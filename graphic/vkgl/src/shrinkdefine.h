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

#ifndef TEST_SHRINKDEFINE_H
#define TEST_SHRINKDEFINE_H

#define SHRINK_HWTEST_F(TestSuite, TestCase, VkglCase1, VkglCase2)   \
    HWTEST_F(TestSuite, TestCase, Function | MediumTest | Level2)                 \
    {                                                                             \
        GTEST_LOG_(INFO) << #TestCase << "start";                                 \
        int argc = 3;                                                             \
        const char *argv[3] = {                                                   \
            ".",                                                                  \
            "--deqp-case="                                                        \
            VkglCase1                                                             \
            VkglCase2,                                                            \
            "--deqp-archive-dir=/data/local/tmp/"                                 \
        };                                                                        \
        FuncRunResult result = RunTestKHRGLES(argc, argv);                        \
        TestSuite::runResult.numPassed += result.numPassed;                       \
        TestSuite::runResult.numFailed += result.numFailed;                       \
        TestSuite::runResult.numNotSupported += result.numNotSupported;           \
        TestSuite::runResult.numWarnings += result.numWarnings;                   \
        TestSuite::runResult.numWaived += result.numWaived;                       \
        if (result.numNotSupported == 1) {                                        \
            GTEST_LOG_(INFO) << #TestCase << "notsupport!";                       \
        } else if (result.isComplete) {                                           \
            EXPECT_TRUE(result.isComplete);                                       \
            EXPECT_TRUE(result.numPassed == 1);                                   \
        };                                                                        \
        GTEST_LOG_(INFO) << #TestCase << "end";                                   \
    }

#endif // 为缩减代码而存在