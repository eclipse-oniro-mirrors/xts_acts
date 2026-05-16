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

#include "Common.h"
#include "VersionInfo.h"
#include "AttachDetachTest.h"
#include "BoxUnBoxPrimitive.h"

namespace {
    std::array methods = {
        ani_native_function{"test_GetVersion", ":i",
            reinterpret_cast<void *>(test_GetVersion)},
        ani_native_function{"test_AttachDetach", ":i",
            reinterpret_cast<void *>(test_AttachDetach)},
        ani_native_function{"test_AttachDetach_WithInterop", ":i",
            reinterpret_cast<void *>(test_AttachDetach_WithInterop)},
        ani_native_function{"test_Attach_InvalidResult", ":i",
            reinterpret_cast<void *>(test_Attach_InvalidResult)},
        ani_native_function{"test_Attach_InvalidVersion", ":i",
            reinterpret_cast<void *>(test_Attach_InvalidVersion)},
        ani_native_function{"test_Attach_InvalidOption", ":i",
            reinterpret_cast<void *>(test_Attach_InvalidOption)},
        ani_native_function{"test_Attach_RepeatAttach", ":i",
            reinterpret_cast<void *>(test_Attach_RepeatAttach)},
        ani_native_function{"test_Attach_RepeatDetach", ":i",
            reinterpret_cast<void *>(test_Attach_RepeatDetach)},
        ani_native_function{"test_Detach_WithoutAttach", ":i",
            reinterpret_cast<void *>(test_Detach_WithoutAttach)},
        ani_native_function{"test_ConcurrentAttach", ":i",
            reinterpret_cast<void *>(test_ConcurrentAttach)},
        ani_native_function{"test_ConcurrentMainThreadWorker", ":i",
            reinterpret_cast<void *>(test_ConcurrentMainThreadWorker)},
        ani_native_function{"test_CreateObjectInWorker", ":i",
            reinterpret_cast<void *>(test_CreateObjectInWorker)},
        ani_native_function{"testBoxBooleanNative", ":z",
            reinterpret_cast<void *>(testBoxBooleanNative)},
        ani_native_function{"testUnboxBooleanNative", ":z",
            reinterpret_cast<void *>(testUnboxBooleanNative)},
        ani_native_function{"testBoxByteNative", ":z",
            reinterpret_cast<void *>(testBoxByteNative)},
        ani_native_function{"testUnboxByteNative", ":z",
            reinterpret_cast<void *>(testUnboxByteNative)},
        ani_native_function{"testBoxCharNative", ":z",
            reinterpret_cast<void *>(testBoxCharNative)},
        ani_native_function{"testUnboxCharNative", ":z",
            reinterpret_cast<void *>(testUnboxCharNative)},
        ani_native_function{"testBoxDoubleNative", ":z",
            reinterpret_cast<void *>(testBoxDoubleNative)},
        ani_native_function{"testUnboxDoubleNative", ":z",
            reinterpret_cast<void *>(testUnboxDoubleNative)},
        ani_native_function{"testBoxFloatNative", ":z",
            reinterpret_cast<void *>(testBoxFloatNative)},
        ani_native_function{"testUnboxFloatNative", ":z",
            reinterpret_cast<void *>(testUnboxFloatNative)},
        ani_native_function{"testBoxIntNative", ":z",
            reinterpret_cast<void *>(testBoxIntNative)},
        ani_native_function{"testUnboxIntNative", ":z",
            reinterpret_cast<void *>(testUnboxIntNative)},
        ani_native_function{"testBoxLongNative", ":z",
            reinterpret_cast<void *>(testBoxLongNative)},
        ani_native_function{"testUnboxLongNative", ":z",
            reinterpret_cast<void *>(testUnboxLongNative)},
        ani_native_function{"testBoxShortNative", ":z",
            reinterpret_cast<void *>(testBoxShortNative)},
        ani_native_function{"testUnboxShortNative", ":z",
            reinterpret_cast<void *>(testUnboxShortNative)},
    };
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return (ani_status)ANI_RES_OUT_OF_REF;
    }

    ani_class cls{};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return (ani_status)ANI_RES_INVALID_ARGS;
    }

    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return (ani_status)ANI_RES_INVALID_TYPE;
    };
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    bindCase(vm, "entry.src.main.src.ets.Index.Foo");
    *result = ANI_VERSION_1;
    return ANI_OK;
}