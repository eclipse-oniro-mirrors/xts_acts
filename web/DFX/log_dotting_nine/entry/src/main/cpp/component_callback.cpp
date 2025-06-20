/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
#include "component_callback.h"

#include "hilog/log.h"

constexpr unsigned int LOG_PRINT_DOMAIN = 0xFF00;
constexpr const char* LOG_PRINT_COMPONENT = "XjArkWeb";

ComponentCallback::ComponentCallback(const char *webTag) : webTag_(webTag) {}

void ComponentCallback::Init() { weak_ptr_ = shared_from_this(); }

std::weak_ptr<ComponentCallback> *ComponentCallback::GetWeakPtr() { return &weak_ptr_; }

void ComponentCallback::OnPageBegin(const char *webTag) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT,
        "ComponentCallback onPageBegin webTag:%{public}s", webTag);
}

void ComponentCallback::OnPageEnd(const char *webTag) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT,
        "ComponentCallback onPageEnd webTag:%{public}s", webTag);
}

void ComponentCallback::OnScroll(const char *webTag, double x, double y) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT,
        "ComponentCallback OnScroll webTag:%{public}s x:%{public}lf y:%{public}lf", webTag, x, y);
}

void ComponentCallback::OnDestroy(const char *webTag) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT,
        "ComponentCallback OnDestroy webTag:%{public}s", webTag);
}
