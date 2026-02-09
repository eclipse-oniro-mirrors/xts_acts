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
static napi_value ControllerBaseCreatTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "ControllerBaseCreatTest", "ControllerBaseCreatTest start");
 
    auto TextSelectionOptions = OH_ArkUI_SelectionOptions_Create();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "Manager", "TextSelectionOptions  Create success ");
    ASSERT_NOTNULL(TextSelectionOptions);
    OH_ArkUI_SelectionOptions_Dispose(TextSelectionOptions);
 
    auto TextContentBaseController = OH_ArkUI_TextContentBaseController_Create();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "Manager", "TextContentBaseController  Create success ");
    ASSERT_NOTNULL(TextContentBaseController);
    OH_ArkUI_TextContentBaseController_Dispose(TextContentBaseController);
 
    auto TextSelectionDragPreviewStyle = OH_ArkUI_SelectedDragPreviewStyle_Create();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "Manager", "TextSelectionDragPreviewStyle  Create success ");
    ASSERT_NOTNULL(TextSelectionDragPreviewStyle);
    OH_ArkUI_SelectedDragPreviewStyle_Dispose(TextSelectionDragPreviewStyle);
    
    NAPI_END;
}
} // namespace ArkUICapiTest