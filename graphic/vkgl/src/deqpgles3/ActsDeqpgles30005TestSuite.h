/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#ifndef DEQPGLES3_TESTCASE_H
#define DEQPGLES3_TESTCASE_H

#include <gtest/gtest.h>
#include "Deqpgles3BaseFunc.h"

namespace OHOS {
    class ActsDeqpgles30005TestSuite : public testing::Test {
    public:
        static time_t startTime;
        static time_t endTime;
        static FuncRunResult runResult;
    protected:
        // Preset action of the test suite, which is executed before the first test case
        static void SetUpTestCase(void);
        // Test suite cleanup action, which is executed after the last test case
        static void TearDownTestCase(void);
        // Preset action of the test case
        virtual void SetUp(void);
        // Cleanup action of the test case
        virtual void TearDown(void);
    };
} // namespace OHOS

#endif // DEQPGLES3_TESTCASE_H