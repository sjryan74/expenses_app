import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "search" ]

  clear() {
    this.searchTarget.defaultValue = ""
  }

}
