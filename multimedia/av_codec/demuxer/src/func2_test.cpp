/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "native_avmemory.h"
#include "meta/meta_key.h"
#include "meta/meta.h"
#include "av_common.h"

#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>
#include <cmath>
#include <thread>

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

namespace OHOS {
namespace Media {
class DemuxerFunc2NdkTest : public testing::Test {
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

static OH_AVMemory *memory = nullptr;
static OH_AVSource *source = nullptr;
static OH_AVDemuxer *demuxer = nullptr;
static OH_AVFormat *sourceFormat = nullptr;
static OH_AVFormat *trackFormat = nullptr;
static OH_AVBuffer *avBuffer = nullptr;
static OH_AVFormat *format = nullptr;
static int32_t g_trackCount;
static int32_t g_width = 3840;
static int32_t g_height = 2160;
void DemuxerFunc2NdkTest::SetUpTestCase() {}
void DemuxerFunc2NdkTest::TearDownTestCase() {}
void DemuxerFunc2NdkTest::SetUp()
{
    memory = OH_AVMemory_Create(g_width * g_height);
    g_trackCount = 0;
}
void DemuxerFunc2NdkTest::TearDown()
{
    if (trackFormat != nullptr) {
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }

    if (sourceFormat != nullptr) {
        OH_AVFormat_Destroy(sourceFormat);
        sourceFormat = nullptr;
    }

    if (memory != nullptr) {
        OH_AVMemory_Destroy(memory);
        memory = nullptr;
    }
    if (source != nullptr) {
        OH_AVSource_Destroy(source);
        source = nullptr;
    }
    if (demuxer != nullptr) {
        OH_AVDemuxer_Destroy(demuxer);
        demuxer = nullptr;
    }
    if (avBuffer != nullptr) {
        OH_AVBuffer_Destroy(avBuffer);
        avBuffer = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
}
} // namespace Media
} // namespace OHOS
static int64_t GetFileSize(const char *fileName)
{
    int64_t fileSize = 0;
    if (fileName != nullptr) {
        struct stat fileStatus {};
        if (stat(fileName, &fileStatus) == 0) {
            fileSize = static_cast<int64_t>(fileStatus.st_size);
        }
    }
    return fileSize;
}

static void OpenFile(const char *fileName, int fd, OH_AVSource **src, OH_AVDemuxer **audioDemuxer)
{
    int64_t size = GetFileSize(fileName);
    cout << fileName << "----------------------" << fd << "---------" << size << endl;
    *src = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(*src, nullptr);

    *audioDemuxer = OH_AVDemuxer_CreateWithSource(*src);
    ASSERT_NE(*audioDemuxer, nullptr);
}

static void CheckTrackCount(OH_AVFormat **srcFormat, OH_AVSource *src, int32_t *trackCount, int trackNum)
{
    *srcFormat = OH_AVSource_GetSourceFormat(src);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(*srcFormat, OH_MD_KEY_TRACK_COUNT, trackCount));
    ASSERT_EQ(trackNum, *trackCount);
}

static void CheckTrackSelect(int32_t trackCount, OH_AVDemuxer *audioDemuxer)
{
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
}

static void CountAudioFrames(OH_AVDemuxer *audioDemuxer, OH_AVMemory *mem,
                             int32_t trackCount, int audioFrameNum, int audioKeyNum)
{
    int audioFrame = 0;
    int keyCount = 0;
    bool audioIsEnd = false;
    OH_AVCodecBufferAttr attr;

    while (!audioIsEnd) {
        for (int32_t index = 0; index < trackCount; index++) {
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(audioDemuxer, index, mem, &attr));
            if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
                audioIsEnd = true;
                cout << audioFrame << "    audio is end !!!!!!!!!!!!!!!" << endl;
                continue;
            }

            audioFrame++;
            if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_SYNC_FRAME) {
                keyCount++;
            }
        }
    }
    ASSERT_EQ(audioFrame, audioFrameNum);
    ASSERT_EQ(keyCount, audioKeyNum);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_VTT_6100
 * @tc.name      : create vtt demuxer with error file -- alternating Up and Down Times
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, SUB_MEDIA_DEMUXER_VTT_6100, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    const char* mimeType = nullptr;
    const char *file = "/data/test/media/vtt_6100.vtt";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &mimeType));
    ASSERT_EQ(0, strcmp(mimeType, OH_AVCODEC_MIMETYPE_SUBTITLE_WEBVTT));
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(1, g_trackCount);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    int tarckType = 0;
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
    ASSERT_EQ(tarckType, MEDIA_TYPE_SUBTITLE);
    while (true) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   vtt is end !!!!!!!!!!!!!!!" << endl;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    }
    close(fd);
}

/**
 * @tc.number    : DEMUXER_META_0090
 * @tc.name      : demuxer meta info, souce is null
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_META_0090, TestSize.Level0)
{
    OH_AVFormat *metaFormat= OH_AVSource_GetCustomMetadataFormat(nullptr);
    ASSERT_EQ(metaFormat, nullptr);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0001
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0001
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0001, TestSize.Level2)
{
    const char *file = "/data/test/media/audio/wav_alaw_410_8b_1.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 1, 1);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0002
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0002
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0002, TestSize.Level2)
{
    int64_t seekTime = 0;
    const char *file = "/data/test/media/audio/wav_alaw_410_8b_1.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime, SEEK_MODE_NEXT_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 1, 1);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0003
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0003
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0003, TestSize.Level0)
{
    const char *file = "/data/test/media/audio/wav_alaw_8K_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 20, 20);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0004
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0004
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0004, TestSize.Level1)
{
    int32_t seekTime = 2304000;
    int32_t thousand = 1000;
    const char *file = "/data/test/media/audio/wav_alaw_8K_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, SEEK_MODE_PREVIOUS_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 11, 11);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0005
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0005
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0005, TestSize.Level2)
{
    const char *file = "/data/test/media/audio/wav_alaw_16K_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 40, 40);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0006
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0006
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0006, TestSize.Level2)
{
    int32_t seekTime = 2432000;
    int32_t thousand = 1000;
    const char *file = "/data/test/media/audio/wav_alaw_16K_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, SEEK_MODE_CLOSEST_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 21, 21);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0007
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0007
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0007, TestSize.Level2)
{
    const char *file = "/data/test/media/audio/wav_alaw_48K_8b_1.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 59, 59);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0008
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0008
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0008, TestSize.Level2)
{
    int32_t seekTime = 2816000;
    int32_t thousand = 1000;
    const char *file = "/data/test/media/audio/wav_alaw_48K_8b_1.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, SEEK_MODE_NEXT_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 26, 26);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0009
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0009
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0009, TestSize.Level2)
{
    const char *file = "/data/test/media/audio/wav_alaw_768001_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 1876, 1876);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_WAV_ALAW_FUNC_0010
 * @tc.name      : DEMUXER_WAV_ALAW_FUNC_0010
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_WAV_ALAW_FUNC_0010, TestSize.Level2)
{
    int32_t seekTime = 4973326;
    int32_t thousand = 1000;
    const char *file = "/data/test/media/audio/wav_alaw_768001_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, SEEK_MODE_PREVIOUS_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 11, 11);
    close(fd);
}