 /*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#ifndef ACE_C_ARKUI_KEY_CODE_TEST_API20_COMPONENTAPITEST_H
#define ACE_C_ARKUI_KEY_CODE_TEST_API20_COMPONENTAPITEST_H

#include "common/Common.h"
#include <js_native_api_types.h>
#include <arkui/native_dialog.h>

namespace ComponentApiTest {
napi_value TestCustomDialogHoverModeArea(napi_env env, napi_callback_info info);
napi_value TestCustomDialogKeyboardAvoidMode(napi_env env, napi_callback_info info);
napi_value RegisterLayoutCallbackOnNodeTest_001(napi_env env, napi_callback_info info);
napi_value RegisterLayoutCallbackOnNodeTest_002(napi_env env, napi_callback_info info);
};

#endif //ACE_C_ARKUI_KEY_CODE_TEST_API20_COMPONENTAPITEST_H
