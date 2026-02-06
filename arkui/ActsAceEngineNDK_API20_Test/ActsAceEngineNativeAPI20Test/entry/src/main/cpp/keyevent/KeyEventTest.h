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

#ifndef KEY_EVENT_TEST_H
#define KEY_EVENT_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <napi/native_api.h>
#include <arkui/native_key_event.h>
#include "common/Common.h"

namespace KeyEventTest {
   
    napi_value IsNumLockOnTest_001(napi_env env, napi_callback_info info);
    napi_value IsNumLockOnTest_002(napi_env env, napi_callback_info info);
   
    napi_value IsCapsLockOnTest_001(napi_env env, napi_callback_info info);
    napi_value IsCapsLockOnTest_002(napi_env env, napi_callback_info info);
   
    napi_value IsScrollLockOnTest_001(napi_env env, napi_callback_info info);
    napi_value IsScrollLockOnTest_002(napi_env env, napi_callback_info info);
    napi_value CreateTextInputNode(napi_env env, napi_callback_info info);

} // namespace KeyEventTest

#endif // KEY_EVENT_TEST_H