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
#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestLayoutConstraintCreate001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ret = OH_ArkUI_LayoutConstraint_Create();
    ASSERT_EQ((ret != nullptr), true);
    NAPI_END;
}

static napi_value TestLayoutConstraintCopy001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto layoutConstraint = OH_ArkUI_LayoutConstraint_Create();
    auto ret = OH_ArkUI_LayoutConstraint_Copy(layoutConstraint);
    ASSERT_EQ((ret != nullptr), true);
    NAPI_END;
}

static napi_value TestLayoutConstraintMinWidth001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto layoutConstraint = OH_ArkUI_LayoutConstraint_Create();
    OH_ArkUI_LayoutConstraint_SetMinWidth(layoutConstraint, SIZE_500);
    auto ret = OH_ArkUI_LayoutConstraint_GetMinWidth(layoutConstraint);
    ASSERT_EQ(ret, SIZE_500);
    NAPI_END;
}

static napi_value TestLayoutConstraintMinWidth002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ret = OH_ArkUI_LayoutConstraint_GetMinWidth(nullptr);
    ASSERT_EQ(ret, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestLayoutConstraintMaxWidth001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto layoutConstraint = OH_ArkUI_LayoutConstraint_Create();
    OH_ArkUI_LayoutConstraint_SetMaxWidth(layoutConstraint, SIZE_500);
    auto ret = OH_ArkUI_LayoutConstraint_GetMaxWidth(layoutConstraint);
    ASSERT_EQ(ret, SIZE_500);
    NAPI_END;
}

static napi_value TestLayoutConstraintMaxWidth002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ret = OH_ArkUI_LayoutConstraint_GetMaxWidth(nullptr);
    ASSERT_EQ(ret, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestLayoutConstraintMinHeight001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto layoutConstraint = OH_ArkUI_LayoutConstraint_Create();
    OH_ArkUI_LayoutConstraint_SetMinHeight(layoutConstraint, SIZE_500);
    auto ret = OH_ArkUI_LayoutConstraint_GetMinHeight(layoutConstraint);
    ASSERT_EQ(ret, SIZE_500);
    NAPI_END;
}

static napi_value TestLayoutConstraintMinHeight002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ret = OH_ArkUI_LayoutConstraint_GetMinHeight(nullptr);
    ASSERT_EQ(ret, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestLayoutConstraintMaxHeight001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto layoutConstraint = OH_ArkUI_LayoutConstraint_Create();
    OH_ArkUI_LayoutConstraint_SetMaxHeight(layoutConstraint, SIZE_500);
    auto ret = OH_ArkUI_LayoutConstraint_GetMaxHeight(layoutConstraint);
    ASSERT_EQ(ret, SIZE_500);
    NAPI_END;
}

static napi_value TestLayoutConstraintMaxHeight002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ret = OH_ArkUI_LayoutConstraint_GetMaxHeight(nullptr);
    ASSERT_EQ(ret, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestLayoutConstraintPercentReferenceWidth001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto layoutConstraint = OH_ArkUI_LayoutConstraint_Create();
    OH_ArkUI_LayoutConstraint_SetPercentReferenceWidth(layoutConstraint, SIZE_500);
    auto ret = OH_ArkUI_LayoutConstraint_GetPercentReferenceWidth(layoutConstraint);
    ASSERT_EQ(ret, SIZE_500);
    NAPI_END;
}

static napi_value TestLayoutConstraintPercentReferenceWidth002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ret = OH_ArkUI_LayoutConstraint_GetPercentReferenceWidth(nullptr);
    ASSERT_EQ(ret, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestLayoutConstraintPercentReferenceHeight001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto layoutConstraint = OH_ArkUI_LayoutConstraint_Create();
    OH_ArkUI_LayoutConstraint_SetPercentReferenceHeight(layoutConstraint, SIZE_500);
    auto ret = OH_ArkUI_LayoutConstraint_GetPercentReferenceHeight(layoutConstraint);
    ASSERT_EQ(ret, SIZE_500);
    NAPI_END;
}

static napi_value TestLayoutConstraintPercentReferenceHeight002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ret = OH_ArkUI_LayoutConstraint_GetPercentReferenceWidth(nullptr);
    ASSERT_EQ(ret, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestLayoutConstraintMeasuredSize001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto ret = nodeAPI->setMeasuredSize(custom, SIZE_100, SIZE_100);
    auto ret1 = nodeAPI->getMeasuredSize(custom).height;
    auto ret2 = nodeAPI->getMeasuredSize(custom).width;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SIZE_100);
    ASSERT_EQ(ret2, SIZE_100);
    NAPI_END;
}

static napi_value TestLayoutConstraintMeasuredSize002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto ret = nodeAPI->setMeasuredSize(custom, PARAM_NEGATIVE_1, PARAM_NEGATIVE_1);
    auto ret1 = nodeAPI->getMeasuredSize(custom).height;
    auto ret2 = nodeAPI->getMeasuredSize(custom).width;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_0);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static napi_value TestLayoutConstraintLayoutPosition001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto ret = nodeAPI->setLayoutPosition(custom, SIZE_100, SIZE_100);
    auto ret1 = nodeAPI->getLayoutPosition(custom).x;
    auto ret2 = nodeAPI->getLayoutPosition(custom).y;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SIZE_100);
    ASSERT_EQ(ret2, SIZE_100);
    NAPI_END;
}

static napi_value TestLayoutConstraintLayoutPosition002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto ret = nodeAPI->setLayoutPosition(custom, PARAM_NEGATIVE_1, PARAM_NEGATIVE_1);
    auto ret1 = nodeAPI->getLayoutPosition(custom).x;
    auto ret2 = nodeAPI->getLayoutPosition(custom).y;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_NEGATIVE_1);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestLayoutConstraintMeasureNode001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto layoutConstraint = OH_ArkUI_LayoutConstraint_Create();
    OH_ArkUI_LayoutConstraint_SetMinWidth(layoutConstraint, SIZE_100);
    OH_ArkUI_LayoutConstraint_SetMaxWidth(layoutConstraint, SIZE_100);
    OH_ArkUI_LayoutConstraint_SetMinHeight(layoutConstraint, SIZE_100);
    OH_ArkUI_LayoutConstraint_SetMaxHeight(layoutConstraint, SIZE_100);
    OH_ArkUI_LayoutConstraint_SetPercentReferenceWidth(layoutConstraint, SIZE_100);
    OH_ArkUI_LayoutConstraint_SetPercentReferenceHeight(layoutConstraint, SIZE_100);
    auto ret = nodeAPI->measureNode(custom, layoutConstraint);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestLayoutConstraintMeasureNode002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto ret = nodeAPI->measureNode(custom, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestLayoutConstraintLayoutNode001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto ret = nodeAPI->layoutNode(custom, PARAM_1, PARAM_1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestLayoutConstraintLayoutNode002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ret = nodeAPI->layoutNode(nullptr, PARAM_1, PARAM_1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
} // namespace ArkUICapiTest
