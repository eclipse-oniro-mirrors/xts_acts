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
#include <arkui/native_type.h>

#define NUMBER_0 0
#define VALUE_0 10
const int INVAILE_PARA = -1;

namespace ArkUICapiTest {

static napi_value TestListChildMainSize001(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_ListChildrenMainSizeOption_Create();
    if(ret == nullptr) {
       NAPI_END;
    }
    napi_value result = nullptr;  
    napi_create_int32(env, 1, &result);                                                                                 
    return result;
    
}

static napi_value TestListChildMainSize002(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(listChildrenMainSize, SIZE_30);
    auto ret = OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(listChildrenMainSize);
    ASSERT_EQ(ret, SIZE_30);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static napi_value TestListChildMainSize003(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    int ret = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(listChildrenMainSize,NUMBER_0,VALUE_0);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static napi_value TestListChildMainSize004(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    int ret = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(listChildrenMainSize, INVAILE_PARA);
    ASSERT_EQ(ret, INVAILE_PARA);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static napi_value TestListChildMainSize005(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Resize(listChildrenMainSize, VALUE_0);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static napi_value TestListChildMainSize006(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    int ret = OH_ArkUI_ListChildrenMainSizeOption_Splice(listChildrenMainSize, NUMBER_0, VALUE_0, VALUE_0);
    ASSERT_EQ(ret, NUMBER_0);
    NAPI_END;
}

static napi_value TestListChildMainSize007(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "list", "childrenMainSize: %{public}o",  ret);
    ASSERT_NOTNULL(ret);
    NAPI_END;
}

static napi_value TestListSwipeOption007(napi_env env, napi_callback_info info)
{
    auto listItemSwipeActionOption = OH_ArkUI_ListItemSwipeActionOption_Create();
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    OH_ArkUI_ListItemSwipeActionOption_SetStart(listItemSwipeActionOption, listSwipeActionItem);
    OH_ArkUI_ListItemSwipeActionOption_SetEnd(listItemSwipeActionOption, listSwipeActionItem);
    NAPI_END;
}

static napi_value TestListSwipeOption008(napi_env env, napi_callback_info info)
{
    auto listItemSwipeActionOption = OH_ArkUI_ListItemSwipeActionOption_Create();
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    int ret = OH_ArkUI_List_CloseAllSwipeActions(nullptr, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestNodeUtils010(napi_env env, napi_callback_info info)
{   
    ArkUI_IntSize layoutSize = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NodeUtils_GetLayoutSize(nodeHandle, &layoutSize);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestNodeUtils020(napi_env env, napi_callback_info info)
{   
    ArkUI_IntOffset localoffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetLayoutPosition(nodeHandle, &localoffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}


static napi_value TestNodeUtils030(napi_env env, napi_callback_info info)
{   
    ArkUI_IntOffset globaloffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetLayoutPositionInWindow(nodeHandle, &globaloffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestNodeUtils040(napi_env env, napi_callback_info info)
{   
    ArkUI_IntOffset screenoffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetLayoutPositionInScreen(nodeHandle, &screenoffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestNodeUtils050(napi_env env, napi_callback_info info)
{   
    ArkUI_IntOffset screenoffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetPositionWithTranslateInScreen(nodeHandle, &screenoffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestNodeUtils060(napi_env env, napi_callback_info info)
{   
    ArkUI_IntOffset translateOffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetPositionWithTranslateInWindow(nodeHandle, &translateOffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestImageAniMator009(napi_env env, napi_callback_info info)
{   
    char *content = "C textStyle Test";
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
    if(ret == nullptr) {
        NAPI_END;
    }
    napi_value result = nullptr;  
    napi_create_int32(env, 1, &result);
    OH_ArkUI_ImageAnimatorFrameInfo_Dispose(ret);                                                                                
    return result;
}

static napi_value TestImageAniMator010(napi_env env, napi_callback_info info)
{   
    ArkUI_DrawableDescriptor *drawableDescripter = nullptr;
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromDrawableDescriptor(drawableDescripter);
    if(ret == nullptr) {
        NAPI_END;
    }
    napi_value result = nullptr;  
    napi_create_int32(env, 1, &result);                                                                                 
    return result;
}

static napi_value TestImageAniMator011(napi_env env, napi_callback_info info)
{   
     char *content = "C textStyle Test";
     auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
     OH_ArkUI_ImageAnimatorFrameInfo_SetWidth(ret, VALUE_0);
     auto value = OH_ArkUI_ImageAnimatorFrameInfo_GetWidth(ret);
     ASSERT_EQ(value, VALUE_0);
     napi_value result = nullptr;  
     napi_create_int32(env, 1, &result);                                                                                 
     return result;
}
static napi_value TestAccessibility070(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    if (ret == nullptr) {
        NAPI_END;
    }
    OH_ArkUI_AccessibilityValue_Dispose(ret);
    napi_value result = nullptr;  
    napi_create_int32(env, 1, &result);                                                                                 
    return result;
}

static napi_value TestAccessibility080(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMin(ret, VALUE_0);
    auto value = OH_ArkUI_AccessibilityValue_GetMin(ret);
    ASSERT_EQ(value, VALUE_0);
    napi_value result = nullptr;  
    napi_create_int32(env, 1, &result);                                                                                 
    return result;
}

static napi_value TestAccessibility090(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMax(ret, VALUE_0);
    auto value = OH_ArkUI_AccessibilityValue_GetMax(ret);
    ASSERT_EQ(value, VALUE_0);
    napi_value result = nullptr;  
    napi_create_int32(env, 1, &result);                                                                                 
    return result;
}

static napi_value TestAccessibility010(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetCurrent(ret, VALUE_0);
    auto value = OH_ArkUI_AccessibilityValue_GetCurrent(ret);
    ASSERT_EQ(value, VALUE_0);
    napi_value result = nullptr;  
    napi_create_int32(env, 1, &result);                                                                                 
    return result;
}


static napi_value TestAccessibility011(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    const char *content = "C textStyle Test";
    OH_ArkUI_AccessibilityValue_SetText(ret, content);
    auto value = OH_ArkUI_AccessibilityValue_GetText(ret);
    ASSERT_STREQ(content, value);
    napi_value result = nullptr;  
    napi_create_int32(env, 1, &result);                                                                                 
    return result;
}

} // namespace ArkUICapiTest
