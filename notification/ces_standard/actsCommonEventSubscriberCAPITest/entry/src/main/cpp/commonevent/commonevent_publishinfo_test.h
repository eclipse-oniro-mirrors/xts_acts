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

#ifndef CES_CAPI_XTS_COMMONEVENT_PUBLISHINFO_TEST_H
#define CES_CAPI_XTS_COMMONEVENT_PUBLISHINFO_TEST_H

#include "oh_commonevent.h"
#include "oh_commonevent_support.h"
#include "common.h"

namespace CesCapiTest {
class CommonEventPublishInfoTest {
public:
    ~CommonEventPublishInfoTest();
    static napi_value TestCommonEventCreatePublishInfo001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventCreatePublishInfo002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventDestroyPublishInfo001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoBundleName001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoBundleName002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoBundleName003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoPermissions001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoPermissions002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoPermissions003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoCode001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoCode002(napi_env env, napi_callback_info info);
    static napi_value GetDataStr001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoData001(napi_env env, napi_callback_info info);
    static napi_value GetDataStr002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoData002(napi_env env, napi_callback_info info);
    static napi_value GetDataStr003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoData003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoData004(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoData005(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoData006(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetPublishInfoParameters003(napi_env env, napi_callback_info info);

private:
    static void PublishInfoCallback001(const CommonEvent_RcvData *data);
};
} // namespace CesCapiTest
#endif // CES_CAPI_XTS_COMMONEVENT_PUBLISHINFO_TEST_H