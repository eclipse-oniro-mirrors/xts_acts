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

#ifndef BOX_UNBOX_PRIMITIVE_H
#define BOX_UNBOX_PRIMITIVE_H
#include "Common.h"
#include <cfloat>

ani_boolean AssertIsBoolean(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Boolean", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxBooleanNative([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object boxedBool = nullptr;
    ASSERT_EQ(env->Primitive_Box_Boolean(ANI_TRUE, &boxedBool), ANI_OK);
    AssertIsBoolean(env, boxedBool);
    ani_boolean unboxedBool = ANI_FALSE;
    ASSERT_EQ(env->Primitive_Unbox_Boolean(boxedBool, &unboxedBool), ANI_OK);
    ASSERT_EQ(unboxedBool, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testUnboxBooleanNative(ani_env *env)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field genderField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalBoolean", &genderField), ANI_OK);

    ani_ref genderRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, genderField, &genderRef), ANI_OK);

    ani_boolean gender = ANI_TRUE;
    ASSERT_EQ(env->Primitive_Unbox_Boolean(static_cast<ani_object>(genderRef), &gender), ANI_OK);
    ASSERT_EQ(gender, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean AssertIsByte(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Byte", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxByteNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(INT8_MIN, &boxedMin), ANI_OK);
    AssertIsByte(env, boxedMin);
    ani_byte unboxedMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, INT8_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(INT8_MAX, &boxedMax), ANI_OK);
    AssertIsByte(env, boxedMax);
    ani_byte unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, INT8_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(0, &boxedZero), ANI_OK);
    AssertIsByte(env, boxedZero);
    ani_byte unboxedZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0);

    ani_byte value = 12;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(value, &boxedValue), ANI_OK);
    AssertIsByte(env, boxedValue);
    ani_byte unboxedValue = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testUnboxByteNative(ani_env *env)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field codeField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalByte", &codeField), ANI_OK);

    ani_ref codeRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, codeField, &codeRef), ANI_OK);

    ani_byte code = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(static_cast<ani_object>(codeRef), &code), ANI_OK);
    ani_byte expectCode = 12;
    ASSERT_EQ(code, expectCode);
    return ANI_TRUE;
}

ani_boolean AssertIsChar(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Char", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxCharNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(0, &boxedMin), ANI_OK);
    AssertIsChar(env, boxedMin);
    ani_char unboxedMin = 1;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, 0);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(UINT16_MAX, &boxedMax), ANI_OK);
    AssertIsChar(env, boxedMax);
    ani_char unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, UINT16_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char('\0', &boxedZero), ANI_OK);
    AssertIsChar(env, boxedZero);
    ani_char unboxedZero = 1;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, '\0');

    ani_object boxedChar = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char('A', &boxedChar), ANI_OK);
    AssertIsChar(env, boxedChar);
    ani_char unboxedChar = '\0';
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedChar, &unboxedChar), ANI_OK);
    ASSERT_EQ(unboxedChar, 'A');
    return ANI_TRUE;
}

ani_boolean testUnboxCharNative(ani_env *env)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field msgField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalChar", &msgField), ANI_OK);

    ani_ref msgRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, msgField, &msgRef), ANI_OK);

    ani_char msg = '0';
    ASSERT_EQ(env->Primitive_Unbox_Char(static_cast<ani_object>(msgRef), &msg), ANI_OK);
    ASSERT_EQ(msg, 'z');
    return ANI_TRUE;
}

ani_boolean AssertIsDouble(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Double", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxDoubleNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(-DBL_MAX, &boxedMin), ANI_OK);
    AssertIsDouble(env, boxedMin);
    ani_double unboxedMin = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, -DBL_MAX);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(DBL_MAX, &boxedMax), ANI_OK);
    AssertIsDouble(env, boxedMax);
    ani_double unboxedMax = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, DBL_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(0.0, &boxedZero), ANI_OK);
    AssertIsDouble(env, boxedZero);
    ani_double unboxedZero = -1.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0.0);

    ani_double value = 1.23;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(value, &boxedValue), ANI_OK);
    AssertIsDouble(env, boxedValue);
    ani_double unboxedValue = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testUnboxDoubleNative(ani_env *env)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalDouble", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_double score = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ani_double expectScore = 1.23;
    ASSERT_EQ(score, expectScore);
    return ANI_TRUE;
}

ani_boolean AssertIsFloat(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Float", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxFloatNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(-FLT_MAX, &boxedMin), ANI_OK);
    AssertIsFloat(env, boxedMin);
    ani_float unboxedMin = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, -FLT_MAX);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(FLT_MAX, &boxedMax), ANI_OK);
    AssertIsFloat(env, boxedMax);
    ani_float unboxedMax = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, FLT_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(0.0F, &boxedZero), ANI_OK);
    AssertIsFloat(env, boxedZero);
    ani_float unboxedZero = -1.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0.0F);

    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(1.1F, &boxedValue), ANI_OK);
    AssertIsFloat(env, boxedValue);
    ani_float unboxedValue = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, 1.1F);
    return ANI_TRUE;
}

ani_boolean testUnboxFloatNative(ani_env *env)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalFloat", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_float score = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ASSERT_EQ(score, 1.2F);
    return ANI_TRUE;
}

ani_boolean AssertIsInt(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Int", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxIntNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(INT32_MIN, &boxedMin), ANI_OK);
    AssertIsInt(env, boxedMin);
    ani_int unboxedMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, INT32_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(INT32_MAX, &boxedMax), ANI_OK);
    AssertIsInt(env, boxedMax);
    ani_int unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, INT32_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(0, &boxedZero), ANI_OK);
    AssertIsInt(env, boxedZero);
    ani_int unboxedZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0);

    ani_int value = 12;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(value, &boxedValue), ANI_OK);
    AssertIsInt(env, boxedValue);
    ani_int unboxedValue = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testUnboxIntNative(ani_env *env)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalInt", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_int score = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ani_int expectScore = 1234;
    ASSERT_EQ(score, expectScore);
    return ANI_TRUE;
}

ani_boolean AssertIsLong(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Long", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxLongNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(INT64_MIN, &boxedMin), ANI_OK);
    AssertIsLong(env, boxedMin);
    ani_long unboxedMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, INT64_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(INT64_MAX, &boxedMax), ANI_OK);
    AssertIsLong(env, boxedMax);
    ani_long unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, INT64_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(0, &boxedZero), ANI_OK);
    AssertIsLong(env, boxedZero);
    ani_long unboxedZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0);

    ani_long value = 123456789;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(value, &boxedValue), ANI_OK);
    AssertIsLong(env, boxedValue);
    ani_long unboxedValue = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testUnboxLongNative(ani_env *env)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalLong", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_long score = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ani_long expectScore = 123456789;
    ASSERT_EQ(score, expectScore);
    return ANI_TRUE;
}

ani_boolean AssertIsShort(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Short", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxShortNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(INT16_MIN, &boxedMin), ANI_OK);
    AssertIsShort(env, boxedMin);
    ani_short unboxedMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, INT16_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(INT16_MAX, &boxedMax), ANI_OK);
    AssertIsShort(env, boxedMax);
    ani_short unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, INT16_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(0, &boxedZero), ANI_OK);
    AssertIsShort(env, boxedZero);
    ani_short unboxedZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0);

    ani_short value = 123;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(value, &boxedValue), ANI_OK);
    AssertIsShort(env, boxedValue);
    ani_short unboxedValue = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testUnboxShortNative(ani_env *env)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalShort", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_short score = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ani_short expectScore = 123;
    ASSERT_EQ(score, expectScore);
    return ANI_TRUE;
}
#endif //BOX_UNBOX_PRIMITIVE_H
