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

#ifndef ARKTS_ANI_TEST_ACCESSINGSTATICFIELDS_H
#define ARKTS_ANI_TEST_ACCESSINGSTATICFIELDS_H
#include "Common.h"

ani_int test_Class_GetStaticField_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestBoolean", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "boolean_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    const ani_char target = 'c';
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0;
    const ani_byte target = 126;
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestShort", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "short_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_short result = 0U;
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 3U);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestInt", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 3U);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestLong", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "long_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_long result = 0L;
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 24L);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    const ani_float target = 18.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    const ani_double target = 18.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestRef", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_ref result = nullptr;
    ASSERT_EQ(env->Class_GetStaticField_Ref(cls, field, &result), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    ani_boolean single = ANI_FALSE;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestBoolean", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "boolean_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_FALSE), ANI_OK);

    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestSetChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    const ani_char target = 'a';
    ASSERT_EQ(result, target);
    const ani_char setTar = 'c';
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    const ani_byte setTarget = 127;
    ani_byte single = 0U;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestByte", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTarget), ANI_OK);

    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, setTarget);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestSetShort", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "short_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_short result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 3U);
    ASSERT_EQ(env->Class_SetStaticField_Short(cls, field, 7U), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 7U);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestSetInt", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 3U);
    ASSERT_EQ(env->Class_SetStaticField_Int(cls, field, 1024U), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 1024U);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestSetLong", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "long_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_long result = 0L;
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 24L);
    ASSERT_EQ(env->Class_SetStaticField_Long(cls, field, 30L), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 30L);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestSetFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    const ani_float target = 18.0F;
    ASSERT_EQ(result, target);
    const ani_float setTar = 28.0F;
    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestSetDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    const ani_double target = 18.0;
    ASSERT_EQ(result, target);
    const ani_double setTar = 28.0;
    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.TestSetRef", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_string string {};
    ASSERT_EQ(env->String_NewUTF8("testString", 10U, &string), ANI_OK);
    ASSERT_EQ(env->Class_SetStaticField_Ref(cls, field, string), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticFieldByName_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.GetBoolStatic", &cls), ANI_OK);
    ani_boolean single = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "single", &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Class_GetStaticFieldByName_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.GetCharStatic", &cls), ANI_OK);
    ani_char name = 'c';
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "name", &name), ANI_OK);
    ASSERT_EQ(name, static_cast<ani_char>('b'));
    return ANI_TRUE;
}

ani_int test_Class_GetStaticFieldByName_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.GetbyteStatic", &cls), ANI_OK);
    ani_byte age;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_byte>(0));
    return ANI_TRUE;
}

ani_int test_Class_GetStaticFieldByName_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.GetShortStatic", &cls), ANI_OK);
    ani_short age = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_short>(20U));
    return ANI_TRUE;
}

ani_int test_Class_GetStaticFieldByName_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.GetIntStatic", &cls), ANI_OK);
    ani_int age = 0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_int>(20U));
    return ANI_TRUE;
}

ani_int test_Class_GetStaticFieldByName_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.GetLongStatic", &cls), ANI_OK);
    ani_long age = 0L;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_long>(20L));
    return ANI_TRUE;
}

ani_int test_Class_GetStaticFieldByName_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.GetFloatStatic", &cls), ANI_OK);
    ani_float age = 0.0F;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_float>(20.0F));
    return ANI_TRUE;
}

ani_int test_Class_GetStaticFieldByName_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.Woman", &cls), ANI_OK);
    ani_double age = 0.0;
    const ani_double expectedAge = 20.0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_double>(expectedAge));
    return ANI_TRUE;
}

ani_int test_Class_GetStaticFieldByName_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticFieldByName_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.BoolStatic", &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Boolean(cls, "bool_value", ANI_TRUE), ANI_OK);
    ani_boolean resultValue = ANI_FALSE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "bool_value", &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticFieldByName_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_char target = 'b';
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.CharStatic", &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Char(cls, "char_value", target), ANI_OK);
    ani_char resultValue;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "char_value", &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, target);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticFieldByName_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_short setTarget = 2U;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.ByteStatic", &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Byte(cls, "byte_value", setTarget), ANI_OK);
    ani_byte resultValue;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "byte_value", &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticFieldByName_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_short setTarget = 2U;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.ShortStatic", &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Short(cls, "short_value", setTarget), ANI_OK);
    ani_short resultValue = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "short_value", &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticFieldByName_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_short setTarget = 2U;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.Packstatic", &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Int(cls, "int_value", setTarget), ANI_OK);
    ani_int resultValue = 0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "int_value", &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticFieldByName_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.PackageStatic", &cls), ANI_OK);
    ASSERT_EQ(env->Class_SetStaticFieldByName_Long(cls, "long_value", 8L), ANI_OK);
    ani_long resultValue = 0L;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "long_value", &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, 8L);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticFieldByName_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_short setTarget = 2.0F;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.FloatStatic", &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Float(cls, "float_value", setTarget), ANI_OK);
    ani_float resultValue = 0.0F;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "float_value", &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticFieldByName_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_double age = 2.0;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.DoubleStatic", &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Double(cls, "double_value", age), ANI_OK);
    ani_double resultValue;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "double_value", &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, age);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticFieldByName_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.AccessingStaticFields.BoxStatic", &cls), ANI_OK);

    ani_string string {};
    ASSERT_EQ(env->String_NewUTF8("abcdef", 6U, &string), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Ref(cls, "string_value", string), ANI_OK);
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_ACCESSINGSTATICFIELDS_H
