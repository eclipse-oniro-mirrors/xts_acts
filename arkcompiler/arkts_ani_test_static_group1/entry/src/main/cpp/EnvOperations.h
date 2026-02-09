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

#ifndef ARKTS_ANI_TEST_ENVOPERATIONS_H
#define ARKTS_ANI_TEST_ENVOPERATIONS_H
#include "Common.h"

ani_boolean test_getEnv([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_vm *vm = nullptr;
    ASSERT_EQ(env->GetVM(&vm), ANI_OK);
    ani_env *targetEnv = nullptr;
    ASSERT_EQ(vm->GetEnv(ANI_VERSION_1, &targetEnv), ANI_OK);
    ASSERT_NE(targetEnv, nullptr);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_ENVOPERATIONS_H
