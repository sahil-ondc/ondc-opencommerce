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


# seller
seller_services=('server_image_pusher_bpp-apis' 'server_image_pusher_seller-adapter-service' 'server_image_pusher_callback-action-service')
for service in ${seller_services[@]}; do
  echo "publish seller $service"
  bazelisk run //docker/publish/seller:$service --define DOCKER_REGISTRY="${1}" --define DOCKER_REPOSITORY="${2}"
done
