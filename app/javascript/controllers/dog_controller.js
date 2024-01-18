import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submitForm(event) {
    event.preventDefault();
    const form = event.currentTarget;

    fetch(form.action, {
      method: form.method,
      body: new FormData(form),
      headers: {
        'Accept': 'text/javascript',
        'X-Requested-With': 'XMLHttpRequest',
      },
    });
  }
}
