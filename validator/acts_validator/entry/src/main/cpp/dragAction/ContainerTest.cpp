/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <string>
#include "ContainerTest.h"

namespace NativeXComponentSample {
    std::unordered_map<std::string, Container *> Container::instance_;

    Container::Container(const std::string &id) {
        this->id_ = id;
    }

    Container *Container::GetInstance(const std::string &id) {
        if (instance_.find(id) == instance_.end()) {
            Container *instance = new Container(id);
            instance_[id] = instance;
            return instance;
        } else {
            return instance_[id];
        }
    }

    void Container::RegisterCallback(OH_NativeXComponent *nativeXComponent) {
        OH_NativeXComponent_RegisterCallback(nativeXComponent, &containerCallback_);
    }
} // namespace NativeXComponentSample
