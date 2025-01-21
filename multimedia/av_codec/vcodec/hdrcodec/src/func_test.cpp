/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <iostream>
#include <cstdio>
#include <atomic>
#include <fstream>
#include <thread>
#include <mutex>
#include <queue>
#include <string>

#include "gtest/gtest.h"
#include "hdrcodec_ndk_sample.h"
#include "native_averrors.h"
#include "native_avcodec_base.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;
namespace OHOS {
namespace Media {
class HDRFuncNdkTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);
};

void HDRFuncNdkTest::SetUpTestCase()
{
}
void HDRFuncNdkTest::TearDownTestCase() {}
void HDRFuncNdkTest::SetUp()
{
}
void HDRFuncNdkTest::TearDown()
{
}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.number    : HDR_FUNC_0030
 * @tc.name      : decode PQ HDRVivid by display mode, and then set HEVC_PROFILE_MAIN10 to encode
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, HDR_FUNC_0010, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = "/data/test/media/pq_vivid.h265";
        ASSERT_EQ(AV_ERR_OK, sample->CreateCodec());
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->Start());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}
/**
 * @tc.number    : HDR_FUNC_0020
 * @tc.name      : decode HLG HDRVivid by display mode, and then set HEVC_PROFILE_MAIN10 to encode
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, HDR_FUNC_0020, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = "/data/test/media/hlg_vivid_4k.h265";
        ASSERT_EQ(AV_ERR_OK, sample->CreateCodec());
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->Start());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : HDR_FUNC_0030
 * @tc.name      : decode PQ HDRVivid by display mode, and then set HEVC_PROFILE_MAIN to encode
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, HDR_FUNC_0030, TestSize.Level2)
{
    if (!access("/system/lib64/media/", 0)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        sample->INP_DIR = "/data/test/media/pq_vivid.h265";
        ASSERT_EQ(AV_ERR_OK, sample->CreateCodec());
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->Start());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : HDR_FUNC_0040
 * @tc.name      : decode HLG HDRVivid by display mode, and then set HEVC_PROFILE_MAIN to encode
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, HDR_FUNC_0040, TestSize.Level2)
{
    if (!access("/system/lib64/media/", 0)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        sample->INP_DIR = "/data/test/media/hlg_vivid_4k.h265";
        ASSERT_EQ(AV_ERR_OK, sample->CreateCodec());
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->Start());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : HDR_FUNC_0050
 * @tc.name      : decode and encode HDRVivid repeat start-stop 5 times before EOS
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, HDR_FUNC_0050, TestSize.Level2)
{
    if (!access("/system/lib64/media/", 0)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = "/data/test/media/hlg_vivid_4k.h265";
        sample->REPEAT_START_STOP_BEFORE_EOS = 5;
        ASSERT_EQ(AV_ERR_OK, sample->CreateCodec());
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->Start());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : HDR_FUNC_0060
 * @tc.name      : decode and encode HDRVivid repeat start-flush-stop 5 times before EOS
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, HDR_FUNC_0060, TestSize.Level2)
{
    if (!access("/system/lib64/media/", 0)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = "/data/test/media/hlg_vivid_4k.h265";
        sample->REPEAT_START_FLUSH_STOP_BEFORE_EOS = 5;
        ASSERT_EQ(AV_ERR_OK, sample->CreateCodec());
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->Start());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : HDR_FUNC_0070
 * @tc.name      : decode and encode HDRVivid repeat start-flush-start 5 times before EOS
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, HDR_FUNC_0070, TestSize.Level2)
{
    if (!access("/system/lib64/media/", 0)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = "/data/test/media/hlg_vivid_4k.h265";
        sample->REPEAT_START_FLUSH_BEFORE_EOS = 5;
        ASSERT_EQ(AV_ERR_OK, sample->CreateCodec());
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->Start());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : HDR_FUNC_0080
 * @tc.name      : decode and encode different resolution with same codec
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, HDR_FUNC_0080, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = "/data/test/media/hlg_vivid_4k.h265";
        ASSERT_EQ(AV_ERR_OK, sample->CreateCodec());
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->Start());
        sample->WaitForEos();
        sample->DEFAULT_WIDTH = 1920;
        sample->DEFAULT_HEIGHT = 1080;
        sample->INP_DIR = "/data/test/media/hlg_vivid_1080p.h265";
        ASSERT_EQ(AV_ERR_OK, sample->ReConfigure());
        ASSERT_EQ(AV_ERR_OK, sample->Start());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}
} // namespace