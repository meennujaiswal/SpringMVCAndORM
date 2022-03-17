package com.greatlearning.springmvc.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greatlearning.springmvc.crm.dao.CustomerTrackerDAO;
import com.greatlearning.springmvc.crm.model.Customer;
import com.greatlearning.springmvc.crm.service.CustomerTrackerService;

@Service
public class CustomerTrackerServiceImpl implements CustomerTrackerService {

	@Autowired
	CustomerTrackerDAO customerTrackerDAO;

	@Override
	public List<Customer> getAllCustomers() {
		return customerTrackerDAO.getAllRegistrations();
	}

	@Override
	public void saveOrUpdateCustomer(Customer student) {
		customerTrackerDAO.saveRegistration(student);
	}

	@Override
	public void deleteCustomer(int id) {
		customerTrackerDAO.deleteStudent(id);
	}

	@Override
	public Customer getCustomerById(int id) {
		return customerTrackerDAO.getStudentById(id);
	}

}
