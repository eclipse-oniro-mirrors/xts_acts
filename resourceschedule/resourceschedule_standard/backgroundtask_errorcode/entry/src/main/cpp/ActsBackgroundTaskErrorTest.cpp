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

#include "napi/native_api.h"
#include "native_common.h"
#include "transient_task/transient_task_api.h"
#include "background_process_manager/background_process_manager.h"
#include <unistd.h>
#include <hilog/log.h>
TransientTask_DelaySuspendInfo delaySuspendInfo;

static napi_value BackgroundProcessManagerSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int pid = 12;
    int ret = 0;
    ret = OH_BackgroundProcessManager_SetProcessPriority(pid, PROCESS_BACKGROUND);
    napi_create_int32(env, ret == ERR_BACKGROUND_PROCESS_MANAGER_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value BackgroundProcessManagerInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    int pid = 12;
    BackgroundProcessManager_ProcessPriority priority;
    ret = OH_BackgroundProcessManager_SetProcessPriority(pid, priority);
    napi_create_int32(env, ret == ERR_BACKGROUND_PROCESS_MANAGER_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

static napi_value SetProcessPriorityInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    int pid = 12;
    BackgroundProcessManager_ProcessPriority priority;
    ret = OH_BackgroundProcessManager_SetProcessPriority(pid, priority);
    napi_create_int32(env, ret == ERR_BACKGROUND_PROCESS_MANAGER_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

static void OnCallbackCompleted(void)
{
    // 短时任务即将结束，业务在这里取消短时任务
    OH_BackgroundTaskManager_CancelSuspendDelay(delaySuspendInfo.requestId);
}

static napi_value RequestSuspendDelaySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t res = OH_BackgroundTaskManager_RequestSuspendDelay("test", OnCallbackCompleted, &delaySuspendInfo);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_OK ? 0 : -1, &result);
    return result;
}

static napi_value RequestSuspendDelayInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t res = OH_BackgroundTaskManager_RequestSuspendDelay("test", OnCallbackCompleted, nullptr);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

static napi_value RequestSuspendDelaySVFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    int maxAttempts = 4;
    int successCount = 0;
    for (int i = 0; i < maxAttempts; i++) {
        int32_t res =
            OH_BackgroundTaskManager_RequestSuspendDelay("Quota Test", OnCallbackCompleted, &delaySuspendInfo);
        if (res == ERR_TRANSIENT_TASK_OK) {
            successCount++;
            int32_t intTime = 15;
            sleep(intTime);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "BackgroundTask",
                         "=======  RequestSuspendDelay requestId = %{public}d", delaySuspendInfo.requestId);
            napi_create_int32(env, -1, &result);
        } else if (res == ERR_TRANSIENT_TASK_SERVICE_VERIFICATION_FAILED) {
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "BackgroundTask",
                         "=======  Attempt %d: Quota exceeded (Error 9900002)\n", i + 1);
            napi_create_int32(env, res == ERR_TRANSIENT_TASK_SERVICE_VERIFICATION_FAILED ? 0 : -1, &result);
            return result;
        } else {
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "BackgroundTask", "======= Attempt: Failed with error %d\n",
                         res);
            napi_create_int32(env, -1, &result);
            break;
        }
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "BackgroundTask", "======= Total successful attempts: %d\n", successCount);
    return result;
}

static napi_value GetRemainingDelayTimeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t delayTime = 0;
    OH_BackgroundTaskManager_RequestSuspendDelay("test", OnCallbackCompleted, &delaySuspendInfo);
    int32_t res = OH_BackgroundTaskManager_GetRemainingDelayTime(delaySuspendInfo.requestId, &delayTime);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_OK ? 0 : -1, &result);
    return result;
}

static napi_value GetRemainingDelayTimeInfoVerFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t delayTime = 0;
    int32_t res = OH_BackgroundTaskManager_GetRemainingDelayTime(NULL, &delayTime);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_CLIENT_INFO_VERIFICATION_FAILED  ? 0 : -1, &result);
    return result;
}

static napi_value CancelSuspendDelaySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_BackgroundTaskManager_RequestSuspendDelay("test", OnCallbackCompleted, &delaySuspendInfo);
    int32_t res = OH_BackgroundTaskManager_CancelSuspendDelay(delaySuspendInfo.requestId);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_OK ? 0 : -1, &result);
    return result;
}

static napi_value CancelSuspendDelayVerFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_BackgroundTaskManager_RequestSuspendDelay("test", OnCallbackCompleted, &delaySuspendInfo);
    int32_t res = OH_BackgroundTaskManager_CancelSuspendDelay(NULL);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_CLIENT_INFO_VERIFICATION_FAILED ? 0 : -1, &result);
    return result;
}

TransientTask_TransientTaskInfo transientTaskInfo;

static napi_value GetTransientTaskInfoSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t res = OH_BackgroundTaskManager_GetTransientTaskInfo(&transientTaskInfo);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_OK ? 0 : -1, &result);
    return result;
}

static napi_value TransientTaskOK(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t delayTime = 0;
    OH_BackgroundTaskManager_RequestSuspendDelay("test", OnCallbackCompleted, &delaySuspendInfo);
    int32_t res = OH_BackgroundTaskManager_GetRemainingDelayTime(delaySuspendInfo.requestId, &delayTime);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_OK ? 0 : -1, &result);
    return result;
}

static napi_value TransientTaskInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t res = OH_BackgroundTaskManager_RequestSuspendDelay("test", OnCallbackCompleted, nullptr);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

static napi_value TransientTaskCIVerificationFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t delayTime = 0;
    int32_t res = OH_BackgroundTaskManager_GetRemainingDelayTime(NULL, &delayTime);
    napi_create_int32(env, res == ERR_TRANSIENT_TASK_CLIENT_INFO_VERIFICATION_FAILED  ? 0 : -1, &result);
    return result;
}

static napi_value TransientTaskSVFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    int maxAttempts = 4;
    int successCount = 0;
    for (int i = 0; i < maxAttempts; i++) {
        int32_t res =
            OH_BackgroundTaskManager_RequestSuspendDelay("Quota Test", OnCallbackCompleted, &delaySuspendInfo);
        if (res == ERR_TRANSIENT_TASK_OK) {
            successCount++;
            int32_t intTime = 15;
            sleep(intTime);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "BackgroundTask",
                         "=======  RequestSuspendDelay requestId = %{public}d", delaySuspendInfo.requestId);
            napi_create_int32(env, -1, &result);
        } else if (res == ERR_TRANSIENT_TASK_SERVICE_VERIFICATION_FAILED) {
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "BackgroundTask",
                         "=======  Attempt %d: Quota exceeded (Error 9900002)\n", i + 1);
            napi_create_int32(env, res == ERR_TRANSIENT_TASK_SERVICE_VERIFICATION_FAILED ? 0 : -1, &result);
            return result;
        } else {
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "BackgroundTask", "======= Attempt: Failed with error %d\n",
                         res);
            napi_create_int32(env, -1, &result);
            break;
        }
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "BackgroundTask", "======= Total successful attempts: %d\n", successCount);
    return result;
}

static napi_value OH_TransientTask_ErrorCode(napi_env env, napi_callback_info info) 
{
    int result = 0;
    TransientTask_ErrorCode errcode = ERR_TRANSIENT_TASK_OK;
    NAPI_ASSERT(env, errcode == 0, "ERR_TRANSIENT_TASK_OK is fail.");
    errcode = ERR_TRANSIENT_TASK_INVALID_PARAM;
    NAPI_ASSERT(env, errcode == 401, "ERR_TRANSIENT_TASK_INVALID_PARAM is fail.");
    errcode = ERR_TRANSIENT_TASK_PARCEL_FAILED;
    NAPI_ASSERT(env, errcode == 9800002, "ERR_TRANSIENT_TASK_PARCEL_FAILED is fail.");
    errcode = ERR_TRANSIENT_TASK_TRANSACTION_FAILED;
    NAPI_ASSERT(env, errcode == 9800003, "ERR_TRANSIENT_TASK_TRANSACTION_FAILED is fail.");
    errcode = ERR_TRANSIENT_TASK_SYS_NOT_READY;
    NAPI_ASSERT(env, errcode == 9800004, "ERR_TRANSIENT_TASK_SYS_NOT_READY is fail.");
    errcode = ERR_TRANSIENT_TASK_CLIENT_INFO_VERIFICATION_FAILED;
    NAPI_ASSERT(env, errcode == 9900001, "ERR_TRANSIENT_TASK_CLIENT_INFO_VERIFICATION_FAILED is fail.");
    errcode = ERR_TRANSIENT_TASK_SERVICE_VERIFICATION_FAILED;
    NAPI_ASSERT(env, errcode == 9900002, "ERR_TRANSIENT_TASK_SERVICE_VERIFICATION_FAILED is fail.");
    errcode = ERR_TRANSIENT_TASK_PARCELABLE_FAILED;
    NAPI_ASSERT(env, errcode == 9900003, "ERR_TRANSIENT_TASK_PARCELABLE_FAILED is fail.");
    errcode = ERR_TRANSIENT_TASK_SERVICE_NOT_READY;
    NAPI_ASSERT(env, errcode == 9900004, "ERR_TRANSIENT_TASK_SERVICE_NOT_READY is fail.");
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

static napi_value OH_BackgroundProcessManager_ErrorCode(napi_env env, napi_callback_info info) 
{
    int result = 0;
    BackgroundProcessManager_ErrorCode errcode = ERR_BACKGROUND_PROCESS_MANAGER_SUCCESS;
    NAPI_ASSERT(env, errcode == 0, "ERR_BACKGROUND_PROCESS_MANAGER_SUCCESS is fail.");
    errcode = ERR_BACKGROUND_PROCESS_MANAGER_INVALID_PARAM;
    NAPI_ASSERT(env, errcode == 401, "ERR_BACKGROUND_PROCESS_MANAGER_INVALID_PARAM is fail.");
    errcode = ERR_BACKGROUND_PROCESS_MANAGER_REMOTE_ERROR;
    NAPI_ASSERT(env, errcode == 31800001, "ERR_BACKGROUND_PROCESS_MANAGER_REMOTE_ERROR is fail.");
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "BackgroundProcessManagerSuccess", nullptr, BackgroundProcessManagerSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "BackgroundProcessManagerInvalidParam", nullptr, BackgroundProcessManagerInvalidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetProcessPriorityInvalidParam", nullptr, SetProcessPriorityInvalidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RequestSuspendDelaySuccess", nullptr, RequestSuspendDelaySuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RequestSuspendDelayInvalidParam", nullptr, RequestSuspendDelayInvalidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RequestSuspendDelaySVFailed", nullptr, RequestSuspendDelaySVFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"GetRemainingDelayTimeSuccess", nullptr, GetRemainingDelayTimeSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"GetRemainingDelayTimeInfoVerFailed", nullptr, GetRemainingDelayTimeInfoVerFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"CancelSuspendDelaySuccess", nullptr, CancelSuspendDelaySuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"CancelSuspendDelayVerFailed", nullptr, CancelSuspendDelayVerFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"GetTransientTaskInfoSuccess", nullptr, GetTransientTaskInfoSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"TransientTaskOK", nullptr, TransientTaskOK,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"TransientTaskInvalidParam", nullptr, TransientTaskInvalidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"TransientTaskCIVerificationFailed", nullptr, TransientTaskCIVerificationFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"TransientTaskSVFailed", nullptr, TransientTaskSVFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"OH_TransientTask_ErrorCode", nullptr, OH_TransientTask_ErrorCode,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        {"OH_BackgroundProcessManager_ErrorCode", nullptr, OH_BackgroundProcessManager_ErrorCode,
            nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "backgroundtaskerrorcode",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}