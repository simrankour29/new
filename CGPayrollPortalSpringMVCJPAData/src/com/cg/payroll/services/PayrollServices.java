package com.cg.payroll.services;

import com.cg.payroll.beans.Associate;
import com.cg.payroll.exceptions.AssociateDetailsNotfoundException;
import java.util.List;

public interface PayrollServices {
	Associate acceptAssociateDetails (Associate associate);
	Associate calculateNetSalary (int associateId) throws AssociateDetailsNotfoundException;
	Associate getAssociateDetails(int associateId) throws AssociateDetailsNotfoundException;
	List<Associate> getAllAssociatesDetails();
	
	
}
