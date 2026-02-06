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
constexpr int32_t THOUSAND = 1000.0;
constexpr int32_t TRACKNUM_0 = 0;
constexpr int32_t TRACKNUM_1 = 1;
constexpr int32_t TRACKNUM_2 = 2;
constexpr int32_t TRACKNUM_3 = 3;
constexpr int32_t TRACKNUM_4 = 4;
constexpr int32_t TRACKFRAME_231 = 231;
constexpr int32_t TRACKFRAME_431 = 431;
constexpr int32_t TRACKFRAME_16 = 16;
constexpr int32_t TRACKFRAME_77 = 77;
constexpr int32_t TRACKFRAME_223 = 223;
constexpr int32_t TRACKFRAME_417 = 417;
constexpr int64_t VIDEOTRACKSEEK = 900000;
constexpr int64_t AUDIOTRACKSEEK = 130604;
int32_t g_unselect = -1;
int g_trackType = 0;
const std::string TRACK_REF_TYPE_DEPTH = "vdep";
const std::string TRACK_REF_TYPE_PREY = "auxl";
const std::string TRACK_REF_TYPE_CDSC = "cdsc";
const std::string AUXILIARY_DEPTH_TRACK_KEY = "com.openharmony.moviemode.depth";
const std::string AUXILIARY_PREY_TRACK_KEY = "com.openharmony.moviemode.prey";
const std::string TIMED_METADATA_KEY = "timed_metadata";
bool g_isRefult = false;
bool g_initResult = false;

void DemuxerFunc2NdkTest::SetUpTestCase() {}
void DemuxerFunc2NdkTest::TearDownTestCase() {}
void DemuxerFunc2NdkTest::SetUp()
{
    g_isRefult = false;
    g_initResult = false;
    g_unselect = -1;
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

static bool InitFile(const char *file, int32_t trackNum, int &fd, int64_t &size)
{
    fd = open(file, O_RDONLY);
    size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return false;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return false;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount)) {
        return false;
    }
    if (trackNum != g_trackCount) {
        return false;
    }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            return false;
        }
    }
    return true;
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

static void SetVideoValue(OH_AVCodecBufferAttr attr, bool &videoIsEnd, int &videoFrame)
{
    if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
        videoIsEnd = true;
        cout << videoFrame << "   video is end !!!!!!!!!!!!!!!" << endl;
    } else {
        videoFrame++;
        cout << "video track !!!!!" << endl;
    }
}
static void InitFile(const char *file, int32_t trackNum, int &fd)
{
    g_initResult = false;
    fd = open(file, O_RDONLY);
    int64_t size = GetFileSize(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    ASSERT_NE(source, nullptr);

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    ASSERT_EQ(trackNum, g_trackCount);
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (g_unselect != index) {
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
        }
    }
    avBuffer = OH_AVBuffer_Create(size);
    ASSERT_NE(avBuffer, nullptr);
    g_initResult = true;
}

static void GetDepthTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
    ASSERT_EQ(TRACKNUM_2, bufferSize);
    ASSERT_EQ(TRACKNUM_1, trackIdsDepth[TRACKNUM_0]);
    ASSERT_EQ(TRACKNUM_3, trackIdsDepth[TRACKNUM_1]);
    g_isRefult = true;
}

static void GetPreyTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize));
    ASSERT_EQ(TRACKNUM_1, bufferSize);
    ASSERT_EQ(TRACKNUM_2, trackIdsPrey[TRACKNUM_0]);
    g_isRefult = true;
}

static void GetTimedMetaTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_CDSC.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, TIMED_METADATA_KEY.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
    ASSERT_EQ(TRACKNUM_1, bufferSize);
    ASSERT_EQ(TRACKNUM_1, trackIdsDepth[TRACKNUM_0]);
    g_isRefult = true;
}

static void GetDepthAndIdsTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
    ASSERT_EQ(TRACKNUM_3, bufferSize);
    ASSERT_EQ(TRACKNUM_0, trackIdsDepth[TRACKNUM_0]);
    ASSERT_EQ(TRACKNUM_2, trackIdsDepth[TRACKNUM_1]);
    ASSERT_EQ(TRACKNUM_3, trackIdsDepth[TRACKNUM_2]);
    g_isRefult = true;
}

static void GetPreyAndIdsTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()));
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize));
    ASSERT_EQ(TRACKNUM_2, bufferSize);
    ASSERT_EQ(TRACKNUM_0, trackIdsPrey[TRACKNUM_0]);
    ASSERT_EQ(TRACKNUM_1, trackIdsPrey[TRACKNUM_1]);
    g_isRefult = true;
}
/**
 * @tc.name   SUB_MEDIA_DEMUXER_VTT_6100
 * @tc.number SUB_MEDIA_DEMUXER_VTT_6100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
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
 * @tc.name   DEMUXER_META_0090
 * @tc.number DEMUXER_META_0090
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_META_0090, TestSize.Level0)
{
    OH_AVFormat *metaFormat= OH_AVSource_GetCustomMetadataFormat(nullptr);
    ASSERT_EQ(metaFormat, nullptr);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0001
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
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
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0002
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
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
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0003
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0004
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
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
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0005
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
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
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0006
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
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
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0007
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0007
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
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
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0008
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0008
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
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
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0009
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0009
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
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
 * @tc.name   DEMUXER_WAV_ALAW_FUNC_0010
 * @tc.number DEMUXER_WAV_ALAW_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
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
/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0010
 * @tc.number DEMUXER_FUNCTION_TRACK_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0010, TestSize.Level1)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0020
 * @tc.number DEMUXER_FUNCTION_TRACK_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0020, TestSize.Level1)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    const char *trackRefType = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
    OH_AVFormat_Destroy(trackFormat);
    
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0030
 * @tc.number DEMUXER_FUNCTION_TRACK_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0030, TestSize.Level1)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    const char *trackdescription = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
    OH_AVFormat_Destroy(trackFormat);
    
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0040
 * @tc.number DEMUXER_FUNCTION_TRACK_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0040, TestSize.Level1)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    int32_t *trackIdsDepth = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    int bufferSizeResult = 3;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
    ASSERT_EQ(bufferSizeResult, bufferSize);
    OH_AVFormat_Destroy(trackFormat);
    
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize));
    bufferSizeResult = 2;
    ASSERT_EQ(bufferSizeResult, bufferSize);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0050
 * @tc.number DEMUXER_FUNCTION_TRACK_0050
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0050, TestSize.Level0)
{
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    ASSERT_FALSE(OH_AVFormat_GetIntBuffer(nullptr, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0060
 * @tc.number DEMUXER_FUNCTION_TRACK_0060
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0060, TestSize.Level0)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_FALSE(OH_AVFormat_GetIntBuffer(trackFormat, nullptr, &trackIdsDepth, &bufferSize));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0061
 * @tc.number DEMUXER_FUNCTION_TRACK_0061
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0061, TestSize.Level0)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
    int bufferSizeResult = 3;
    ASSERT_EQ(bufferSizeResult, bufferSize);
    ASSERT_EQ(TRACKNUM_0, trackIdsDepth[TRACKNUM_0]);
    ASSERT_EQ(TRACKNUM_2, trackIdsDepth[TRACKNUM_1]);
    ASSERT_EQ(TRACKNUM_3, trackIdsDepth[TRACKNUM_2]);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0070
 * @tc.number DEMUXER_FUNCTION_TRACK_0070
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0070, TestSize.Level2)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    const char *trackRefType = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    ASSERT_FALSE(OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &doubleData));
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &intData));
    ASSERT_FALSE(OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &longData));
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0080
 * @tc.number DEMUXER_FUNCTION_TRACK_0080
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0080, TestSize.Level2)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    const char *trackdescription = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    ASSERT_FALSE(OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &doubleData));
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &intData));
    ASSERT_FALSE(OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &longData));
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0090
 * @tc.number DEMUXER_FUNCTION_TRACK_0090
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0090, TestSize.Level2)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_FALSE(OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &doubleData));
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &intData));
    ASSERT_FALSE(OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &longData));
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
    int bufferSizeResult = 3;
    ASSERT_EQ(bufferSizeResult, bufferSize);
    ASSERT_EQ(TRACKNUM_0, trackIdsDepth[TRACKNUM_0]);
    ASSERT_EQ(TRACKNUM_2, trackIdsDepth[TRACKNUM_1]);
    ASSERT_EQ(TRACKNUM_3, trackIdsDepth[TRACKNUM_2]);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0130
 * @tc.number DEMUXER_FUNCTION_TRACK_0130
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0130, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd1 = false;
    bool videoIsEnd2 = false;
    bool videoIsEnd3 = false;
    int videoFrame1 = 0;
    int videoFrame2 = 0;
    int videoFrame3 = 0;
    OH_AVCodecBufferAttr bufferAttr;
    while (!videoIsEnd1 || !videoIsEnd2 || !videoIsEnd3) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
            if ((videoIsEnd1 && (index == TRACKNUM_1)) || (videoIsEnd2 && (index == TRACKNUM_2)) ||
             (videoIsEnd3 && (index == TRACKNUM_3))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, index, avBuffer));
            ASSERT_NE(avBuffer, nullptr);
            ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
            if (index == TRACKNUM_1 && g_trackType == MEDIA_TYPE_AUXILIARY) {
                GetDepthAndIdsTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd1, videoFrame1);
            } else if (index == TRACKNUM_2 && g_trackType == MEDIA_TYPE_AUXILIARY) {
                GetPreyAndIdsTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd2, videoFrame2);
            } else if (index == TRACKNUM_3 && g_trackType == MEDIA_TYPE_TIMED_METADATA) {
                GetTimedMetaTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd3, videoFrame3);
            }
            OH_AVFormat_Destroy(trackFormat);
            trackFormat = nullptr;
        }
    }
    ASSERT_EQ(videoFrame3, TRACKFRAME_16);
    ASSERT_EQ(videoFrame2, TRACKFRAME_16);
    ASSERT_EQ(videoFrame1, TRACKFRAME_77);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0140
 * @tc.number DEMUXER_FUNCTION_TRACK_0140
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0140, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_01.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd1 = false;
    bool videoIsEnd2 = false;
    bool videoIsEnd3 = false;
    int videoFrame1 = 0;
    int videoFrame2 = 0;
    int videoFrame3 = 0;
    OH_AVCodecBufferAttr bufferAttr;
    while (!videoIsEnd1 || !videoIsEnd2 || !videoIsEnd3) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
            if ((videoIsEnd1 && (index == TRACKNUM_1)) || (videoIsEnd2 && (index == TRACKNUM_2)) ||
             (videoIsEnd3 && (index == TRACKNUM_3))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, index, avBuffer));
            ASSERT_NE(avBuffer, nullptr);
            ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
            if (index == TRACKNUM_1 && g_trackType == MEDIA_TYPE_AUXILIARY) {
                GetDepthTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd1, videoFrame1);
            } else if (index == TRACKNUM_2 && g_trackType == MEDIA_TYPE_AUXILIARY) {
                GetPreyTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd2, videoFrame2);
            } else if (index == TRACKNUM_3 && g_trackType == MEDIA_TYPE_TIMED_METADATA) {
                GetTimedMetaTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd3, videoFrame3);
            }
            OH_AVFormat_Destroy(trackFormat);
            trackFormat = nullptr;
        }
    }
    ASSERT_EQ(videoFrame3, TRACKFRAME_16);
    ASSERT_EQ(videoFrame2, TRACKFRAME_16);
    ASSERT_EQ(videoFrame1, TRACKFRAME_77);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0150
 * @tc.number DEMUXER_FUNCTION_TRACK_0150
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0150, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_3);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_3, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_TIMED_METADATA) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_CDSC.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, TIMED_METADATA_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
            ASSERT_EQ(TRACKNUM_1, bufferSize);
            ASSERT_EQ(TRACKNUM_1, trackIdsDepth[TRACKNUM_0]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    ASSERT_EQ(videoFrame, TRACKFRAME_16);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0160
 * @tc.number DEMUXER_FUNCTION_TRACK_0160
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0160, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_2, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize));
            ASSERT_EQ(TRACKNUM_2, bufferSize);
            ASSERT_EQ(TRACKNUM_0, trackIdsPrey[TRACKNUM_0]);
            ASSERT_EQ(TRACKNUM_1, trackIdsPrey[TRACKNUM_1]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    ASSERT_EQ(videoFrame, TRACKFRAME_16);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0170
 * @tc.number DEMUXER_FUNCTION_TRACK_0170
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0170, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_04.mp4";
    int fd = 0;
    g_unselect = 0;
    InitFile(file, TRACKNUM_3, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, VIDEOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC));
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_2, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize));
            ASSERT_EQ(TRACKNUM_1, bufferSize);
            ASSERT_EQ(TRACKNUM_2, trackIdsPrey[TRACKNUM_0]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0180
 * @tc.number DEMUXER_FUNCTION_TRACK_0180
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0180, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
            ASSERT_EQ(TRACKNUM_3, bufferSize);
            ASSERT_EQ(TRACKNUM_0, trackIdsDepth[TRACKNUM_0]);
            ASSERT_EQ(TRACKNUM_2, trackIdsDepth[TRACKNUM_1]);
            ASSERT_EQ(TRACKNUM_3, trackIdsDepth[TRACKNUM_2]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    ASSERT_EQ(videoFrame, TRACKFRAME_77);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_TRACK_0190
 * @tc.number DEMUXER_FUNCTION_TRACK_0190
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_TRACK_0190, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_04.mp4";
    int fd = 0;
    g_unselect = 0;
    InitFile(file, TRACKNUM_3, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, VIDEOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC));
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
            ASSERT_EQ(TRACKNUM_1, bufferSize);
            ASSERT_EQ(TRACKNUM_1, trackIdsDepth[TRACKNUM_0]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0010
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0010, TestSize.Level1)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0020
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0020, TestSize.Level1)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    const char *trackRefType = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
    OH_AVFormat_Destroy(trackFormat);
    
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0030
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0030, TestSize.Level1)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    const char *trackdescription = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
    OH_AVFormat_Destroy(trackFormat);
    
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0040
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0040, TestSize.Level1)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    int32_t *trackIdsDepth = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    int bufferSizeResult = 3;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
    ASSERT_EQ(bufferSizeResult, bufferSize);
    OH_AVFormat_Destroy(trackFormat);
    
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize));
    bufferSizeResult = 2;
    ASSERT_EQ(bufferSizeResult, bufferSize);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0050
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0050
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0050, TestSize.Level0)
{
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    ASSERT_FALSE(OH_AVFormat_GetIntBuffer(nullptr, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0060
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0060
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0060, TestSize.Level0)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_FALSE(OH_AVFormat_GetIntBuffer(trackFormat, nullptr, &trackIdsDepth, &bufferSize));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0061
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0061
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0061, TestSize.Level0)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
    int bufferSizeResult = 3;
    ASSERT_EQ(bufferSizeResult, bufferSize);
    ASSERT_EQ(TRACKNUM_0, trackIdsDepth[TRACKNUM_0]);
    ASSERT_EQ(TRACKNUM_2, trackIdsDepth[TRACKNUM_1]);
    ASSERT_EQ(TRACKNUM_3, trackIdsDepth[TRACKNUM_2]);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0070
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0070
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0070, TestSize.Level2)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    const char *trackRefType = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    ASSERT_FALSE(OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &doubleData));
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &intData));
    ASSERT_FALSE(OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &longData));
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
    ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0080
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0080
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0080, TestSize.Level2)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    const char *trackdescription = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    ASSERT_FALSE(OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &doubleData));
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &intData));
    ASSERT_FALSE(OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &longData));
    ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
    ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0090
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0090
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0090, TestSize.Level2)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    ASSERT_NE(trackFormat, nullptr);
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
    ASSERT_EQ(g_trackType, MEDIA_TYPE_AUXILIARY);
    ASSERT_FALSE(OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &doubleData));
    ASSERT_FALSE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &intData));
    ASSERT_FALSE(OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &longData));
    ASSERT_TRUE(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
    int bufferSizeResult = 3;
    ASSERT_EQ(bufferSizeResult, bufferSize);
    ASSERT_EQ(TRACKNUM_0, trackIdsDepth[TRACKNUM_0]);
    ASSERT_EQ(TRACKNUM_2, trackIdsDepth[TRACKNUM_1]);
    ASSERT_EQ(TRACKNUM_3, trackIdsDepth[TRACKNUM_2]);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0130
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0130
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0130, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd1 = false;
    bool videoIsEnd2 = false;
    bool videoIsEnd3 = false;
    int videoFrame1 = 0;
    int videoFrame2 = 0;
    int videoFrame3 = 0;
    OH_AVCodecBufferAttr bufferAttr;
    while (!videoIsEnd1 || !videoIsEnd2 || !videoIsEnd3) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
            if ((videoIsEnd1 && (index == TRACKNUM_1)) || (videoIsEnd2 && (index == TRACKNUM_2)) ||
             (videoIsEnd3 && (index == TRACKNUM_3))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, index, avBuffer));
            ASSERT_NE(avBuffer, nullptr);
            ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
            if (index == TRACKNUM_1 && g_trackType == MEDIA_TYPE_AUXILIARY) {
                GetDepthAndIdsTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd1, videoFrame1);
            } else if (index == TRACKNUM_2 && g_trackType == MEDIA_TYPE_AUXILIARY) {
                GetPreyAndIdsTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd2, videoFrame2);
            } else if (index == TRACKNUM_3 && g_trackType == MEDIA_TYPE_TIMED_METADATA) {
                GetTimedMetaTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd3, videoFrame3);
            }
            OH_AVFormat_Destroy(trackFormat);
            trackFormat = nullptr;
        }
    }
    ASSERT_EQ(videoFrame3, TRACKFRAME_231);
    ASSERT_EQ(videoFrame2, TRACKFRAME_431);
    ASSERT_EQ(videoFrame1, TRACKFRAME_431);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0140
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0140
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0140, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_03.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd1 = false;
    bool videoIsEnd2 = false;
    bool videoIsEnd3 = false;
    int videoFrame1 = 0;
    int videoFrame2 = 0;
    int videoFrame3 = 0;
    OH_AVCodecBufferAttr bufferAttr;
    while (!videoIsEnd1 || !videoIsEnd2 || !videoIsEnd3) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            ASSERT_NE(trackFormat, nullptr);
            ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
            if ((videoIsEnd1 && (index == TRACKNUM_1)) || (videoIsEnd2 && (index == TRACKNUM_2)) ||
             (videoIsEnd3 && (index == TRACKNUM_3))) {
                continue;
            }
            ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, index, avBuffer));
            ASSERT_NE(avBuffer, nullptr);
            ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
            if (index == TRACKNUM_1 && g_trackType == MEDIA_TYPE_AUXILIARY) {
                GetDepthTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd1, videoFrame1);
            } else if (index == TRACKNUM_2 && g_trackType == MEDIA_TYPE_AUXILIARY) {
                GetPreyTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd2, videoFrame2);
            } else if (index == TRACKNUM_3 && g_trackType == MEDIA_TYPE_TIMED_METADATA) {
                GetTimedMetaTrack();
                ASSERT_TRUE(g_isRefult);
                SetVideoValue(bufferAttr, videoIsEnd3, videoFrame3);
            }
            OH_AVFormat_Destroy(trackFormat);
            trackFormat = nullptr;
        }
    }
    ASSERT_EQ(videoFrame3, TRACKFRAME_223);
    ASSERT_EQ(videoFrame2, TRACKFRAME_417);
    ASSERT_EQ(videoFrame1, TRACKFRAME_417);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0150
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0150
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0150, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_3);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_3, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_TIMED_METADATA) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_CDSC.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, TIMED_METADATA_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
            ASSERT_EQ(TRACKNUM_1, bufferSize);
            ASSERT_EQ(TRACKNUM_1, trackIdsDepth[TRACKNUM_0]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    ASSERT_EQ(videoFrame, TRACKFRAME_231);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0160
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0160
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0160, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_2, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize));
            ASSERT_EQ(TRACKNUM_2, bufferSize);
            ASSERT_EQ(TRACKNUM_0, trackIdsPrey[TRACKNUM_0]);
            ASSERT_EQ(TRACKNUM_1, trackIdsPrey[TRACKNUM_1]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    ASSERT_EQ(videoFrame, TRACKFRAME_431);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0170
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0170
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0170, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, AUDIOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC));
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_2, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize));
            ASSERT_EQ(TRACKNUM_2, bufferSize);
            ASSERT_EQ(TRACKNUM_0, trackIdsPrey[TRACKNUM_0]);
            ASSERT_EQ(TRACKNUM_1, trackIdsPrey[TRACKNUM_1]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0180
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0180
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0180, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
            ASSERT_EQ(TRACKNUM_3, bufferSize);
            ASSERT_EQ(TRACKNUM_0, trackIdsDepth[TRACKNUM_0]);
            ASSERT_EQ(TRACKNUM_2, trackIdsDepth[TRACKNUM_1]);
            ASSERT_EQ(TRACKNUM_3, trackIdsDepth[TRACKNUM_2]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    ASSERT_EQ(videoFrame, TRACKFRAME_431);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_AUDIO_TRACK_0190
 * @tc.number DEMUXER_FUNCTION_AUDIO_TRACK_0190
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_AUDIO_TRACK_0190, TestSize.Level3)
{
    const char *file = "/data/test/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    ASSERT_TRUE(g_initResult);
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, AUDIOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC));
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType));
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer));
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr));
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType));
            ASSERT_EQ(0, strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription));
            ASSERT_EQ(0, strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()));
            ASSERT_TRUE(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize));
            ASSERT_EQ(TRACKNUM_3, bufferSize);
            ASSERT_EQ(TRACKNUM_0, trackIdsDepth[TRACKNUM_0]);
            ASSERT_EQ(TRACKNUM_2, trackIdsDepth[TRACKNUM_1]);
            ASSERT_EQ(TRACKNUM_3, trackIdsDepth[TRACKNUM_2]);
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_ADD_0010
 * @tc.number DEMUXER_FUNCTION_ADD_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_ADD_0010, TestSize.Level2)
{
    const char *file = "/data/test/media/test_size_large.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_2, fd);
    ASSERT_TRUE(g_initResult);
    ASSERT_EQ(AV_ERR_UNKNOWN, OH_AVDemuxer_SeekToTime(demuxer, 2487, SEEK_MODE_NEXT_SYNC));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_ADD_0020
 * @tc.number DEMUXER_FUNCTION_ADD_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_ADD_0020, TestSize.Level2)
{
    const char *file = "/data/test/media/test_size_large.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_2, fd);
    ASSERT_TRUE(g_initResult);
    ASSERT_EQ(AV_ERR_UNKNOWN, OH_AVDemuxer_ReadSampleBuffer(demuxer, 1, avBuffer));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_FUNCTION_ADD_0030
 * @tc.number DEMUXER_FUNCTION_ADD_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_FUNCTION_ADD_0030, TestSize.Level2)
{
    const char *file = "/data/test/media/test_size_large.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_2, fd);
    ASSERT_TRUE(g_initResult);
    OH_AVCodecBufferAttr attr;
    ASSERT_EQ(AV_ERR_UNKNOWN, OH_AVDemuxer_ReadSample(demuxer, 1, memory, &attr));
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
}

/**
 * @tc.name   DEMUXER_SKIP_SAMPLE_FUNC_0010
 * @tc.number DEMUXER_SKIP_SAMPLE_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_SKIP_SAMPLE_FUNC_0010, TestSize.Level0)
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    int skipSampleCounts = 0;
    std::map<int32_t, std::vector<uint8_t>> skipInfoMap = {
        {0, {0x51, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
        {3051, {0x00, 0x00, 0x00, 0x00, 0xa3, 0x01, 0x00, 0x00, 0x00, 0x00}},
    };
    const char *file = "/data/test/media/audio/MP3_8K_1.mp3";
    int fd = 0;
    int64_t size = 0;
    ASSERT_TRUE(InitFile(file, 1, fd, size));
    int aKeyCount = 0;
    uint8_t* addr = nullptr;
    size_t buffSize = 0;
    while (!audioIsEnd) {
        avBuffer = OH_AVBuffer_Create(size);
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, 0, avBuffer));
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &attr));
        format = OH_AVBuffer_GetParameter(avBuffer);
        ASSERT_NE(format, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_Destroy(avBuffer));
        avBuffer = nullptr;
        if (OH_AVFormat_GetBuffer(format, OH_MD_KEY_BUFFER_SKIP_SAMPLES_INFO, &addr, &buffSize)) {
            skipSampleCounts++;
            ASSERT_EQ(buffSize, 10);
            for (auto i = 0; i < buffSize; i++) {
                printf(" %02x", addr[i]);
                ASSERT_EQ(addr[i], skipInfoMap[audioFrame][i]);
            }
            printf("\n");
        }
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    ASSERT_EQ(skipSampleCounts, 2);
    ASSERT_EQ(audioFrame, 3052);
    ASSERT_EQ(aKeyCount, 3052);
    close(fd);
    fd = -1;
}

/**
 * @tc.name   DEMUXER_SKIP_SAMPLE_FUNC_0020
 * @tc.number DEMUXER_SKIP_SAMPLE_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DemuxerFunc2NdkTest, DEMUXER_SKIP_SAMPLE_FUNC_0020, TestSize.Level0)
{
    OH_AVCodecBufferAttr attr;
    std::map<int32_t, std::vector<uint8_t>> skipInfoMap = {
        {6862, {0x00, 0x00, 0x00, 0x00, 0xf4, 0x00, 0x00, 0x00, 0x00, 0x00}},
    };
    int skipSampleCounts = 0;
    bool audioIsEnd = false;
    int audioFrame = 0;
    const char *file = "/data/test/media/audio/OGG_8K_1.ogg";
    int fd = 0;
    int64_t size = 0;
    ASSERT_TRUE(InitFile(file, 1, fd, size));
    int aKeyCount = 0;
    uint8_t *addr = nullptr;
    size_t buffSize = 0;
    while (!audioIsEnd) {
        avBuffer = OH_AVBuffer_Create(size);
        ASSERT_NE(avBuffer, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_ReadSampleBuffer(demuxer, 0, avBuffer));
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_GetBufferAttr(avBuffer, &attr));
        format = OH_AVBuffer_GetParameter(avBuffer);
        ASSERT_NE(format, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_AVBuffer_Destroy(avBuffer));
        avBuffer = nullptr;
        if (OH_AVFormat_GetBuffer(format, OH_MD_KEY_BUFFER_SKIP_SAMPLES_INFO, &addr, &buffSize)) {
            skipSampleCounts++;
            ASSERT_EQ(buffSize, 10);
            for (auto i = 0; i < buffSize; i++) {
                printf(" %02x", addr[i]);
                ASSERT_EQ(addr[i], skipInfoMap[audioFrame][i]);
            }
            printf("\n");
        }
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    ASSERT_EQ(skipSampleCounts, 1);
    ASSERT_EQ(audioFrame, 6863);
    ASSERT_EQ(aKeyCount, 6863);
    close(fd);
    fd = -1;
}