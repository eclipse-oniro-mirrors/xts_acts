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

ani_int test_WeakReference_Delete_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undefinedRef;
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(undefinedRef, &wref), ANI_OK);

    ASSERT_EQ(env->WeakReference_Delete(wref), ANI_OK);

    return ANI_TRUE;
}

ani_int test_WeakReference_Delete_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wref), ANI_OK);

    ASSERT_EQ(env->WeakReference_Delete(wref), ANI_OK);

    return ANI_TRUE;
}

ani_int test_WeakReference_Delete_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_ref objectGRef;
    ASSERT_EQ(env->GlobalReference_Create(objectRef, &objectGRef), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(objectGRef, &wref), ANI_OK);

    ASSERT_EQ(env->WeakReference_Delete(wref), ANI_OK);

    return ANI_TRUE;
}

ani_int test_WeakReference_Delete_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undefinedRef;
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);

    ani_wref wref {};
    ASSERT_EQ(env->WeakReference_Create(undefinedRef, &wref), ANI_OK);
    ASSERT_EQ(env->c_api->WeakReference_Delete(nullptr, wref), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef;
    ASSERT_EQ(env->GetNull(&nullRef), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(nullRef, &wref), ANI_OK);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undefinedRef;
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(undefinedRef, &wref), ANI_OK);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wref), ANI_OK);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_ref objectGRef;
    ASSERT_EQ(env->GlobalReference_Create(objectRef, &objectGRef), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(objectGRef, &wref), ANI_OK);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);
    ASSERT_EQ(env->GlobalReference_Create(objectRef, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undefinedRef {};
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);

    ani_wref wref {};
    ASSERT_EQ(env->WeakReference_Create(undefinedRef, &wref), ANI_OK);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr std::string_view m = "Pure P60";
    const ani_int weight = 200;

    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.WeakGlobalReferences.MobilePhone", &cls), ANI_OK);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.String}i:", &ctor), ANI_OK);

    ani_string model {};
    ASSERT_EQ(env->String_NewUTF8(m.data(), m.size(), &model), ANI_OK);
    ani_object phone {};
    ASSERT_EQ(env->Object_New(cls, ctor, &phone, model, weight), ANI_OK);

    auto objectRef = reinterpret_cast<ani_ref>(phone);
    ani_wref wrefa {};
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wrefa), ANI_OK);
    ani_wref wrefb {};
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wrefb), ANI_OK);
    ani_wref wrefc {};
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wrefc), ANI_OK);
    ani_wref wrefd {};
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wrefd), ANI_OK);
    ani_wref wrefe {};
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wrefe), ANI_OK);

    ASSERT_EQ(env->WeakReference_Delete(wrefa), ANI_OK);
    ASSERT_EQ(env->WeakReference_Delete(wrefb), ANI_OK);
    ASSERT_EQ(env->WeakReference_Delete(wrefc), ANI_OK);

    ani_boolean wasReleased = ANI_FALSE;
    ani_ref ref {};
    ASSERT_EQ(env->WeakReference_GetReference(wrefd, &wasReleased, &ref), ANI_OK);
    ASSERT_EQ(wasReleased, ani_boolean(ANI_FALSE));
    ASSERT_EQ(env->WeakReference_GetReference(wrefe, &wasReleased, &ref), ANI_OK);
    ASSERT_EQ(wasReleased, ani_boolean(ANI_FALSE));

    ani_wref wreff {};
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wreff), ANI_OK);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef {};
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_ref gref {};
    ASSERT_EQ(env->GlobalReference_Create(objectRef, &gref), ANI_OK);

    ani_wref wref {};
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wref), ANI_OK);

    ani_boolean wasReleased;
    ani_ref ref {};
    ASSERT_EQ(env->WeakReference_GetReference(wref, &wasReleased, &ref), ANI_OK);

    ani_boolean isEquals = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(gref, ref, &isEquals), ANI_OK);
    ASSERT_EQ(isEquals, ANI_TRUE);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string functionA = "getObjectA";
    std::string functionB = "getObjectB";
    ani_module module;
    ani_function functionHandleA;
    ani_function functionHandleB;
    ani_ref refObjectA = nullptr;
    ani_ref refObjectB = nullptr;
    
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.WeakGlobalReferences", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, functionA.c_str(), nullptr, &functionHandleA), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandleA, &refObjectA), ANI_OK);

    ASSERT_EQ(env->Module_FindFunction(module, functionB.c_str(), nullptr, &functionHandleB), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandleB, &refObjectB), ANI_OK);
    
    ani_wref wrefa {};
    ASSERT_EQ(env->WeakReference_Create(refObjectA, &wrefa), ANI_OK);

    ani_wref wrefb {};
    ASSERT_EQ(env->WeakReference_Create(refObjectB, &wrefb), ANI_OK);

    ani_boolean wasReleased = ANI_FALSE;
    ani_ref refa {};
    ASSERT_EQ(env->WeakReference_GetReference(wrefa, &wasReleased, &refa), ANI_OK);

    ani_ref refb {};
    ASSERT_EQ(env->WeakReference_GetReference(wrefb, &wasReleased, &refb), ANI_OK);

    ani_boolean isEquals = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(refa, refb, &isEquals), ANI_OK);
    ASSERT_EQ(isEquals, ANI_TRUE);

    ASSERT_EQ(env->Reference_StrictEquals(refa, refb, &isEquals), ANI_OK);
    ASSERT_EQ(isEquals, ANI_TRUE);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string functionA = "getObjectA";
    ani_module module;
    ani_function functionHandleA;
    ani_ref refObjectA = nullptr;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.WeakGlobalReferences", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, functionA.c_str(), nullptr, &functionHandleA), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandleA, &refObjectA), ANI_OK);

    ani_ref refObjectB {};
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&refObjectB)), ANI_OK);

    ani_wref wrefa {};
    ASSERT_EQ(env->WeakReference_Create(refObjectA, &wrefa), ANI_OK);

    ani_wref wrefb {};
    ASSERT_EQ(env->WeakReference_Create(refObjectB, &wrefb), ANI_OK);

    ani_boolean wasReleased = ANI_FALSE;
    ani_ref refa {};
    ASSERT_EQ(env->WeakReference_GetReference(wrefa, &wasReleased, &refa), ANI_OK);

    ani_ref refb {};
    ASSERT_EQ(env->WeakReference_GetReference(wrefb, &wasReleased, &refb), ANI_OK);

    ani_boolean isEquals = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(refa, refb, &isEquals), ANI_OK);
    ASSERT_EQ(isEquals, ANI_FALSE);

    ASSERT_EQ(env->Reference_StrictEquals(refa, refb, &isEquals), ANI_OK);
    ASSERT_EQ(isEquals, ANI_FALSE);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef {};
    std::string str = "test";
    ASSERT_EQ(env->String_NewUTF8(str.c_str(), str.length(), reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_wref wrefa {};
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wrefa), ANI_OK);

    ani_wref wrefb {};
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wrefb), ANI_OK);

    ani_boolean wasReleased = ANI_FALSE;
    ani_ref refa {};
    ASSERT_EQ(env->WeakReference_GetReference(wrefa, &wasReleased, &refa), ANI_OK);

    ani_ref refb {};
    ASSERT_EQ(env->WeakReference_GetReference(wrefb, &wasReleased, &refb), ANI_OK);

    ani_boolean isEquals = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(refa, refb, &isEquals), ANI_OK);
    ASSERT_EQ(isEquals, ANI_TRUE);

    ASSERT_EQ(env->Reference_StrictEquals(refa, refb, &isEquals), ANI_OK);
    ASSERT_EQ(isEquals, ANI_TRUE);

    return ANI_TRUE;
}

ani_int test_WeakReference_Create_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undefinedRef {};
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);

    ani_wref wref {};
    ASSERT_EQ(env->c_api->WeakReference_Create(nullptr, undefinedRef, &wref), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_WeakReference_GetReference([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef;
    ASSERT_EQ(env->GetNull(&nullRef), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(nullRef, &wref), ANI_OK);

    ani_ref ref;
    ani_boolean wasReleased;
    ASSERT_EQ(env->WeakReference_GetReference(wref, &wasReleased, &ref), ANI_OK);
    if (wasReleased == ANI_FALSE) {
        ani_boolean isStrictEquals;
        ASSERT_EQ(env->Reference_StrictEquals(nullRef, ref, &isStrictEquals), ANI_OK);
        ASSERT_EQ(isStrictEquals, ani_boolean(ANI_TRUE));
    }

    return ANI_TRUE;
}

ani_int test_WeakReference_GetReference_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undefinedRef;
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(undefinedRef, &wref), ANI_OK);

    ani_ref ref;
    ani_boolean wasReleased;
    ASSERT_EQ(env->WeakReference_GetReference(wref, &wasReleased, &ref), ANI_OK);
    if (wasReleased == ANI_FALSE) {
        ani_boolean isStrictEquals;
        ASSERT_EQ(env->Reference_StrictEquals(undefinedRef, ref, &isStrictEquals), ANI_OK);
        ASSERT_EQ(isStrictEquals, ani_boolean(ANI_TRUE));
    }

    return ANI_TRUE;
}

ani_int test_WeakReference_GetReference_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wref), ANI_OK);

    ani_ref ref;
    ani_boolean wasReleased;
    ASSERT_EQ(env->WeakReference_GetReference(wref, &wasReleased, &ref), ANI_OK);
    if (wasReleased == ANI_FALSE) {
        ani_boolean isStrictEquals;
        ASSERT_EQ(env->Reference_StrictEquals(objectRef, ref, &isStrictEquals), ANI_OK);
        ASSERT_EQ(isStrictEquals, ani_boolean(ANI_TRUE));
    }

    return ANI_TRUE;
}

ani_int test_WeakReference_GetReference_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wref), ANI_OK);

    // 1. Delete local ref
    ASSERT_EQ(env->Reference_Delete(objectRef), ANI_OK);

    // not GC Collect referent (local ref) from weak referenceCheck
    // that the referent has been released, return result is false.
    ani_ref ref;
    ani_boolean wasReleased;
    ASSERT_EQ(env->WeakReference_GetReference(wref, &wasReleased, &ref), ANI_OK);
    
    ASSERT_EQ(wasReleased, ani_boolean(ANI_FALSE));

    return ANI_TRUE;
}

ani_int test_WeakReference_GetReference_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
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
        ASSERT_EQ(isStrictEquals, ani_boolean(ANI_TRUE));
    }

    return ANI_TRUE;
}

ani_int test_WeakReference_GetReference_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wref), ANI_OK);

    ani_ref ref;
    ASSERT_EQ(env->WeakReference_GetReference(wref, nullptr, &ref), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_WeakReference_GetReference_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);

    ani_wref wref;
    ASSERT_EQ(env->WeakReference_Create(objectRef, &wref), ANI_OK);

    ani_boolean wasReleased;
    ASSERT_EQ(env->WeakReference_GetReference(wref, &wasReleased, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_WeakReference_GetReference_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undefinedRef;
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);

    ani_wref wref {};
    ASSERT_EQ(env->WeakReference_Create(undefinedRef, &wref), ANI_OK);

    ani_boolean wasReleased = ANI_FALSE;
    ani_ref ref {};
    ASSERT_EQ(env->c_api->WeakReference_GetReference(nullptr, wref, &wasReleased, &ref), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_WEAKGLOBALREFERENCES_H
