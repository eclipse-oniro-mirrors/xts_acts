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

#ifndef JSVM_XTS_NAPI_DATE_TEST_H
#define JSVM_XTS_NAPI_DATE_TEST_H
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

//CreateDate
JSVM_Value TestCreateDateTest1(JSVM_Env env, JSVM_CallbackInfo info);
//GetDateValue
JSVM_Value TestGetDateValueTest1(JSVM_Env env, JSVM_CallbackInfo info);
//IsDate
JSVM_Value TestIsDateTest1(JSVM_Env env, JSVM_CallbackInfo info);
//Combination: create -- is-- get
JSVM_Value TestDateCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info);
#endif //JSVM_XTS_NAPI_DATE_TEST_H
