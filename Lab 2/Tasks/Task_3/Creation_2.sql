CREATE TABLE Salary
(
	Emp_id int,
	FOREIGN KEY(Emp_id) REFERENCES Employee_info (Emp_id),
	Salary int
);