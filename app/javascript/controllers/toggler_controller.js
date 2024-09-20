import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggler"
export default class extends Controller {
  static targets=['users'];
  static classes=["show"]

  static values = {
    isVisible: {type:Boolean ,default:false}
  }


  isVisibleValueChanged(){
    this.element.classList.add(this.showClass)
    console.log('Value changed:', this.isVisibleValue)
  }
  toggleVisibility() {
    this.isVisibleValue =!this.isVisibleValue;
    // this.usersTarget.forEach(user => user.classList.toggle("hidden"));
  }
  connect() {
    console.log("Connecting to HTML")
  }
}
