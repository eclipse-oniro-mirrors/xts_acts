/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "BasicServicesKit/oh_commonevent.h"
#include "BasicServicesKit/oh_commonevent_support.h"
#include "common.h"
#include "hilog/log.h"
#include "napi/native_api.h"

static napi_value Publish(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "start");
    const char *event = COMMON_EVENT_TEST;
    int32_t ret = OH_CommonEvent_Publish(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "unSubscribe result %{public}d", ret);
    napi_value res = nullptr;
    napi_create_int32(env, ret, &res);
    return res;
}

static napi_value PublishWithInfo(napi_env env, napi_callback_info info) {
    const char *event = COMMON_EVENT_TEST;
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    int32_t ret = OH_CommonEvent_PublishWithInfo(event, publishInfo);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "unSubscribe result %{public}d", ret);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    napi_value res = nullptr;
    napi_create_int32(env, ret, &res);
    return res;
}