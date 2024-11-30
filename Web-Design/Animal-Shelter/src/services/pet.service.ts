import { Injectable } from '@angular/core';
import { Pet } from '../model/pet.model';

@Injectable({
providedIn: 'root'
})
export class PetService {

private pets:Pet[] = [
    {  id: 1,
        name: 'Buddy',
        species: 'Dog',
        breed: 'Golden Retriever',
        sex: 'Male',
        weight: 68.5, // in pounds
        intake_date: '2024-10-15', // YYYY-MM-DD format
        age: 3, // in years
        pet_status: 'Not Adopted', // e.g., Available, Adopted, Hold
    },
    {  id: 2,
        name: 'Mittens',
        species: 'Cat',
        breed: 'Maine Coon',
        sex: 'Female',
        weight: 12.3, // in pounds
        intake_date: '2024-11-01', // YYYY-MM-DD format
        age: 2, // in years
        pet_status: 'Adopted', // e.g., Available, Adopted, Hold}
    }
    
];
constructor() { }

getPets(): Pet[] {
    return this.pets;
}

getPetByID(id: number): Pet | undefined {
    return this.pets.find(pet => pet.id === id)
}

addPet(pet: Pet) {
    this.pets.push(pet);
}

updatePet(pet:Pet) {
    const index = this.pets.findIndex(u => u.id === pet.id)
}

deletePet (id: number) {
    this.pets = this.pets.filter (pet => pet.id !== id);
}
}