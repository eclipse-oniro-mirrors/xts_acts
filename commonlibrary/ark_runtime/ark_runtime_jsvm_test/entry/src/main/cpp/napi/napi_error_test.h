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

#ifndef JSVM_XTS_NAPI_ERROR_TEST_H
#define JSVM_XTS_NAPI_ERROR_TEST_H
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
#include <cstdint>
#include <fstream>
#include <string>
#include <vector>
using namespace std;
/// OH_JSVM_CreateError interface
JSVM_Value TestCreateErrorTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateErrorTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateErrorTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateErrorTest4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateErrorTest5(JSVM_Env env, JSVM_CallbackInfo info);

/// OH_JSVM_CreateTypeError interface
JSVM_Value TestCreateTypeErrorTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypeErrorTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypeErrorTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypeErrorTest4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypeErrorTest5(JSVM_Env env, JSVM_CallbackInfo info);

/// OH_JSVM_CreateRangeError interface
JSVM_Value TestCreateRangeErrorTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateRangeErrorTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateRangeErrorTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateRangeErrorTest4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateRangeErrorTest5(JSVM_Env env, JSVM_CallbackInfo info);

/// OH_JSVM_CreateSyntaxError interface
JSVM_Value TestCreateSyntaxErrorTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateSyntaxErrorTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateSyntaxErrorTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateSyntaxErrorTest4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateSyntaxErrorTest5(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_Throw(JSVM_Env env, JSVM_Value error) interface
JSVM_Value TestThrowTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowTest4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowTest5(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowTest6(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_ThrowError interface
JSVM_Value TestThrowErrorTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowErrorTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowErrorTest3(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_ThrowTypeError interface
JSVM_Value TestThrowTypeErrorTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowTypeErrorTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowTypeErrorTest3(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_ThrowRangeError interface
JSVM_Value TestThrowRangeErrorTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowRangeErrorTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowRangeErrorTest3(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_ThrowSyntaxError interface
JSVM_Value TestThrowSyntaxErrorTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowSyntaxErrorTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestThrowSyntaxErrorTest3(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_IsError
JSVM_Value TestIsErrorTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestIsErrorTest2(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_GetAndClearLastException
JSVM_Value TestGetAndClearLastExceptionTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetAndClearLastExceptionTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetAndClearLastExceptionTest3(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_IsExceptionPending
JSVM_Value TestIsExceptionPendingTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestIsExceptionPendingTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestIsExceptionPendingTest3(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_GetLastErrorInfo
JSVM_Value TestGetLastErrorInfoTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetLastErrorInfoTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetLastErrorInfoTest3(JSVM_Env env, JSVM_CallbackInfo info);

// Combination
JSVM_Value TestCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest5(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest6(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest7(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest8(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest9(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest10(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest11(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest12(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest13(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest14(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest15(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest16(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest17(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest18(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest19(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest20(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest21(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest22(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationTest23(JSVM_Env env, JSVM_CallbackInfo info);
#endif // JSVM_XTS_NAPI_ERROR_TEST_H