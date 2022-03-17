package com.greatlearning.springmvc.crm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.greatlearning.springmvc.crm.model.Customer;

@Service
public interface CustomerTrackerService {

	List<Customer> getAllCustomers();

	void saveOrUpdateCustomer(Customer student);

	Customer getCustomerById(int id);

	void deleteCustomer(int id);

}
