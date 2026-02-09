/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_node_napi.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "arkui/native_interface.h"

namespace ArkUICapiTest {
#define FLOAT_STEP 2.5
#define FLOAT_SPACING 5.5
static napi_value TextMarqueeOptionsTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                    "TextMarqueeOptionsTest", "TextMarqueeOptionsTest start");
    auto marqueeOptions = OH_ArkUI_TextMarqueeOptions_Create();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                    "Manager", "TextMarqueeOptions  Create success ");
    ASSERT_NOTNULL(marqueeOptions);
    if (marqueeOptions) {
        OH_ArkUI_TextMarqueeOptions_SetStart(marqueeOptions, true);
        auto marqueeOptionsStart1 = OH_ArkUI_TextMarqueeOptions_GetStart(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  Start %{public}d ", marqueeOptionsStart1);
        ASSERT_EQ(marqueeOptionsStart1, PARAM_1);
        OH_ArkUI_TextMarqueeOptions_SetStart(marqueeOptions, false);
        auto marqueeOptionsStart2 = OH_ArkUI_TextMarqueeOptions_GetStart(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  Start %{public}d ", marqueeOptionsStart2);
        ASSERT_EQ(marqueeOptionsStart2, PARAM_0);
        OH_ArkUI_TextMarqueeOptions_SetStep(marqueeOptions, FLOAT_STEP);
        auto marqueeOptionsStep = OH_ArkUI_TextMarqueeOptions_GetStep(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  Step %{public}.2f ", marqueeOptionsStep);
        ASSERT_EQ(marqueeOptionsStep,FLOAT_STEP);
        OH_ArkUI_TextMarqueeOptions_SetSpacing(marqueeOptions, FLOAT_SPACING);
        auto marqueeOptionsSpacing = OH_ArkUI_TextMarqueeOptions_GetSpacing(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  Spacing %{public}.2f ", marqueeOptionsSpacing);
        ASSERT_EQ(marqueeOptionsSpacing, FLOAT_SPACING);
        OH_ArkUI_TextMarqueeOptions_SetLoop(marqueeOptions, PARAM_5);
        auto marqueeOptionsLoop = OH_ArkUI_TextMarqueeOptions_GetLoop(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  Loop %{public}d ", marqueeOptionsLoop);
        ASSERT_EQ(marqueeOptionsLoop, PARAM_5);
        OH_ArkUI_TextMarqueeOptions_SetFromStart(marqueeOptions, true);
        auto marqueeOptionsFromStart1 = OH_ArkUI_TextMarqueeOptions_GetFromStart(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  FromStart %{public}d ", marqueeOptionsFromStart1);
        ASSERT_EQ(marqueeOptionsFromStart1, PARAM_1);
        OH_ArkUI_TextMarqueeOptions_SetFromStart(marqueeOptions, false);
        auto marqueeOptionsFromStart2 = OH_ArkUI_TextMarqueeOptions_GetFromStart(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  FromStart %{public}d ", marqueeOptionsFromStart2);
        ASSERT_EQ(marqueeOptionsFromStart2, PARAM_0);
        OH_ArkUI_TextMarqueeOptions_SetDelay(marqueeOptions, PARAM_6);
        auto marqueeOptionsDelay = OH_ArkUI_TextMarqueeOptions_GetDelay(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  Delay %{public}d ", marqueeOptionsDelay);
        ASSERT_EQ(marqueeOptionsDelay, PARAM_6);
        OH_ArkUI_TextMarqueeOptions_SetFadeout(marqueeOptions, true);
        auto marqueeOptionsFadeout1 = OH_ArkUI_TextMarqueeOptions_GetFadeout(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  Fadeout %{public}d ", marqueeOptionsFadeout1);
        ASSERT_EQ(marqueeOptionsFadeout1, PARAM_1);
        OH_ArkUI_TextMarqueeOptions_SetFadeout(marqueeOptions, false);
        auto marqueeOptionsFadeout2 = OH_ArkUI_TextMarqueeOptions_GetFadeout(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  Fadeout %{public}d ", marqueeOptionsFadeout2);
        ASSERT_EQ(marqueeOptionsFadeout2, PARAM_0);
        OH_ArkUI_TextMarqueeOptions_SetStartPolicy(marqueeOptions, ARKUI_MARQUEESTARTPOLICY_DEFAULT);
        auto marqueeOptionsStartPolicy1 = OH_ArkUI_TextMarqueeOptions_GetStartPolicy(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  StartPolicy %{public}d ", marqueeOptionsStartPolicy1);
        ASSERT_EQ(marqueeOptionsStartPolicy1, PARAM_0);
        OH_ArkUI_TextMarqueeOptions_SetStartPolicy(marqueeOptions, ARKUI_MARQUEESTARTPOLICY_ONFOCUS);
        auto marqueeOptionsStartPolicy2 = OH_ArkUI_TextMarqueeOptions_GetStartPolicy(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  StartPolicy %{public}d ", marqueeOptionsStartPolicy2);
        ASSERT_EQ(marqueeOptionsStartPolicy2, PARAM_1);
        OH_ArkUI_TextMarqueeOptions_SetUpdatePolicy(marqueeOptions, ARKUI_MARQUEEUPDATEPOLICY_DEFAULT);
        auto marqueeOptionsUpdatePolicy1 = OH_ArkUI_TextMarqueeOptions_GetUpdatePolicy(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  UpdatePolicy %{public}d ", marqueeOptionsUpdatePolicy1);
        ASSERT_EQ(marqueeOptionsUpdatePolicy1, PARAM_0);
        OH_ArkUI_TextMarqueeOptions_SetUpdatePolicy(marqueeOptions, ARKUI_MARQUEEUPDATEPOLICY_PRESERVEPOSITION);
        auto marqueeOptionsUpdatePolicy2 = OH_ArkUI_TextMarqueeOptions_GetUpdatePolicy(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  UpdatePolicy %{public}d ", marqueeOptionsUpdatePolicy2);
        ASSERT_EQ(marqueeOptionsUpdatePolicy2, PARAM_1);
        OH_ArkUI_TextMarqueeOptions_Dispose(marqueeOptions);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, 
                        "Manager", "TextMarqueeOptions  Dispose success ");
    }
    NAPI_END;
}
} // namespace ArkUICapiTest