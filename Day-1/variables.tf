variable "ami" {
    description = "inserting ami value"
    type = string
    default = "ami-06d2149e11dd4bec4"
}

variable "type" {
    description = "inserting value for instence type"
    type = string
    default = "t2.micro"
  
}
variable "key" {
    description = "inserting value for key"
    type = string
    default = "awskey"
  
}