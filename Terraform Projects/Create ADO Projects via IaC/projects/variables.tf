variable project_name {
  type        = string
  default     = ""
  description = "A name for your Project"
}

variable description {
  type        = string
  default     = ""
  description = "A useful description for your project"
}

variable visibility {
  type        = string
  default     = "private"
  description = "Can be public/private - but it should probably be private"
}

variable version_control {
  type        = string
  default     = "git"
  description = "Can be tfvc or git, but git is the default"
}

variable work_item_template {
  type        = string
  default     = "agile"
  description = "Valid options are Agile, Basic, CMMI and Scrum, defaults to Agile"
}

variable repo_name {
  type        = string
  default     = ""
  description = "A name for your repository, if you're making one with the pipeline"
}
