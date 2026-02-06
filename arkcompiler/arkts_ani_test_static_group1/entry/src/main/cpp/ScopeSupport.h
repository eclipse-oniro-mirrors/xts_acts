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

#ifndef ARKTS_ANI_TEST_SCOPESUPPORT_H
#define ARKTS_ANI_TEST_SCOPESUPPORT_H
#include "Common.h"

ani_boolean test_Create_Local_Scope([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_size capacity = 32;
    ASSERT_EQ(env->CreateLocalScope(capacity), ANI_OK);
    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_size capacity = 32;
    auto status = env->CreateLocalScope(capacity);
    ASSERT_EQ(env->CreateEscapeLocalScope(capacity), ANI_OK);

    ani_string string = nullptr;
    std::string testValue = "hello";
    ASSERT_EQ(env->String_NewUTF8(testValue.c_str(), testValue.size(), &string), ANI_OK);

    ani_ref result;
    ASSERT_EQ(env->DestroyEscapeLocalScope(string, &result), ANI_OK);
    ani_size size = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(static_cast<ani_string>(result), &size), ANI_OK);
    ASSERT_EQ(size, testValue.size());
    status = env->DestroyLocalScope();
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    const ani_size maxCapacity = 32000000;
    // Passing 0 as capacity should return ANI_INVALID_ARGS
    ASSERT_EQ(env->CreateLocalScope(0), ANI_INVALID_ARGS);

    // Passing specifiedCap as capacity should succeed and return ANI_OK
    ASSERT_EQ(env->CreateLocalScope(specifiedCap), ANI_OK);

    ani_string string = nullptr;

    // Create specifiedCap strings in the newly created local scope
    for (ani_size i = 1; i <= specifiedCap; ++i) {
        // Construct a unique stringName for each iteration
        std::string stringName = "String_NewUTF8_" + std::to_string(i) + ";";

        // Attempt to create a new UTF8 string and check the result
        ASSERT_EQ(env->String_NewUTF8(stringName.c_str(), stringName.size(), &string), ANI_OK);
        ASSERT_NE(string, nullptr);
    }

    // Create another string to confirm that string creation still works
    ani_status res = env->String_NewUTF8(testString.data(), testString.size(), &string);
    ASSERT_EQ(res, ANI_OK);

    // Destroy the local scope after string creation
    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);

    /*
     * Attempt to create a local scope with very large capacity (maxCapacity).
     * The comment below indicates that the free size of local reference storage is
     * smaller than the requested capacity, thus should return ANI_OUT_OF_MEMORY.
     */
    // Free size of local reference storage is less than capacity: maxCapacity
    // blocks_count_: 3 need_blocks: 533334 blocks_free: 524285
    ASSERT_EQ(env->CreateLocalScope(maxCapacity), ANI_OUT_OF_MEMORY);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    const ani_size maxCapacity = 32000000;
    // Passing 0 as capacity should return ANI_INVALID_ARGS
    ASSERT_EQ(env->CreateEscapeLocalScope(0), ANI_INVALID_ARGS);

    // Passing specifiedCap as capacity should succeed
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);

    ani_string string = nullptr;
    // Create multiple strings to test scope behavior
    for (ani_size i = 1; i <= specifiedCap; ++i) {
        std::string stringName = "String_NewUTF8_" + std::to_string(i) + ";";

        ASSERT_EQ(env->String_NewUTF8(stringName.c_str(), stringName.size(), &string), ANI_OK);
        ASSERT_NE(string, nullptr);
    }

    // Create another string to confirm it still works
    ani_status res = env->String_NewUTF8(testString.data(), testString.size(), &string);
    ASSERT_EQ(res, ANI_OK);

    ani_ref result;
    // Destroy the escape local scope and retrieve the final reference
    ASSERT_EQ(env->DestroyEscapeLocalScope(string, &result), ANI_OK);

    /*
     * Trying to create an escape local scope with a large capacity
     * should fail due to insufficient memory (ANI_OUT_OF_MEMORY).
     */
    // Free size of local reference storage is less than capacity: maxCapacity
    // blocks_count_: 3 need_blocks: 533334 blocks_free: 524285
    ASSERT_EQ(env->CreateEscapeLocalScope(maxCapacity), ANI_OUT_OF_MEMORY);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size minCapacity = 1;
    const std::string_view testString = "test";
    // Create a local scope with capacity of minCapacity
    ASSERT_EQ(env->CreateLocalScope(minCapacity), ANI_OK);

    ani_string string = nullptr;
    // Attempt to create a new string
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &string), ANI_OK);

    // Destroy the local scope after string creation
    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    // Passing specifiedCap as capacity should succeed
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);

    ani_string string = nullptr;
    // Create a string to test with
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &string), ANI_OK);

    ani_ref result;
    // Destroy the escape local scope and retrieve the final reference
    ASSERT_EQ(env->DestroyEscapeLocalScope(string, &result), ANI_OK);
    ASSERT_NE(result, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    // test for null
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);
    ani_ref nullRef;
    ASSERT_EQ(env->GetNull(&nullRef), ANI_OK);
    ani_ref result;
    ASSERT_EQ(env->DestroyEscapeLocalScope(nullRef, &result), ANI_OK);
    ani_boolean isNull = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsNull(result, &isNull), ANI_OK);
    ASSERT_EQ(isNull, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    // test for undefined
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);
    ani_ref undefined;
    ASSERT_EQ(env->GetUndefined(&undefined), ANI_OK);
    ani_ref result;
    ASSERT_EQ(env->DestroyEscapeLocalScope(undefined, &result), ANI_OK);
    ani_boolean isUndefined = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsUndefined(result, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->CreateLocalScope(ani_size(std::numeric_limits<uint32_t>::max()) - 1), ANI_OUT_OF_MEMORY);
    ASSERT_EQ(env->CreateLocalScope(ani_size(std::numeric_limits<uint32_t>::max()) - 0), ANI_OUT_OF_MEMORY);
    ASSERT_EQ(env->CreateLocalScope(ani_size(std::numeric_limits<ani_size>::max()) - 1), ANI_OUT_OF_MEMORY);
    ASSERT_EQ(env->CreateLocalScope(ani_size(std::numeric_limits<ani_size>::max()) - 0), ANI_OUT_OF_MEMORY);

    ASSERT_EQ(env->CreateEscapeLocalScope(ani_size(std::numeric_limits<uint32_t>::max()) - 1), ANI_OUT_OF_MEMORY);
    ASSERT_EQ(env->CreateEscapeLocalScope(ani_size(std::numeric_limits<uint32_t>::max()) - 0), ANI_OUT_OF_MEMORY);
    ASSERT_EQ(env->CreateEscapeLocalScope(ani_size(std::numeric_limits<ani_size>::max()) - 1), ANI_OUT_OF_MEMORY);
    ASSERT_EQ(env->CreateEscapeLocalScope(ani_size(std::numeric_limits<ani_size>::max()) - 0), ANI_OUT_OF_MEMORY);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size loopCount = 3;
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    for (ani_size i = 1; i <= loopCount; i++) {
        ASSERT_EQ(env->CreateLocalScope(specifiedCap), ANI_OK);
        ani_string objectRef {};
        ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);
        ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size minCapacity = 1;
    const ani_size loopCount = 3;
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    for (ani_size i = 1; i <= loopCount; i++) {
        ASSERT_EQ(env->CreateLocalScope(minCapacity), ANI_OK);
        for (ani_size j = 1; j <= specifiedCap; j++) {
            ani_string objectRef {};
            ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);
        }
        ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size loopCount = 3;
    const ani_size specifiedCap = 60;
    for (ani_size i = 1; i <= loopCount; i++) {
        ASSERT_EQ(env->CreateLocalScope(specifiedCap), ANI_OK);
        ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size loopCount = 3;
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    for (ani_size i = 1; i <= loopCount; i++) {
        ASSERT_EQ(env->CreateLocalScope(specifiedCap), ANI_OK);
        ani_string objectRef {};
        ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);
        ASSERT_EQ(env->Reference_Delete(objectRef), ANI_OK);
        ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size loopCount = 3;
    const ani_size specifiedCap = 60;
    for (ani_size i = 1; i <= loopCount; i++) {
        ASSERT_EQ(env->CreateLocalScope(specifiedCap), ANI_OK);
        ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    ASSERT_EQ(env->CreateLocalScope(specifiedCap), ANI_OK);
    ASSERT_EQ(env->CreateLocalScope(specifiedCap), ANI_OK);
    ASSERT_EQ(env->CreateLocalScope(specifiedCap), ANI_OK);
    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size loopCount = 3;
    const ani_size specifiedCap = 60;
    for (ani_size i = 1; i <= loopCount; i++) {
        ASSERT_EQ(env->CreateLocalScope(specifiedCap), ANI_OK);
        ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    ani_ref result {};
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);

    ani_string objectRef {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size minCapacity = 1;
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    ani_ref result {};

    ASSERT_EQ(env->CreateEscapeLocalScope(minCapacity), ANI_OK);
    ani_string objectRef {};
    for (ani_size i = 1; i <= specifiedCap; i++) {
        ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);
    }
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);

    ani_string objectRef {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);
    ani_ref result {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    ani_ref result {};
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);

    ani_string objectRef {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);
    ASSERT_EQ(env->Reference_Delete(objectRef), ANI_OK);
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size loopCount = 3;
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    ani_ref result {};
    ani_string objectRef {};
    for (ani_size i = 1; i <= loopCount; i++) {
        ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);
        ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);
        ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    }
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);

    ani_string objectRef {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size loopCount = 3;
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    for (ani_size i = 1; i <= loopCount; i++) {
        ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);
        ani_string objectRef {};
        ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);

        ani_ref result {};
        ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    }
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size specifiedCap = 60;
    const std::string_view testString = "test";
    ASSERT_EQ(env->CreateEscapeLocalScope(specifiedCap), ANI_OK);

    ani_string objectRefA {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRefA), ANI_OK);

    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.LocalScope.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref result {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(cls, &result), ANI_OK);

    ani_static_method method {};
    auto classA = reinterpret_cast<ani_class>(result);
    ASSERT_EQ(env->Class_FindStaticMethod(classA, "or", "zz:z", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(classA, method, &res, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size refNum = 10;
    const std::string_view testString = "test";
    ASSERT_EQ(env->CreateEscapeLocalScope(refNum), ANI_OK);
    ani_string objectRef {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);

    ani_size size = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(static_cast<ani_string>(result), &size), ANI_OK);
    ASSERT_EQ(size, testString.size());
    return ANI_TRUE;
}

ani_boolean CheckReferenceEquality(ani_env *env, ani_ref lhs, ani_ref rhs)
{
    ani_boolean isEquals = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(lhs, rhs, &isEquals), ANI_OK);
    ASSERT_EQ(isEquals, ANI_TRUE);

    isEquals = ANI_FALSE;
    ASSERT_EQ(env->Reference_StrictEquals(lhs, rhs, &isEquals), ANI_OK);
    ASSERT_EQ(isEquals, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size refNum = 10;
    const std::string_view testString = "test";
    ani_string stringRef {};
    ani_ref result {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &stringRef), ANI_OK);

    ASSERT_EQ(env->CreateEscapeLocalScope(refNum), ANI_OK);
    ASSERT_EQ(env->DestroyEscapeLocalScope(stringRef, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size refNum = 10;
    const std::string_view testString = "test";
    ASSERT_EQ(env->CreateLocalScope(refNum), ANI_OK);

    ASSERT_EQ(env->CreateEscapeLocalScope(refNum), ANI_OK);

    ani_string objectRefA {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRefA), ANI_OK);

    ani_string objectRefB {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRefB), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRefA, &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    const uint32_t bufferSize = 100U;
    char utfBuffer[bufferSize] = {};
    ani_size actualSize = 0U;
    ani_status status = env->String_GetUTF8SubString(reinterpret_cast<ani_string>(result), 0U, testString.size(),
        utfBuffer, bufferSize, &actualSize);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(actualSize, testString.size());

    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size refNum = 10;
    ASSERT_EQ(env->CreateLocalScope(refNum), ANI_OK);
    ASSERT_EQ(env->CreateEscapeLocalScope(refNum), ANI_OK);

    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.LocalScope.Student", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &ctor), ANI_OK);
    ASSERT_NE(ctor, nullptr);

    ani_object objectA {};
    const ani_int age = 12;
    ASSERT_EQ(env->Object_New(cls, ctor, &objectA, age), ANI_OK);
    ASSERT_NE(objectA, nullptr);

    ani_string str {};
    std::string name = "Tom";
    ASSERT_EQ(env->String_NewUTF8(name.data(), name.size(), &str), ANI_OK);
    ASSERT_NE(str, nullptr);
    ASSERT_EQ(env->Object_SetPropertyByName_Ref(objectA, "name", str), ANI_OK);

    ani_ref nameValue {};
    ASSERT_EQ(env->Object_CallMethodByName_Ref(objectA, "getName", nullptr, &nameValue), ANI_OK);
    ASSERT_NE(nameValue, nullptr);

    ani_ref escapedValue {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(nameValue, &escapedValue), ANI_OK);
    ASSERT_NE(escapedValue, nullptr);

    std::string resString {};
    GetStdString(env, reinterpret_cast<ani_string>(escapedValue), resString);

    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_28([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size refNum = 10;
    ASSERT_EQ(env->CreateEscapeLocalScope(refNum), ANI_OK);

    ani_ref nullRef;
    ASSERT_EQ(env->GetNull(&nullRef), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(nullRef, &result), ANI_OK);

    ani_boolean isNull = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsNull(result, &isNull), ANI_OK);
    ASSERT_EQ(isNull, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_29([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size refNum = 10;
    ASSERT_EQ(env->CreateEscapeLocalScope(refNum), ANI_OK);

    ani_ref nullRef;
    ASSERT_EQ(env->GetNull(&nullRef), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(nullRef, &result), ANI_OK);

    ani_boolean isNull = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsNull(result, &isNull), ANI_OK);
    ASSERT_EQ(isNull, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_30([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size refNum = 10;
    ASSERT_EQ(env->CreateEscapeLocalScope(refNum), ANI_OK);

    ani_ref undefinedRef {};
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(undefinedRef, &result), ANI_OK);

    ani_boolean isUndefined = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsUndefined(result, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_31([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->c_api->CreateLocalScope(nullptr, SPECIFIED_CAPACITY), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_32([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->c_api->DestroyLocalScope(nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_33([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->c_api->CreateEscapeLocalScope(nullptr, SPECIFIED_CAPACITY), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_34([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string_view testString = "test";
    const ani_size refNum = 10;
    ani_ref result {};

    ASSERT_EQ(env->CreateEscapeLocalScope(refNum), ANI_OK);
    ani_string objectRef {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);
    ASSERT_EQ(env->c_api->DestroyEscapeLocalScope(nullptr, objectRef, &result), ANI_INVALID_ARGS);
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Create_Escape_Local_Scope_35([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string_view testString = "test";
    const ani_size refNum = 10;
    ASSERT_EQ(env->CreateEscapeLocalScope(refNum), ANI_OK);
    ani_string objectRef {};
    ASSERT_EQ(env->String_NewUTF8(testString.data(), testString.size(), &objectRef), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env->DestroyEscapeLocalScope(objectRef, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Ensure_Enough_References_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_size specifiedCapacity = 60;
    // Ensures specifiedCapacity local references are available
    ASSERT_EQ(env->EnsureEnoughReferences(specifiedCapacity), ANI_OK);
    // Passing specifiedCapacity as capacity should succeed and return ANI_OK
    ASSERT_EQ(env->CreateLocalScope(specifiedCapacity), ANI_OK);

    ani_string string = nullptr;

    // Create specifiedCapacity strings in the newly created local scope
    for (ani_size i = 1; i <= specifiedCapacity; ++i) {
        // Construct a unique stringName for each iteration
        std::string stringName = "String_NewUTF8_" + std::to_string(i) + ";";

        // Attempt to create a new UTF8 string and check the result
        ASSERT_EQ(env->String_NewUTF8(stringName.c_str(), stringName.size(), &string), ANI_OK);
        ASSERT_NE(string, nullptr);
    }

    // Destroy the local scope after string creation
    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    constexpr ani_size minCapacity = 1;
    // Ensures minCapacity local references are available
    ASSERT_EQ(env->EnsureEnoughReferences(minCapacity), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Ensure_Enough_References_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_size maxCapacity = 32000000;
    // Passing 0 as capacity should return ANI_INVALID_ARGS
    ASSERT_EQ(env->EnsureEnoughReferences(0), ANI_INVALID_ARGS);

    ASSERT_EQ(env->EnsureEnoughReferences(maxCapacity), ANI_OUT_OF_MEMORY);
    /*
     * Attempt to create a local scope with very large capacity (maxCapacity).
     * The comment below indicates that the free size of local reference storage is
     * smaller than the requested capacity, thus should return ANI_OUT_OF_MEMORY.
     */
    // Free size of local reference storage is less than capacity: maxCapacity
    // blocks_count_: 1 need_blocks: 533334 blocks_free: 524287
    ASSERT_EQ(env->CreateLocalScope(maxCapacity), ANI_OUT_OF_MEMORY);
    return ANI_TRUE;
}

ani_boolean test_Ensure_Enough_References_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_size capacity = 10;
    ASSERT_EQ(env->EnsureEnoughReferences(capacity), ANI_OK);

    for (ani_size i = 0; i <= capacity; i++) {
        std::string stringName = "String_NewUTF8_" + std::to_string(i) + ";";

        ani_ref objectRef {};
        ASSERT_EQ(
            env->String_NewUTF8(stringName.c_str(), stringName.size(), reinterpret_cast<ani_string *>(&objectRef)),
            ANI_OK);
    }
    return ANI_TRUE;
}

ani_boolean test_Ensure_Enough_References_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->EnsureEnoughReferences(ani_size(std::numeric_limits<uint32_t>::max()) - 1), ANI_OUT_OF_MEMORY);
    ASSERT_EQ(env->EnsureEnoughReferences(ani_size(std::numeric_limits<uint32_t>::max()) - 0), ANI_OUT_OF_MEMORY);
    ASSERT_EQ(env->EnsureEnoughReferences(ani_size(std::numeric_limits<ani_size>::max()) - 1), ANI_OUT_OF_MEMORY);
    ASSERT_EQ(env->EnsureEnoughReferences(ani_size(std::numeric_limits<ani_size>::max()) - 0), ANI_OUT_OF_MEMORY);
    return ANI_TRUE;
}

ani_boolean test_Ensure_Enough_References_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_size minCapacity = 1;
    ASSERT_EQ(env->c_api->EnsureEnoughReferences(nullptr, minCapacity), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_SCOPESUPPORT_H
