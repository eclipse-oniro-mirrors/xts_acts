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
#include "napi/native_api.h"
#include <bits/alltypes.h>
#include <memory>
#include <string>
#include <sys/types.h>
#include <iostream>
#include <map>
#include "hilog/log.h"
#include "web/arkweb_interface.h"
#include "component_callback.h"
#include <thread>

constexpr unsigned int LOG_PRINT_DOMAIN = 0xFF00;
constexpr const char* LOG_PRINT_COMPONENT = "XjArkWeb";

std::shared_ptr<ComponentCallback> component_callback_ptr = nullptr;

static ArkWeb_ControllerAPI *controller = nullptr;
static ArkWeb_ComponentAPI *component = nullptr;


void LoadStartCallback(const char *webTag, void *userData) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk LoadStartCallback webTag: %{public}s", webTag);
    if (!userData) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk LoadStartCallback userData is nullptr");
        return;
    }
    std::weak_ptr<ComponentCallback> callback = *static_cast<std::weak_ptr<ComponentCallback> *>(userData);
    if (auto callback_ptr = callback.lock()) {
        callback_ptr->OnPageBegin(webTag);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk LoadStartCallback callback_weak_ptr lock failed");
    }
}

void LoadEndCallback(const char *webTag, void *userData) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk LoadEndCallback webTag: %{public}s", webTag);
    if (!userData) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk LoadEndCallback userData is nullptr");
        return;
    }
    std::weak_ptr<ComponentCallback> callback = *static_cast<std::weak_ptr<ComponentCallback> *>(userData);
    if (auto callback_ptr = callback.lock()) {
        callback_ptr->OnPageEnd(webTag);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk LoadEndCallback callback_weak_ptr lock failed");
    }
}

void DestroyCallback(const char *webTag, void *userData) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk DestoryCallback webTag: %{public}s", webTag);
    if (!userData) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk DestroyCallback userData is nullptr");
        return;
    }
    std::weak_ptr<ComponentCallback> callback = *static_cast<std::weak_ptr<ComponentCallback> *>(userData);
    if (auto callback_ptr = callback.lock()) {
        callback_ptr->OnDestroy(webTag);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk DestroyCallback callback_weak_ptr lock failed");
    }
}

void ScrollCallback(const char* webTag, void* userData, double x, double y) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk ScrollCallback webTag: %{public}s", webTag);
    if (!userData) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk ScrollCallback userData is nullptr");
        return;
    }
    std::weak_ptr<ComponentCallback> callback = *static_cast<std::weak_ptr<ComponentCallback> *>(userData);
    if (auto callback_ptr = callback.lock()) {
        callback_ptr->OnScroll(webTag, x, y);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk ScrollCallback callback_weak_ptr lock failed");
    }
}

bool SetComponentCallback(ArkWeb_ComponentAPI* component, const char* webTagValue) {
    if (!ARKWEB_MEMBER_MISSING(component, onPageBegin)) {
        component->onPageBegin(webTagValue, LoadStartCallback,
            static_cast<void *>(component_callback_ptr->GetWeakPtr()));
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "component onPageBegin func not exist");
    }

    if (!ARKWEB_MEMBER_MISSING(component, onPageEnd)) {
        component->onPageEnd(webTagValue, LoadEndCallback,
            static_cast<void *>(component_callback_ptr->GetWeakPtr()));
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "component onPageEnd func not exist");
    }

    if (!ARKWEB_MEMBER_MISSING(component, onDestroy)) {
        component->onDestroy(webTagValue, DestroyCallback,
            static_cast<void *>(component_callback_ptr->GetWeakPtr()));
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "component onDestroy func not exist");
    }
    // 返回值 bool
    bool isRegister = OH_ArkWeb_RegisterScrollCallback(
        webTagValue, ScrollCallback, static_cast<void *>(component_callback_ptr->GetWeakPtr()));
    return isRegister;
}

// 解析存储webTag
static napi_value NativeWebInit(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk NativeWebInit start");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk NativeWebInit webTag:%{public}s", webTagValue);

    controller = reinterpret_cast<ArkWeb_ControllerAPI *>(OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_CONTROLLER));
    if (controller) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "get ArkWeb_ControllerAPI success");
    }

    component = reinterpret_cast<ArkWeb_ComponentAPI *>(OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_COMPONENT));
    if (component) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "get ArkWeb_ComponentAPI success");
    }
    
    component_callback_ptr = std::make_shared<ComponentCallback>(webTagValue);
    if (component_callback_ptr) {
        component_callback_ptr->Init();
    }
    bool isRegister = SetComponentCallback(component, webTagValue);
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk NativeWebInit end");
    
    
    napi_value isSuccess;
    if (isRegister) {
        napi_create_int32(env, 1,  &isSuccess);
    } else {
        napi_create_int32(env, 2,  &isSuccess);
    }
    
    return isSuccess;
}


static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nativeWebInit", nullptr, NativeWebInit, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
