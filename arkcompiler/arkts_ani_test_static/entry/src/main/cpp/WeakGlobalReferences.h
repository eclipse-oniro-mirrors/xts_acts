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

#ifndef ARKTS_ANI_TEST_WEAKGLOBALREFERENCES_H
#define ARKTS_ANI_TEST_WEAKGLOBALREFERENCES_H
#include "Common.h"

ani_int test_WeakReference_Delete([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef;
    ASSERT_EQ(env->GetNull(&nullRef), ANI_OK);
    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(nullRef, &wref), ANI_OK);

    ASSERT_EQ(env->WeakReference_Delete(wref), ANI_OK);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_WEAKGLOBALREFERENCES_H
