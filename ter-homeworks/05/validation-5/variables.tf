variable "no_uppercase_string" {
    description = "Строка без использования верхнего регистра"
    type        = string
    default     = "this is a valid string"

    validation {
        condition     = can(regex("^[^A-Z]*$", var.no_uppercase_string))
        error_message = "Строка не может содержать символы верхнего регистра"
    }
}

variable "in_the_end_there_can_be_only_one" {
    description = "Who is better Connor or Duncan?"
    type = object({
        Dunkan  = optional(bool)
        Connor  = optional(bool)
    })

    default = {
        Dunkan  = true
        Connor  = false
    }

    validation {
        condition     = (
            (lookup(var.in_the_end_there_can_be_only_one, "Dunkan", false) == true && lookup(var.in_the_end_there_can_be_only_one, "Connor", false) == false) ||
            (lookup(var.in_the_end_there_can_be_only_one, "Dunkan", false) == false && lookup(var.in_the_end_there_can_be_only_one, "Connor", false) == true)
        )
        error_message = "only one is possible"
    }
}
