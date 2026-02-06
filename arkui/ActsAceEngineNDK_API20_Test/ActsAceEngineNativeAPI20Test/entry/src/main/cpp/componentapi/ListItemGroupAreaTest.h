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
#ifndef ACE_C_ARKUI_KEY_CODE_TEST_API20_LISTITEMGROUPAREATEST_H
#define ACE_C_ARKUI_KEY_CODE_TEST_API20_LISTITEMGROUPAREATEST_H
#include "common/Common.h"
#include "component/XComponent.h"

#define XC ArkUICapiTest::XComponent
namespace ListItemGroupAreaTest {
void OnScrollPositionChanged(ArkUI_NodeEvent *event);
napi_value CreateRegionTestList(napi_env env, napi_callback_info info);
napi_value TestAreaOutside(napi_env env, napi_callback_info info);
napi_value TestAreaNone(napi_env env, napi_callback_info info);
napi_value TestAreaItem(napi_env env, napi_callback_info info);
napi_value TestAreaHeader(napi_env env, napi_callback_info info);
napi_value TestAreaFooter(napi_env env, napi_callback_info info);
};

#endif //ACE_C_ARKUI_KEY_CODE_TEST_API20_LISTITEMGROUPAREATEST_H
