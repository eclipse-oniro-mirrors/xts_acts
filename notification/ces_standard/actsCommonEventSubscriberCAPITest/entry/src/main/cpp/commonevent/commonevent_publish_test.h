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

#ifndef CES_CAPI_XTS_COMMONEVENT_PUBLISH_TEST_H
#define CES_CAPI_XTS_COMMONEVENT_PUBLISH_TEST_H

#include "oh_commonevent.h"
#include "oh_commonevent_support.h"
#include "common.h"

namespace CesCapiTest {
class CommonEventPublishTest {
public:
    ~CommonEventPublishTest();
    static napi_value TestCommonEventPublish001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventPublish002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventPublish003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventPublishWithInfo001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventPublishWithInfo002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventPublishWithInfo003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventPublishWithInfo004(napi_env env, napi_callback_info info);
private:
    static void PublishInfoCallback001(const CommonEvent_RcvData *data);
};
} // namespace CesCapiTest
#endif // CES_CAPI_XTS_COMMONEVENT_PUBLISH_TEST_H