#!/bin/bash
# Copyright 2023 Google LLC
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

# Change these variables for your project
cluster_name="dev-buyer-cluster"
region="asia-southeast1"
project_id="ondc-l1-accl-180920232021"

# Optional: You can change this variable if you do not want to restart all deployments.
deployments=("bap-adapter" "bap-apis" "buyer-app" "request-action")

gcloud container clusters get-credentials $cluster_name --region $region --project $project_id
for e in ${deployments[@]}; do
    echo "Restarting deployment: $e"
    kubectl rollout restart deployment $e -n $e
done
