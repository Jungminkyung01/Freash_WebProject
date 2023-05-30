package com.cos.fresh.domain.add;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface Add1Repository extends JpaRepository<Add1, Integer> {

	//@Modifying
	//@Query(value = "INSERT INTO add1(title, content1, createDate) VALUES(:title, :content1, now())", nativeQuery = true)
	//int mAdd(@Param("title") String title, @Param("content1") String content1);

}
