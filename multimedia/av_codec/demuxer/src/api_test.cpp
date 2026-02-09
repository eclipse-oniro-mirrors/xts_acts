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

#include "gtest/gtest.h"

#include "native_avcodec_base.h"
#include "native_avdemuxer.h"
#include "native_avformat.h"
#include "native_avsource.h"
#include "native_avbuffer.h"

#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>

namespace OHOS {
namespace Media {
class DemuxerApiNdkTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);

public:
    int fd1;
    int64_t size;
};
static int32_t g_width = 3840;
static int32_t g_height = 2160;
static OH_AVMemory *memory = nullptr;
static OH_AVBuffer *buffer = nullptr;
static OH_AVSource *source = nullptr;
static OH_AVDemuxer *demuxer = nullptr;
const char *g_file1 = "/data/test/media/01_video_audio.mp4";
const char *g_file2 = "/data/test/media/avcc_10sec.mp4";

void DemuxerApiNdkTest::SetUpTestCase() {}
void DemuxerApiNdkTest::TearDownTestCase() {}

void DemuxerApiNdkTest::SetUp()
{
    memory = OH_AVMemory_Create(g_width * g_height);
    buffer = OH_AVBuffer_Create(g_width * g_height);
    fd1 = open(g_file1, O_RDONLY);

    struct stat fileStatus {};
    if (stat(g_file1, &fileStatus) == 0) {
        size = static_cast<int64_t>(fileStatus.st_size);
    }

    std::cout << fd1 << "----------" << g_file1 << "=====" << size << std::endl;
}

void DemuxerApiNdkTest::TearDown()
{
    close(fd1);
    fd1 = 0;
    if (memory != nullptr) {
        OH_AVMemory_Destroy(memory);
        memory = nullptr;
    }
    if (buffer != nullptr) {
        OH_AVBuffer_Destroy(buffer);
        buffer = nullptr;
    }
    if (source != nullptr) {
        OH_AVSource_Destroy(source);
        source = nullptr;
    }
    if (demuxer != nullptr) {
        OH_AVDemuxer_Destroy(demuxer);
        demuxer = nullptr;
    }
}
} // namespace Media
} // namespace OHOS

namespace {
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

/**
 * @tc.name   OH_AVSource_CreateWithDataSource_0100
 * @tc.number OH_AVSource_CreateWithDataSource_0100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, OH_AVSource_CreateWithDataSource_0100, TestSize.Level2)
{
    source = OH_AVSource_CreateWithDataSource(nullptr);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.name   OH_AVSource_CreateWithDataSourceExt_0100
 * @tc.number OH_AVSource_CreateWithDataSourceExt_0100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, OH_AVSource_CreateWithDataSourceExt_0100, TestSize.Level2)
{
    OH_AVSource* source = OH_AVSource_CreateWithDataSourceExt(nullptr, nullptr);
    ASSERT_EQ(nullptr, source);

    OH_AVDataSourceExt dataSourceExt = {1000, nullptr};
    source = OH_AVSource_CreateWithDataSourceExt(&dataSourceExt, nullptr);
    ASSERT_EQ(nullptr, source);

    int dummy = 123;
    source = OH_AVSource_CreateWithDataSourceExt(nullptr, &dummy);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_0100
 * @tc.number DEMUXER_ILLEGAL_PARA_0100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_0100, TestSize.Level2)
{
    source = OH_AVSource_CreateWithURI(nullptr);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_0200
 * @tc.number DEMUXER_ILLEGAL_PARA_0200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_0200, TestSize.Level2)
{
    // fd must bigger than 2
    source = OH_AVSource_CreateWithFD(2, 0, 0);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_0700
 * @tc.number DEMUXER_ILLEGAL_PARA_0700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_0700, TestSize.Level2)
{
    // fd must bigger than 2
    source = OH_AVSource_CreateWithFD(3, 0, -1);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_0800
 * @tc.number DEMUXER_ILLEGAL_PARA_0800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_0800, TestSize.Level2)
{
    // fd must bigger than 2
    source = OH_AVSource_CreateWithFD(3, -1, 1);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_0300
 * @tc.number DEMUXER_ILLEGAL_PARA_0300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_0300, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVSource_Destroy(nullptr));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_0400
 * @tc.number DEMUXER_ILLEGAL_PARA_0400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_0400, TestSize.Level2)
{
    OH_AVFormat *format = OH_AVSource_GetSourceFormat(nullptr);
    ASSERT_EQ(nullptr, format);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_0500
 * @tc.number DEMUXER_ILLEGAL_PARA_0500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_0500, TestSize.Level2)
{
    OH_AVFormat *format = OH_AVSource_GetTrackFormat(nullptr, 0);
    ASSERT_EQ(nullptr, format);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_0600
 * @tc.number DEMUXER_ILLEGAL_PARA_0600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_0600, TestSize.Level2)
{
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    OH_AVFormat *format = OH_AVSource_GetTrackFormat(source, -1);
    ASSERT_EQ(nullptr, format);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_2300
 * @tc.number DEMUXER_ILLEGAL_PARA_2300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_2300, TestSize.Level2)
{
    source = OH_AVSource_CreateWithFD(fd1, 0, 0);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_0900
 * @tc.number DEMUXER_ILLEGAL_PARA_0900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_0900, TestSize.Level2)
{
    demuxer = OH_AVDemuxer_CreateWithSource(nullptr);
    ASSERT_EQ(nullptr, demuxer);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1000
 * @tc.number DEMUXER_ILLEGAL_PARA_1000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1000, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_Destroy(nullptr));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1100
 * @tc.number DEMUXER_ILLEGAL_PARA_1100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1100, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_SelectTrackByID(nullptr, 0));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1200
 * @tc.number DEMUXER_ILLEGAL_PARA_1200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1200, TestSize.Level2)
{
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_SelectTrackByID(demuxer, -1));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1300
 * @tc.number DEMUXER_ILLEGAL_PARA_1300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1300, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_UnselectTrackByID(nullptr, 0));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1400
 * @tc.number DEMUXER_ILLEGAL_PARA_1400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1400, TestSize.Level2)
{
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_UnselectTrackByID(demuxer, -1)); // unselect ok
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1500
 * @tc.number DEMUXER_ILLEGAL_PARA_1500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1500, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    OH_AVCodecBufferAttr bufferAttr;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_ReadSample(nullptr, trackIndex, memory, &bufferAttr));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1600
 * @tc.number DEMUXER_ILLEGAL_PARA_1600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1600, TestSize.Level2)
{
    uint32_t trackIndex = -1;
    OH_AVCodecBufferAttr bufferAttr;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &bufferAttr));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1700
 * @tc.number DEMUXER_ILLEGAL_PARA_1700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1700, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    OH_AVMemory *memory1 = OH_AVMemory_Create(2);
    OH_AVCodecBufferAttr bufferAttr;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    ASSERT_EQ(AV_ERR_NO_MEMORY, OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory1, &bufferAttr));

    OH_AVMemory_Destroy(memory1);
    memory1 = nullptr;
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_2400
 * @tc.number DEMUXER_ILLEGAL_PARA_8600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_2400, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    OH_AVMemory *memory1 = OH_AVMemory_Create(2);
    OH_AVCodecBufferAttr bufferAttr;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory1, &bufferAttr));

    OH_AVMemory_Destroy(memory1);
    memory1 = nullptr;
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_2500
 * @tc.number DEMUXER_ILLEGAL_PARA_1700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_2500, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    OH_AVCodecBufferAttr bufferAttr;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_ReadSample(demuxer, trackIndex, nullptr, &bufferAttr));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_2600
 * @tc.number DEMUXER_ILLEGAL_PARA_2600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_2600, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_ReadSampleBuffer(nullptr, trackIndex, buffer));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_2700
 * @tc.number DEMUXER_ILLEGAL_PARA_2700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_2700, TestSize.Level2)
{
    uint32_t trackIndex = -1;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, OH_AVDemuxer_ReadSampleBuffer(demuxer, trackIndex, buffer));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_2800
 * @tc.number DEMUXER_ILLEGAL_PARA_2800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_2800, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    OH_AVBuffer *buffer1 = OH_AVBuffer_Create(2);
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    ASSERT_EQ(AV_ERR_NO_MEMORY, OH_AVDemuxer_ReadSampleBuffer(demuxer, trackIndex, buffer1));

    OH_AVBuffer_Destroy(buffer1);
    buffer1 = nullptr;
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_2900
 * @tc.number DEMUXER_ILLEGAL_PARA_2900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_2900, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    OH_AVBuffer *buffer1 = OH_AVBuffer_Create(2);
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, OH_AVDemuxer_ReadSampleBuffer(demuxer, trackIndex, buffer1));

    OH_AVBuffer_Destroy(buffer1);
    buffer1 = nullptr;
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_3000
 * @tc.number DEMUXER_ILLEGAL_PARA_3000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_3000, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_ReadSampleBuffer(demuxer, trackIndex, nullptr));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1800
 * @tc.number DEMUXER_ILLEGAL_PARA_1800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1800, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, nullptr));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_1900
 * @tc.number DEMUXER_ILLEGAL_PARA_1900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_1900, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_SeekToTime(nullptr, 1, SEEK_MODE_NEXT_SYNC));
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_2100
 * @tc.number DEMUXER_ILLEGAL_PARA_2100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_2100, TestSize.Level2)
{
    memory = OH_AVMemory_Create(-1);
    ASSERT_EQ(nullptr, memory);
}

/**
 * @tc.name   DEMUXER_ILLEGAL_PARA_2200
 * @tc.number DEMUXER_ILLEGAL_PARA_2200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_ILLEGAL_PARA_2200, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVMemory_Destroy(nullptr));
}

/**
 * @tc.name   DEMUXER_API_0200
 * @tc.number DEMUXER_API_0200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_0200, TestSize.Level2)
{
    OH_AVSource *source1 = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(source1, nullptr);
    int fd2 = open(g_file2, O_RDONLY);
    int64_t size2 = 0;

    struct stat fileStatus {};
    if (stat(g_file2, &fileStatus) == 0) {
        size2 = static_cast<int64_t>(fileStatus.st_size);
    }

    OH_AVSource *source2 = OH_AVSource_CreateWithFD(fd2, 0, size2);
    cout << size2 << "------------------" << endl;
    ASSERT_NE(source2, nullptr);
    ASSERT_EQ(AV_ERR_OK, OH_AVSource_Destroy(source1));
    ASSERT_EQ(AV_ERR_OK, OH_AVSource_Destroy(source2));
    source1 = nullptr;
    source2 = nullptr;
    close(fd2);
}

/**
 * @tc.name   DEMUXER_API_0300
 * @tc.number DEMUXER_API_0300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_0300, TestSize.Level2)
{
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_EQ(AV_ERR_OK, OH_AVSource_Destroy(source));
    source = nullptr;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVSource_Destroy(source));
}

/**
 * @tc.name   DEMUXER_API_0500
 * @tc.number DEMUXER_API_0500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_0500, TestSize.Level2)
{
    OH_AVFormat *format;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(source, nullptr);
    format = OH_AVSource_GetSourceFormat(source);
    ASSERT_NE(format, nullptr);
    format = OH_AVSource_GetSourceFormat(source);
    ASSERT_NE(format, nullptr);
}

/**
 * @tc.name   DEMUXER_API_0700
 * @tc.number DEMUXER_API_0700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_0700, TestSize.Level2)
{
    OH_AVFormat *format;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(source, nullptr);

    format = OH_AVSource_GetTrackFormat(source, 0);
    ASSERT_NE(format, nullptr);
    format = OH_AVSource_GetTrackFormat(source, 0);
    ASSERT_NE(format, nullptr);
}

/**
 * @tc.name   DEMUXER_API_1000
 * @tc.number DEMUXER_API_1000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_1000, TestSize.Level2)
{
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(source, nullptr);

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);

    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_Destroy(demuxer));
    demuxer = nullptr;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVDemuxer_Destroy(demuxer));
}

/**
 * @tc.name   DEMUXER_API_1100
 * @tc.number DEMUXER_API_1100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_1100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(source, nullptr);

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
}

/**
 * @tc.name   DEMUXER_API_1200
 * @tc.number DEMUXER_API_1200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_1200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(source, nullptr);

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    ret = OH_AVDemuxer_UnselectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    ret = OH_AVDemuxer_UnselectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
}

/**
 * @tc.name   DEMUXER_API_1300
 * @tc.number DEMUXER_API_1300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_1300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    ret = OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr);
    ASSERT_EQ(ret, AV_ERR_OK);
    ret = OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr);
    ASSERT_EQ(ret, AV_ERR_OK);
}

/**
 * @tc.name   DEMUXER_API_1400
 * @tc.number DEMUXER_API_1400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_1400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t ms = 1000;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    ret = OH_AVDemuxer_SeekToTime(demuxer, ms, SEEK_MODE_NEXT_SYNC);
    ASSERT_EQ(ret, AV_ERR_OK);
    ret = OH_AVDemuxer_SeekToTime(demuxer, ms, SEEK_MODE_NEXT_SYNC);
    ASSERT_EQ(ret, AV_ERR_OK);
}

/**
 * @tc.name   DEMUXER_API_2300
 * @tc.number DEMUXER_API_1500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_2300, TestSize.Level2)
{
    memory = OH_AVMemory_Create(1024);
    ASSERT_NE(nullptr, memory);
    memory = OH_AVMemory_Create(2);
    ASSERT_NE(nullptr, memory);
}

/**
 * @tc.name   DEMUXER_API_2400
 * @tc.number DEMUXER_ILLEGAL_PARA_2200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_2400, TestSize.Level2)
{
    memory = OH_AVMemory_Create(2);
    ASSERT_EQ(AV_ERR_OK, OH_AVMemory_Destroy(memory));
    memory = nullptr;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_AVMemory_Destroy(memory));
}

/**
 * @tc.name   DEMUXER_API_2500
 * @tc.number DEMUXER_API_2500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerApiNdkTest, DEMUXER_API_2500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    source = OH_AVSource_CreateWithFD(fd1, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    ret = OH_AVDemuxer_ReadSampleBuffer(demuxer, 0, buffer);
    ASSERT_EQ(ret, AV_ERR_OK);
    ret = OH_AVDemuxer_ReadSampleBuffer(demuxer, 0, buffer);
    ASSERT_EQ(ret, AV_ERR_OK);
}
}
