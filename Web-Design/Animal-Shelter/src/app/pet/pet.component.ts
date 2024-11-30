import { Component, OnInit } from '@angular/core';
import { Pet } from '../../model/pet.model';
import { CommonModule, NgForOf } from '@angular/common'
import { PetService } from '../../services/pet.service';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-pet',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './pet.component.html',
  styleUrl: './pet.component.css'
})
export class PetComponent implements OnInit {
  pets: Pet[] = [];
  selectedPet: Pet | null =  null;
  newPet: Pet = {id: 0, name:'', species:'', breed:'', sex:'', weight: 0, intake_date:'', age: 0, pet_status: ''   }; //add date method

  constructor(private readonly petService:PetService,
    private readonly route:ActivatedRoute,
    private readonly router:Router
  ){}

  ngOnInit(): void {
      this.loadPets();
      //this.addUser();
  }

  loadPets() {
    this.pets = this.petService.getPets()
  }

  goToPetDetail(pet:Pet) {
    this.router.navigate(['/pet',pet.id]);
  }
  selectPet(pet: Pet) {
    this.selectedPet = pet;
  }

  addPet(pet:Pet){
    //this.userService.addUser(this.newUser);
    const newId = pet.id;
    const newName = pet.name;
    const newSpecies = pet.species;
    const newBreed = pet.breed;
    const newSex = pet.sex;
    const newWeight = pet.weight;
    const newIntake_date = pet.intake_date;
    const newAge = pet.age;
    const newPet_status = pet.pet_status;
    this.newPet = {id:newId, name:newName, species: newSpecies, breed: newBreed, sex: newSex, weight: newWeight, intake_date: newIntake_date, age: newAge, pet_status: newPet_status};
    this.petService.addPet(pet);
    //this.userService.addUser(this.newUser);
    this.loadPets;
  }
  /*ngOnInit() {
    this.users = [
      {id: 1, name: 'John Doe', email: 'johndoe@example.com'},
      {id: 2, name: 'John Smith', email: 'johnsmith@example.com'}
    ]
  }*/
}
