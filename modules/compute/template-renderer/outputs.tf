# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# outputs.tf

output "rendered_documents" {
  description = "A list of rendered YAML documents from the specified file(s)."
  value       = data.kubectl_path_documents.rendered_file.documents
}

output "output_file_path_created" {
  description = "The path to the created output file."
  value       = local_file.output_file.filename
}

output "output_file_content" {
  description = "The content of the rendered file(s)."
  value       = local_file.output_file.content
  sensitive   = true
}

output "instructions" {
  description = "Command to apply the generated Kubernetes job manifest."
  value       = <<-EOT
    To apply the job to your Kubernetes cluster, run the following command:
      kubectl apply -f ${abspath(local_file.output_file.filename)}
    EOT
}