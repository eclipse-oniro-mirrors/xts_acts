/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "web/arkweb_type.h"
#include <string>

class ComponentCallback : public std::enable_shared_from_this<ComponentCallback> {
public:
    ComponentCallback(const char* webTag);
    ~ComponentCallback() = default;
    void Init();
    std::weak_ptr<ComponentCallback>* GetWeakPtr();
    void OnPageBegin(const char *webTag);
    void OnPageEnd(const char *webTag);
    void OnDestroy(const char *webTag);
    void OnScroll(const char *webTag, double x, double y);
    
private:
    std::string webTag_;
    std::weak_ptr<ComponentCallback> weak_ptr_;
};