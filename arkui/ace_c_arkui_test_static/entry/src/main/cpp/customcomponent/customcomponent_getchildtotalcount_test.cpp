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

#include "common/common.h"
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestCustomComponentGetChildTotalCount001(ani_env* env, ani_object info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto childTotalCount = nodeAPI->getTotalChildCount(column);
    ASSERT_EQ(childTotalCount, PARAM_0);
    NAPI_END;
}
static ani_double TestCustomComponentGetChildTotalCount002(ani_env* env, ani_object info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textInput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    nodeAPI->addChild(column, textInput);
    auto childTotalCount = nodeAPI->getTotalChildCount(column);
    ASSERT_EQ(childTotalCount, PARAM_1);
    NAPI_END;
}
static ani_double TestCustomComponentGetChildTotalCount003(ani_env* env, ani_object info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textInput1 = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    nodeAPI->addChild(column, textInput1);
    auto textInput2 = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    nodeAPI->addChild(column, textInput2);
    auto textInput3 = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    nodeAPI->addChild(column, textInput3);
    auto childTotalCount = nodeAPI->getTotalChildCount(column);
    ASSERT_EQ(childTotalCount, PARAM_3);
    NAPI_END;
}
} // namespace ArkUIAniTest
