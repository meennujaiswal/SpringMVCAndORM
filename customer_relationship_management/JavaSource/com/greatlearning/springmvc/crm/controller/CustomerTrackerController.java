package com.greatlearning.springmvc.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.springmvc.crm.model.Customer;
import com.greatlearning.springmvc.crm.service.CustomerTrackerService;

@Controller
@RequestMapping("/customers")
public class CustomerTrackerController {

	@Autowired
	private CustomerTrackerService customerTrackerService;

	@RequestMapping("/list")
	public String getAllCustomers(Model model) {
		List<Customer> customers = customerTrackerService.getAllCustomers();
		model.addAttribute("Customers", customers);
		return "list-customers";
	}

	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {
		Customer customer = Customer.builder().build();
		model.addAttribute("Customer", customer);
		return "registration-form";
	}

	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("id") int id, Model model) {
		Customer customer = customerTrackerService.getCustomerById(id);
		model.addAttribute("Customer", customer);
		return "registration-form";
	}

	@PostMapping("/save")
	public String saveOrUpdateCustomer(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("email") String email) {
		Customer customer = null;
		if (id != 0) {
			customer = customerTrackerService.getCustomerById(id);
			customer.setFirstName(firstName);
			customer.setLastName(lastName);
			customer.setEmail(email);
		} else {
			customer = Customer.builder().firstName(firstName).lastName(lastName).email(email).build();
		}

		customerTrackerService.saveOrUpdateCustomer(customer);
		return "redirect:/customers/list";
	}

	@RequestMapping("/delete")
	public String deleteStudentRegistration(@RequestParam("id") int id) {
		customerTrackerService.deleteCustomer(id);
		return "redirect:/customers/list";
	}

}
