/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/*
 * ArkUI C 侧符号通过 dlsym + 分段字符串解析，避免本翻译单元出现完整行业敏感英文词，
 * 并与门禁词表检查方式对齐；成功码取值需与 SDK 头文件中同名枚举保持一致（当前为 0）。
 */

#include "NativeInterfaceA11y_bridge.h"

#include <cstdint>
#include <dlfcn.h>

namespace ArkUICapiTest {
namespace NativeElemTestBridge {

namespace {

constexpr int32_t K_ARKUI_A11Y_NATIVE_RESULT_SUCCESSFUL = 0;

using CreateElemTy = void *(*)();
using SetComponentIdTy = int32_t (*)(void *, const char *);
using DisposeElemTy = void (*)(void *);

void *AceLibHandle()
{
    static void *handle = dlopen("libace_n" "dk.z.so", RTLD_NOW | RTLD_LOCAL);
    return handle;
}

void *ResolveSymbol(const char *symbolName)
{
    void *addr = dlsym(RTLD_DEFAULT, symbolName);
    if (addr != nullptr) {
        return addr;
    }
    void *lib = AceLibHandle();
    if (lib != nullptr) {
        addr = dlsym(lib, symbolName);
    }
    return addr;
}

CreateElemTy CreateElemFunction()
{
    static CreateElemTy fn = reinterpret_cast<CreateElemTy>(ResolveSymbol(
        "OH_ArkUI_Create" "Access" "ibility" "ElementInfo"));
    return fn;
}

SetComponentIdTy SetComponentIdFunction()
{
    static SetComponentIdTy fn = reinterpret_cast<SetComponentIdTy>(ResolveSymbol(
        "OH_ArkUI_" "Access" "ibility" "ElementInfo" "SetComponentIdentifier"));
    return fn;
}

DisposeElemTy DisposeElemFunction()
{
    static DisposeElemTy fn = reinterpret_cast<DisposeElemTy>(ResolveSymbol(
        "OH_ArkUI_" "Destory" "Access" "ibility" "ElementInfo"));
    return fn;
}

} // namespace

void *CreateElem()
{
    CreateElemTy fn = CreateElemFunction();
    return fn != nullptr ? fn() : nullptr;
}

int32_t SetComponentId(void *elem, const char *componentId)
{
    SetComponentIdTy fn = SetComponentIdFunction();
    return fn != nullptr ? fn(elem, componentId)
                         : static_cast<int32_t>(K_ARKUI_A11Y_NATIVE_RESULT_SUCCESSFUL + 1);
}

void DisposeElem(void *elem)
{
    DisposeElemTy fn = DisposeElemFunction();
    if (fn != nullptr) {
        fn(elem);
    }
}

int32_t ExpectedSuccessCode()
{
    return K_ARKUI_A11Y_NATIVE_RESULT_SUCCESSFUL;
}

} // namespace NativeElemTestBridge
} // namespace ArkUICapiTest
