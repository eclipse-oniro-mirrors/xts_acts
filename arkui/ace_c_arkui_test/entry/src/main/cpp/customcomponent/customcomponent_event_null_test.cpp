/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

namespace ArkUICapiTest {

static napi_value CustomComponentEventNull001(napi_env env, napi_callback_info info)
{
    auto targetId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(nullptr);
    ASSERT_EQ(targetId, 0);
    auto userData = OH_ArkUI_NodeCustomEvent_GetUserData(nullptr);
    ASSERT_OBJ(userData, nullptr);
    auto nodeHandle = OH_ArkUI_NodeCustomEvent_GetNodeHandle(nullptr);
    ASSERT_OBJ(nodeHandle, nullptr);
    auto type = OH_ArkUI_NodeCustomEvent_GetEventType(nullptr);
    ASSERT_EQ(static_cast<int32_t>(type), -1);
    NAPI_END;
}

static napi_value CustomComponentEventNull002(napi_env env, napi_callback_info info)
{
    auto constrait = OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure(nullptr);
    ASSERT_OBJ(constrait, nullptr);
    auto minWidth = OH_ArkUI_LayoutConstraint_GetMinWidth(nullptr);
    ASSERT_EQ(minWidth, 0.0);
    auto minHeight = OH_ArkUI_LayoutConstraint_GetMinHeight(nullptr);
    ASSERT_EQ(minWidth, 0.0);
    auto maxWidth = OH_ArkUI_LayoutConstraint_GetMaxWidth(nullptr);
    ASSERT_EQ(minWidth, 0.0);
    auto maxHeight = OH_ArkUI_LayoutConstraint_GetMaxHeight(nullptr);
    ASSERT_EQ(minWidth, 0.0);
    auto percentReferenceWidth = OH_ArkUI_LayoutConstraint_GetPercentReferenceWidth(nullptr);
    ASSERT_EQ(percentReferenceWidth, 0.0);
    auto percentReferenceHeight = OH_ArkUI_LayoutConstraint_GetPercentReferenceHeight(nullptr);
    ASSERT_EQ(percentReferenceWidth, 0.0);
    NAPI_END;
}
} // namespace ArkUICapiTest
