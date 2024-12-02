import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-staff',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './staff.component.html',
  styleUrls: ['./staff.component.css'],
})

  deleteStaff(id: number): void {
    this.staff = this.staff.filter(member => member.id !== id);
  }

  resetForm(): void {
    this.newStaff = { id: 0, name: '', email: '', phone: '', role: 'Volunteer' };
  }
}
