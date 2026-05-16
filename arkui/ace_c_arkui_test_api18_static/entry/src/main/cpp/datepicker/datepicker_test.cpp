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

#include "../component/column_component.h"
#include "../component/datepicker_component.h"
#include "../manager/plugin_manager.h"
#include "common/common.h"
#include "datepicker_test.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"


namespace ArkUIAniTest {
    
void DatePickerTest::DatePickerModeTest(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto datepicker1 = std::make_shared<DatePickerComponent>();
    datepicker1->SetDatePickerMode(ARKUI_DATEPICKER_MODE_DATE);
    datepicker1->SetDatePickerSelected("2024-12-31");
    datepicker1->SetDatePickerStart("2000-1-1");
    datepicker1->SetDatePickerEnd("2025-2-2");
    datepicker1->SetId("datePickerMode1");

    auto datepicker2 = std::make_shared<DatePickerComponent>();
    datepicker2->SetDatePickerMode(ARKUI_DATEPICKER_YEAR_AND_MONTH);
    datepicker2->SetDatePickerSelected("2024-12-31");
    datepicker2->SetDatePickerStart("2000-1-1");
    datepicker2->SetDatePickerEnd("2025-2-2");
    datepicker2->SetId("datePickerMode2");

    auto datepicker3 = std::make_shared<DatePickerComponent>();
    datepicker3->SetDatePickerMode(ARKUI_DATEPICKER_MONTH_AND_DAY);
    datepicker3->SetDatePickerSelected("2024-12-31");
    datepicker3->SetDatePickerStart("2000-1-1");
    datepicker3->SetDatePickerEnd("2025-2-2");
    datepicker3->SetId("datePickerMode3");

    auto column = new ColumnComponent();
    column->AddChild(datepicker1);
    column->AddChild(datepicker2);
    column->AddChild(datepicker3);


    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // ArkUIAniTest
