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

#ifndef ARKTS_ANI_TEST_ACCESSINGFILEDSOFOBJECTS_H
#define ARKTS_ANI_TEST_ACCESSINGFILEDSOFOBJECTS_H
#include "Common.h"

ani_boolean GetClassObject(ani_env *env, ani_object *objectResult, ani_class *outCls, const char *className)
{
    ani_class cls{};
    if (env->FindClass(className, &cls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " FindClass Failed");
        return ANI_FALSE;
    }
    if (cls == nullptr) {
        OH_LOG_INFO(LOG_APP, " FindClass cls is nullptr");
        return ANI_FALSE;
    }

    ani_static_method newMethod;
    std::string strTmp = ":";
    strTmp += className;
    if (env->Class_FindStaticMethod(cls, "new_Object", strTmp.c_str(), &newMethod) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_FindStaticMethod Failed");
        return ANI_FALSE;
    }

    ani_ref ref;
    if (env->Class_CallStaticMethod_Ref(cls, newMethod, &ref) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_CallStaticMethod_Ref Failed");
        return ANI_FALSE;
    }

    *objectResult = static_cast<ani_object>(ref);
    *outCls = cls;
    return ANI_TRUE;
}

ani_int test_Object_SetProperty_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env->Object_SetPropertyByName_Boolean(obj, "booleanValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetProperty_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_char value = 47;
    ASSERT_EQ(env->Object_SetPropertyByName_Char(obj, "charValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetProperty_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_byte value = 3;
    ASSERT_EQ(env->Object_SetPropertyByName_Byte(obj, "byteValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetProperty_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_short value = 3;
    ASSERT_EQ(env->Object_SetPropertyByName_Short(obj, "shortValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetProperty_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_int value = 3;
    ASSERT_EQ(env->Object_SetPropertyByName_Int(obj, "intValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetProperty_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_long value = 3;
    ASSERT_EQ(env->Object_SetPropertyByName_Long(obj, "longValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetProperty_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_float value = 3.3;
    ASSERT_EQ(env->Object_SetPropertyByName_Float(obj, "floatValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetProperty_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_double value = 3.3;
    ASSERT_EQ(env->Object_SetPropertyByName_Double(obj, "doubleValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetProperty_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_ref value = {};
    ASSERT_EQ(env->Object_SetPropertyByName_Ref(obj, "stringValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_GetPropertyByName_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_boolean value;
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(obj, "booleanValue", &value), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_GetPropertyByName_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_char value;
    ASSERT_EQ(env->Object_GetPropertyByName_Char(obj, "charValue", &value), ANI_OK);
    ani_char compValue = 5;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetPropertyByName_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_byte value;
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(obj, "byteValue", &value), ANI_OK);
    ani_byte compValue = 6;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetPropertyByName_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_short value;
    ASSERT_EQ(env->Object_GetPropertyByName_Short(obj, "shortValue", &value), ANI_OK);
    ani_short compValue = 7;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetPropertyByName_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_int value;
    ASSERT_EQ(env->Object_GetPropertyByName_Int(obj, "intValue", &value), ANI_OK);
    ani_int compValue = 8;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetPropertyByName_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_long value;
    ASSERT_EQ(env->Object_GetPropertyByName_Long(obj, "longValue", &value), ANI_OK);
    ani_long compValue = 9;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetPropertyByName_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_float value;
    ASSERT_EQ(env->Object_GetPropertyByName_Float(obj, "floatValue", &value), ANI_OK);
    ani_float compValue = 10.0;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetPropertyByName_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_double value;
    ASSERT_EQ(env->Object_GetPropertyByName_Double(obj, "doubleValue", &value), ANI_OK);
    ani_double compValue = 11.0;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetPropertyByName_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_ref value;
    ASSERT_EQ(env->Object_GetPropertyByName_Ref(obj, "stringValue", &value), ANI_OK);
    ASSERT_NE(value, nullptr);
    return ANI_TRUE;
}

ani_int test_Class_FindField([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field value;
    ASSERT_EQ(env->Class_FindField(cls, "stringValue", &value), ANI_OK);
    ASSERT_NE(value, nullptr);
    return ANI_TRUE;
}

ani_int test_Class_FindSetter([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_method value;
    ASSERT_EQ(env->Class_FindSetter(cls, "age", &value), ANI_OK);
    ASSERT_NE(value, nullptr);
    return ANI_TRUE;
}

ani_int test_Class_FindGetter([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_method value;
    ASSERT_EQ(env->Class_FindGetter(cls, "age", &value), ANI_OK);
    ASSERT_NE(value, nullptr);
    return ANI_TRUE;
}

ani_int test_Class_FindIndexableGetter([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_method value;
    ASSERT_EQ(
        env->Class_FindIndexableGetter(cls, "D:Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;", &value),
        ANI_OK);
    ASSERT_NE(value, nullptr);
    return ANI_TRUE;
}

ani_int test_Class_FindIndexableSetter([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_method value;
    ASSERT_EQ(env->Class_FindIndexableSetter(cls, "DZ:V", &value), ANI_OK);
    ASSERT_NE(value, nullptr);
    return ANI_TRUE;
}

ani_int test_Class_FindIterator([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/AccessingFiledsOfObjects/Singleton;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method value;
    ASSERT_EQ(env->Class_FindIterator(cls, &value), ANI_OK);
    ASSERT_NE(value, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_GetField_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "booleanValue", &field), ANI_OK);

    ani_boolean value;
    ASSERT_EQ(env->Object_GetField_Boolean(obj, field, &value), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_GetField_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "charValue", &field), ANI_OK);

    ani_char value;
    ASSERT_EQ(env->Object_GetField_Char(obj, field, &value), ANI_OK);
    ani_char compValue = 5;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetField_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "byteValue", &field), ANI_OK);

    ani_byte value;
    ASSERT_EQ(env->Object_GetField_Byte(obj, field, &value), ANI_OK);
    ani_byte compValue = 6;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetField_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "shortValue", &field), ANI_OK);

    ani_short value;
    ASSERT_EQ(env->Object_GetField_Short(obj, field, &value), ANI_OK);
    ani_short compValue = 7;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetField_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "intValue", &field), ANI_OK);

    ani_int value;
    ASSERT_EQ(env->Object_GetField_Int(obj, field, &value), ANI_OK);
    ani_int compValue = 8;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetField_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "longValue", &field), ANI_OK);

    ani_long value;
    ASSERT_EQ(env->Object_GetField_Long(obj, field, &value), ANI_OK);
    ani_long compValue = 9;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetField_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "floatValue", &field), ANI_OK);

    ani_float value;
    ASSERT_EQ(env->Object_GetField_Float(obj, field, &value), ANI_OK);
    ani_float compValue = 10.0;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetField_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "doubleValue", &field), ANI_OK);

    ani_double value;
    ASSERT_EQ(env->Object_GetField_Double(obj, field, &value), ANI_OK);
    ani_double compValue = 11.0;
    ASSERT_EQ(value, compValue);
    return ANI_TRUE;
}

ani_int test_Object_GetField_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "stringValue", &field), ANI_OK);

    ani_ref value;
    ASSERT_EQ(env->Object_GetField_Ref(obj, field, &value), ANI_OK);
    ASSERT_NE(value, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_SetField_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "booleanValue", &field), ANI_OK);

    ani_boolean value;
    ASSERT_EQ(env->Object_SetField_Boolean(obj, field, value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetField_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "charValue", &field), ANI_OK);

    ani_char value;
    ASSERT_EQ(env->Object_SetField_Char(obj, field, value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetField_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "byteValue", &field), ANI_OK);

    ani_byte value;
    ASSERT_EQ(env->Object_SetField_Byte(obj, field, value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetField_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "shortValue", &field), ANI_OK);

    ani_short value;
    ASSERT_EQ(env->Object_SetField_Short(obj, field, value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetField_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "intValue", &field), ANI_OK);

    ani_int value;
    ASSERT_EQ(env->Object_SetField_Int(obj, field, value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetField_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "longValue", &field), ANI_OK);

    ani_long value;
    ASSERT_EQ(env->Object_SetField_Long(obj, field, value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetField_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "floatValue", &field), ANI_OK);

    ani_float value;
    ASSERT_EQ(env->Object_SetField_Float(obj, field, value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetField_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "doubleValue", &field), ANI_OK);

    ani_double value;
    ASSERT_EQ(env->Object_SetField_Double(obj, field, value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetField_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, "stringValue", &field), ANI_OK);

    ani_ref value;
    ASSERT_EQ(env->Object_SetField_Ref(obj, field, value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_GetFieldByName_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_boolean value;
    ASSERT_EQ(env->Object_GetFieldByName_Boolean(obj, "booleanValue", &value), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_GetFieldByName_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_char value;
    ASSERT_EQ(env->Object_GetFieldByName_Char(obj, "charValue", &value), ANI_OK);
    ani_char cmpValue = 5;
    ASSERT_EQ(value, cmpValue);
    return ANI_TRUE;
}

ani_int test_Object_GetFieldByName_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_byte value;
    ASSERT_EQ(env->Object_GetFieldByName_Byte(obj, "byteValue", &value), ANI_OK);
    ani_byte cmpValue = 6;
    ASSERT_EQ(value, cmpValue);
    return ANI_TRUE;
}

ani_int test_Object_GetFieldByName_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_short value;
    ASSERT_EQ(env->Object_GetFieldByName_Short(obj, "shortValue", &value), ANI_OK);
    ani_short cmpValue = 7;
    ASSERT_EQ(value, cmpValue);
    return ANI_TRUE;
}

ani_int test_Object_GetFieldByName_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_int value;
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "intValue", &value), ANI_OK);
    ani_int cmpValue = 8;
    ASSERT_EQ(value, cmpValue);
    return ANI_TRUE;
}

ani_int test_Object_GetFieldByName_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_long value;
    ASSERT_EQ(env->Object_GetFieldByName_Long(obj, "longValue", &value), ANI_OK);
    ani_long cmpValue = 9;
    ASSERT_EQ(value, cmpValue);
    return ANI_TRUE;
}

ani_int test_Object_GetFieldByName_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_float value;
    ASSERT_EQ(env->Object_GetFieldByName_Float(obj, "floatValue", &value), ANI_OK);
    ani_float cmpValue = 10.0;
    ASSERT_EQ(value, cmpValue);
    return ANI_TRUE;
}

ani_int test_Object_GetFieldByName_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_double value;
    ASSERT_EQ(env->Object_GetFieldByName_Double(obj, "doubleValue", &value), ANI_OK);
    ani_double cmpValue = 11.0;
    ASSERT_EQ(value, cmpValue);
    return ANI_TRUE;
}

ani_int test_Object_GetFieldByName_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_ref strRef{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "stringValue", &strRef), ANI_OK);
    ASSERT_NE(strRef, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_SetFieldByName_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_boolean value;
    ASSERT_EQ(env->Object_SetFieldByName_Boolean(obj, "booleanValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetFieldByName_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_char value;
    ASSERT_EQ(env->Object_SetFieldByName_Char(obj, "charValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetFieldByName_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_byte value;
    ASSERT_EQ(env->Object_SetFieldByName_Byte(obj, "byteValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetFieldByName_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_short value;
    ASSERT_EQ(env->Object_SetFieldByName_Short(obj, "shortValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetFieldByName_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_int value;
    ASSERT_EQ(env->Object_SetFieldByName_Int(obj, "intValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetFieldByName_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_long value;
    ASSERT_EQ(env->Object_SetFieldByName_Long(obj, "longValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetFieldByName_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_float value;
    ASSERT_EQ(env->Object_SetFieldByName_Float(obj, "floatValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetFieldByName_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_double value;
    ASSERT_EQ(env->Object_SetFieldByName_Double(obj, "doubleValue", value), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_SetFieldByName_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClassObject(env, &obj, &cls, "Lentry/src/main/src/ets/AccessingFiledsOfObjects/TestField;"), ANI_TRUE);

    ani_ref strRef{};
    std::string example = "example";
    const size_t strLen = example.size();
    ani_string aniStringPtr = nullptr;
    env->String_NewUTF8(example.c_str(), strLen, &aniStringPtr);
    strRef = static_cast<ani_ref>(aniStringPtr);
    ASSERT_EQ(env->Object_SetFieldByName_Ref(obj, "stringValue", strRef), ANI_OK);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_ACCESSINGFILEDSOFOBJECTS_H
