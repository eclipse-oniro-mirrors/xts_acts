/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "common.h"
#include "oh_commonevent.h"
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>

static CommonEvent_Subscriber *g_subscriber = nullptr;
static bool g_isOrdered = false;
static bool g_isFinished = false;
static CommonEvent_SubscribeInfo *g_subscribeInfo = nullptr;
static void IsOrderedCallback001(const CommonEvent_RcvData *data)
{
    if (g_subscriber != nullptr) {
        g_isOrdered = OH_CommonEvent_IsOrderedCommonEvent(g_subscriber);
        g_isFinished = OH_CommonEvent_FinishCommonEvent(g_subscriber);
    }
}

static napi_value testCommonEventNoError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, IsOrderedCallback001);
    int32_t retResult = OH_CommonEvent_Subscribe(g_subscriber);
    napi_create_int32(env, retResult, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testCommonEventNoError", nullptr, testCommonEventNoError, nullptr, nullptr, nullptr, napi_default,
            nullptr},
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
    .nm_modname = "commoneventerrorcode",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
