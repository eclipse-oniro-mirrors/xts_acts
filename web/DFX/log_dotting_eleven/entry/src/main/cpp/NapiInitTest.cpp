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
napi_ref g_scrollCallback = nullptr;
napi_env g_env;
std::map<std::string, std::shared_ptr<ComponentCallback>> component_callback_ptrs;

static ArkWeb_ControllerAPI *controller = nullptr;
static ArkWeb_ComponentAPI *component = nullptr;

// void LoadStartCallback(const char *webTag, void *userData) {
//     OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk LoadStartCallback webTag: %{public}s", webTag);
//     if (!userData) {
//         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk LoadStartCallback userData is nullptr");
//         return;
//     }
//     std::weak_ptr<ComponentCallback> callback = *static_cast<std::weak_ptr<ComponentCallback> *>(userData);
//     if (auto callback_ptr = callback.lock()) {
//         callback_ptr->OnPageBegin(webTag);
//     } else {
//         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk LoadStartCallback callback_weak_ptr lock failed");
//     }
// }

void ScrollCallback(const char* webTag, void* userData, double x, double y) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk ScrollCallback webTag: %{public}s", webTag);
    if (g_scrollCallback) {
        napi_value jsResult = nullptr;
        napi_create_string_utf8(g_env, "ok" ,NAPI_AUTO_LENGTH, &jsResult);
        napi_value callback = nullptr;
        napi_get_reference_value(g_env, g_scrollCallback, &callback);
        napi_value callbackResult = nullptr;
        napi_call_function(g_env, nullptr, callback, 1, &jsResult, &callbackResult);
    }
    
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

void SetComponentCallback(ArkWeb_ComponentAPI* component,
                          const char* webTagValue,
                          std::shared_ptr<ComponentCallback> component_callback_ptr) {
    if (component_callback_ptr) {
        OH_ArkWeb_RegisterScrollCallback(
            webTagValue, ScrollCallback, static_cast<void *>(component_callback_ptr->GetWeakPtr()));
    }
}

bool SetComponentCallbackFalse() {
      bool result = false;
      result =  OH_ArkWeb_RegisterScrollCallback("per", nullptr, nullptr);
      return result;

}

static napi_value NativeWebInitFalse(napi_env env, napi_callback_info info) {
      bool result =  SetComponentCallbackFalse();
      napi_value results;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk NativeWebInit end");
    napi_get_boolean(env, result, &results);
    return results;
    }


bool  SetComponentCallbackTrue(ArkWeb_ComponentAPI* component,
  const char* webTagValue,
std::shared_ptr<ComponentCallback> component_callback_ptr) {
  bool result = false;
  if (component_callback_ptr) {
    result = OH_ArkWeb_RegisterScrollCallback(
      webTagValue, ScrollCallback, static_cast<void *>(component_callback_ptr->GetWeakPtr()));
  }
  return result;
}

static napi_value NativeWebInitTrue(napi_env env, napi_callback_info info) {
  napi_value results;
  //    return sum;
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

  controller = reinterpret_cast<ArkWeb_ControllerAPI *>(OH_ArkWeb_GetNativeAPI((ArkWeb_NativeAPIVariantKind)200));
  if (controller) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "get ArkWeb_ControllerAPI success");
  }

  component = reinterpret_cast<ArkWeb_ComponentAPI *>(OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_COMPONENT));
  if (component) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "get ArkWeb_ComponentAPI success");
  }

  std::shared_ptr<ComponentCallback> component_callback_ptr = std::make_shared<ComponentCallback>(webTagValue);
  if (component_callback_ptr) {
    component_callback_ptr->Init();
    component_callback_ptrs.emplace(webTagValue, component_callback_ptr);
  }
  // 方法1：ui线程调用
  bool result =  SetComponentCallbackTrue(component, webTagValue, component_callback_ptr);
  //  bool result =  SetComponentCallbackThread( webTagValue, component_callback_ptr);
  // 方法2：创建线程调用
  // std::thread threadObj(SetComponentCallbackThread, webTagValue, component_callback_ptr);
  // threadObj.join();
  OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk NativeWebInit end");
  napi_get_boolean(env, result, &results);
  return results;
}


// SetComponentCallbackThread
void SetComponentCallbackThread(const char* webTagValue,
                                std::shared_ptr<ComponentCallback> component_callback_ptr) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "SetComponentCallbackThread webTag: %{public}s", webTagValue);
    if (component_callback_ptr) {
        OH_ArkWeb_RegisterScrollCallback(
            webTagValue, ScrollCallback, static_cast<void *>(component_callback_ptr->GetWeakPtr()));
    }
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
    
    std::shared_ptr<ComponentCallback> component_callback_ptr = std::make_shared<ComponentCallback>(webTagValue);
    if (component_callback_ptr) {
        component_callback_ptr->Init();
        component_callback_ptrs.emplace(webTagValue, component_callback_ptr);
    }
    // 方法1：ui线程调用
    SetComponentCallback(component, webTagValue, component_callback_ptr);
    // 方法2：创建线程调用
    // std::thread threadObj(SetComponentCallbackThread, webTagValue, component_callback_ptr);
    // threadObj.join();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk NativeWebInit end");
    return nullptr;
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

static napi_value NAPI_Global_setScrollCallback(napi_env env, napi_callback_info info) {
    // TODO: implements the code;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_COMPONENT, "ndk NAPI_Global_setScrollCallback start");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数webTag
    if (g_scrollCallback) {
        napi_delete_reference(env, g_scrollCallback);
    }
    napi_create_reference(env, args[0], 1, &g_scrollCallback);
    g_env = env;
    return nullptr;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeWebInit", nullptr, NativeWebInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setScrollCallback", nullptr, NAPI_Global_setScrollCallback, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"nativeWebInitFalse", nullptr, NativeWebInitFalse, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"nativeWebInitTrue", nullptr, NativeWebInitTrue, nullptr, nullptr, nullptr, napi_default, nullptr },
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
