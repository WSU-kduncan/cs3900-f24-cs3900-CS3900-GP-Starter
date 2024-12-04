import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-staff', 
    standalone: true,
    imports: [CommonModule, FormsModule],
    templateUrl: './staff.component.html',
    styleUrls: ['./staff.component.css']
})
export class StaffComponent implements OnInit {
  staff = [
    { id: 1, name: 'Gani', email: 'Gani@example.com', phone: '555-1234', role: 'Manager' },
    { id: 2, name: 'Hunter', email: 'Hunter@example.com', phone: '555-5678', role: 'Volunteer' },
  ];

  newStaff = { id: 0, name: '', email: '', phone: '', role: 'Volunteer' };

  constructor() {}

  ngOnInit(): void {}

  addStaff(): void {
    if (this.newStaff.name && this.newStaff.email && this.newStaff.phone) {
      this.newStaff.id = this.staff.length + 1;
      this.staff.push({ ...this.newStaff });
      this.resetForm();
    }
  }

  deleteStaff(id: number): void {
    this.staff = this.staff.filter(member => member.id !== id);
  }

  resetForm(): void {
    this.newStaff = { id: 0, name: '', email: '', phone: '', role: 'Volunteer' };
  }
}
