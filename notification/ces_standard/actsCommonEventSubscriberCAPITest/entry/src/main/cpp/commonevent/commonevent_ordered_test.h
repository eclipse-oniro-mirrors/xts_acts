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

#ifndef CES_CAPI_XTS_COMMONEVENT_ORDERED_TEST_H
#define CES_CAPI_XTS_COMMONEVENT_ORDERED_TEST_H

#include "oh_commonevent.h"
#include "oh_commonevent_support.h"
#include "common.h"

namespace CesCapiTest {
class CommonEventOrderedTest {
public:
    ~CommonEventOrderedTest();
    static napi_value GetIsOrdered001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventIsOrderedCommonEvent001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventIsOrderedCommonEvent002(napi_env env, napi_callback_info info);
    static napi_value GetIsFinished001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventFinishCommonEvent001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventFinishCommonEvent002(napi_env env, napi_callback_info info);
    static napi_value GetIsAborted001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventAbortCommonEvent001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventAbortCommonEvent002(napi_env env, napi_callback_info info);
    static napi_value GetIsGetAborted001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventGetAbortCommonEvent001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventGetAbortCommonEvent002(napi_env env, napi_callback_info info);
    static napi_value GetIsClearAborted001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventClearAbortCommonEvent001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventClearAbortCommonEvent002(napi_env env, napi_callback_info info);
    static napi_value GetCode001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCodeToSubscriber001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCodeToSubscriber002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCodeToSubscriber003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventGetCodeFromSubscriber001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventGetCodeFromSubscriber002(napi_env env, napi_callback_info info);
    static napi_value GetData001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDataToSubscriber001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDataToSubscriber002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDataToSubscriber003(napi_env env, napi_callback_info info);
    static napi_value GetData002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventGetDataFromSubscriber001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventGetDataFromSubscriber002(napi_env env, napi_callback_info info);

private:
    static void IsOrderedCallback001(const CommonEvent_RcvData *data);
    static void IsOrderedCallback002(const CommonEvent_RcvData *data);
    static void IsOrderedCallback(const CommonEvent_RcvData *data);
    static void IsOrderedCallback003(const CommonEvent_RcvData *data);
};
} // namespace CesCapiTest
#endif // CES_CAPI_XTS_COMMONEVENT_ORDERED_TEST_H