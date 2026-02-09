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
#ifndef JSVM_XTS_NAPI_STRING_TEST_H
#define JSVM_XTS_NAPI_STRING_TEST_H
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

// OH_JSVM_GetValueStringUtf8 interface
JSVM_Value TestGetValueStringUtf8Test1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf8Test2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf8Test3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf8Test4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf8Test5(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf8Test6(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_CreateStringUtf8 interface
JSVM_Value TestCreateStringUtf8Test1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateStringUtf8Test2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateStringUtf8Test3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateStringUtf8Test4(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_CreateStringUtf16 interface
JSVM_Value TestCreateStringUtf16Test1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateStringUtf16Test2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateStringUtf16Test3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateStringUtf16Test4(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_GetValueStringUtf16 interface
JSVM_Value TestGetValueStringUtf16Test1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf16Test2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf16Test3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf16Test4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf16Test5(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringUtf16Test6(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_CreateStringLatin1 interface
JSVM_Value TestCreateStringLatin1Test1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateStringLatin1Test2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateStringLatin1Test3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateStringLatin1Test4(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_GetValueStringLatin1 interface
JSVM_Value TestGetValueStringLatin1Test1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringLatin1Test2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringLatin1Test3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringLatin1Test4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringLatin1Test5(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueStringLatin1Test6(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_IsString interface
JSVM_Value TestIsStringTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestIsStringTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestIsStringTest3(JSVM_Env env, JSVM_CallbackInfo info);

// combination interface
JSVM_Value TestOtherTest1(JSVM_Env env, JSVM_CallbackInfo info);
#endif //JSVM_XTS_NAPI_STRING_TEST_H