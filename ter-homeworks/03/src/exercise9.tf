locals {
  first_list = [for i in range(1, 100) : format("rc%02d", i)]
  
  second_list = [
    for i in local.first_list :
    i if !(i == "rc19" || endswith(i, "0") || endswith(i, "7") || endswith(i, "8") || endswith(i, "9"))
  ]
}
