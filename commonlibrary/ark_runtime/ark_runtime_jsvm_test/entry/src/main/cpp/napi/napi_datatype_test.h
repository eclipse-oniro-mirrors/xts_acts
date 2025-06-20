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

#ifndef JSVM_XTS_NAPI_DATATYPE_TEST_H
#define JSVM_XTS_NAPI_DATATYPE_TEST_H
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
//Init
JSVM_Value TestInitTest1(JSVM_Env env, JSVM_CallbackInfo info);
//CreateVM
JSVM_Value TestCreateVMTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateVMTest2(JSVM_Env env, JSVM_CallbackInfo info);
//DestroyVM
JSVM_Value TestDestroyVMTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDestroyVMTest2(JSVM_Env env, JSVM_CallbackInfo info);
//OpenVMScope
JSVM_Value TestOpenVMScopeTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenVMScopeTest2(JSVM_Env env, JSVM_CallbackInfo info);
//CloseVMScope
JSVM_Value TestCloseVMScopeTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCloseVMScopeTest2(JSVM_Env env, JSVM_CallbackInfo info);
//CreateEnv
JSVM_Value TestCreateEnvTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateEnvTest2(JSVM_Env env, JSVM_CallbackInfo info);
//DestroyEnv
JSVM_Value TestDestroyEnvTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDestroyEnvTest2(JSVM_Env env, JSVM_CallbackInfo info);
//OpenEnvScope
JSVM_Value TestOpenEnvScopeTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenEnvScopeTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenEnvScopeTest3(JSVM_Env env, JSVM_CallbackInfo info);
//CloseEnvScope
JSVM_Value TestCloseEnvScopeTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCloseEnvScopeTest2(JSVM_Env env, JSVM_CallbackInfo info);
//Combination：OH_JSVM_Init -- create vm -- open vm scope -- create env -- open env scope -- open handlescope
//-- close handlescope -- close env scope -- destroy env -- close vm scope -- destroy vm
JSVM_Value TestDataTypeCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info);
#endif //JSVM_XTS_NAPI_DATATYPE_TEST_H
