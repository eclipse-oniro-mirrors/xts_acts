/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "native_common.h"
#include "transient_task/transient_task_api.h"

TransientTask_DelaySuspendInfo delaySuspendInfo;

static void OnCallbackCompleted(void)
{
    // 短时任务即将结束，业务在这里取消短时任务
    OH_BackgroundTaskManager_CancelSuspendDelay(delaySuspendInfo.requestId);
}

// 申请短时任务
static napi_value RequestSuspendDelay(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t res = OH_BackgroundTaskManager_RequestSuspendDelay("test", OnCallbackCompleted, &delaySuspendInfo);
    if (res == 0) {
        napi_create_int32(env, delaySuspendInfo.requestId, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 获取剩余时间
static napi_value GetRemainingDelayTime(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t delayTime = 0;
    int32_t res = OH_BackgroundTaskManager_GetRemainingDelayTime(delaySuspendInfo.requestId, &delayTime);
    if (res == 0) {
        napi_create_int32(env, delayTime, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 取消短时任务
static napi_value CancelSuspendDelay(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t res = OH_BackgroundTaskManager_CancelSuspendDelay(delaySuspendInfo.requestId);
    napi_create_int32(env, res, &result);
    return result;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"RequestSuspendDelay", nullptr, RequestSuspendDelay, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetRemainingDelayTime", nullptr, GetRemainingDelayTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CancelSuspendDelay", nullptr, CancelSuspendDelay, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "shorttimetaskndk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}