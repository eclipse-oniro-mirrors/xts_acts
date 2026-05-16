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
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <vector>
#include "refresh/NodeXtsRefreshTest.h"
#include "refresh/RefreshAttributeTest.h"

namespace ArkUICapiTest {
const char* MY_REFRESH_LOG = "nativeRefreshTest";
static auto tester = new NodeXTSRefreshTest();

void TestNodeRefreshRefreshing001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue refreshingValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem refreshingItem = {refreshingValue, 1};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_REFRESHING, &refreshingItem);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_REFRESHING);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_REFRESHING001 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_REFRESHING is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshRefreshing002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_REFRESHING);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_REFRESHING002 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_REFRESHING is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshPullDownRatio001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue refreshPullDownRatioValue[] = { { .f32 = 0.5 } };
    ArkUI_AttributeItem refreshPullDownRatioItem = {refreshPullDownRatioValue, 1};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &refreshPullDownRatioItem);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_PULL_DOWN_RATIO001 %{public}f", result->value->f32);
    if(result->value->f32 != 0.5) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_PULL_DOWN_RATIO is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshPullDownRatio002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_PULL_DOWN_RATIO002 %{public}f", result->value->f32);
    if(result->value->f32 != 0.5) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_PULL_DOWN_RATIO is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshOffset001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue refreshOffsetValue[] = { { .f32 = 64 } };
    ArkUI_AttributeItem refreshOffsetItem = {refreshOffsetValue, 1};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_OFFSET, &refreshOffsetItem);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_OFFSET);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_OFFSET001 %{public}f", result->value->f32);
    if(result->value->f32 != 64) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshOffset002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_OFFSET);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_OFFSET002 %{public}f", result->value->f32);
    if(result->value->f32 != 64) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshPullToRefresh001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue pullToRefreshValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem pullToRefreshItem = {pullToRefreshValue, 1};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_TO_REFRESH, &pullToRefreshItem);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_TO_REFRESH);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_PULL_TO_REFRESH001 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_PULL_TO_REFRESH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshPullToRefresh002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_TO_REFRESH);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_PULL_TO_REFRESH002 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_PULL_TO_REFRESH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshMaxPullDownDistance001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue maxPullDownDistanceValue[] = { { .f32 = 100 } };
    ArkUI_AttributeItem maxPullDownDistanceItem = {maxPullDownDistanceValue, 1};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_MAX_PULL_DOWN_DISTANCE, &maxPullDownDistanceItem);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_MAX_PULL_DOWN_DISTANCE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_MAX_PULL_DOWN_DISTANCE001 %{public}f", result->value->f32);
    if(result->value->f32 != 100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_MAX_PULL_DOWN_DISTANCE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshMaxPullDownDistance002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_MAX_PULL_DOWN_DISTANCE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_MAX_PULL_DOWN_DISTANCE002 %{public}f", result->value->f32);
    if(result->value->f32 != 100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_MAX_PULL_DOWN_DISTANCE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshEvent001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->registerNodeEvent(refresh, NODE_REFRESH_STATE_CHANGE, NODE_REFRESH_STATE_CHANGE, nullptr);
}

void TestNodeRefreshEvent002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->addNodeEventReceiver(refresh, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_REFRESH_STATE_CHANGE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_REFRESH_LOG, "RegisterEvent NODE_REFRESH_STATE_CHANGE");
        }
    });
}

void TestNodeRefreshEvent101(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->registerNodeEvent(refresh, NODE_REFRESH_STATE_CHANGE, NODE_REFRESH_STATE_CHANGE, nullptr);
    nodeAPI->unregisterNodeEvent(refresh, NODE_REFRESH_STATE_CHANGE);
}

void TestNodeRefreshEvent102(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->addNodeEventReceiver(refresh, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_REFRESH_STATE_CHANGE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_REFRESH_LOG, "UnRegisterEvent NODE_REFRESH_STATE_CHANGE");
        }
    });
}

void TestNodeRefreshEvent003(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->registerNodeEvent(refresh, NODE_REFRESH_ON_REFRESH, NODE_REFRESH_ON_REFRESH, nullptr);
}

void TestNodeRefreshEvent004(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->addNodeEventReceiver(refresh, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_REFRESH_ON_REFRESH) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_REFRESH_LOG, "RegisterEvent NODE_REFRESH_ON_REFRESH");
        }
    });
}

void TestNodeRefreshEvent103(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->registerNodeEvent(refresh, NODE_REFRESH_ON_REFRESH, NODE_REFRESH_ON_REFRESH, nullptr);
    nodeAPI->unregisterNodeEvent(refresh, NODE_REFRESH_ON_REFRESH);
}

void TestNodeRefreshEvent104(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->addNodeEventReceiver(refresh, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_REFRESH_ON_REFRESH) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_REFRESH_LOG, "UnRegisterEvent NODE_REFRESH_ON_REFRESH");
        }
    });
}

void TestNodeRefreshEvent005(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->registerNodeEvent(refresh, NODE_REFRESH_ON_OFFSET_CHANGE, NODE_REFRESH_ON_OFFSET_CHANGE, nullptr);
}

void TestNodeRefreshEvent006(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->addNodeEventReceiver(refresh, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_REFRESH_ON_OFFSET_CHANGE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_REFRESH_LOG, "RegisterEvent NODE_REFRESH_ON_OFFSET_CHANGE");
        }
    });
}

void TestNodeRefreshEvent105(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->registerNodeEvent(refresh, NODE_REFRESH_ON_OFFSET_CHANGE, NODE_REFRESH_ON_OFFSET_CHANGE, nullptr);
    nodeAPI->unregisterNodeEvent(refresh, NODE_REFRESH_ON_OFFSET_CHANGE);
}

void TestNodeRefreshEvent106(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle refresh)
{
    nodeAPI->addNodeEventReceiver(refresh, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_REFRESH_ON_OFFSET_CHANGE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_REFRESH_LOG, "UnRegisterEvent NODE_REFRESH_ON_OFFSET_CHANGE");
        }
    });
}

void TestNodeInitRefreshAttribute001(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Refresh capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonRefreshID1"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto refresh = nodeAPI->createNode(ARKUI_NODE_REFRESH);
    nodeList.push_back(refresh);
    nodeList.push_back(button);
    TestNodeRefreshRefreshing001(nodeAPI, refresh, button);
    TestNodeRefreshPullDownRatio001(nodeAPI, refresh, button);
    TestNodeRefreshOffset001(nodeAPI, refresh, button);
    TestNodeRefreshPullToRefresh001(nodeAPI, refresh, button);
    TestNodeRefreshMaxPullDownDistance001(nodeAPI, refresh, button);
    TestNodeRefreshEvent001(nodeAPI, refresh);
    TestNodeRefreshEvent003(nodeAPI, refresh);
    TestNodeRefreshEvent005(nodeAPI, refresh);
}

void TestNodeInitRefreshAttribute101(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto refresh = nodeList[0];
    auto button = nodeList[1];
    if (refresh) {
        // 主线程读属性
        TestNodeRefreshRefreshing002(nodeAPI, refresh, button);
        TestNodeRefreshPullDownRatio002(nodeAPI, refresh, button);
        TestNodeRefreshOffset002(nodeAPI, refresh, button);
        TestNodeRefreshPullToRefresh002(nodeAPI, refresh, button);
        TestNodeRefreshMaxPullDownDistance002(nodeAPI, refresh, button);
        TestNodeRefreshEvent002(nodeAPI, refresh);
        TestNodeRefreshEvent004(nodeAPI, refresh);
        TestNodeRefreshEvent006(nodeAPI, refresh);
    }
}

void TestNodeRefreshRefreshing011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue refreshingValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem refreshingItem = {refreshingValue, sizeof(refreshingValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_REFRESHING, &refreshingItem);
    nodeAPI->resetAttribute(refresh, NODE_REFRESH_REFRESHING);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_REFRESHING);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_REFRESHING011 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_REFRESHING is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshRefreshing012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_REFRESHING);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_REFRESHING012 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_REFRESHING is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshPullDownRatio011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue refreshPullDownRatioValue[] = { { .f32 = 0.5 } };
    ArkUI_AttributeItem refreshPullDownRatioItem = {refreshPullDownRatioValue, 1};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &refreshPullDownRatioItem);
    nodeAPI->resetAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_PULL_DOWN_RATIO011 %{public}f ", result->value->f32);
    if(result->value->f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_PULL_DOWN_RATIO is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshPullDownRatio012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_PULL_DOWN_RATIO012 %{public}f ", result->value->f32);
    if(result->value->f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_PULL_DOWN_RATIO is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshOffset011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue refreshOffsetValue[] = { { .f32 = 64 } };
    ArkUI_AttributeItem refreshOffsetItem = {refreshOffsetValue, 1};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_OFFSET, &refreshOffsetItem);
    nodeAPI->resetAttribute(refresh, NODE_REFRESH_OFFSET);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_OFFSET);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_OFFSET011 %{public}f", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshOffset012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_OFFSET);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_OFFSET012 %{public}f", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshPullToRefresh011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue pullToRefreshValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem pullToRefreshItem = {pullToRefreshValue, 1};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_TO_REFRESH, &pullToRefreshItem);
    nodeAPI->resetAttribute(refresh, NODE_REFRESH_PULL_TO_REFRESH);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_TO_REFRESH);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_PULL_TO_REFRESH011 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_PULL_TO_REFRESH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshPullToRefresh012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_TO_REFRESH);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_PULL_TO_REFRESH012 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_REFRESH_PULL_TO_REFRESH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeRefreshMaxPullDownDistance011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue maxPullDownDistanceValue[] = { { .f32 = 100 } };
    ArkUI_AttributeItem maxPullDownDistanceItem = {maxPullDownDistanceValue, 1};
    nodeAPI->setAttribute(refresh, NODE_REFRESH_MAX_PULL_DOWN_DISTANCE, &maxPullDownDistanceItem);
    nodeAPI->resetAttribute(refresh, NODE_REFRESH_MAX_PULL_DOWN_DISTANCE);
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_MAX_PULL_DOWN_DISTANCE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_MAX_PULL_DOWN_DISTANCE011 %{public}f ", result->value->f32);
}

void TestNodeRefreshMaxPullDownDistance012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &refresh, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(refresh, NODE_REFRESH_MAX_PULL_DOWN_DISTANCE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_REFRESH_MAX_PULL_DOWN_DISTANCE012 %{public}f ", result->value->f32);
}

void TestNodeInitRefreshAttribute011(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Refresh2 capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonRefreshID2"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto refresh = nodeAPI->createNode(ARKUI_NODE_REFRESH);
    nodeList.push_back(refresh);
    nodeList.push_back(button);
    TestNodeRefreshRefreshing011(nodeAPI, refresh, button);
    TestNodeRefreshPullDownRatio011(nodeAPI, refresh, button);
    TestNodeRefreshOffset011(nodeAPI, refresh, button);
    TestNodeRefreshPullToRefresh011(nodeAPI, refresh, button);
    TestNodeRefreshMaxPullDownDistance011(nodeAPI, refresh, button);
    TestNodeRefreshEvent101(nodeAPI, refresh);
    TestNodeRefreshEvent103(nodeAPI, refresh);
    TestNodeRefreshEvent105(nodeAPI, refresh);
}

void TestNodeInitRefreshAttribute111(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto refresh = nodeList[2];
    auto button = nodeList[3];
    if (refresh) {
        // 主线程读属性
        TestNodeRefreshRefreshing012(nodeAPI, refresh, button);
        TestNodeRefreshPullDownRatio012(nodeAPI, refresh, button);
        TestNodeRefreshOffset012(nodeAPI, refresh, button);
        TestNodeRefreshPullToRefresh012(nodeAPI, refresh, button);
        TestNodeRefreshMaxPullDownDistance012(nodeAPI, refresh, button);
        TestNodeRefreshEvent102(nodeAPI, refresh);
        TestNodeRefreshEvent104(nodeAPI, refresh);
        TestNodeRefreshEvent106(nodeAPI, refresh);
    }
}

void RunOnSubThreadRefresh(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    TestNodeInitRefreshAttribute001(nodeAPI, nodeList);
    TestNodeInitRefreshAttribute011(nodeAPI, nodeList);
}

void RunOnUIThreadRefresh(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    // 获取在RunOnSubThreadRefresh中保存到nodeList中的组件
    TestNodeInitRefreshAttribute101(nodeAPI, nodeList);
    TestNodeInitRefreshAttribute111(nodeAPI, nodeList);
}

napi_value RefreshAttributeTest::CreateNativeRefreshNode(napi_env env, napi_callback_info info)
{
    return tester->CreateCNodeTreeRefresh(env, info, RunOnUIThreadRefresh, RunOnSubThreadRefresh);
}

napi_value RefreshAttributeTest::DisposeNativeRefreshNode(napi_env env, napi_callback_info info)
{
    // 释放组件
    return tester->DisposeCNodeTreeRefresh(env, info);
}
}