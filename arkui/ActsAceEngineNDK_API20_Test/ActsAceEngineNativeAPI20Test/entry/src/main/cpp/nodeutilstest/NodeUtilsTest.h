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
#ifndef NODE_UTILS_TEST_H
#define NODE_UTILS_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <cstdint>
#include <napi/native_api.h>
#include <arkui/native_node.h>
#include "common/Common.h"

namespace NodeUtilsTest {
    napi_value GetLayoutSizeTest_001(napi_env env, napi_callback_info info);
    napi_value GetLayoutSizeTest_002(napi_env env, napi_callback_info info);
    napi_value GetLayoutPositionTest_001(napi_env env, napi_callback_info info);
    napi_value GetLayoutPositionTest_002(napi_env env, napi_callback_info info);
    napi_value GetLayoutPositionInWindowTest_001(napi_env env, napi_callback_info info);
    napi_value GetLayoutPositionInWindowTest_002(napi_env env, napi_callback_info info);
    napi_value GetLayoutPositionInScreenTest_001(napi_env env, napi_callback_info info);
    napi_value GetLayoutPositionInScreenTest_002(napi_env env, napi_callback_info info);
    napi_value GetLayoutPositionInGlobalDisplayTest_001(napi_env env, napi_callback_info info);
    napi_value GetLayoutPositionInGlobalDisplayTest_002(napi_env env, napi_callback_info info);
    napi_value GetPositionWithTranslateInWindowTest_001(napi_env env, napi_callback_info info);
    napi_value GetPositionWithTranslateInWindowTest_002(napi_env env, napi_callback_info info);
    napi_value GetPositionWithTranslateInScreenTest_001(napi_env env, napi_callback_info info);
    napi_value GetPositionWithTranslateInScreenTest_002(napi_env env, napi_callback_info info);
    napi_value GetCustomPropertyTest_001(napi_env env, napi_callback_info info);
    napi_value GetActiveChildrenInfoTest_001(napi_env env, napi_callback_info info);
    napi_value GetActiveChildrenInfoTest_002(napi_env env, napi_callback_info info);
    napi_value MoveToTest_001(napi_env env, napi_callback_info info);
    napi_value SetCrossLanguageOptionTest_001(napi_env env, napi_callback_info info);
    napi_value SetCrossLanguageOptionTest_002(napi_env env, napi_callback_info info);
    napi_value GetCrossLanguageOptionTest_001(napi_env env, napi_callback_info info);
    napi_value GetCrossLanguageOptionTest_002(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_001(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_002(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_003(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_004(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_005(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_006(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_007(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_008(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_009(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_010(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_011(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_012(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_013(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_014(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_015(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_016(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_017(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_018(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_019(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_020(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_021(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_022(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_023(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_024(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_025(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_026(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_027(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_028(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_029(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_030(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_031(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_032(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_033(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_034(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_035(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_036(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_037(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_038(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_039(napi_env env, napi_callback_info info);
    napi_value GetNodeTypeTest_040(napi_env env, napi_callback_info info);
    napi_value SetForceDarkConfigTest_001(napi_env env, napi_callback_info info);
    napi_value SetForceDarkConfigTest_002(napi_env env, napi_callback_info info);
    napi_value SetForceDarkConfigTest_003(napi_env env, napi_callback_info info);
    napi_value GetCustomSpanMeasureInfoTest_001(napi_env env, napi_callback_info info);
    napi_value GetCustomSpanMeasureInfoTest_002(napi_env env, napi_callback_info info);
    napi_value SetCustomSpanMetricsTest_001(napi_env env, napi_callback_info info);
    napi_value SetCustomSpanMetricsTest_002(napi_env env, napi_callback_info info);
    napi_value GetCustomSpanDrawInfoTest_001(napi_env env, napi_callback_info info);
    napi_value GetCustomSpanDrawInfoTest_002(napi_env env, napi_callback_info info);
    napi_value CreateCustomSpanNode(napi_env env, napi_callback_info info);
    napi_value CloseAllSwipeActionsTest_001(napi_env env, napi_callback_info info);
    napi_value CloseAllSwipeActionsTest_002(napi_env env, napi_callback_info info);
    napi_value CloseAllSwipeActionsTest_003(napi_env env, napi_callback_info info);
    napi_value RegisterSystemColorModeChangeTest_001(napi_env env, napi_callback_info info);
    napi_value RegisterSystemColorModeChangeTest_002(napi_env env, napi_callback_info info);
    napi_value RegisterSystemFontStyleChangeTest_001(napi_env env, napi_callback_info info);
    napi_value RegisterSystemFontStyleChangeTest_002(napi_env env, napi_callback_info info);
    napi_value RegisterLayoutCallbackOnNodeTest_001(napi_env env, napi_callback_info info);
    napi_value RegisterLayoutCallbackOnNodeTest_002(napi_env env, napi_callback_info info);
    napi_value RegisterDrawCallbackOnNodeTest_001(napi_env env, napi_callback_info info);
    napi_value RegisterDrawCallbackOnNodeTest_002(napi_env env, napi_callback_info info);
    napi_value UnregisterLayoutCallbackOnNodeTest_001(napi_env env, napi_callback_info info);
    napi_value UnregisterLayoutCallbackOnNodeTest_002(napi_env env, napi_callback_info info);
    napi_value UnregisterDrawCallbackOnNodeTest_001(napi_env env, napi_callback_info info);
    napi_value UnregisterDrawCallbackOnNodeTest_002(napi_env env, napi_callback_info info);
    napi_value GetPositionToParentTest_001(napi_env env, napi_callback_info info);
    napi_value GetPositionToParentTest_002(napi_env env, napi_callback_info info);
    napi_value GetNodeHandleByUniqueIdTest_001(napi_env env, napi_callback_info info);
    napi_value GetNodeHandleByUniqueIdTest_002(napi_env env, napi_callback_info info);
    napi_value GetNodeHandleByUniqueIdTest_003(napi_env env, napi_callback_info info);
    napi_value GetNodeUniqueIdTest_001(napi_env env, napi_callback_info info);
    napi_value GetNodeUniqueIdTest_002(napi_env env, napi_callback_info info);
    napi_value GetNodeUniqueIdTest_003(napi_env env, napi_callback_info info);
    napi_value AddSupportedUIStatesTest_001(napi_env env, napi_callback_info info);
    napi_value AddSupportedUIStatesTest_002(napi_env env, napi_callback_info info);
    napi_value RemoveSupportedUIStatesTest_001(napi_env env, napi_callback_info info);
    napi_value RemoveSupportedUIStatesTest_002(napi_env env, napi_callback_info info);
    napi_value GetArkuiNode(napi_env env, napi_callback_info info);
}

#endif // NODE_UTILS_TEST_H