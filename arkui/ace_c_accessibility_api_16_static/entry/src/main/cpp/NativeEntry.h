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

#ifndef MYAPPLICATION_NATIVEENTRY_H
#define MYAPPLICATION_NATIVEENTRY_H
#include "ArkUIBaseNode.h"
#include "ani/ani.h"
#include "arkui/native_type.h"
#include "NormalTextListExample.h"
#include "hilog/log.h"

ArkUI_NodeContentHandle contentHandle;

namespace NativeModule {
// 管理Native组件的生命周期和内存。
class NativeEntry {
public:
    static NativeEntry *GetInstance() {
        static NativeEntry nativeEntry;
        return &nativeEntry;
    }

    void SetContentHandle(ArkUI_NodeContentHandle handle) { handle_ = handle; }

    void SetRootNode(const std::shared_ptr<ArkUIBaseNode> &baseNode) {
        root_ = baseNode;
        // 添加Native组件到NodeContent上用于挂载显示。
        OH_ArkUI_NodeContent_AddNode(handle_, root_->GetHandle());
    }
    void DisposeRootNode() {
        // 从NodeContent上卸载组件并销毁Native组件。
        OH_ArkUI_NodeContent_RemoveNode(handle_, root_->GetHandle());
        root_.reset();
    }

private:
    std::shared_ptr<ArkUIBaseNode> root_;
    ArkUI_NodeContentHandle handle_;
};

void verifyingTheLayoutCallbackFunction(ani_env* env, ani_object obj, ani_object NodeContent) {
    OH_LOG_INFO(LOG_APP, " C_verifyingTheLayoutCallbackFunction start -> 53");
    OH_LOG_INFO(LOG_APP, " OH_ArkUI_NativeModule_GetNodeContentFromAniValue start -> 54");
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    // 创建文本列表
    OH_LOG_INFO(LOG_APP, " OH_ArkUI_NativeModule_GetNodeContentFromAniValue end -> 57");
    auto list = verifyingTheLayoutCallbackFunction1();
    OH_LOG_INFO(LOG_APP, " verifyingTheLayoutCallbackFunction1 end -> 59");
    NativeEntry::GetInstance()->SetRootNode(list);
    OH_LOG_INFO(LOG_APP, " GetInstance()->SetRootNode end -> 62");
    
    return ;
}

void verifyingTheLayoutAndDrawCallbackFunction100(ani_env* env, ani_object obj, ani_object NodeContent) {
    
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    NativeEntry::GetInstance()->SetContentHandle(contentHandle);

    // 创建文本列表
    auto list = verifyingTheLayoutAndDrawCallbackFunction1001();

    // 保持Native侧对象到管理类中，维护生命周期。
    NativeEntry::GetInstance()->SetRootNode(list);
    return ;
}

void verifyingTheLayoutCallbackFunction3000(ani_env* env, ani_object obj, ani_object NodeContent) {
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    NativeEntry::GetInstance()->SetContentHandle(contentHandle);

    // 创建文本列表
    auto list = verifyingTheLayoutCallbackFunction30001();

    // 保持Native侧对象到管理类中，维护生命周期。
    NativeEntry::GetInstance()->SetRootNode(list);
    return ;
}

void verifyTheDeregistrationLayoutCallbackFunction(ani_env* env, ani_object obj, ani_object NodeContent) {

    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    NativeEntry::GetInstance()->SetContentHandle(contentHandle);

    // 创建文本列表
    auto list = verifyTheDeregistrationLayoutCallbackFunction1();

    // 保持Native侧对象到管理类中，维护生命周期。
    NativeEntry::GetInstance()->SetRootNode(list);
    return ;
}

void verifyRegisterDrawCallback(ani_env* env, ani_object obj, ani_object NodeContent) {
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    NativeEntry::GetInstance()->SetContentHandle(contentHandle);

    // 创建文本列表
    auto list = verifyRegisterDrawCallback1();

    // 保持Native侧对象到管理类中，维护生命周期。
    NativeEntry::GetInstance()->SetRootNode(list);
    return ;
}

void verifyUnregisterDrawCallback(ani_env* env, ani_object obj, ani_object NodeContent) {
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    NativeEntry::GetInstance()->SetContentHandle(contentHandle);

    // 创建文本列表
    auto list = verifyUnregisterDrawCallback1();

    // 保持Native侧对象到管理类中，维护生命周期。
    NativeEntry::GetInstance()->SetRootNode(list);
    return ;
}

void CreateNativeRoots(ani_env* env, ani_object obj, ani_object NodeContent) {

    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    NativeEntry::GetInstance()->SetContentHandle(contentHandle);

    // 创建文本列表
    auto list = CreateTextListExample1();

    // 保持Native侧对象到管理类中，维护生命周期。
    NativeEntry::GetInstance()->SetRootNode(list);
    return ;
}

void DestroyNativeRoot(ani_env* env, ani_object obj) {
    // 从管理类中释放Native侧对象。
    NativeEntry::GetInstance()->DisposeRootNode();
    return ;
}

void DestroyNativeRoots(ani_env* env, ani_object obj) {
    // 从管理类中释放Native侧对象。
    NativeEntry::GetInstance()->DisposeRootNode();
    return ;
}

} // namespace NativeModule

#endif // MYAPPLICATION_NATIVEENTRY_H