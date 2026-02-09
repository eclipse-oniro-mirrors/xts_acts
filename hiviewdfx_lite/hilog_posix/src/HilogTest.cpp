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


#include <stdio.h>
#include "gtest/gtest.h"
#include "log.h"

#undef LOG_TAG
#undef LOG_DOMAIN
#define LOG_TAG "Test_TAG"
#define LOG_DOMAIN 0xD002D00

using namespace OHOS::HiviewDFX;
static constexpr HiLogLabel LABEL = {LOG_CORE, 0xD002D00, "Test_TAG"};
using namespace std;
using namespace testing::ext;
	
class HiLogTest : public testing::Test {
protected:
    static void SetUpTestCase(void) {}
    static void TearDownTestCase(void) {}
    virtual void SetUp() {}
    virtual void TearDown() {}
};

/**
 * @tc.name   subDfxDftHiLogCortexaapi0100
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi0100, Function | MediumTest | Level0)
{
    HILOG_DEBUG(LOG_CORE, "Debug log of HiLog API test");
}


/**
 * @tc.name   subDfxDftHiLogCortexaapi0200
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi0200, Function | MediumTest | Level1)
{
    HILOG_INFO(LOG_CORE, "Info log of HiLog API test");
}

/**
 * @tc.name   subDfxDftHiLogCortexaapi0300
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi0300, Function | MediumTest | Level1)
{
    HILOG_WARN(LOG_CORE, "Warn log of HiLog API test");
}

/**
 * @tc.name   subDfxDftHiLogCortexaapi0400
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi0400, Function | MediumTest | Level1)
{
    HILOG_ERROR(LOG_CORE, "Error log of HiLog API test");
}

/**
 * @tc.name   subDfxDftHiLogCortexaapi0500
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi0500, Function | MediumTest | Level1)
{
    HILOG_FATAL(LOG_CORE, "Fatal log of HiLog API test");
}

/**
 * @tc.name   subDfxDftHiLogCortexaapi0600
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi0600, Function | MediumTest | Level1)
{
    bool ret = true;
    ret = HiLog::Debug(LABEL, "Debug log of HiLog API test");
    EXPECT_TRUE(ret);
}

/**
 * @tc.name   subDfxDftHiLogCortexaapi0700
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi0700, Function | MediumTest | Level1)
{
    bool ret = true;
    ret = HiLog::Error(LABEL, "Error log of HiLog API test");
    EXPECT_TRUE(ret);
}

/**
 * @tc.name   subDfxDftHiLogCortexaapi0800
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_0800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi0800, Function | MediumTest | Level1)
{
    bool ret = true;
    ret = HiLog::Fatal(LABEL, "Fatal log of HiLog API test");
    EXPECT_TRUE(ret);
}

/**
 * @tc.name   subDfxDftHiLogCortexaapi0900
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_0900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi0900, Function | MediumTest | Level1)
{
    bool ret = true;
    ret = HiLog::Info(LABEL, "Info log of HiLog API test");
    EXPECT_TRUE(ret);
}

/**
 * @tc.name   subDfxDftHiLogCortexaapi1000
 * @tc.number Sub_Dfx_Dft_HiLog_Cortexaapi_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HiLogTest, subDfxDftHiLogCortexaapi1000, Function | MediumTest | Level1)
{
    bool ret = true;
    ret = HiLog::Warn(LABEL, "Warn log of HiLog API test");
    EXPECT_TRUE(ret);
}
