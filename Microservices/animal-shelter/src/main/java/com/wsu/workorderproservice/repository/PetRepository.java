package com.wsu.workorderproservice.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.wsu.workorderproservice.model.Pet;

public interface  PetRepository extends JpaRepository<Pet, Integer> {

    List<Pet> findByStatus(String status);
    List<Pet> findByDistinctPetName(String petName);
    List<Pet> findByDistinctBreed(String breed);
}
