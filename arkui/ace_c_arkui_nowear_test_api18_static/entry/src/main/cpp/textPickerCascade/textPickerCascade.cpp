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

#include "textPickerCascade.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>
#include "ani/ani.h"

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>

namespace ArkUICapiTest {


ani_int TextPickerCascadeTest::TextPickerCascadeTest_a(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 5;
    auto array = OH_ArkUI_TextPickerRangeContentArray_Create(len);
    int check = ((array == nullptr) ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_a", "check %{public}d", check);
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_TextPickerRangeContentArray_Destroy(array);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_a", "Destroy ret void");
    NAPI_END;
}

ani_int TextPickerCascadeTest::TextPickerCascadeTest_a1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_a1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = -5;
    auto array = OH_ArkUI_TextPickerRangeContentArray_Create(len);
    int check = ((array == nullptr) ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_a1", "check %{public}d", check);
    ASSERT_EQ(check, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
typedef const char* ArkUI_CharPtr;
typedef struct RangeContent_ {
    ArkUI_CharPtr icon;
    ArkUI_CharPtr text;
}RangeContent_;

typedef struct ArkUI_TextPickerRangeContentArray_ {
    RangeContent_* rangeContent;
    int32_t rangeContentArraySize;
}ArkUI_TextPickerRangeContentArray_;

ani_int TextPickerCascadeTest::TextPickerCascadeTest_b(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 5;
    char data[12] = "test data";
    char expect[12] = {0};
    auto array = OH_ArkUI_TextPickerRangeContentArray_Create(len);
    OH_ArkUI_TextPickerRangeContentArray_SetIconAtIndex(array, data, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_b", "SetIconAtIndex ret void,check: %{public}s", 
    ((((ArkUI_TextPickerRangeContentArray_*)array)->rangeContent[0])).icon);
    strncpy(expect, ((((ArkUI_TextPickerRangeContentArray_*)array)->rangeContent[0])).icon, sizeof(expect) - 1);  
    expect[sizeof(expect) - 1] = '\0'; 
    ASSERT_STREQ(data, expect);
    NAPI_END;
}

ani_int TextPickerCascadeTest::TextPickerCascadeTest_b1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_b1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 5;
    char data[12] = "test data";
    int check = 1;
    auto array = OH_ArkUI_TextPickerRangeContentArray_Create(len);
    OH_ArkUI_TextPickerRangeContentArray_SetIconAtIndex(array, data, -1);
    if(((((ArkUI_TextPickerRangeContentArray_*)array)->rangeContent[0])).icon == nullptr){
        check = 0;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_b1", "SetIconAtIndex ret nullptr");
    }
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int TextPickerCascadeTest::TextPickerCascadeTest_c(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 5;
    char data[12] = "test data";
    auto array = OH_ArkUI_TextPickerRangeContentArray_Create(len);
    OH_ArkUI_TextPickerRangeContentArray_SetTextAtIndex(array, data, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_c", "SetTextAtIndex ret void,check: %{public}s", 
    ((((ArkUI_TextPickerRangeContentArray_*)array)->rangeContent[0])).text);
    char expect[12] = {0};
    strncpy(expect, ((((ArkUI_TextPickerRangeContentArray_*)array)->rangeContent[0])).text, sizeof(expect) - 1);  
    expect[sizeof(expect) - 1] = '\0'; 
    ASSERT_STREQ(data, expect);
    NAPI_END;
}


ani_int TextPickerCascadeTest::TextPickerCascadeTest_c1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_c1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 5;
    char data[12] = "test data";
    int check = 1;
    auto array = OH_ArkUI_TextPickerRangeContentArray_Create(len);
    OH_ArkUI_TextPickerRangeContentArray_SetTextAtIndex(array, data, -1);
    if(((((ArkUI_TextPickerRangeContentArray_*)array)->rangeContent[0])).text == nullptr){
        check = 0;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_c1", "SetTextAtIndex ret nullptr");
    }
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int TextPickerCascadeTest::TextPickerCascadeTest_d(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_d", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 6;
    auto ret = OH_ArkUI_TextCascadePickerRangeContentArray_Create(len);
    int check = ((ret == nullptr) ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_d", "check %{public}d", check);
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_TextCascadePickerRangeContentArray_Destroy(ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_d", "Destroy ret void");
    NAPI_END;
}

ani_int TextPickerCascadeTest::TextPickerCascadeTest_d1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_d1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 0;
    auto ret = OH_ArkUI_TextCascadePickerRangeContentArray_Create(len);
    int check = ((ret == nullptr) ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_d1", "check %{public}d", check);
    ASSERT_EQ(check, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

typedef int ArkUI_Int32;
typedef struct ArkUI_TextCascadePickerRangeContentArray_ {
    ArkUI_CharPtr text;
    ArkUI_Int32 rangeContentArraySize;
    ArkUI_TextCascadePickerRangeContentArray_* children;
}ArkUI_TextCascadePickerRangeContentArray_;

ani_int TextPickerCascadeTest::TextPickerCascadeTest_e(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_e", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 6;
    char data[12] = "test data";
    auto array = OH_ArkUI_TextCascadePickerRangeContentArray_Create(len);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(array, data, 0);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_e", "SetTextAtIndex check %{public}s",
                (((ArkUI_TextCascadePickerRangeContentArray_*)array)[0]).text);
    char expect[12] = {0};
    strncpy(expect, (((ArkUI_TextCascadePickerRangeContentArray_*)array)[0]).text, sizeof(expect) - 1);  
    expect[sizeof(expect) - 1] = '\0'; 
    ASSERT_STREQ(data, expect);
    NAPI_END;
}


ani_int TextPickerCascadeTest::TextPickerCascadeTest_e1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_e1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 6;
    char data[12] = "test data";
    auto array = OH_ArkUI_TextCascadePickerRangeContentArray_Create(len);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(array, data, -1);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_e1", "SetTextAtIndex ret void");
    int check = 1;
    if((((ArkUI_TextCascadePickerRangeContentArray_*)array)[0]).text == nullptr){
        check = 0;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_e1", "SetTextAtIndex ret nullptr");
    }
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int TextPickerCascadeTest::TextPickerCascadeTest_f(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_f", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 6;
    char data[12] = "test data";
    auto array = OH_ArkUI_TextCascadePickerRangeContentArray_Create(len);
    auto child = OH_ArkUI_TextCascadePickerRangeContentArray_Create(1);
    
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(child, data, 0);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetChildAtIndex(array, child, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_f", "SetChildAtIndex chiled %{public}s",
                 (((ArkUI_TextCascadePickerRangeContentArray_*)array)[0]).children->text);
    char expect[12] = {0};
    strncpy(expect, (((ArkUI_TextCascadePickerRangeContentArray_*)array)[0]).children->text, sizeof(expect) - 1);  
    expect[sizeof(expect) - 1] = '\0'; 
    ASSERT_STREQ(data, expect);
    NAPI_END;
}

ani_int TextPickerCascadeTest::TextPickerCascadeTest_f1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_f1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int len = 6;
    char data[12] = "test data";
    auto array = OH_ArkUI_TextCascadePickerRangeContentArray_Create(len);
    auto child = OH_ArkUI_TextCascadePickerRangeContentArray_Create(1);
    
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(child, data, -1);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetChildAtIndex(array, child, -1);
    int check = 1;
    if((((ArkUI_TextCascadePickerRangeContentArray_*)array)[0]).children == nullptr ||
       (((ArkUI_TextCascadePickerRangeContentArray_*)array)[0]).children->text == nullptr ){
        check = 0;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerCascadeTest_f1", "SetTextAtIndex ret nullptr");
    }
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
} // namespace ArkUICapiTest