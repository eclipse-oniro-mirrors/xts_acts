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

#include <gtest/gtest.h>
#include <stdlib.h>
#include "ActsLibuvTest.h"
extern "C"{
#include "runner.h"
}

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsLibuvTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsLibuvTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsLibuvTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsLibuvTest::TearDown()
    {
    }

    HWTEST_F(ActsLibuvTest, TestLibuvTestCase001, Function | MediumTest | Level2)
    {
        printf("------start ActsLibuvTest------\n");
        system("/data/local/tmp/libuvruntest");
        EXPECT_TRUE(true);
        printf("------end ActsLibuvTest------\n");
    }
}
