import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PetComponent } from './pet/pet.component';
import { ApplicationComponent } from './application/application.component';

export const routes: Routes = [
    {path: 'pet', component: PetComponent },
    {path: 'application', component: ApplicationComponent},

];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule],
})
export class AppRoutingModule {}
