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
#ifndef NODECONTENT_TEST_H
#define NODECONTENT_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <napi/native_api.h>
#include <arkui/native_node.h>
#include "common/Common.h"

namespace NodeContentTest {
    napi_value RegisterCallbackTest_001(napi_env env, napi_callback_info info);
    napi_value RegisterCallbackTest_002(napi_env env, napi_callback_info info);
    napi_value SetUserDataTest_001(napi_env env, napi_callback_info info);
    napi_value SetUserDataTest_002(napi_env env, napi_callback_info info);
    napi_value AddNodeTest_001(napi_env env, napi_callback_info info);
    napi_value AddNodeTest_002(napi_env env, napi_callback_info info);
    napi_value RemoveNodeTest_001(napi_env env, napi_callback_info info);
    napi_value RemoveNodeTest_002(napi_env env, napi_callback_info info);
    napi_value InsertNodeTest_001(napi_env env, napi_callback_info info);
    napi_value InsertNodeTest_002(napi_env env, napi_callback_info info);
    napi_value createNode1(napi_env env, napi_callback_info info);

}

#endif // NODECONTENT_TEST_H