package com.wsu.workorderproservice.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.wsu.workorderproservice.model.Pet;

public interface  PetRepository extends JpaRepository<Pet, Integer> {

    @Query(nativeQuery = true, value = "add sql query")

    Page<Object[]> findBySearch(String search, PageRequest pageable);

}
