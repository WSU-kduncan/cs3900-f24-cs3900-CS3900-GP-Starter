package com.wsu.workorderproservice.model;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "adopter")
public class Adopter {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "adopter_id")
    private Integer adopterId;
    @Column(name = "name")
    private String name;
    @Column(name = "email")
    private String email;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "registration_date")
    private Date registrationDate;
    @Column(name = "phone_number")
    private String phoneNumber;
}
