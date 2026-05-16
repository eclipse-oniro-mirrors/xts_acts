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

struct ArkUIData {
    float id;
    int number;
};

static void Callback() {
    
}

static void Callback2(void *useData) {
    
}

static void Callback3(ArkUI_ListItemSwipeActionState swipeActionState) {
    
}

namespace ArkUIAniTest {


static ani_double listSwipeActionCreate(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_ListItemSwipeActionItem_Create();
    if(ret == nullptr) {
       NAPI_END;
    }
    ani_int result = PARAM_1;  
    return result;
    
}
static ani_double listSwipeActionSetActionAreaDistance001(ani_env* env, ani_object info)
{
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    OH_ArkUI_ListItemSwipeActionItem_SetActionAreaDistance(listSwipeActionItem, SIZE_56);
    auto ret = OH_ArkUI_ListItemSwipeActionItem_GetActionAreaDistance(listSwipeActionItem);
    ASSERT_EQ(ret, SIZE_56);
    NAPI_END;
}

static ani_double listSwipeActionOptionCreate(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_ListItemSwipeActionOption_Create();
    if(ret == nullptr) {
       NAPI_END;
    }
    ani_int result = PARAM_1;                                                                                
    return result;
    
}

static ani_double listSwipeActionOptionEdgeEffect(ani_env* env, ani_object info)
{
    auto listItemSwipeActionOption = OH_ArkUI_ListItemSwipeActionOption_Create();
    OH_ArkUI_ListItemSwipeActionOption_SetEdgeEffect(listItemSwipeActionOption, ARKUI_LIST_ITEM_SWIPE_EDGE_EFFECT_NONE);
    auto ret = OH_ArkUI_ListItemSwipeActionOption_GetEdgeEffect(listItemSwipeActionOption);
    
    ASSERT_EQ(ret, PARAM_1);
    NAPI_END;
    
}

static ani_double listSwipeActionItem006(ani_env* env, ani_object info)
{
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    OH_ArkUI_ListItemSwipeActionItem_SetOnAction(listSwipeActionItem, Callback);
    OH_ArkUI_ListItemSwipeActionItem_SetOnEnterActionArea(listSwipeActionItem, Callback);
    OH_ArkUI_ListItemSwipeActionItem_SetOnExitActionArea(listSwipeActionItem, Callback);
    OH_ArkUI_ListItemSwipeActionItem_SetOnStateChange(listSwipeActionItem, Callback3);
    ani_int result = PARAM_1;                                                                                
    return result;
}

static ani_double listSwipeActionItem007(ani_env* env, ani_object info)
{
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(                                           
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")); 
    ArkUI_NodeHandle nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_ListItemSwipeActionItem_SetContent(listSwipeActionItem, nodeHandle);
    OH_ArkUI_ListItemSwipeActionItem_Dispose(listSwipeActionItem);
    ani_int result = PARAM_1;                                                                                
    return result;
}

static ani_double listSwipeActionItem008(ani_env* env, ani_object info)
{
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();

    ArkUIData testData = {3.0f, 0};
   
    OH_ArkUI_ListItemSwipeActionItem_SetOnActionWithUserData(listSwipeActionItem, &testData, nullptr);
    OH_ArkUI_ListItemSwipeActionItem_SetOnEnterActionAreaWithUserData(listSwipeActionItem, nullptr, nullptr);
    OH_ArkUI_ListItemSwipeActionItem_SetOnExitActionAreaWithUserData(listSwipeActionItem, nullptr,  nullptr);
    OH_ArkUI_ListItemSwipeActionItem_Dispose(listSwipeActionItem);
    ani_int result = PARAM_1;                                                                                
    return result;
}

static ani_double listSwipeActionItem009(ani_env* env, ani_object info)
{
    auto listItemSwipeActionOption = OH_ArkUI_ListItemSwipeActionOption_Create();
    OH_ArkUI_ListItemSwipeActionOption_SetOnOffsetChangeWithUserData(listItemSwipeActionOption, nullptr, nullptr);
    OH_ArkUI_ListItemSwipeActionOption_SetOnOffsetChange(listItemSwipeActionOption, nullptr);
    OH_ArkUI_ListItemSwipeActionOption_Dispose(listItemSwipeActionOption);
    ani_int result = PARAM_1;                                                                                
    return result;
}




} // namespace ArkUIAniTest
