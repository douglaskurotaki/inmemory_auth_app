import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["nameError", "emailError", "passwordError", "passwordConfirmationError"]

  validateName(event) {
    const name = event.target.value
    if (name.length < 5 || name.length > 128) {
      this.nameErrorTarget.textContent = "Nome deve ter entre 5 e 128 caracteres."
      event.target.classList.add("is-invalid")
    } else {
      this.nameErrorTarget.textContent = ""
      event.target.classList.remove("is-invalid")
    }
  }

  validateEmail(event) {
    const email = event.target.value
    const emailRegex = /^[A-Za-z0-9!#$%&'*+\-\/=?^_`{|}~.]{1,64}@[A-Za-z0-9.-]{1,128}$/
    if (!emailRegex.test(email)) {
      this.emailErrorTarget.textContent = "Email inválido."
      event.target.classList.add("is-invalid")
    } else {
      this.emailErrorTarget.textContent = ""
      event.target.classList.remove("is-invalid")
    }
  }

  validatePassword(event) {
    const password = event.target.value
    const passwordRegex = /^(?=(?:.*\d){2,})(?=(?:.*[A-Z]){2,})(?=(?:.*[a-z]){2,})(?=(?:.*[^A-Za-z0-9]){2,}).{10,72}$/
    if (!passwordRegex.test(password)) {
      this.passwordErrorTarget.textContent = "Senha deve ter entre 10 e 72 caracteres, com pelo menos 2 dígitos, 2 caracteres especiais, 2 letras maiúsculas e 2 letras minúsculas."
      event.target.classList.add("is-invalid")
    } else {
      this.passwordErrorTarget.textContent = ""
      event.target.classList.remove("is-invalid")
    }
  }

  validatePasswordConfirmation(event) {
    const password = document.querySelector('input[name="user[password]"]').value
    const passwordConfirmation = event.target.value
    if (password !== passwordConfirmation) {
      this.passwordConfirmationErrorTarget.textContent = "Confirmação de senha não corresponde."
      event.target.classList.add("is-invalid")
    } else {
      this.passwordConfirmationErrorTarget.textContent = ""
      event.target.classList.remove("is-invalid")
    }
  }
}
