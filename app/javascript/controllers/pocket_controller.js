// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "btn" ]

  addToPocket(id) {
     Rails.ajax({
        url: `/restaurants/${id}/pocket_list`,
        type: 'post',
        success: res => {
          // console.log(res);
          if (res.status == 'added') {
            this.btnTarget.classList.add('like-btn-favorited')
          } else {
            this.btnTarget.classList.remove('like-btn-favorited')
          }
        },
        error: err => {
          console.log(err);
        }
      })
  }

  add() {
    // this.btnTarget.classList.toggle('like-btn-favorited')

    // const id = this.btnTarget.dataset['id']
    // addToPocket(id)
    this.addToPocket(this.btnTarget.dataset['id'])
  }
  connect() {

  }
}
