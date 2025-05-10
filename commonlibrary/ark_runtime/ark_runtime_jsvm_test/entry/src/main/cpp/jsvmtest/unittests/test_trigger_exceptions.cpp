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
#ifdef TEST_TRIGGER_EXCEPTIONS
#include <csetjmp>
#include <iostream>

#include "jsvmtest.h"

static jmp_buf g_buf;
static bool g_oomHandlerFinished = false;
static bool g_fatalHandlerFinished = false;
static bool g_fatalHandlerFinished2 = false;
static bool g_promiseRejectFinished = false;

void OnOOMError(const char *location, const char *detail, bool isHeapOOM)
{
    g_oomHandlerFinished = true;
    longjmp(g_buf, 1);
}

void OnFatalError(const char *location, const char *message)
{
    g_fatalHandlerFinished = true;
    longjmp(g_buf, 1);
}

void OnFatalError2(const char *location, const char *message)
{
    g_fatalHandlerFinished2 = true;
    longjmp(g_buf, 1);
}


void OnPromiseReject(JSVM_Env env, JSVM_PromiseRejectEvent rejectEvent, JSVM_Value rejectInfo)
{
    CHECK(jsvm::IsObject(rejectInfo));
    auto promise = jsvm::GetProperty(rejectInfo, "promise");
    CHECK(jsvm::IsPromise(promise));
    auto value = jsvm::GetProperty(rejectInfo, "value");
    CHECK(jsvm::IsNumber(value));
    g_promiseRejectFinished = true;
}

TEST(OOM)
{
    g_oomHandlerFinished = false;
    JSVMTEST_CALL(OH_JSVM_SetHandlerForOOMError(vm, OnOOMError));
}

TEST(FatalError)
{
    g_fatalHandlerFinished = false;
    JSVMTEST_CALL(OH_JSVM_SetHandlerForFatalError(vm, OnFatalError));
    static bool fataled = false;
    setjmp(g_buf);
    if (!fataled) {
        fataled = true;
        jsvm::TryTriggerFatalError(vm);
    }
    CHECK(g_fatalHandlerFinished);
}

TEST(PromiseReject)
{
    JSVMTEST_CALL(OH_JSVM_SetHandlerForPromiseReject(vm, OnPromiseReject));
    jsvm::Run("new Promise((resolve, reject) => { reject(42); })");
}

TEST(CheckHandler)
{
    CHECK(g_fatalHandlerFinished);
    CHECK(g_promiseRejectFinished);
}
#endif // TEST_TRIGGER_EXCEPTIONS