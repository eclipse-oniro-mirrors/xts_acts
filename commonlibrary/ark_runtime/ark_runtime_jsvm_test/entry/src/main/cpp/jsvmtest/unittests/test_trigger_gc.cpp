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
#ifdef TEST_TRIGGER_GC
#include <iostream>

#include "jsvmtest.h"

static bool g_beforeFlag1 = false;
static bool g_beforeFlag2 = false;
static bool g_beforeFlag3 = false;
static bool g_afterFlag1 = false;
static bool g_afterFlag2 = false;
static int g_nativeData = 2024;

void OnBeforeGC(JSVM_VM vm, JSVM_GCType gcType, JSVM_GCCallbackFlags flags, void *data)
{
    g_beforeFlag1 = true;
}

void OnBeforeGC2(JSVM_VM vm, JSVM_GCType gcType, JSVM_GCCallbackFlags flags, void *data)
{
    if (*(int*)data == g_nativeData) {
        g_beforeFlag2 = true;
    }
}

void OnBeforeGC3(JSVM_VM vm, JSVM_GCType gcType, JSVM_GCCallbackFlags flags, void *data)
{
    g_beforeFlag3 = true;
}

void OnAfterGC(JSVM_VM vm, JSVM_GCType gcType, JSVM_GCCallbackFlags flags, void *data)
{
    g_afterFlag1 = true;
}

void OnAfterGC2(JSVM_VM vm, JSVM_GCType gcType, JSVM_GCCallbackFlags flags, void *data)
{
    g_afterFlag2 = true;
}

TEST(ForwardUsageApplicationScenariosOfGCCB)
{
    g_beforeFlag1 = false;
    g_beforeFlag2 = false;
    g_beforeFlag3 = false;
    g_afterFlag1 = false;
    g_afterFlag2 = false;
    int data = g_nativeData;
    JSVMTEST_CALL(OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC, JSVM_GC_TYPE_ALL, NULL));
    JSVMTEST_CALL(OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC,
        OnBeforeGC2, JSVM_GC_TYPE_ALL, (void*)(&data)));
    JSVMTEST_CALL(OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC3,
        JSVM_GC_TYPE_SCAVENGE, NULL));
    JSVMTEST_CALL(OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_AFTER_GC, OnAfterGC, JSVM_GC_TYPE_ALL, NULL));
    JSVMTEST_CALL(OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_AFTER_GC, OnAfterGC2, JSVM_GC_TYPE_ALL, NULL));

    JSVMTEST_CALL(OH_JSVM_RemoveHandlerForGC(vm, JSVM_CB_TRIGGER_AFTER_GC, OnAfterGC2, NULL));

    // can not remove handler that has not been added.
    CHECK(OH_JSVM_RemoveHandlerForGC(vm, JSVM_CB_TRIGGER_AFTER_GC, OnAfterGC2, new int(12)) != JSVM_OK);

    jsvm::TryTriggerGC();
    CHECK(g_beforeFlag1 == true);
    CHECK(g_beforeFlag2 == true);
    CHECK(g_beforeFlag3 == false);
    CHECK(g_afterFlag1 == true);
    CHECK(g_afterFlag2 == false);
}

TEST(NegativeApplicationScenariosOfGCCB) {
    JSVMTEST_CALL(OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC, JSVM_GC_TYPE_ALL, NULL));
    // 1. Repeatedly register the same handler and native-data.
    CHECK(OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC, JSVM_GC_TYPE_ALL, NULL)
        == JSVM_INVALID_ARG);
    // 2. Register an empty handler.
    CHECK(OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, NULL, JSVM_GC_TYPE_ALL, NULL)
        == JSVM_INVALID_ARG);
    // 3. Remove unregistered handlers.
    CHECK(OH_JSVM_RemoveHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC2, NULL) == JSVM_INVALID_ARG);
    // 4. Remove the same handler and native-data repeatedly.
    CHECK(OH_JSVM_RemoveHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC, NULL) == JSVM_OK);
    CHECK(OH_JSVM_RemoveHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC, NULL) == JSVM_INVALID_ARG);
}
#endif  // TEST_TRIGGER_GC
