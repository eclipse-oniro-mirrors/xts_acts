/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

#ifndef JSVM_XTS_NAPI_OBJECT_TEST_H
#define JSVM_XTS_NAPI_OBJECT_TEST_H
#include "jsvm.h"
#include "jsvm_common.h"
#include "native_common.h"
#include "test_entry.h"
#include "securec.h"
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <thread>
#include <uv.h>
#include <bits/alltypes.h>
#include <unistd.h>
#include <cstring>
#include <fstream>
#include <string>
#include <vector>
using namespace std;
//OH_JSVM_CreateObject
JSVM_Value TestCreateObjectTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateObjectTest2(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_Typeof
JSVM_Value TestTypeofTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest5(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest6(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest7(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest8(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest9(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest10(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest11(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeofTest12(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_TypeTagObject
JSVM_Value TestTypeTagObjectTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeTagObjectTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeTagObjectTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeTagObjectTest4(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_CheckObjectTypeTag
JSVM_Value TestCheckObjectTypeTagTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCheckObjectTypeTagTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCheckObjectTypeTagTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCheckObjectTypeTagTest4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCheckObjectTypeTagTest5(JSVM_Env env, JSVM_CallbackInfo info);

//Combination
JSVM_Value TestObjectCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestObjectCombinationTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestObjectCombinationTest3(JSVM_Env env, JSVM_CallbackInfo info);
#endif //JSVM_XTS_NAPI_OBJECT_TEST_H
