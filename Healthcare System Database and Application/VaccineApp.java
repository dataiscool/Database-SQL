import java.sql.* ;
import java.util.Scanner;

class VaccineApp
{
    public static void main ( String [ ] args ) throws SQLException
    {
      // Connect to database
      // Register the driver.  You must register the driver before you can use it.
      try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
      catch (Exception cnfe){ System.out.println("Class not found"); }
      // This is the url you must use for DB2.
      //Note: This url may not valid now !
      String url = "jdbc:db2://winter2021-comp421.cs.mcgill.ca:50000/cs421";
      // user and pass set in unix shell environment
      String your_userid = System.getenv("SOCSUSER");
      String your_password = System.getenv("SOCSPASSWD");
      if(your_userid == null)
        {
          System.err.println("Error!! do not have a username to connect to the database!");
          System.exit(1);
        }
      if(your_password == null)
        {
          System.err.println("Error!! do not have a password to connect to the database!");
          System.exit(1);
        }
      Connection con = DriverManager.getConnection (url,your_userid,your_password);
      Statement statement = con.createStatement ();

      // Application
      int option = 0;
      do
      {
        Scanner myScanner = new Scanner(System.in);
        System.out.println("VaccineApp Main Menu");
        System.out.println("        1. Add a Person");
        System.out.println("        2. Assign a slot to a Person");
        System.out.println("        3. Enter Vaccination information");
        System.out.println("        4. Exit Application");
        System.out.println("Please Enter Your Option (number):");
        option = Integer.parseInt(myScanner.nextLine());
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE
        if (option == 1) { // enter new person in system
          // Is person already in system? - verify HIN
          System.out.println("Please provide Person's information in the order requested:");
          System.out.println("Health Insurance Number:");
          String hin = myScanner.nextLine();
          System.out.println("Registered Date (YYYY-MM-DD):");
          String rdate = myScanner.nextLine();
          System.out.println("Name (First Last):");
          String iname = myScanner.nextLine();
          System.out.println("Phone number (XXX-XXX-XXXX):");
          String phonenum = myScanner.nextLine();
          System.out.println("Date of birth (YYYY-MM-DD):");
          String datebirth = myScanner.nextLine();
          System.out.println("Gender:");
          String gender = myScanner.nextLine();
          System.out.println("City:");
          String city = myScanner.nextLine();
          System.out.println("Postal Code:");
          String postcode = myScanner.nextLine();
          System.out.println("Street Address:");
          String street = myScanner.nextLine();
          System.out.println("Priority Category name:");
          String cname = myScanner.nextLine();

            //  INSERT Person information
          try {
            String insertSQL = "INSERT INTO RegIndividuals VALUES (\'" + hin + "\',\'" + rdate + "\',\'" + iname + "\',\'" + phonenum + "\',\'" + datebirth + "\',\'" + gender + "\',\'" + city + "\',\'" + postcode+ "\',\'" + street + "\',\'" + cname + "\')";
            System.out.println (insertSQL);
            statement.executeUpdate(insertSQL);
            System.out.println("DONE!");
          } 
          catch (SQLException e) {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            if (sqlCode == -803) {
              System.out.println("Person with this health insurance number is already registered.\n Do you wish to proceed with updating this Person's information? (Y/N)");
              String ans = myScanner.nextLine();
              if(ans.equals("Y")) {
                try {
                  String updateSQL = "UPDATE RegIndividuals SET rdate = \'" + rdate + "\',iname = \'" + iname + "\',phonenum = \'" + phonenum + "\',datebirth = \'" + datebirth + "\',gender = \'" + gender + "\',\ncity = \'" + city + "\',postcode = \'" + postcode + "\',street = \'" + street + "\',cname = \'" + cname + "\'WHERE HIN = '" + hin +"'"; 
                  System.out.println (updateSQL);
                  statement.executeUpdate(updateSQL);
                  System.out.println("DONE!");
                }
                catch (SQLException e1) {
                  // Only error possible is cname constraint
                  System.out.println("ERROR! The category name was not found, refer to documentation for possible category groups");
                  continue;
                }
              }
              else // No update
                continue;
            } 
            else { // code == -530 (cname foreign key)
              System.out.println("ERROR! The category name was not found, refer to documentation for possible category groups");
              continue;
            }
            // sqlState = e.getSQLState(); // Get SQLSTATE
            // // Your code to handle errors comes here;
            // // something more meaningful than a print would be good
            // System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            // System.out.println(e);
          }
        }

        if(option == 2) {
          // 1. HIN of person to be assigned a slot
          // 2. Verify number of doses received against required
          // Assume not vaccinated by two different brands
          // => do not assign to occupied slot or slot in the past
          // Only minimum checks implemented to satisfy given workflow (does not check whether individual has already been assigned slots etc.)
          System.out.println("Please provide Health Insurance Number of Person to assign a slot for:");
          String hin = myScanner.nextLine();
          try {
        	  String sqlStr = "SELECT COUNT(*) AS count FROM Slots s WHERE s.hin = \'" + hin + "\' AND s.sdate <= CURRENT DATE AND s.licensenum IS NOT NULL";
        	  System.out.println(sqlStr);
        	  ResultSet rs = statement.executeQuery(sqlStr);
          
	          // 2. Verify number of doses received against required
	          int shotsCount = 0;
	          while(rs.next()) { // there should only be 1 entry
	        	  shotsCount = rs.getInt("count");
	          }
	          // get dosage requirement
	          if (shotsCount != 0) {
		          try {
			    	  sqlStr = "SELECT numdoses FROM Vaccines vac, Slots s, Vial v WHERE vac.manufacturer = v.manufacturer AND s.sid = v.sid AND s.sdate <= CURRENT DATE AND s.licensenum IS NOT NULL AND s.hin = \'"+hin+"\' LIMIT 1";
			    	  System.out.println(sqlStr);
			    	  rs = statement.executeQuery(sqlStr);
			    	  int shotsHad = 0;
			    	  while(rs.next()) { // there should only be 1 entry
			    		  shotsHad = rs.getInt("numdoses");
			    	  }
			    	  if (shotsCount == shotsHad) {
			    		  System.out.println(hin + " has already received the required number of doses.");
			    		  continue;
			    	  } 
		          }
		          catch (SQLException e) {
		        	  System.out.println("Health Insurance Number format provided is not valid");
		        	  System.out.println(e.getErrorCode()); //for debug
		        	  continue; // keep loop running
		          }
	          }
	    	  // Person has not yet received required dosage => print availabilities
	          try {
		    	  sqlStr = "SELECT sid, sdate, stime, vname FROM slots s WHERE s.HIN IS NULL AND sdate >= CURRENT DATE ORDER BY sdate, stime";
		    	  rs = statement.executeQuery(sqlStr);
		    	  System.out.println(sqlStr);
		    	  int count = 1; // start at one since row starts at 1 for absolute() below
		    	  int slotID; // store the slot chosen
		    	  System.out.println("Please input slot ID (sid) of selected slot:");
		    	  while(rs.next()) {
		    		  System.out.println(rs.getInt("sid") + ": " + rs.getDate("sdate") + ", " + rs.getTime("stime") + ", " + rs.getString("vname"));
		    		  count++;
		    	  }
		    	  if(count == 1) {
		    		  System.out.println("No slots currently available");
		    		  continue; // loop back to menu
		    	  }
		    	  else {
		    		  slotID = Integer.parseInt(myScanner.nextLine());
		    		  try {
		    			  // Now assign the slot
		    			  String sqlQuery = "UPDATE Slots SET HIN = \'" + hin + "\', assigndate = CURRENT DATE WHERE sid = " + slotID;
		                  System.out.println (sqlQuery);
		                  statement.executeUpdate(sqlQuery);
		                  System.out.println("DONE!");
		                  continue; // go back to main menu
		    			  
		    		  }
		    		  catch (SQLException e ) {
		    			  System.out.println("Invalid choice; slot ID type or Person was not registered.");
		    			  System.out.println(e.getErrorCode());
		    			  System.out.println(e.getMessage());
		    			  continue; // loop back to menu
		    		  }
		    	  }
	          }
	          catch (SQLException e) {
	        	  System.out.println("No slot available");
	        	  System.out.println(e.getErrorCode()); //for debug
	        	  continue; // keep loop running
	          }
	        }
          catch (SQLException e){
        	  System.out.println("Health Insurance Number format provided is not valid");
        	  System.out.println(e.getErrorCode()); //for debug
        	  continue; // keep loop running
          }
        }
        
        if(option == 3) {
        	// Vaccinated = Date is today/past, has nurse assigned, has vial assigned
        	// get vial manuf info
        	// check that vial to be assigned is same manuf, if not, abort
        	// info to enter: nurse, vial, slot
        	// Assume: Vaccination happens on CURRENT DATE
        	System.out.println("Please input the Health Insurance Number of the individual to be vaccinated:");
        	String hin = myScanner.nextLine();
	    	String manuf = null; // store manuf of previous dose if applicable
	    	int sid = -1; // store slotID of Person
	    	String vname = null; //Store vac Location
	    	String stime = null; //store time using .toString()
	    	String licensenum = null; //store nurse to assign
	    	int batchnum = -1; //store batch number
	    	String manuf1 = null; //store manufacturer of user input
	    	boolean prevVac = false; // store whether we had previous dose.
        	// get previous manufacturer if already received a dose
        	try {
	        	String sqlStr = "SELECT manufacturer FROM Slots s, Vial v WHERE s.sid = v.sid AND s.sdate <= CURRENT DATE AND s.licensenum IS NOT NULL AND s.hin = \'"+hin+"\' LIMIT 1";
		    	System.out.println(sqlStr);
		    	ResultSet rs = statement.executeQuery(sqlStr); 
		    	while(rs.next()) { // if no prev dose, prevVac takes default false value
		    		manuf = rs.getString("manufacturer");
		    		//System.out.println(manuf);
		    		prevVac = true;
		    	}
        	}
        	catch(SQLException e) {
        		System.out.println("Invalid Health Insurance Number format.");
        		System.out.println(e.getMessage()); //for debug
        		continue;
        	}
        	// get slot id:
        	try {
	        	String sqlStr = "SELECT sid, vname, stime FROM Slots s WHERE s.hin = \'" + hin + "\' AND s.sdate = CURRENT DATE AND licensenum IS NULL";
	      	  	System.out.println(sqlStr);
	      	  	ResultSet rs = statement.executeQuery(sqlStr);
	      	  	int count = 0;
	      	  	while(rs.next()) { // Assume only 1 slot is assigned.
	      	  		sid = rs.getInt("sid");
	      	  		vname = rs.getString("vname");
	      	  		stime = rs.getTime("stime").toString();
	      	  		count++;
	      	  	}
	      	  	if(count == 0) {
	      	  		System.out.println("There are no slots assigned to this Person today. Please use Option 2 to assign a slot.");
	      	  		continue;
	      	  	}
        	}
        	catch(SQLException e) {
        		System.out.println("Invalid Health Insurance Number format.");
        		System.out.println(e.getMessage()); //for debug
        		continue;
        	}
        	// Show list of available nurses currently onsite:
        	//(note that there can be multiple slots at the same time with different nurses...)
        	// DO a difference between nurses assigned here and nurses assigned to this time slot
        	try {
	        	String sqlStr = "SELECT nname, n.licensenum FROM Nurses n, NurseAssignment na, Slots s WHERE n.licensenum = na.licensenum AND na.ndate = CURRENT DATE AND ndate = sdate EXCEPT SELECT nname, n.licensenum FROM Nurses n, NurseAssignment na, Slots s WHERE n.licensenum = na.licensenum AND s.licensenum = n.licensenum AND na.vname = s.vname AND sdate = CURRENT DATE AND sdate = ndate AND s.vname = \'"+vname+"\' AND stime = \'"+stime+"\'";
	        	System.out.println(sqlStr);
	        	ResultSet rs = statement.executeQuery(sqlStr);
	        	int count = 0;
	        	System.out.println("Please assign a nurse (input nurse license number):");
	        	while(rs.next()) {
	        		System.out.println(rs.getString("nname") + ", ID: " + rs.getString("licensenum"));
	        		count++;
	        	}
	        	if(count == 0) {
	        		System.out.println("There are no nurses currently available");
	        		continue; //go back to main menu
	        	}
	        	else {
	        		licensenum = myScanner.nextLine();
	        		//insert into Slots
	        		try {
		        		String updateSQL = "UPDATE Slots SET licensenum = \'" + licensenum + "\', assigndate = CURRENT DATE WHERE sid = " + sid;
		        		System.out.println(updateSQL);
		        		statement.executeUpdate(updateSQL);
	        		}
	        		catch (SQLException e) {
	        			System.out.println("Nurse license number not recognized.");
	        			System.out.println(e.getMessage());
	        			continue;
	        		}
	        	}
        	}
        	catch (SQLException e) {
        		System.out.println("There are no nurses currently available");
        		System.out.println(e.getMessage());
        		continue;
        	}
        	// get vial (check prevVac value), display list of batch+manuf available at location
        	try {
        		System.out.println("Select an option (number) from the current vaccine availabilities:");
        		String sqlQ = "SELECT batchnum, manufacturer FROM Batches WHERE vname = \'"+vname+"\' AND expdate >= CURRENT DATE";
        		System.out.println(sqlQ);
        		ResultSet rs = statement.executeQuery(sqlQ);
        		int counter = 1;
        		while (rs.next()) {
        			System.out.println(counter++ + ", Batch Number:" + rs.getInt("batchnum") + ", Manufacturer:" + rs.getString("manufacturer"));
        		}
        		int vacOption = Integer.parseInt(myScanner.nextLine());
        		rs = statement.executeQuery(sqlQ);
        		counter = 1;
        		while (rs.next()) {
        			if(counter++ == vacOption) {
        				batchnum = rs.getInt("batchnum");
        				manuf1 = rs.getString("manufacturer");
        			}
        		}
        		if (prevVac) {
        			if (!manuf1.equals(manuf)) {
        				System.out.println("Vaccine shots must be from the same manufacturer");
        				System.out.println("Previous manufacturer: "+manuf+", Manufacturer selected: "+manuf1);
        				continue; //go back to menu
        			}
        		}
        	}
        	catch (SQLException e) {
        		System.out.println("Currently no vaccines available at this location.");
        		System.out.println(e.getMessage());
        		continue;
        	}
        	System.out.println("Please input the vial number of the vaccine:");
        	int vialnum = Integer.parseInt(myScanner.nextLine());
        	// Insert into Vial
        	try {
        		String sqlUp = "INSERT INTO Vial VALUES (" + vialnum +", "+batchnum+", \'"+manuf1+"\', "+sid+")";
        		System.out.println(sqlUp);
        		statement.executeUpdate(sqlUp);
        		System.out.println("DONE!");
        	}
        	catch(SQLException e) {
        		System.out.println("vial number invalid");
        		System.out.println(e.getMessage());
        		continue;
        	}
        }
      }while(option != 4);
      // Finally but importantly close the statement and connection
      statement.close ( ) ;
      con.close ( ) ;
    }
}
