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

#ifndef MYAPPLICATION_NORMALTEXTLISTEXAMPLE_H
#define MYAPPLICATION_NORMALTEXTLISTEXAMPLE_H

#include "ArkUIBaseNode.h"
#include "ArkUIListItemNode.h"
#include "ArkUIListNode.h"
#include "ArkUITextNode.h"
#include <cstdint>
#include <hilog/log.h>

namespace NativeModule {
std::shared_ptr<ArkUIBaseNode> verifyingTheLayoutCallbackFunction1() {
    OH_LOG_INFO(LOG_APP, " verifyingTheLayoutCallbackFunction1 start -> 28");
    // 创建组件并挂载
    // 1：使用智能指针创建List组件。
    auto list = std::make_shared<ArkUIListNode>();
    list->SetPercentWidth(1);
    list->SetPercentHeight(1);
    // 2：创建ListItem子组件并挂载到List上。
    for (int32_t i = 0; i < 1; ++i) {
        auto listItem = std::make_shared<ArkUIListItemNode>();
        auto textNode = std::make_shared<ArkUITextNode>();
        textNode->SetTextContent(std::to_string(i));
        textNode->SetFontSize(16);
        textNode->SetPercentWidth(1);
        textNode->SetHeight(100);
        textNode->SetBackgroundColor(0xFFfffacd);
        textNode->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        // text_node_0
        textNode->SetInspectorId("text_node" + std::to_string(i));
        // 布局回调入口
        textNode->SetLayoutCallBack(i);
        textNode->SetLayoutCallBack(i);
        listItem->AddChild(textNode);
        list->AddChild(listItem);
    }
    OH_LOG_INFO(LOG_APP, " C_verifyingTheLayoutCallbackFunction1 end -> 52");
    return list;
}

std::shared_ptr<ArkUIBaseNode> verifyingTheLayoutAndDrawCallbackFunction1001() {
    // 创建组件并挂载
    // 1：使用智能指针创建List组件。
    auto list = std::make_shared<ArkUIListNode>();
    list->SetPercentWidth(1);
    list->SetPercentHeight(1);
    // 2：创建ListItem子组件并挂载到List上。
    for (int32_t i = 0; i < 1; ++i) {
        auto listItem = std::make_shared<ArkUIListItemNode>();
        auto textNode = std::make_shared<ArkUITextNode>();
        textNode->SetTextContent(std::to_string(i));
        textNode->SetFontSize(16);
        textNode->SetPercentWidth(1);
        textNode->SetHeight(100);
        textNode->SetBackgroundColor(0xFFfffacd);
        textNode->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        textNode->SetInspectorId("text_node" + std::to_string(i));
        // 布局回调入口,给同一个组件设置100个回调函数
        for (int32_t j = 0; j < 100; j++) {
            textNode->SetLayoutCallBack(i, true);
            textNode->SetDrawCallBack(i, true);
        }
        listItem->AddChild(textNode);
        list->AddChild(listItem);
    }
    return list;
}

std::shared_ptr<ArkUIBaseNode> verifyingTheLayoutCallbackFunction30001() {
    // 创建组件并挂载
    // 1：使用智能指针创建List组件。
    auto list = std::make_shared<ArkUIListNode>();
    list->SetPercentWidth(1);
    list->SetPercentHeight(1);
    // 2：创建ListItem子组件并挂载到List上。
    for (int32_t i = 0; i < 3000; ++i) {
        auto listItem = std::make_shared<ArkUIListItemNode>();
        auto textNode = std::make_shared<ArkUITextNode>();
        textNode->SetTextContent(std::to_string(i));
        textNode->SetFontSize(16);
        textNode->SetPercentWidth(1);
        textNode->SetHeight(100);
        textNode->SetBackgroundColor(0xFFfffacd);
        textNode->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        textNode->SetInspectorId("text_node" + std::to_string(i));
        // 布局回调入口,给同一个组件设置3000个回调函数
        textNode->SetLayoutCallBack(i);
//        textNode->SetDrawCallBack(i);
        listItem->AddChild(textNode);
        list->AddChild(listItem);
    }
    return list;
}

std::shared_ptr<ArkUIBaseNode> verifyTheDeregistrationLayoutCallbackFunction1() {
    // 创建组件并挂载
    // 1：使用智能指针创建List组件。
    auto list = std::make_shared<ArkUIListNode>();
    list->SetPercentWidth(1);
    list->SetPercentHeight(1);
    // 2：创建ListItem子组件并挂载到List上。
    for (int32_t i = 0; i < 1; ++i) {
        auto listItem = std::make_shared<ArkUIListItemNode>();
        auto textNode = std::make_shared<ArkUITextNode>();
        textNode->SetTextContent(std::to_string(i));
        textNode->SetFontSize(16);
        textNode->SetPercentWidth(1);
        textNode->SetHeight(100);
        textNode->SetBackgroundColor(0xFFfffacd);
        textNode->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        textNode->SetInspectorId("text_node" + std::to_string(i));
        // 布局回调入口
        textNode->SetLayoutCallBack(i);
        // 注销布局回调入口
        textNode->ResetLayoutCallBack();
        listItem->AddChild(textNode);
        list->AddChild(listItem);
    }
    return list;
}

std::shared_ptr<ArkUIBaseNode> verifyRegisterDrawCallback1() {
    // 创建组件并挂载
    // 1：使用智能指针创建List组件。
    auto list = std::make_shared<ArkUIListNode>();
    list->SetPercentWidth(1);
    list->SetPercentHeight(1);
    // 2：创建ListItem子组件并挂载到List上。
    for (int32_t i = 0; i < 1; ++i) {
        auto listItem = std::make_shared<ArkUIListItemNode>();
        auto textNode = std::make_shared<ArkUITextNode>();
        textNode->SetTextContent(std::to_string(i));
        textNode->SetFontSize(16);
        textNode->SetPercentWidth(1);
        textNode->SetHeight(100);
        textNode->SetBackgroundColor(0xFFfffacd);
        textNode->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        textNode->SetInspectorId("text_node" + std::to_string(i));
        // 绘制回调入口
        textNode->SetDrawCallBack(i);
        listItem->AddChild(textNode);
        list->AddChild(listItem);
    }
    return list;
}

std::shared_ptr<ArkUIBaseNode> verifyUnregisterDrawCallback1() {
    // 创建组件并挂载
    // 1：使用智能指针创建List组件。
    auto list = std::make_shared<ArkUIListNode>();
    list->SetPercentWidth(1);
    list->SetPercentHeight(1);
    // 2：创建ListItem子组件并挂载到List上。
    for (int32_t i = 0; i < 1; ++i) {
        auto listItem = std::make_shared<ArkUIListItemNode>();
        auto textNode = std::make_shared<ArkUITextNode>();
        textNode->SetTextContent(std::to_string(i));
        textNode->SetFontSize(16);
        textNode->SetPercentWidth(1);
        textNode->SetHeight(100);
        textNode->SetBackgroundColor(0xFFfffacd);
        textNode->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        textNode->SetInspectorId("text_node" + std::to_string(i));
        // 绘制回调入口
        textNode->SetDrawCallBack(i);
        // 注销绘制回调
        textNode->ResetDrawCallBack();
        listItem->AddChild(textNode);
        list->AddChild(listItem);
    }
    return list;
}

std::shared_ptr<ArkUIBaseNode> CreateTextListExample1() {
    // 创建组件并挂载
    // 1：使用智能指针创建List组件。
    auto list = std::make_shared<ArkUIListNode>();
    list->SetPercentWidth(1);
    list->SetPercentHeight(1);
    // 2：创建ListItem子组件并挂载到List上。
    for (int32_t i = 0; i < 3000; ++i) {
        auto listItem = std::make_shared<ArkUIListItemNode>();
        auto textNode = std::make_shared<ArkUITextNode>();
        textNode->SetTextContent(std::to_string(i));
        textNode->SetFontSize(16);
        textNode->SetPercentWidth(1);
        textNode->SetHeight(100);
        textNode->SetBackgroundColor(0xFFfffacd);
        textNode->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        textNode->SetInspectorId("text_node" + std::to_string(i));
        // 绘制回调入口
        textNode->SetDrawCallBack(i);
        listItem->AddChild(textNode);
        list->AddChild(listItem);
    }
    return list;
}
} // namespace NativeModule

#endif // MYAPPLICATION_NORMALTEXTLISTEXAMPLE_H