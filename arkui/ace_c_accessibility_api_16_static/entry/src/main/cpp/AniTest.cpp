/**
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

#include "ani/ani.h"
#include <array>
#include <iostream>
#include "arkui/native_type.h"
#include "arkui/native_node_ani.h"
#include "NativeEntry.h"
#include "hilog/log.h"

namespace {
    //定义 Native 方法签名，冒号”:“ 左边为方法入参，后边为接口返回值，无返回值则不写。 特殊的类型需要对接口进行反汇编获取具体的类型
    const char *testSignature = "C{arkui.Content.Content}:";
    //定义 Native 方法数组，内为arkts侧需要用到的C方法。参数1是arkts接口，参数3是映射的对应C接口。
    std::array methods = {
        ani_native_function {"verifyingTheLayoutCallbackFunction", testSignature, reinterpret_cast<void *>(NativeModule::verifyingTheLayoutCallbackFunction)},
        ani_native_function {"verifyingTheLayoutAndDrawCallbackFunction100", testSignature, reinterpret_cast<void *>(NativeModule::verifyingTheLayoutAndDrawCallbackFunction100)},
        ani_native_function {"verifyingTheLayoutCallbackFunction3000", testSignature, reinterpret_cast<void *>(NativeModule::verifyingTheLayoutCallbackFunction3000)},
        ani_native_function {"verifyTheDeregistrationLayoutCallbackFunction", testSignature, reinterpret_cast<void *>(NativeModule::verifyTheDeregistrationLayoutCallbackFunction)},
        ani_native_function {"verifyRegisterDrawCallback", testSignature, reinterpret_cast<void *>(NativeModule::verifyRegisterDrawCallback)},
        ani_native_function {"verifyUnregisterDrawCallback", testSignature, reinterpret_cast<void *>(NativeModule::verifyUnregisterDrawCallback)},
        ani_native_function {"destroyNativeRoot", ":", reinterpret_cast<void *>(NativeModule::DestroyNativeRoot)},
        ani_native_function {"destroyNativeRoots", ":", reinterpret_cast<void *>(NativeModule::DestroyNativeRoots)},
        ani_native_function {"createNativeRoots", testSignature, reinterpret_cast<void *>(NativeModule::CreateNativeRoots)},
    };
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    OH_LOG_INFO(LOG_APP, " GetEnv strat -> 44");
    //获取环境变量
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        OH_LOG_INFO(LOG_APP, " GetEnv Failed -> 47");
        return (ani_status)9;
    }
    OH_LOG_INFO(LOG_APP, " GetEnv end -> 50");

    ani_class cls{};
    //根据传入的ets侧绑定类的路径查找C侧的实现
    OH_LOG_INFO(LOG_APP, " FindClass start -> 53");
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        OH_LOG_INFO(LOG_APP, " FindClass Failed -> 55");
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return (ani_status)2;
    }
    OH_LOG_INFO(LOG_APP, " FindClass end -> 53");

    OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods start -> 61");
    //将查询到的C侧接口实现与ets侧接口进行绑定
    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods Failed -> 63");
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return (ani_status)3;
    };
    OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods end -> 67");
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    OH_LOG_INFO(LOG_APP, " bindCase strat -> 73");
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    //触发绑定接口，参数2“entry.src.main.ets.pages.LibUtil.LibUtil” 为ets侧绑定类的路径，需要追踪到类名，中间用"."隔开，不能用“/”
    bindCase(vm, "entry.src.main.ets.pages.LibUtil.LibUtil");
    OH_LOG_INFO(LOG_APP, " bindCase end -> 76");
    *result = ANI_VERSION_1;
    OH_LOG_INFO(LOG_APP, " bindCase end -> 78");
    return ANI_OK;
}