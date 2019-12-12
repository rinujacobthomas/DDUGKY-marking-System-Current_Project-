package com.batch1.dao;

import java.util.List;
import com.batch1.bo.AddUserbo;
import com.batch1.bo.BoClass;
import com.batch1.bo.LoginBO;
public interface DaoInter {

	void setList(String date,String batch );

	void addstudent(AddUserbo addbo);

	List<BoClass> ListView(String date, String batch);

	void markupdate(BoClass boclass, String date);

	void setListWeek(String date, String batch);

	List<BoClass> ListViewWeek(String week, String batch);

	void markupdateWeek(BoClass boclass, String week);

	LoginBO uservalidate(LoginBO logbo);

	List<BoClass> studentDetails(String id);

	List<BoClass> studentDetailsweek(String id);

	List<BoClass> Search_Student(String id);

	void Delete_Student(String id);

	List<BoClass> batchStudentsView(String batch);

	BoClass passwordView(String id);

	void passwordChange(String id, String password);

	void addTrainer(String id, String name, String password);

	void trainerPasswordChange(String id, String password);

}
