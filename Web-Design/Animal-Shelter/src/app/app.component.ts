import { Component } from '@angular/core';
import { NgClass } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [NgClass, RouterModule, ReactiveFormsModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'Animal-Shelter';

  featuredItems = ['Item 1', 'Item 2', 'Item 3'];
  isHighlighted = true;


  }
