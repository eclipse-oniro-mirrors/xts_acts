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
#include "native_avmemory.h"

#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>
#include <cmath>
#include <thread>
namespace {
constexpr uint32_t CODEC_NAME_SIZE = 128;
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
}
namespace OHOS {
namespace Media {
class DemuxerProcNdkTest : public testing::Test {
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
constexpr int64_t START_TIME_NUM = 5011;


void DemuxerProcNdkTest::SetUpTestCase() {}
void DemuxerProcNdkTest::TearDownTestCase() {}
void DemuxerProcNdkTest::SetUp()
{
    memory = OH_AVMemory_Create(g_width * g_height);
    g_trackCount = 0;
}
void DemuxerProcNdkTest::TearDown()
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

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

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

static void SetAudioValue(OH_AVCodecBufferAttr attr, bool &audioIsEnd, int &audioFrame, int &aKeyCount)
{
    if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
        audioIsEnd = true;
        cout << audioFrame << "    audio is end !!!!!!!!!!!!!!!" << endl;
    } else {
        audioFrame++;
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_SYNC_FRAME) {
            aKeyCount++;
        }
    }
}

static void SetVideoValue(OH_AVCodecBufferAttr attr, bool &videoIsEnd, int &videoFrame, int &vKeyCount)
{
    if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
        videoIsEnd = true;
        cout << videoFrame << "   video is end !!!!!!!!!!!!!!!" << endl;
    } else {
        videoFrame++;
        cout << "video track !!!!!" << endl;
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_SYNC_FRAME) {
            vKeyCount++;
        }
    }
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_1400
 * @tc.name      : demuxer video and 2 audio file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_1400, TestSize.Level0)
{
    int tarckType = 0;
    int auidoTrackCount = 2;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/test/media/video_2audio.mp4";
    const char* mimeType = nullptr;
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(auidoTrackCount + 1, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int vKeyCount = 0;
    int aKeyCount[2] = {};
    int audioFrame[2] = {};
    bool audioIsEnd = false;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0)) || (videoIsEnd && (tarckType == 1))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 1) {
                SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
            } else if (tarckType == 0) {
                ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &mimeType));
                ASSERT_NE(0, strcmp(mimeType, OH_AVCODEC_MIMETYPE_AUDIO_RAW));
                SetAudioValue(attr, audioIsEnd, audioFrame[index-1], aKeyCount[index-1]);
            }
        }
    }
    for (int index = 0; index < auidoTrackCount; index++) {
        ASSERT_EQ(audioFrame[index], 433);
        ASSERT_EQ(aKeyCount[index], 433);
    }
    ASSERT_EQ(videoFrame, 602);
    ASSERT_EQ(vKeyCount, 3);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_1500
 * @tc.name      : demuxer video and 9 audio file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_1500, TestSize.Level0)
{
    int tarckType = 0;
    int auidoTrackCount = 9;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/test/media/video_9audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(auidoTrackCount + 1, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int vKeyCount = 0;
    int aKeyCount[9] = {};
    int audioFrame[9] = {};
    bool audioIsEnd = false;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0)) || (videoIsEnd && (tarckType == 1))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 1) {
                SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
            } else if (tarckType == 0) {
                SetAudioValue(attr, audioIsEnd, audioFrame[index-1], aKeyCount[index-1]);
            }
        }
    }
    for (int index = 0; index < auidoTrackCount; index++) {
        ASSERT_EQ(audioFrame[index], 433);
        ASSERT_EQ(aKeyCount[index], 433);
    }
    ASSERT_EQ(videoFrame, 602);
    ASSERT_EQ(vKeyCount, 3);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_1600
 * @tc.name      : demuxer avc+MP3 flv video file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_1600, TestSize.Level0)
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/test/media/avc_mp3.flv";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0)) || (videoIsEnd && (tarckType == 1))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 1) {
                SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
            } else if (tarckType == 0) {
                SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
            }
        }
    }
    ASSERT_EQ(audioFrame, 385);
    ASSERT_EQ(aKeyCount, 385);
    ASSERT_EQ(videoFrame, 602);
    ASSERT_EQ(vKeyCount, 3);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_1700
 * @tc.name      : demuxer hevc+pcm flv video file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_1700, TestSize.Level0)
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/test/media/hevc_pcm_a.flv";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0)) || (videoIsEnd && (tarckType == 1))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 1) {
                SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
            } else if (tarckType == 0) {
                SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
            }
        }
    }
    ASSERT_EQ(audioFrame, 385);
    ASSERT_EQ(aKeyCount, 385);
    ASSERT_EQ(videoFrame, 602);
    ASSERT_EQ(vKeyCount, 3);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_1800
 * @tc.name      : demuxer damaged flv video file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_1800, TestSize.Level2)
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/test/media/avc_mp3_error.flv";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0)) || (videoIsEnd && (tarckType == 1))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 1) {
                SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
            } else if (tarckType == 0) {
                SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
            }
        }
    }
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_1900
 * @tc.name      : demuxer damaged ape audio file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_1900, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    const char* mimeType = nullptr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    const char *file = "/data/test/media/audio/ape.ape";
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
    string mimeTypeString = mimeType;
    string apeString = OH_AVCODEC_MIMETYPE_AUDIO_APE;
    cout << "------mimeType-------" << mimeTypeString << endl;
    ASSERT_EQ(mimeTypeString, apeString);
    ASSERT_NE(mimeTypeString, OH_AVCODEC_MIMETYPE_VIDEO_VVC);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(1, g_trackCount);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    int aKeyCount = 0;
    while (!audioIsEnd) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
    }
    ASSERT_EQ(audioFrame, 8);
    ASSERT_EQ(aKeyCount, 8);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2000
 * @tc.name      : demuxer h264+mp3 fmp4 file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2000, TestSize.Level0)
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/test/media/h264_mp3_3mevx_fmp4.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0)) || (videoIsEnd && (tarckType == 1))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 1) {
                SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
            } else if (tarckType == 0) {
                SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
            }
        }
    }
    ASSERT_EQ(audioFrame, 465);
    ASSERT_EQ(aKeyCount, 465);
    ASSERT_EQ(videoFrame, 369);
    ASSERT_EQ(vKeyCount, 3);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2100
 * @tc.name      : demuxer h265+aac fmp4 file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2100, TestSize.Level0)
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/test/media/h265_aac_1mvex_fmp4.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0)) || (videoIsEnd && (tarckType == 1))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 1) {
                SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
            } else if (tarckType == 0) {
                SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
            }
        }
    }
    ASSERT_EQ(audioFrame, 173);
    ASSERT_EQ(aKeyCount, 173);
    ASSERT_EQ(videoFrame, 242);
    ASSERT_EQ(vKeyCount, 1);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2200
 * @tc.name      : demuxer HDRVivid+AudioVivid fmp4 file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2200, TestSize.Level0)
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/test/media/audiovivid_hdrvivid_1s_fmp4.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0)) || (videoIsEnd && (tarckType == 1))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 1) {
                SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
            } else if (tarckType == 0) {
                SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
            }
        }
    }
    ASSERT_EQ(videoFrame, 26);
    ASSERT_EQ(vKeyCount, 1);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2300
 * @tc.name      : demuxer M4A fmp4 file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2300, TestSize.Level0)
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    const char *file = "/data/test/media/m4a_fmp4.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(1, g_trackCount);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    int aKeyCount = 0;
    while (!audioIsEnd) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
    }
    ASSERT_EQ(audioFrame, 352);
    ASSERT_EQ(aKeyCount, 352);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2400
 * @tc.name      : demuxer M4V fmp4 file
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2400, TestSize.Level0)
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/test/media/m4v_fmp4.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0)) || (videoIsEnd && (tarckType == 1))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 1) {
                SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
            } else if (tarckType == 0) {
                SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
            }
        }
    }
    ASSERT_EQ(audioFrame, 176);
    ASSERT_EQ(aKeyCount, 176);
    ASSERT_EQ(videoFrame, 123);
    ASSERT_EQ(vKeyCount, 1);
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2500
 * @tc.name      : create hls demuxer with error uri
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2500, TestSize.Level0)
{
    const char *uri = "http://192.168.3.11:8080/share/index.m3u8";
    source = OH_AVSource_CreateWithURI(const_cast<char *>(uri));
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2600
 * @tc.name      : create str demuxer with file and read
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2600, TestSize.Level0)
{
    OH_AVCodecBufferAttr attr;
    const char* mimeType = nullptr;
    int srtIndex = 1;
    int srtSubtitle = 0;
    const char *file = "/data/test/media/srt_test.srt";
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
    string mimeTypeString = mimeType;
    string srtString = OH_AVCODEC_MIMETYPE_SUBTITLE_SRT;
    cout << "------mimeType-------" << mimeTypeString << endl;
    ASSERT_EQ(mimeTypeString, srtString);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(1, g_trackCount);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    while (true) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        srtSubtitle = atoi(reinterpret_cast<const char*>(data));
        cout << "subtitle" << "----------------" << srtSubtitle << "-----------------" << endl;
        ASSERT_EQ(srtSubtitle, srtIndex);
        srtIndex++;
    }
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2700
 * @tc.name      : create str demuxer with file and seek+read
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2700, TestSize.Level0)
{
    OH_AVCodecBufferAttr attr;
    int srtIndex = 1;
    int srtSubtitle = 0;
    uint8_t *data = nullptr;
    const char *file = "/data/test/media/srt_test.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(1, g_trackCount);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));

    for (int index = 0; index < 5; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        data = OH_AVMemory_GetAddr(memory);
        srtSubtitle = atoi(reinterpret_cast<const char*>(data));
        cout << "subtitle" << "----------------" << srtSubtitle << "-----------------" << endl;
        ASSERT_EQ(srtSubtitle, srtIndex);
        srtIndex++;
    }
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, 5400, SEEK_MODE_CLOSEST_SYNC));
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
    data = OH_AVMemory_GetAddr(memory);
    srtSubtitle = atoi(reinterpret_cast<const char*>(data));
    cout << "subtitle"<< "----------------" << srtSubtitle << "-----------------" << endl;
    srtIndex = 2;
    ASSERT_EQ(srtSubtitle, srtIndex);

    while (true) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            break;
        }
        data = OH_AVMemory_GetAddr(memory);
        srtSubtitle = atoi(reinterpret_cast<const char*>(data));
        cout << "subtitle" << "----------------" << srtSubtitle << "-----------------" << endl;
        srtIndex++;
        ASSERT_EQ(srtSubtitle, srtIndex);
    }
    
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2800
 * @tc.name      : create str demuxer with error file -- no empty paragraphs
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2800, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/test/media/srt_2800.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(1, g_trackCount);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    while (true) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    }

    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_2900
 * @tc.name      : create str demuxer with error file -- subtitle sequence error
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_2900, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/test/media/srt_2900.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(1, g_trackCount);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    while (true) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        cout << "subtitle" << "----------------" << data << "-----------------" << endl;
    }

    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3000
 * @tc.name      : create str demuxer with error file -- timeline format error
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3000, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/test/media/srt_3000.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount);
    cout << "g_trackCount"<< "----------------" << g_trackCount << "-----------------" << endl;
    OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr);
    uint8_t *data = OH_AVMemory_GetAddr(memory);
    cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3100
 * @tc.name      : create str demuxer with error file -- subtitle is empty
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3100, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/test/media/srt_3100.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(1, g_trackCount);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    while (true) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    }

    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3200
 * @tc.name      : create str demuxer with error file -- SRT file is empty
 * @tc.desc      : function test
 * fail
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3200, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/test/media/srt_3200.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount);
    cout << "g_trackCount"<< "----------------" << g_trackCount << "-----------------" << endl;
    OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr);
    uint8_t *data = OH_AVMemory_GetAddr(memory);
    cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3300
 * @tc.name      : create str demuxer with error file -- alternating Up and Down Times
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3300, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/test/media/srt_3300.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(1, g_trackCount);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, 0));
    while (true) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr));
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    }

    close(fd);
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3400
 * @tc.name      : demuxer MP4 ,OH_MD_KEY_DURATION,OH_MD_KEY_CODEC_CONFIG
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3400, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
    int64_t duration;
    static OH_AVFormat *trackFormatFirst = nullptr;
    static OH_AVFormat *trackFormatSecond = nullptr;
    uint8_t *codecConfig = nullptr;
    double frameRate;
    int32_t rotation;
    int64_t channelLayout;
    int32_t audioSampleFormat;
    int32_t bitsPreCodedSample;
    int32_t profile;
    int32_t colorPrimaries;
    int32_t videoIsHdrvivid;
    size_t bufferSize;
    const char *file = "/data/test/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    trackFormatFirst = OH_AVSource_GetTrackFormat(source, 0);
    ASSERT_NE(trackFormatFirst, nullptr);
    trackFormatSecond = OH_AVSource_GetTrackFormat(source, 1);
    ASSERT_NE(trackFormatSecond, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetLongValue(sourceFormat, OH_MD_KEY_DURATION, &duration));
    ASSERT_EQ(duration, 10032000);
    ASSERT_TRUE(OH_AVFormat_GetBuffer(trackFormatSecond, OH_MD_KEY_CODEC_CONFIG, &codecConfig, &bufferSize));
    ASSERT_TRUE(OH_AVFormat_GetDoubleValue(trackFormatSecond, OH_MD_KEY_FRAME_RATE, &frameRate));
    ASSERT_EQ(frameRate, 25.1);
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormatSecond, OH_MD_KEY_ROTATION, &rotation));
    ASSERT_TRUE(OH_AVFormat_GetLongValue(trackFormatFirst, OH_MD_KEY_CHANNEL_LAYOUT, &channelLayout));
    ASSERT_EQ(channelLayout, 3);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormatFirst, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, &audioSampleFormat));
    ASSERT_EQ(audioSampleFormat, 9);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormatFirst, OH_MD_KEY_BITS_PER_CODED_SAMPLE, &bitsPreCodedSample));
    ASSERT_EQ(bitsPreCodedSample, 16);
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormatFirst, OH_MD_KEY_PROFILE, &profile));
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormatFirst, OH_MD_KEY_COLOR_PRIMARIES, &colorPrimaries));
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormatFirst, OH_MD_KEY_VIDEO_IS_HDR_VIVID, &videoIsHdrvivid));
    close(fd);
    }
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3800
 * @tc.name      : demuxer MP4 ,AVCODEC_BUFFER_FLAGS_DISCARD
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3800, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
    OH_AVCodecBufferAttr attr;
    int tarckType = 0;
    const char *file = "/data/test/media/test_265_B_Gop25_4sec.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_NE(sourceFormat, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    int audioFrame = 0;
    bool audioIsEnd = false;
    while (!audioIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
            if ((audioIsEnd && (tarckType == 0))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr));
            if (tarckType == 0 && (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_DISCARD)) {
                audioIsEnd = true;
                cout << audioFrame << "    audio is end !!!!!!!!!!!!!!!" << endl;
            }
        }
    }
    close(fd);
    }
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3700
 * @tc.name      : demuxer MP4,duration,dts
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3700, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
    int tarckType = 0;
    int64_t duration;
    int64_t dts;
    const char *file = "/data/test/media/test_265_B_Gop25_4sec.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    avBuffer = OH_AVBuffer_Create(size);
    ASSERT_NE(avBuffer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    for (int32_t index = 0; index < g_trackCount; index++) {
        trackFormat = OH_AVSource_GetTrackFormat(source, index);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
        if (tarckType == MEDIA_TYPE_VID) {
            OH_AVDemuxer_ReadSampleBuffer(demuxer, index, avBuffer);
            ASSERT_NE(avBuffer, nullptr);
            format = OH_AVBuffer_GetParameter(avBuffer);
            ASSERT_NE(format, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetLongValue(format, OH_MD_KEY_BUFFER_DURATION, &duration));
            ASSERT_TRUE(OH_AVFormat_GetLongValue(format, OH_MD_KEY_DECODING_TIMESTAMP, &dts));
            ASSERT_EQ(40000, duration);
            ASSERT_EQ(-80000, dts);
        }
    }
    }
}
 
/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3600
 * @tc.name      : demuxer MP4 ,SAR,bitsPreCodedSample,sampleFormat
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3600, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
    int tarckType = 0;
    double sar;
    int32_t bitsPreCodedSample;
    int32_t sampleFormat;
    const char *file = "/data/test/media/test_265_B_Gop25_4sec.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_NE(sourceFormat, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(2, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    for (int32_t index = 0; index < g_trackCount; index++) {
        trackFormat = OH_AVSource_GetTrackFormat(source, index);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType));
        if (tarckType == MEDIA_TYPE_VID) {
            ASSERT_TRUE(OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_VIDEO_SAR, &sar));
        }else if (tarckType == MEDIA_TYPE_AUD) {
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, &bitsPreCodedSample));
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, &sampleFormat));
        }
    }
    ASSERT_EQ(1, sar);
    ASSERT_EQ(16, bitsPreCodedSample);
    ASSERT_EQ(9, sampleFormat);
    close(fd);
    }
}

/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3510
 * @tc.name      : demuxer MP4 ,startTime Non-zero
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3510, TestSize.Level0)
{
    int64_t startTime;
    const char *file = "/data/test/media/test_starttime.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_NE(sourceFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetLongValue(sourceFormat, OH_MD_KEY_START_TIME, &startTime));
    cout << "---startTime---" << startTime << endl;
    ASSERT_EQ(START_TIME_NUM, startTime);
    close(fd);
}
 
/**
 * @tc.number    : SUB_MEDIA_DEMUXER_PROCESS_3500
 * @tc.name      : demuxer MP4 ,startTime
 * @tc.desc      : function test
 */
HWTEST_F(DemuxerProcNdkTest, SUB_MEDIA_DEMUXER_PROCESS_3500, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
    int64_t startTime;
    const char *file = "/data/test/media/test_265_B_Gop25_4sec.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_NE(sourceFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetLongValue(sourceFormat, OH_MD_KEY_START_TIME, &startTime));
    ASSERT_EQ(0, startTime);
    close(fd);
    }
}

