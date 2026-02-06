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
#ifndef NODE_EVENT_TEST_H
#define NODE_EVENT_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <cstdint>
#include <napi/native_api.h>
#include <arkui/native_node.h>
#include "common/Common.h"

namespace NodeEventTest {

    napi_value GetNumberValueTest_001(napi_env env, napi_callback_info info);
    napi_value GetNumberValueTest_002(napi_env env, napi_callback_info info);
    napi_value GetNumberValueTest_003(napi_env env, napi_callback_info info);
    
    napi_value GetStringValueTest_001(napi_env env, napi_callback_info info);
    napi_value GetStringValueTest_002(napi_env env, napi_callback_info info);
    napi_value GetStringValueTest_003(napi_env env, napi_callback_info info);

    napi_value SetReturnNumberValueTest_001(napi_env env, napi_callback_info info);
    napi_value SetReturnNumberValueTest_002(napi_env env, napi_callback_info info);
    napi_value SetReturnNumberValueTest_003(napi_env env, napi_callback_info info);

    napi_value CreateNode(napi_env env, napi_callback_info info);

}

#endif // NODE_EVENT_TEST_H