import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggler"
export default class extends Controller {
  static targets=['usersContainer', 'hiddenUser'];

  static values = {
    isVisible: {type:Boolean ,default:false}
  }

  isVisibleValueChanged(value) {
    console.log(this.hiddenUserTargets);
    this.hiddenUserTargets.forEach(el => el.classList.toggle('d-none', value));
  }

  hiddenUserTargetConnected(target)  {
    target.classList.add('d-none')
  }

  toggleVisibility() {
    this.isVisibleValue =!this.isVisibleValue;
    // this.usersTarget.forEach(user => user.classList.toggle("hidden"));
  }
  connect() {
    console.log("Connecting to HTML")
  }
}
