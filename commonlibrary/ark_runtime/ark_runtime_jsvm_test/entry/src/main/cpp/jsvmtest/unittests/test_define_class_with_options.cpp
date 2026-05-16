/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifdef TEST_DEFINE_CLASS_WITH_OPTIONS
#include "jsvmtest.h"

#define JSVM_PARENT_CLASS_DES_COUNT 2
#define JSVM_OBJECT_INTERFAIELD_COUNT 3
#define JSVM_DEFINE_CLASS_OPTIONS_COUNT 2

static JSVM_PropertyHandlerConfigurationStruct propertyCfg{
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr
};

static bool g_callAsFunctionFlag = false;
static bool g_setNamedPropertyFlag = false;
static bool g_callAsConstructorFlag = false;
static bool g_propertiesFlag = false;

static JSVM_Value SetNamedPropertyCbInfo2(JSVM_Env env, JSVM_Value name, JSVM_Value property,
    JSVM_Value thisArg, JSVM_Value data)
{
    g_setNamedPropertyFlag = true;
    return property;
}

static JSVM_Value Add(JSVM_Env env, JSVM_CallbackInfo info)
{
    g_propertiesFlag = true;
    size_t argc = 2;
    JSVM_Value args[2];
    OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL);
    double num1, num2;
    OH_JSVM_GetValueDouble(env, args[0], &num1);
    OH_JSVM_GetValueDouble(env, args[1], &num2);
    JSVM_Value sum = nullptr;
    OH_JSVM_CreateDouble(env, num1 + num2, &sum);
    return sum;
}

JSVM_Value GenerateParentClass(JSVM_Env env)
{
    JSVM_Value parentClass = nullptr;
    JSVM_CallbackStruct *parentClassConstructor = new JSVM_CallbackStruct;
    parentClassConstructor->data = nullptr;
    parentClassConstructor->callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    JSVM_Value fooVal = jsvm::Str("bar");
    JSVM_PropertyDescriptor des[2];
    des[0] = {
        .utf8name = "foo",
        .value = fooVal,
    };
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    addMethod->callback = Add;
    des[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    JSVM_DefineClassOptions options[1];
    options[0].id = JSVM_DEFINE_CLASS_WITH_COUNT;
    options[0].content.num = JSVM_OBJECT_INTERFAIELD_COUNT;
    JSVMTEST_CALL(OH_JSVM_DefineClassWithOptions(env, "parentClass", JSVM_AUTO_LENGTH,
        parentClassConstructor, JSVM_PARENT_CLASS_DES_COUNT, des,
        nullptr, 1, options, &parentClass));
    return parentClass;
}

JSVM_Value GenerateSubClass(JSVM_Env env, JSVM_Value parentClass)
{
    JSVM_Value subClass = nullptr;
    JSVM_CallbackStruct *subClassConstructor = new JSVM_CallbackStruct;
    subClassConstructor->data = nullptr;
    subClassConstructor->callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        g_callAsConstructorFlag = true;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    JSVM_DefineClassOptions subOptions[2];
    JSVM_CallbackStruct *callAsFuncParam = new JSVM_CallbackStruct;
    callAsFuncParam->data = nullptr;
    callAsFuncParam->callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        g_callAsFunctionFlag = true;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    propertyCfg.genericNamedPropertySetterCallback = SetNamedPropertyCbInfo2;
    JSVM_PropertyHandler propertyHandler = {
        .propertyHandlerCfg = &propertyCfg,
        .callAsFunctionCallback = callAsFuncParam,
    };
    subOptions[0].id = JSVM_DEFINE_CLASS_WITH_COUNT;
    subOptions[0].content.num = JSVM_OBJECT_INTERFAIELD_COUNT;
    subOptions[1].id = JSVM_DEFINE_CLASS_WITH_PROPERTY_HANDLER;
    subOptions[1].content.ptr = &propertyHandler;
    JSVMTEST_CALL(OH_JSVM_DefineClassWithOptions(env, "subClass", JSVM_AUTO_LENGTH, subClassConstructor, 0, nullptr,
        parentClass, JSVM_DEFINE_CLASS_OPTIONS_COUNT, subOptions, &subClass));
    return subClass;
}

/**
 * @brief Verify the validity of the following parameters in the OH_JSVM_DefineClassWithOptions interface:
 * 'consturctor' | 'properties' | 'parentClass' | 'options'
 */
TEST(TestParentClassWithCount)
{
    g_callAsFunctionFlag = false;
    g_setNamedPropertyFlag = false;
    g_callAsConstructorFlag = false;
    g_propertiesFlag = false;
    // 1. Define parent-class.
    JSVM_Value parentClass = GenerateParentClass(env);
    // 2. Define sub-class.
    JSVM_Value subClass = GenerateSubClass(env, parentClass);
    // 3. Verify the validity of 'constructor'.
    JSVM_Value subInstance;
    CHECK(g_callAsConstructorFlag == false);
    JSVM_CALL(OH_JSVM_NewInstance(env, subClass, 0, nullptr, &subInstance));
    CHECK(g_callAsConstructorFlag == true);

    JSVM_Value globalVal;
    OH_JSVM_GetGlobal(env, &globalVal);
    OH_JSVM_SetNamedProperty(env, globalVal, "obj", subInstance);

    // 4. Verify the validity of 'parentClass'.
    JSVM_Value subRes = nullptr;
    JSVM_CALL(OH_JSVM_GetNamedProperty(env, subInstance, "foo", &subRes));
    CHECK(jsvm::ToString(subRes).compare("bar") == 0);
    // 5. Verify the validity of 'properties'.
    CHECK(g_propertiesFlag == false);
    jsvm::Run("obj.add(3, 4);");
    CHECK(g_propertiesFlag == true);
    // 6. Verify the validity of 'options'.
    CHECK(g_callAsFunctionFlag == false);
    jsvm::Run("obj()");
    CHECK(g_callAsFunctionFlag == true);
    CHECK(g_setNamedPropertyFlag == false);
    jsvm::Run("obj.x = 123;");
    CHECK(g_setNamedPropertyFlag == true);
}

/**
 * @brief If parentClass is not an APIFunction, the status code is JSVM_INVALID_ARG.
 */
TEST(NonAPIFunction) {
    JSVM_Value script  = jsvm::Str("return 2 + 3;");
    JSVM_Value nonAPIFunction = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateFunctionWithScript(env, nullptr, 0, 0,
	    nullptr, script, &nonAPIFunction));

    JSVM_Value subClass = nullptr;
    JSVM_CallbackStruct constructor;
    constructor.data = nullptr;
    constructor.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    JSVM_Status status = OH_JSVM_DefineClassWithOptions(env, "subClass", JSVM_AUTO_LENGTH,
        &constructor, 0, nullptr, nonAPIFunction, 0, nullptr, &subClass);
    CHECK(status == JSVM_INVALID_ARG);
}

#endif // TEST_DEFINE_CLASS_WITH_OPTIONS