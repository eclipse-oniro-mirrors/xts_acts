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

#ifndef ARKTS_ANI_TEST_GLOBALANDLOCALREFERENCES_H
#define ARKTS_ANI_TEST_GLOBALANDLOCALREFERENCES_H
#include "Common.h"

ani_boolean test_GlobalReference_Create([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef;
    ASSERT_EQ(env->GetNull(&nullRef), ANI_OK);
    ani_ref nullGRef;
    ASSERT_EQ(env->GlobalReference_Create(nullRef, &nullGRef), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_GlobalReference_Delete([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);
    ani_ref objectGRef;
    ASSERT_EQ(env->GlobalReference_Create(objectRef, &objectGRef), ANI_OK);
    ASSERT_EQ(env->GlobalReference_Delete(objectGRef), ANI_OK);
    return ANI_TRUE;
}


ani_boolean test_Reference_StrictEquals([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);
    ani_ref objectGRef;
    ASSERT_EQ(env->GlobalReference_Create(objectRef, &objectGRef), ANI_OK);
    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(objectGRef, &wref), ANI_OK);

    ani_ref ref;
    ani_boolean wasReleased;
    ASSERT_EQ(env->WeakReference_GetReference(wref, &wasReleased, &ref), ANI_OK);
    if (wasReleased == ANI_FALSE) {
        ani_boolean isStrictEquals;
        ASSERT_EQ(env->Reference_StrictEquals(objectRef, ref, &isStrictEquals), ANI_OK);
        ASSERT_EQ(isStrictEquals, true);
    }
    return ANI_TRUE;
}

ani_boolean test_Reference_Delete([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string objectRef {};
    std::string str = "";
    ASSERT_EQ(env->String_NewUTF8(str.c_str(), str.length(), &objectRef), ANI_OK);
    ASSERT_EQ(env->Reference_Delete(objectRef), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_EnsureEnoughReferences([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->EnsureEnoughReferences(SPECIFIED_CAPACITY), ANI_OK);
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_GLOBALANDLOCALREFERENCES_H
