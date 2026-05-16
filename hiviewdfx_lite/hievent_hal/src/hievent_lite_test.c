/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include <ctype.h>
#include <stdint.h>
#include "event.h"
#include "hctest.h"

#define HIEVENT_TEST_ID 0x1234

LITE_TEST_SUIT(hiviewdfx, hievent_lite, HieventLiteTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL HieventLiteTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL HieventLiteTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

static int HieventLiteTestOutputFunc(uint8 *data)
{
    HiEvent *e = (HiEvent *)data;

    TEST_ASSERT_EQUAL_INT(HIEVENT_TEST_ID, e->common.eventId);
    return 0;
}

/**
 * @tc.name   HieventLiteFuncTest001
 * @tc.number HieventLiteFuncTest001
 * @tc.desc   Test HiEventCreate
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(HieventLiteTestSuite, HieventLiteFuncTest001, Level1)
{
    HiEvent *e = HiEventCreate(HIEVENT_FAULT, 0, 3);

    TEST_ASSERT_NOT_NULL(e);

    HiEventReport(e);
};

/**
 * @tc.name   HieventLiteFuncTest002
 * @tc.number HieventLiteFuncTest002
 * @tc.desc   Test HiEventPutInteger 3 items whth async flush
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(HieventLiteTestSuite, HieventLiteFuncTest002, Level1)
{
    HiEvent *e = HiEventCreate(HIEVENT_FAULT, 1, 3);

    TEST_ASSERT_NOT_NULL(e);

    HiEventPutInteger(e, 1, 0);

    HiEventReport(e);

    HiEventFlush(FALSE);
};

/**
 * @tc.name   HieventLiteFuncTest003
 * @tc.number HieventLiteFuncTest003
 * @tc.desc   Test HiEventCreate
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(HieventLiteTestSuite, HieventLiteFuncTest003, Level1)
{
    HiEvent *e = HiEventCreate(HIEVENT_FAULT, HIEVENT_TEST_ID, 3);

    HiEventRegisterProc((HieventProc)HieventLiteTestOutputFunc);

    TEST_ASSERT_NOT_NULL(e);

    HiEventPutInteger(e, 1, 0);
    HiEventPutInteger(e, 2, 10);
    HiEventPutInteger(e, 3, 20);

    HiEventReport(e);
    HiEventFlush(TRUE);
    HiEventUnRegisterProc((HieventProc)HieventLiteTestOutputFunc);
};

/**
 * @tc.name   HieventLiteFuncTest004
 * @tc.number HieventLiteFuncTest004
 * @tc.desc   Test HiEventCreate
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(HieventLiteTestSuite, HieventLiteFuncTest004, Level1)
{
    HIEVENT_FAULT_REPORT(8, 1, 2);
};

RUN_TEST_SUITE(HieventLiteTestSuite);
