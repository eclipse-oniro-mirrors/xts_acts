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

#ifndef ARKTS_ANI_TEST_VMOPS_H
#define ARKTS_ANI_TEST_VMOPS_H
#include "Common.h"
#include <thread>

const int NUM_THREADS = 3;
using ThreadTestFunc = std::function<ani_int(void)>;

ani_int test_AttachCurrentThreadAndDetachCurrentThread([[maybe_unused]] ani_env *env,
                                                       [[maybe_unused]] ani_object object)
{
    ani_vm *vm_ = nullptr;
    ASSERT_EQ(env->GetVM(&vm_), ANI_OK);
    ThreadTestFunc fun = [&]() {
        ani_env *etsEnv {nullptr};
        ani_option interopEnabled {"--interop=disable", nullptr};
        ani_options aniArgs {1, &interopEnabled};
        ASSERT_NE(vm_, nullptr);
        ASSERT_EQ(vm_->AttachCurrentThread(&aniArgs, ANI_VERSION_1, &etsEnv), ANI_OK);
        ASSERT_EQ(vm_->AttachCurrentThread(&aniArgs, ANI_VERSION_1, &etsEnv), ANI_ERROR);
        ASSERT_EQ(vm_->AttachCurrentThread(&aniArgs, ANI_VERSION_1, &etsEnv), ANI_ERROR);
        ASSERT_NE(etsEnv, nullptr);
        ani_class kclass {};
        ASSERT_EQ(etsEnv->FindClass("Lattach_thread_test/A;", &kclass), ANI_OK);
        ASSERT_NE(kclass, nullptr);
        ASSERT_EQ(vm_->DetachCurrentThread(), ANI_OK);
        return ANI_TRUE;
    };
    std::array<std::thread, NUM_THREADS> threads;
    for (int i = 0; i < NUM_THREADS; ++i) {
        threads[i] = std::thread(fun);
    }
    // wait for all thread stop
    for (auto &t : threads) {
        t.join();
    }
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_VMOPS_H