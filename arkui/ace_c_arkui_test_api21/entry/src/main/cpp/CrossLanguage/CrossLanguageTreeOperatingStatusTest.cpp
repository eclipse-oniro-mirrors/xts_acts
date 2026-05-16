/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "arkui/native_type.h"
#include "arkui/native_node.h"

static int NUMBER_999 = 999;

namespace ArkUICapiTest {

static napi_value testCrossLanguageTreeOperatingStatus(napi_env env, napi_callback_info info)
{
    ArkUI_CrossLanguageOption *option = OH_ArkUI_CrossLanguageOption_Create();
    OH_ArkUI_CrossLanguageOption_SetTreeOperatingStatus(nullptr, OH_ARKUI_TREE_OPERATING_STATUS_ENABLE);
    OH_ArkUI_CrossLanguageOperatingStatus ret1 = OH_ArkUI_CrossLanguageOption_GetTreeOperatingStatus(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "testCrossLanguageTreeOperatingStatus ret1=%{public}d", ret1);
    ASSERT_EQ(ret1, OH_ARKUI_TREE_OPERATING_STATUS_UNDEFINED);
    
    auto invalidStatus1 = static_cast<OH_ArkUI_CrossLanguageOperatingStatus>(-1);
    OH_ArkUI_CrossLanguageOption_SetTreeOperatingStatus(option, invalidStatus1);
    OH_ArkUI_CrossLanguageOperatingStatus ret2 = OH_ArkUI_CrossLanguageOption_GetTreeOperatingStatus(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "testCrossLanguageTreeOperatingStatus ret2=%{public}d", ret2);
    ASSERT_EQ(ret2, -1);
    
    auto invalidStatus2 = static_cast<OH_ArkUI_CrossLanguageOperatingStatus>(NUMBER_999);
    OH_ArkUI_CrossLanguageOption_SetTreeOperatingStatus(option, invalidStatus2);
    OH_ArkUI_CrossLanguageOperatingStatus ret3 = OH_ArkUI_CrossLanguageOption_GetTreeOperatingStatus(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "testCrossLanguageTreeOperatingStatus ret3=%{public}d", ret3);
    ASSERT_EQ(ret3, NUMBER_999);
    
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(option, true);
    OH_ArkUI_CrossLanguageOption_SetTreeOperatingStatus(option, OH_ARKUI_TREE_OPERATING_STATUS_UNDEFINED);
    OH_ArkUI_CrossLanguageOperatingStatus ret4 = OH_ArkUI_CrossLanguageOption_GetTreeOperatingStatus(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "testCrossLanguageTreeOperatingStatus ret4=%{public}d", ret4);
    ASSERT_EQ(ret4, OH_ARKUI_TREE_OPERATING_STATUS_UNDEFINED);
    
    OH_ArkUI_CrossLanguageOption_SetTreeOperatingStatus(option, OH_ARKUI_TREE_OPERATING_STATUS_DISABLE);
    OH_ArkUI_CrossLanguageOperatingStatus ret5 = OH_ArkUI_CrossLanguageOption_GetTreeOperatingStatus(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "testCrossLanguageTreeOperatingStatus ret5=%{public}d", ret5);
    ASSERT_EQ(ret5, OH_ARKUI_TREE_OPERATING_STATUS_DISABLE);
    
    OH_ArkUI_CrossLanguageOption_SetTreeOperatingStatus(option, OH_ARKUI_TREE_OPERATING_STATUS_ENABLE);
    OH_ArkUI_CrossLanguageOperatingStatus ret6 = OH_ArkUI_CrossLanguageOption_GetTreeOperatingStatus(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "testCrossLanguageTreeOperatingStatus ret6=%{public}d", ret6);
    ASSERT_EQ(ret6, OH_ARKUI_TREE_OPERATING_STATUS_ENABLE);
    
    NAPI_END;
}

} // namespace ArkUICapiTest