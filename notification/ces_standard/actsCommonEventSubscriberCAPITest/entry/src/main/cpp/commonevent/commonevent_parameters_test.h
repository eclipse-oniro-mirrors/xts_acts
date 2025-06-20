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

#ifndef CES_CAPI_XTS_COMMONEVENT_PARAMETERS_TEST_H
#define CES_CAPI_XTS_COMMONEVENT_PARAMETERS_TEST_H

#include "common.h"
#include "oh_commonevent.h"
#include "oh_commonevent_support.h"

namespace CesCapiTest {
class CommonEventParametersTest {
public:
    ~CommonEventParametersTest();
    static napi_value TestCommonEventCreateParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventDestroyParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetIntToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetIntToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetIntArrayToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetIntArrayToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetLongToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetLongToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetLongArrayToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetLongArrayToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDoubleToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDoubleToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDoubleToParameters003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDoubleToParameters004(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDoubleArrayToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDoubleArrayToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDoubleArrayToParameters003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetDoubleArrayToParameters004(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetBoolToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetBoolToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetBoolToParameters003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetBoolToParameters004(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetBoolArrayToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetBoolArrayToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetBoolArrayToParameters003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetBoolArrayToParameters004(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCharToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCharToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCharToParameters003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCharToParameters004(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCharArrayToParameters001(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCharArrayToParameters002(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCharArrayToParameters003(napi_env env, napi_callback_info info);
    static napi_value TestCommonEventSetCharArrayToParameters004(napi_env env, napi_callback_info info);

private:
    static void PublishInfoCallback001(const CommonEvent_RcvData *data);
};
} // namespace CesCapiTest
#endif // CES_CAPI_XTS_COMMONEVENT_PARAMETERS_TEST_H