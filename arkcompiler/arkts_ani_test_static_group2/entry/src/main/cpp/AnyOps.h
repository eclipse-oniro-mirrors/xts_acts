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

#ifndef ARKTS_ANI_TEST_ANYOPS_H
#define ARKTS_ANI_TEST_ANYOPS_H
#include "Common.h"

ani_int GetMethod([[maybe_unused]] ani_env *env_, const char *fnName, ani_module *mdResult, ani_function *fnResult)
{
    ani_module md{};
    ASSERT_EQ(env_->FindModule("entry.src.main.src.ets.AnyOps", &md), ANI_OK);
    ASSERT_NE(md, nullptr);

    ani_function fn{};
    ASSERT_EQ(env_->Module_FindFunction(md, fnName, ":C{std.core.Array}", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);

    *mdResult = md;
    *fnResult = fn;
    return ANI_TRUE;
}

ani_int test_Any_Call([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    std::string str = "test";
    ani_string arg {};
    ASSERT_EQ(env_->String_NewUTF8(str.c_str(), str.size(), &arg), ANI_OK);
    std::vector<ani_ref> args = {static_cast<ani_ref>(arg)};
    ani_ref result {};

    ASSERT_EQ(env_->Any_Call(nullptr, args.size(), args.data(), &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Any_CallMethod([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *validName = "test";
    auto dummyRef = reinterpret_cast<ani_ref>(0x1234);
    ani_ref resultRef{};
    ASSERT_EQ(env_->Any_CallMethod(nullptr, validName, 0U, nullptr, &resultRef), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_CallMethod(dummyRef, nullptr, 0U, nullptr, &resultRef), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_CallMethod(dummyRef, validName, 0U, nullptr, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_CallMethod(dummyRef, validName, 2U, nullptr, &resultRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Any_CallMethod_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *clsName = "any_call_method_test.Student";
    ani_class cls {};
    ASSERT_EQ(env_->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env_->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);
    std::string_view nameStr = "Leechy";
    ani_string strRef {};
    ASSERT_EQ(env_->String_NewUTF8(nameStr.data(), nameStr.size(), &strRef), ANI_OK);

    ani_object res {};
    ASSERT_EQ(env_->Object_New(cls, ctor, &res, ani_int(10U), strRef), ANI_OK);
    ani_ref nameRef {};
    // NOTE: Test for Any_CallMethod will be added after resolve #27087
    ASSERT_EQ(env_->Any_CallMethod(static_cast<ani_ref>(res), "test", 0, nullptr, &nameRef), ANI_PENDING_ERROR);
    return ANI_TRUE;
}

ani_int test_Any_GetByIndex([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module md{};
    ani_function fn{};
    GetMethod(env, "getArray", &md, &fn);
    ani_ref arrayRef{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &arrayRef), ANI_OK);
    ani_ref nameRefByIdx{};
    ASSERT_EQ(env->Any_GetByIndex(arrayRef, 0U, &nameRefByIdx), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_GetByValue([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *clsName = "entry.src.main.src.ets.AnyOps.Worker";
    ani_class cls{};
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "iC{std.core.String}:", &ctor), ANI_OK);
    std::string_view nameStr = "Leechy";
    ani_string strRef{};
    ASSERT_EQ(env->String_NewUTF8(nameStr.data(), nameStr.size(), &strRef), ANI_OK);
    ani_object res{};
    ASSERT_EQ(env->Object_New(cls, ctor, &res, ani_int(10U), strRef), ANI_OK);
    ani_ref nameRef{};
    std::string_view fieldNameStr = "_name";
    ani_string filedNameRef{};
    ASSERT_EQ(env->String_NewUTF8(fieldNameStr.data(), fieldNameStr.size(), &filedNameRef), ANI_OK);
    ASSERT_EQ(env->Any_GetByValue(static_cast<ani_ref>(res), static_cast<ani_ref>(filedNameRef), &nameRef), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_GetProperty([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *clsName = "entry.src.main.src.ets.AnyOps.Student";
    ani_class cls{};
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);
    std::string_view nameStr = "Leechy";
    ani_string strRef{};
    ASSERT_EQ(env->String_NewUTF8(nameStr.data(), nameStr.size(), &strRef), ANI_OK);

    ani_object res{};
    ASSERT_EQ(env->Object_New(cls, ctor, &res, ani_int(10U), strRef), ANI_OK);
    ani_ref nameRef{};
    ASSERT_EQ(env->Any_GetProperty(static_cast<ani_ref>(res), "name", &nameRef), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_GetProperty_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref dummyResult {};

    ASSERT_EQ(env->Any_GetByIndex(nullptr, 0U, &dummyResult), ANI_INVALID_ARGS);

    ani_module md {};
    ani_function fn {};
    GetMethod(env, "getArray", &md, &fn);
    ani_ref arrayRef {};
    ASSERT_EQ(env->Function_Call_Ref(fn, &arrayRef), ANI_OK);

    ASSERT_EQ(env->Any_GetByIndex(arrayRef, 0U, nullptr), ANI_INVALID_ARGS);

    ASSERT_EQ(env->c_api->Any_GetByIndex(nullptr, arrayRef, 0U, &dummyResult), ANI_INVALID_ARGS);
    ani_ref outOfBounds {};
    ASSERT_EQ(env->Any_GetByIndex(arrayRef, 1000U, &outOfBounds), ANI_PENDING_ERROR);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_GetProperty_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *clsName = "any_get_property_test.Worker";
    ani_class cls {};
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "iC{std.core.String}:", &ctor), ANI_OK);
    std::string_view nameStr = "Leechy";
    ani_string strRef {};
    ASSERT_EQ(env->String_NewUTF8(nameStr.data(), nameStr.size(), &strRef), ANI_OK);

    ani_object res {};
    ASSERT_EQ(env->Object_New(cls, ctor, &res, ani_int(10U), strRef), ANI_OK);
    ani_ref nameRef {};
    std::string_view fieldNameStr = "_name";
    ani_string filedNameRef {};
    ASSERT_EQ(env->String_NewUTF8(fieldNameStr.data(), fieldNameStr.size(), &filedNameRef), ANI_OK);

    ASSERT_EQ(env->Any_GetByValue(static_cast<ani_ref>(res), static_cast<ani_ref>(filedNameRef), &nameRef), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_GetProperty_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref dummyResult {};
    std::string propName = "name";

    ASSERT_EQ(env->Any_GetProperty(nullptr, propName.c_str(), &dummyResult), ANI_INVALID_ARGS);

    const char *clsName = "any_get_property_test.Student";
    ani_class cls {};
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);

    std::string_view nameStr = "Leechy";
    ani_string strRef {};
    ASSERT_EQ(env->String_NewUTF8(nameStr.data(), nameStr.size(), &strRef), ANI_OK);

    ani_object res {};
    ASSERT_EQ(env->Object_New(cls, ctor, &res, ani_int(10U), strRef), ANI_OK);

    ASSERT_EQ(env->Any_GetProperty(static_cast<ani_ref>(res), nullptr, &dummyResult), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Any_GetProperty(static_cast<ani_ref>(res), propName.c_str(), nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Any_GetProperty_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref dummyResult {};

    ASSERT_EQ(env->Any_GetByValue(nullptr, nullptr, &dummyResult), ANI_INVALID_ARGS);

    const char *clsName = "any_get_property_test.Student";
    ani_class cls {};
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);

    std::string_view nameStr = "Leechy";
    ani_string strRef {};
    ASSERT_EQ(env->String_NewUTF8(nameStr.data(), nameStr.size(), &strRef), ANI_OK);

    ani_object res {};
    ASSERT_EQ(env->Object_New(cls, ctor, &res, ani_int(10U), strRef), ANI_OK);

    ASSERT_EQ(env->Any_GetByValue(static_cast<ani_ref>(res), nullptr, &dummyResult), ANI_INVALID_ARGS);

    std::string_view fieldName = "name";
    ani_string keyStr {};
    ASSERT_EQ(env->String_NewUTF8(fieldName.data(), fieldName.size(), &keyStr), ANI_OK);

    ASSERT_EQ(env->Any_GetByValue(static_cast<ani_ref>(res), static_cast<ani_ref>(keyStr), nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Any_GetProperty_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *clsName = "any_get_property_test.Student";
    ani_class cls {};
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);

    std::string_view nameStr = "Leechy";
    ani_string strRef {};
    ASSERT_EQ(env->String_NewUTF8(nameStr.data(), nameStr.size(), &strRef), ANI_OK);

    ani_object res {};
    ASSERT_EQ(env->Object_New(cls, ctor, &res, ani_int(10U), strRef), ANI_OK);

    const char *invalidClsName = "std.core.Object";
    ani_class dummyCls {};
    ASSERT_EQ(env->FindClass(invalidClsName, &dummyCls), ANI_OK);
    ani_method dummyCtor {};
    ASSERT_EQ(env->Class_FindMethod(dummyCls, "<ctor>", nullptr, &dummyCtor), ANI_OK);
    ani_object dummyKey {};
    ASSERT_EQ(env->Object_New(dummyCls, dummyCtor, &dummyKey), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env->Any_GetByValue(static_cast<ani_ref>(res), static_cast<ani_ref>(dummyKey), &result),
              ANI_PENDING_ERROR);
    return ANI_TRUE;
}

ani_int test_Any_InstanceOf([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const int32_t longStringSize = 10000U;
    std::string longString(longStringSize, 'a');
    ani_string strRef{};
    ASSERT_EQ(env_->String_NewUTF8(longString.c_str(), longString.size(), &strRef), ANI_OK);
    ani_class strType{};
    ani_class stdCoreObj{};
    ASSERT_EQ(env_->FindClass("std.core.String", &strType), ANI_OK);
    ASSERT_EQ(env_->FindClass("std.core.Object", &stdCoreObj), ANI_OK);
    ani_boolean instanceof = ANI_FALSE;
    ASSERT_EQ(env_->Any_InstanceOf(strRef, stdCoreObj, &instanceof), ANI_OK);
    ASSERT_EQ(instanceof, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Any_InstanceOf_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_FALSE;

    ani_class strType {};
    ASSERT_EQ(env_->FindClass("std.core.String", &strType), ANI_OK);
    ASSERT_EQ(env_->Any_InstanceOf(nullptr, strType, &result), ANI_INVALID_ARGS);

    ani_string strRef {};
    std::string_view val = "test";
    ASSERT_EQ(env_->String_NewUTF8(val.data(), val.size(), &strRef), ANI_OK);

    ASSERT_EQ(env_->Any_InstanceOf(strRef, nullptr, &result), ANI_INVALID_ARGS);

    ASSERT_EQ(env_->Any_InstanceOf(strRef, strType, nullptr), ANI_INVALID_ARGS);

    ASSERT_EQ(env_->Any_InstanceOf(nullptr, nullptr, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Any_New([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_ref dummy{};
    ani_ref result{};
    ASSERT_EQ(env_->Any_New(nullptr, 0U, nullptr, &result), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_New(dummy, 0U, nullptr, nullptr), ANI_INVALID_ARGS);
    std::array<ani_ref, 1U> args{};
    ASSERT_EQ(env_->Any_New(dummy, 0U, args.data(), &result), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_New(dummy, 1U, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Any_New_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const int32_t longStringSize = 10000U;
    std::string longString(longStringSize, 'a');
    ani_string strRef {};
    ASSERT_EQ(env_->String_NewUTF8(longString.c_str(), longString.size(), &strRef), ANI_OK);
    ani_ref anyStringRef {};
    ASSERT_EQ(env_->Any_New(strRef, 0U, nullptr, &anyStringRef), ANI_PENDING_ERROR);
    ASSERT_EQ(env_->ResetError(), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_SetByIndex([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_module md{};
    ani_function fn{};
    GetMethod(env_, "getNumericArray", &md, &fn);
    ani_ref arrayRef{};
    ASSERT_EQ(env_->Function_Call_Ref(fn, &arrayRef), ANI_OK);
    ani_class intCls{};
    ani_method intCtor{};
    ASSERT_EQ(env_->FindClass("std.core.Int", &intCls), ANI_OK);
    ASSERT_EQ(env_->Class_FindMethod(intCls, "<ctor>", "i:", &intCtor), ANI_OK);
    ani_object intObj{};
    ani_int intValue = 100U;
    ASSERT_EQ(env_->Object_New(intCls, intCtor, &intObj, intValue), ANI_OK);
    ASSERT_EQ(env_->Any_SetByIndex(arrayRef, 0U, static_cast<ani_ref>(intObj)), ANI_OK);
    ani_ref result{};
    ASSERT_EQ(env_->Any_GetByIndex(arrayRef, 0U, &result), ANI_OK);
    ani_int intResult = 0;
    ASSERT_EQ(env_->Object_CallMethodByName_Int(static_cast<ani_object>(result), "toInt", nullptr, &intResult),
              ANI_OK);
    ASSERT_EQ(intResult, intValue);
    return ANI_TRUE;
}

ani_int test_Any_SetByValue([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *clsName = "entry.src.main.src.ets.AnyOps.Student";
    ani_class cls{};
    ASSERT_EQ(env_->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env_->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);

    std::string_view name = "Initial";
    ani_string nameRef{};
    ASSERT_EQ(env_->String_NewUTF8(name.data(), name.size(), &nameRef), ANI_OK);

    ani_object res{};
    ASSERT_EQ(env_->Object_New(cls, ctor, &res, ani_int(2U), nameRef), ANI_OK);

    std::string_view keyStr = "name";
    ani_string keyRef{};
    ASSERT_EQ(env_->String_NewUTF8(keyStr.data(), keyStr.size(), &keyRef), ANI_OK);

    std::string_view newValue = "Changed";
    ani_string newValueRef{};
    ASSERT_EQ(env_->String_NewUTF8(newValue.data(), newValue.size(), &newValueRef), ANI_OK);

    ASSERT_EQ(env_->Any_SetByValue(res, keyRef, newValueRef), ANI_OK);

    ani_ref result{};
    ASSERT_EQ(env_->Any_GetProperty(res, "name", &result), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_SetProperty([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *clsName = "entry.src.main.src.ets.AnyOps.Student";
    ani_class cls{};
    ASSERT_EQ(env_->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env_->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);

    std::string_view oldName = "Old";
    ani_string strRef{};
    ASSERT_EQ(env_->String_NewUTF8(oldName.data(), oldName.size(), &strRef), ANI_OK);

    ani_object res{};
    ASSERT_EQ(env_->Object_New(cls, ctor, &res, ani_int(1), strRef), ANI_OK);

    std::string_view newName = "Leechy";
    ani_string newStrRef{};
    ASSERT_EQ(env_->String_NewUTF8(newName.data(), newName.size(), &newStrRef), ANI_OK);

    ASSERT_EQ(env_->Any_SetProperty(res, "name", newStrRef), ANI_OK);

    ani_ref result{};
    ASSERT_EQ(env_->Any_GetProperty(res, "name", &result), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_SetProperty_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_module md {};
    ani_function fn {};
    GetMethod(env_, "GetNumericArray", &md, &fn);
    ani_ref arrayRef {};
    ASSERT_EQ(env_->Function_Call_Ref(fn, &arrayRef), ANI_OK);

    ani_class intCls {};
    ani_method intCtor {};
    ASSERT_EQ(env_->FindClass("std.core.Int", &intCls), ANI_OK);
    ASSERT_EQ(env_->Class_FindMethod(intCls, "<ctor>", "i:", &intCtor), ANI_OK);
    ani_object intObj {};
    ani_int intValue = 100U;
    ASSERT_EQ(env_->Object_New(intCls, intCtor, &intObj, intValue), ANI_OK);
    ASSERT_EQ(env_->Any_SetByIndex(arrayRef, 0U, static_cast<ani_ref>(intObj)), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env_->Any_GetByIndex(arrayRef, 0U, &result), ANI_OK);
    ani_int intResult = 0;
    ASSERT_EQ(env_->Object_CallMethodByName_Int(static_cast<ani_object>(result), "toInt", nullptr, &intResult),
              ANI_OK);
    ASSERT_EQ(intResult, intValue);

    return ANI_TRUE;
}

ani_int test_Any_SetProperty_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *clsName = "any_set_property_test.Student";
    ani_class cls {};
    ASSERT_EQ(env_->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env_->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);

    std::string_view name = "Initial";
    ani_string nameRef {};
    ASSERT_EQ(env_->String_NewUTF8(name.data(), name.size(), &nameRef), ANI_OK);

    ani_object res {};
    ASSERT_EQ(env_->Object_New(cls, ctor, &res, ani_int(2U), nameRef), ANI_OK);

    std::string_view keyStr = "name";
    ani_string keyRef {};
    ASSERT_EQ(env_->String_NewUTF8(keyStr.data(), keyStr.size(), &keyRef), ANI_OK);

    std::string_view newValue = "Changed";
    ani_string newValueRef {};
    ASSERT_EQ(env_->String_NewUTF8(newValue.data(), newValue.size(), &newValueRef), ANI_OK);

    ASSERT_EQ(env_->Any_SetByValue(res, keyRef, newValueRef), ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env_->Any_GetProperty(res, "name", &result), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_SetProperty_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_ref dummyRef {};
    std::string_view name = "name";
    std::string_view value = "Invalid";
    ani_string valRef {};
    ASSERT_EQ(env_->String_NewUTF8(value.data(), value.size(), &valRef), ANI_OK);

    ASSERT_EQ(env_->Any_SetProperty(nullptr, name.data(), valRef), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_SetProperty(dummyRef, nullptr, valRef), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_SetProperty(dummyRef, name.data(), nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Any_SetProperty_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_module md {};
    ani_function fn {};
    GetMethod(env_, "GetNumericArray", &md, &fn);
    ani_ref arrayRef {};
    ASSERT_EQ(env_->Function_Call_Ref(fn, &arrayRef), ANI_OK);

    ani_class intCls {};
    ani_method intCtor {};
    ASSERT_EQ(env_->FindClass("std.core.Int", &intCls), ANI_OK);
    ASSERT_EQ(env_->Class_FindMethod(intCls, "<ctor>", "i:", &intCtor), ANI_OK);

    ani_object intObj {};
    ani_int intValue = 42;
    ASSERT_EQ(env_->Object_New(intCls, intCtor, &intObj, intValue), ANI_OK);

    ASSERT_EQ(env_->Any_SetByIndex(nullptr, 0U, static_cast<ani_ref>(intObj)), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_SetByIndex(arrayRef, 0U, nullptr), ANI_INVALID_ARGS);

    ASSERT_EQ(env_->Any_SetByIndex(arrayRef, 1000U, static_cast<ani_ref>(intObj)), ANI_PENDING_ERROR);
    ASSERT_EQ(env_->ResetError(), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_SetProperty_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *clsName = "any_set_property_test.Student";
    ani_class cls {};
    ASSERT_EQ(env_->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env_->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);

    std::string_view name = "X";
    ani_string nameRef {};
    ASSERT_EQ(env_->String_NewUTF8(name.data(), name.size(), &nameRef), ANI_OK);

    ani_object res {};
    ASSERT_EQ(env_->Object_New(cls, ctor, &res, ani_int(3U), nameRef), ANI_OK);

    const char *objClsName = "std.core.Object";
    ani_class keyCls {};
    ASSERT_EQ(env_->FindClass(objClsName, &keyCls), ANI_OK);
    ani_method objCtor {};
    ASSERT_EQ(env_->Class_FindMethod(keyCls, "<ctor>", nullptr, &objCtor), ANI_OK);
    ani_object keyObj {};
    ASSERT_EQ(env_->Object_New(keyCls, objCtor, &keyObj), ANI_OK);

    ASSERT_EQ(env_->Any_SetByValue(res, keyObj, nameRef), ANI_PENDING_ERROR);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_ANYOPS_H
