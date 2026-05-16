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

#include "avdemuxer.h"
#include "avsource.h"
#include "meta/format.h"
#include "avcodec_errors.h"
#include "avcodec_common.h"
#include "buffer/avsharedmemory.h"
#include "buffer/avsharedmemorybase.h"
#include "securec.h"

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
#include <thread>

using namespace std;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::Media;
using namespace testing::ext;

namespace {
class DemuxerNetNdkTest : public testing::Test {
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
    int32_t fd_ = -1;
    int64_t size;
};
static OH_AVMemory *memory = nullptr;
static OH_AVFormat *sourceFormat = nullptr;
static OH_AVFormat *trackFormat = nullptr;
static OH_AVSource *source = nullptr;
static OH_AVDemuxer *demuxer = nullptr;
static int32_t g_trackCount = 0;
static OH_AVBuffer *avBuffer = nullptr;

static int32_t g_width = 3840;
static int32_t g_height = 2160;
void DemuxerNetNdkTest::SetUpTestCase() {}
void DemuxerNetNdkTest::TearDownTestCase() {}
void DemuxerNetNdkTest::SetUp()
{
    memory = OH_AVMemory_Create(g_width * g_height);
    g_trackCount = 0;
}
void DemuxerNetNdkTest::TearDown()
{
    if (fd_ > 0) {
        close(fd_);
        fd_ = -1;
    }
    if (demuxer != nullptr) {
        OH_AVDemuxer_Destroy(demuxer);
        demuxer = nullptr;
    }
    if (memory != nullptr) {
        OH_AVMemory_Destroy(memory);
        memory = nullptr;
    }
    if (source != nullptr) {
        OH_AVSource_Destroy(source);
        source = nullptr;
    }
    if (avBuffer != nullptr) {
        OH_AVBuffer_Destroy(avBuffer);
        avBuffer = nullptr;
    }
    if (trackFormat != nullptr) {
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (sourceFormat != nullptr) {
        OH_AVFormat_Destroy(sourceFormat);
        sourceFormat = nullptr;
    }
}
} // namespace

namespace {
static void OpenUri(const char* uri, OH_AVSource **src, OH_AVDemuxer **audioDemuxer)
{
    *src = OH_AVSource_CreateWithURI(const_cast<char *>(uri));
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
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0001
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0001, TestSize.Level2)
{
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_410_8b_1.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 1, 1);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0002
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0002, TestSize.Level2)
{
    int64_t seekTime = 0;
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_410_8b_1.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime, OH_AVSeekMode::SEEK_MODE_NEXT_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 1, 1);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0003
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0003, TestSize.Level2)
{
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_8K_8b_2.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 20, 20);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0004
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0004, TestSize.Level2)
{
    int32_t seekTime = 2304000;
    int32_t thousand = 1000;
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_8K_8b_2.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, OH_AVSeekMode::SEEK_MODE_PREVIOUS_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 11, 11);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0005
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0005, TestSize.Level2)
{
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_16K_8b_2.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 40, 40);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0006
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0006, TestSize.Level2)
{
    int32_t seekTime = 2432000;
    int32_t thousand = 1000;
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_16K_8b_2.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, OH_AVSeekMode::SEEK_MODE_CLOSEST_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 21, 21);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0007
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0007
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0007, TestSize.Level2)
{
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_48K_8b_1.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 59, 59);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0008
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0008
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0008, TestSize.Level2)
{
    int32_t seekTime = 2816000;
    int32_t thousand = 1000;
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_48K_8b_1.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, OH_AVSeekMode::SEEK_MODE_NEXT_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 26, 26);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0009
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0009
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0009, TestSize.Level2)
{
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_768001_8b_2.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 1876, 1876);
}

/**
 * @tc.name   DEMUXER_WAV_ALAW_NET_FUNC_0010
 * @tc.number DEMUXER_WAV_ALAW_NET_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DemuxerNetNdkTest, DEMUXER_WAV_ALAW_NET_FUNC_0010, TestSize.Level2)
{
    int32_t seekTime = 4973326;
    int32_t thousand = 1000;
    const char *uri = "http://192.168.3.17:8080/share/audio/wav_alaw_768001_8b_2.wav";
    OpenUri(uri, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, OH_AVSeekMode::SEEK_MODE_PREVIOUS_SYNC));
    CountAudioFrames(demuxer, memory, g_trackCount, 11, 11);
}
} // namespace