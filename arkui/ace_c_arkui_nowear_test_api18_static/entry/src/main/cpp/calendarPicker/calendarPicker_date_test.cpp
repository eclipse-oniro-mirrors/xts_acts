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

#include "../manager/plugin_manager.h"
#include "calendarPicker_date_test.h"
#include "../component/column_component.h"
#include <arkui/native_dialog.h>
#include <string>
#include "../component/calendarPicker_component.h"
#include "ani/ani.h"
#include "arkui/native_interface.h"
#include <arkui/native_node.h>
#include "arkui/native_node_ani.h"

#include <arkui/native_type.h>

  
namespace ArkUICapiTest {
  
void CalendarPickerStartEndTest::CalendarPickerDateTest(ani_env* env, ani_object obj, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CalendarPickerStartEndTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);


    auto calendarPicker = std::make_shared<CalendarPickerComponent>();
    calendarPicker->SetCalendarPickerStart("2024-12-01");
    calendarPicker->SetCalendarPickerEnd("2025-12-30");
    calendarPicker->SetId("CalendarPickerDate_001");
      
    auto column = new ColumnComponent();
    column->AddChild(calendarPicker);


    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
  
} // namespace ArkUICApiDemo