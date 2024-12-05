import { Component, OnInit } from '@angular/core';
import { Pet } from '../../model/pet.model';
import { CommonModule } from '@angular/common';
import { PetService } from '../../services/pet.service';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
    selector: 'app-pet',
    standalone: true,
    imports: [CommonModule, FormsModule],
    templateUrl: './pet.component.html',
    styleUrls: ['./pet.component.css']
})
export class PetComponent implements OnInit {
  pets: Pet[] = [];
  selectedPet: Pet | null = null;
  newPet: Pet = {
    id: 0,
    name: '',
    species: '',
    breed: '',
    sex: '',
    weight: 0,
    intake_date: '',
    age: 0,
    pet_status: '',
  };

  constructor(
    private readonly petService: PetService,
    private readonly route: ActivatedRoute,
    private readonly router: Router
  ) {}

  ngOnInit(): void {
    this.loadPets();
  }

  loadPets(): void {
    this.pets = this.petService.getPets();
  }

  addPet(): void {
    if (
      this.newPet.name &&
      this.newPet.species &&
      this.newPet.breed &&
      this.newPet.sex &&
      this.newPet.pet_status
    ) {
      this.newPet.id = this.pets.length + 1; 
      this.petService.addPet({ ...this.newPet }); 
      this.loadPets(); 
      this.resetNewPetForm();
    } else {
      console.error('All fields are required to add a new pet!');
    }
  }

  deletePet(id: number): void {
    this.petService.deletePet(id); 
    this.loadPets(); 
  }

  resetNewPetForm(): void {
    this.newPet = {
      id: 0,
      name: '',
      species: '',
      breed: '',
      sex: '',
      weight: 0,
      intake_date: '',
      age: 0,
      pet_status: '',
    };
  }
}
