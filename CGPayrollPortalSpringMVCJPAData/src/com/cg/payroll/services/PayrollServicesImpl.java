package com.cg.payroll.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cg.payroll.beans.Associate;
import com.cg.payroll.beans.BankDetails;
import com.cg.payroll.beans.Salary;
import com.cg.payroll.daoservices.AssociateDAO;
import com.cg.payroll.exceptions.AssociateDetailsNotfoundException;

@Component("payrollServices")
public class PayrollServicesImpl implements PayrollServices {

	@Autowired
	private AssociateDAO associateDao;

	@Override
	public Associate acceptAssociateDetails(Associate associate) {

		//Associate associate = new Associate(yearlyInvestmentUnder80C, firstName, lastName, department, designation, pancard, emailId, new Salary(basicSalary, epf, companyPf), new BankDetails(accountNumber, bankName, ifscCode));
		associate = associateDao.save(associate);
		return associate;
	}


	@Override
	public Associate getAssociateDetails(int associateId) throws AssociateDetailsNotfoundException {
		Associate associate = associateDao.findById(associateId).orElseThrow
				(()->new AssociateDetailsNotfoundException("Associate details not found associate Id"+associateId));
		if(associate == null)
			throw new AssociateDetailsNotfoundException("Associate details not found for ID:" + associateId);
		return associate;
	}

	@Override
	public List<Associate> getAllAssociatesDetails() {
		return associateDao.findAll();
	}


	@Override
	public Associate calculateNetSalary(int associateId) throws AssociateDetailsNotfoundException  {
		Associate associate=getAssociateDetails(associateId);
		Salary salary = salaryDetails(associate);
		double taxableAmount =(salary.getGrossSalary()-associate.getYearlyInvestmentUnder80C());
		salary.setMonthlyTax(calculateTax(associate, taxableAmount));
		double netSalary =  (taxableAmount - (salary.getMonthlyTax() + associate.getSalary().getEpf() + associate.getSalary().getCompanyPf() + associate.getYearlyInvestmentUnder80C()));
		associate.getSalary().setNetSalary(netSalary);
		associate.setSalary(salaryDetails(associate));
		associateDao.save(associate);
		return associate;
	}
	
	public double calculateTax(Associate associate, double taxableAmount) {
		double taxAmount =0;
		while(taxableAmount>250000) {
			if(taxableAmount>250000&&taxableAmount<=500000) {
				taxableAmount = taxableAmount - 250000;
				taxAmount = taxAmount+taxableAmount/10;		
			}
			if(taxableAmount>500000&&taxableAmount<=1000000) {
				taxableAmount=taxableAmount-500000;
				taxAmount =taxAmount+taxableAmount/20;
			}
			if(taxableAmount>1000000) {
				taxableAmount = taxableAmount-1000000;
				taxAmount=taxAmount+taxableAmount/30;
			}
		}
		System.out.println("Monthly tax: " + taxAmount);
		return taxAmount;
	}
	
	public Salary salaryDetails(Associate associate) {
		associate.getSalary().setHra((associate.getSalary().getBasicSalary()*30/100));
		associate.getSalary().setConveyenceAllowance((associate.getSalary().getBasicSalary()*30/100));
		associate.getSalary().setOtherAllowance((associate.getSalary().getBasicSalary()*35/100));
		associate.getSalary().setPersonalAllowance(associate.getSalary().getBasicSalary()/5);
		associate.getSalary().setGrossSalary(associate.getSalary().getBasicSalary()+associate.getSalary().getConveyenceAllowance()+associate.getSalary().getHra()+associate.getSalary().getOtherAllowance()+associate.getSalary().getPersonalAllowance());
		return associate.getSalary();
	}


	
}
