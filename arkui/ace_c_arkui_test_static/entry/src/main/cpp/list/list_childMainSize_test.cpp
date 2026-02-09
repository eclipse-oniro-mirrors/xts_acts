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

#include "common/common.h"
#include "ani/ani.h"
#include <arkui/native_type.h>

#define NUMBER_0 0
#define VALUE_0 10
const int INVAILE_PARA = -1;

namespace ArkUIAniTest {

static ani_double TestListChildMainSize001(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_ListChildrenMainSizeOption_Create();
    if(ret == nullptr) {
       NAPI_END;
    }
    ani_int result = PARAM_1;  
    return result;
    
}

static ani_double TestListChildMainSize002(ani_env* env, ani_object info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(listChildrenMainSize, SIZE_30);
    auto ret = OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(listChildrenMainSize);
    ASSERT_EQ(ret, SIZE_30);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static ani_double TestListChildMainSize003(ani_env* env, ani_object info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    int ret = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(listChildrenMainSize,NUMBER_0,VALUE_0);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static ani_double TestListChildMainSize004(ani_env* env, ani_object info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    int ret = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(listChildrenMainSize, INVAILE_PARA);
    ASSERT_EQ(ret, INVAILE_PARA);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static ani_double TestListChildMainSize005(ani_env* env, ani_object info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Resize(listChildrenMainSize, VALUE_0);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static ani_double TestListChildMainSize006(ani_env* env, ani_object info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    int ret = OH_ArkUI_ListChildrenMainSizeOption_Splice(listChildrenMainSize, NUMBER_0, VALUE_0, VALUE_0);
    ASSERT_EQ(ret, NUMBER_0);
    NAPI_END;
}

static ani_double TestListSwipeOption007(ani_env* env, ani_object info)
{
    auto listItemSwipeActionOption = OH_ArkUI_ListItemSwipeActionOption_Create();
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    OH_ArkUI_ListItemSwipeActionOption_SetStart(listItemSwipeActionOption, listSwipeActionItem);
    OH_ArkUI_ListItemSwipeActionOption_SetEnd(listItemSwipeActionOption, listSwipeActionItem);
    NAPI_END;
}

static ani_double TestListSwipeOption008(ani_env* env, ani_object info)
{
    auto listItemSwipeActionOption = OH_ArkUI_ListItemSwipeActionOption_Create();
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    int ret = OH_ArkUI_List_CloseAllSwipeActions(nullptr, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestNodeUtils010(ani_env* env, ani_object info)
{   
    ArkUI_IntSize layoutSize = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NodeUtils_GetLayoutSize(nodeHandle, &layoutSize);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestNodeUtils020(ani_env* env, ani_object info)
{   
    ArkUI_IntOffset localoffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetLayoutPosition(nodeHandle, &localoffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}


static ani_double TestNodeUtils030(ani_env* env, ani_object info)
{   
    ArkUI_IntOffset globaloffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetLayoutPositionInWindow(nodeHandle, &globaloffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestNodeUtils040(ani_env* env, ani_object info)
{   
    ArkUI_IntOffset screenoffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetLayoutPositionInScreen(nodeHandle, &screenoffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestNodeUtils050(ani_env* env, ani_object info)
{   
    ArkUI_IntOffset screenoffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetPositionWithTranslateInScreen(nodeHandle, &screenoffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestNodeUtils060(ani_env* env, ani_object info)
{   
    ArkUI_IntOffset translateOffset = {0, 0};
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto ret = OH_ArkUI_NodeUtils_GetPositionWithTranslateInWindow(nodeHandle, &translateOffset);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestImageAniMator009(ani_env* env, ani_object info)
{   
    char *content = "C textStyle Test";
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
    if(ret == nullptr) {
        NAPI_END;
    }
    ani_int result = PARAM_1;
    OH_ArkUI_ImageAnimatorFrameInfo_Dispose(ret);                                                                        
    return result;
}

static ani_double TestImageAniMator010(ani_env* env, ani_object info)
{   
    ArkUI_DrawableDescriptor *drawableDescripter = nullptr;
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromDrawableDescriptor(drawableDescripter);
    if(ret == nullptr) {
        NAPI_END;
    }
    ani_int result = PARAM_1;                                                                                
    return result;
}

static ani_double TestImageAniMator011(ani_env* env, ani_object info)
{   
     char *content = "C textStyle Test";
     auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
     OH_ArkUI_ImageAnimatorFrameInfo_SetWidth(ret, VALUE_0);
     auto value = OH_ArkUI_ImageAnimatorFrameInfo_GetWidth(ret);
     ASSERT_EQ(value, VALUE_0);
     ani_int result = PARAM_1;  
     return result;
}
static ani_double TestAccessibility070(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    if (ret == nullptr) {
        NAPI_END;
    }
    OH_ArkUI_AccessibilityValue_Dispose(ret);
    ani_int result = PARAM_1;                                                                                
    return result;
}

static ani_double TestAccessibility080(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMin(ret, VALUE_0);
    auto value = OH_ArkUI_AccessibilityValue_GetMin(ret);
    ASSERT_EQ(value, VALUE_0);
    ani_int result = PARAM_1;                                                                                
    return result;
}

static ani_double TestAccessibility090(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMax(ret, VALUE_0);
    auto value = OH_ArkUI_AccessibilityValue_GetMax(ret);
    ASSERT_EQ(value, VALUE_0);
    ani_int result = PARAM_1;                                                                                
    return result;
}

static ani_double TestAccessibility010(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetCurrent(ret, VALUE_0);
    auto value = OH_ArkUI_AccessibilityValue_GetCurrent(ret);
    ASSERT_EQ(value, VALUE_0);
    ani_int result = PARAM_1;                                                                                
    return result;
}


static ani_double TestAccessibility011(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    const char *content = "C textStyle Test";
    OH_ArkUI_AccessibilityValue_SetText(ret, content);
    auto value = OH_ArkUI_AccessibilityValue_GetText(ret);
    ASSERT_STREQ(content, value);
    ani_int result = PARAM_1;                                                                                
    return result;
}

} // namespace ArkUIAniTest
