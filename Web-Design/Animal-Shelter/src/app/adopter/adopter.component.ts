import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-adopter',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './adopter.component.html',
  styleUrls: ['./adopter.component.css'],
})
export class AdopterComponent implements OnInit {
  adopters = [
    { id: 1, name: 'Ava Macintash', email: 'Ava@example.com', phone: '123-456-7890', status: 'Approved' },
    { id: 2, name: 'Cara Zozokos', email: 'Cara@example.com', phone: '987-654-3210', status: 'Pending' },
  ];

  newAdopter = { id: 0, name: '', email: '', phone: '', status: 'Pending' };

  constructor() {}

  ngOnInit(): void {}

  addAdopter(): void {
    if (this.newAdopter.name && this.newAdopter.email && this.newAdopter.phone) {
      this.newAdopter.id = this.adopters.length + 1;
      this.adopters.push({ ...this.newAdopter });
      this.resetForm();
    }
  }

  deleteAdopter(id: number): void {
    this.adopters = this.adopters.filter(adopter => adopter.id !== id);
  }

  resetForm(): void {
    this.newAdopter = { id: 0, name: '', email: '', phone: '', status: 'Pending' };
  }
}
