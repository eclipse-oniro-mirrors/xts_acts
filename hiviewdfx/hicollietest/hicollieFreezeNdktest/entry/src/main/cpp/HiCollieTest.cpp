/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "HiCollieTest.h"
#include "hilog/log.h"
#include "hicollie/hicollie.h"
#include <atomic>
#include <thread>
#include <string>
#include <unistd.h>

#undef LOG_DOMAIN
#define LOG_DOMAIN 0xD003200
#undef LOG_TAG
#define LOG_TAG "StruckTest"
const int64_t BLOCK_TIME = 3; 

size_t UserCall(OH_HiCollie_Freeze_Type type, void* buffer, size_t size)
{
   std::string source = "Freeze is happened";
   if (type == OH_THREAD_BLOCK_3S) {
       source += ":block 3s";
   } else if (type == OH_THREAD_BLOCK_6S) {
       source += ":block 6s";
   } else if (type == OH_BUSINESS_INPUT_BLOCK) {
       source += ":input block";
   }else if (type == OH_BUSINESS_THREAD_BLOCK_3S) {
       source += ":THREAD_BLOCK_3";
   }else if (type == OH_BUSINESS_THREAD_BLOCK_6S) {
       source += ":THREAD_BLOCK_6S";
   }else if (type == OH_LIFECYCLE_HALF_TIMEOUT) {
       source += ":HALF_TIMEOUT";
   }else if (type == OH_LIFECYCLE_TIMEOUT) {
       source += ":timeout";
   }else if (type == OH_APP_INPUT_BLOCK) {
       source += ":input block";
   }else {
       source += ":other block";
   }
   char* buffer1 = (char*)buffer;
   int needed = snprintf(buffer1, size, "UserCallback%s", source.c_str());
   return needed; 
}

napi_value TestHiCollieSetFreezeCallback(napi_env env, napi_callback_info info)
{
   // 设置用户回调
    OH_HiCollie_SetFreezeCallback(UserCall);
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value TestHiCollieAssociateProcessReport(napi_env env, napi_callback_info info)
{
    // 上报3秒事件
    OH_HiCollie_AssociateProcessReport(false);
    sleep(BLOCK_TIME);
    // 上报6秒事件
    OH_HiCollie_AssociateProcessReport(true);
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value TestHiCollieAssociateProcessReport1(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag start");
    HiCollie_ErrorCode code = OH_HiCollie_AssociateProcessReport(true);
    OH_LOG_INFO(LOG_APP, "testTag  res is %{public}d", code);
    code = OH_HiCollie_AssociateProcessReport(true);
    OH_LOG_INFO(LOG_APP, "testTag  res is %{public}d", code);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}