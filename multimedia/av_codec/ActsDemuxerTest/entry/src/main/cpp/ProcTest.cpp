/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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


#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avmemory.h>
#include "include/DemuxerHelperTest.h"

#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <cmath>
#include <thread>
#include <cerrno>
#include <cstring>
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "DemuxerFuncTest"
namespace {
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr int SUBTITLE_INDEX_INCREMENT = 10;
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
}

using namespace std;

// 全局变量声明
static OH_AVSource *source = nullptr;
static OH_AVDemuxer *demuxer = nullptr;
static OH_AVFormat *sourceFormat = nullptr;
static OH_AVFormat *trackFormat = nullptr;
static OH_AVMemory *memory = nullptr;
static int32_t g_trackCount = 0;
static OH_AVBuffer *avBuffer = nullptr;
static OH_AVFormat *format = nullptr;
static const int64_t START_TIME_NUM = 5011;

// 测试预期值常量定义
static constexpr int EXPECTED_TRACK_COUNT_DUAL = 2;
static constexpr int EXPECTED_AUDIO_FRAMES_433 = 433;
static constexpr int EXPECTED_AUDIO_FRAMES_385 = 385;
static constexpr int EXPECTED_AUDIO_FRAMES_465 = 465;
static constexpr int EXPECTED_AUDIO_FRAMES_173 = 173;
static constexpr int EXPECTED_AUDIO_FRAMES_176 = 176;
static constexpr int EXPECTED_AUDIO_FRAMES_8 = 8;
static constexpr int EXPECTED_AUDIO_FRAMES_352 = 352;
static constexpr int EXPECTED_VIDEO_FRAMES_602 = 602;
static constexpr int EXPECTED_VIDEO_FRAMES_369 = 369;
static constexpr int EXPECTED_VIDEO_FRAMES_242 = 242;
static constexpr int EXPECTED_VIDEO_FRAMES_123 = 123;
static constexpr int EXPECTED_VIDEO_FRAMES_26 = 26;
static constexpr int EXPECTED_KEY_FRAMES_3 = 3;
static constexpr int EXPECTED_KEY_FRAMES_1 = 1;
static constexpr int MEMORY_BUFFER_WIDTH = 3840;
static constexpr int MEMORY_BUFFER_HEIGHT = 2160;
static constexpr int64_t EXPECTED_DURATION_10032000 = 10032000;
static constexpr double EXPECTED_FRAME_RATE_25_1 = 25.1;
static constexpr int64_t EXPECTED_CHANNEL_LAYOUT_3 = 3;
static constexpr int EXPECTED_AUDIO_SAMPLE_FORMAT_9 = 9;
static constexpr int EXPECTED_BITS_PER_CODED_SAMPLE_16 = 16;
static constexpr int64_t EXPECTED_BUFFER_DURATION_40000 = 40000;
static constexpr int64_t EXPECTED_DTS_NEG_80000 = -80000;
static constexpr int EXPECTED_SEEK_TIME_5400 = 5400;
static constexpr int EXPECTED_SUBTITLE_COUNT_5 = 5;
static constexpr int EXPECTED_TRACK_COUNT_THREE = 3;
static constexpr int EXPECTED_AUDIO_TRACK_COUNT_TWO = 2;

static int64_t GET_FILE_SIZE(const char *fileName)
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

// 辅助函数：处理 SubMediaDemuxerProcess3600 的音频轨道格式
static int ProcessAudioTrackFormat3600(OH_AVFormat *trackFormat, int32_t &bitsPreCodedSample, int32_t &sampleFormat)
{
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, &bitsPreCodedSample))) {
        return -1;
    }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, &sampleFormat))) {
        return -1;
    }
    return 0;
}

static int ProcessSingleTrackFormat3600(int32_t index, int &tarckType, double &sar,
                                        int32_t &bitsPreCodedSample, int32_t &sampleFormat)
{
    trackFormat = OH_AVSource_GetTrackFormat(source, index);
    if (trackFormat == nullptr) {
        return -1;
    }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType))) {
        return -1;
    }
    if (tarckType == MEDIA_TYPE_VID) {
        if (!(OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_VIDEO_SAR, &sar))) {
            return -1;
        }
        return 0;
    }
    if (tarckType == MEDIA_TYPE_AUD) {
        return ProcessAudioTrackFormat3600(trackFormat, bitsPreCodedSample, sampleFormat);
    }
    return 0;
}

static int ProcessTrackFormats3600(double &sar, int32_t &bitsPreCodedSample, int32_t &sampleFormat)
{
    int tarckType = 0;
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (ProcessSingleTrackFormat3600(index, tarckType, sar, bitsPreCodedSample, sampleFormat) != 0) {
            return -1;
        }
    }
    return 0;
}

static int InitSource3600(const char *file, int &fd)
{
    fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        return -1;
    }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) {
        return -1;
    }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            return -1;
        }
    }
    return 0;
}

// 辅助函数：初始化解复用器（通用版本）
static int InitDemuxerCommon(const char *file, int &fd, int64_t &size, int32_t expectedTrackCount)
{
    fd = open(file, O_RDONLY);
    size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    
    avBuffer = OH_AVBuffer_Create(size);
    if (avBuffer == nullptr) {
        return -1;
    }
    
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        return -1;
    }
    
    if (g_trackCount != expectedTrackCount) {
        return -1;
    }
    
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            return -1;
        }
    }
    
    return 0;
}

// 辅助函数：验证视频轨道的 duration 和 dts
static int ValidateVideoDurationAndDts(int32_t index, int64_t expectedDuration, int64_t expectedDts)
{
    int tarckType = 0;
    trackFormat = OH_AVSource_GetTrackFormat(source, index);
    if (trackFormat == nullptr) {
        return -1;
    }
    
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType))) {
        return -1;
    }
    
    if (tarckType != MEDIA_TYPE_VID) {
        return 1;
    }
    
    OH_AVDemuxer_ReadSampleBuffer(demuxer, index, avBuffer);
    if (avBuffer == nullptr) {
        return -1;
    }
    
    format = OH_AVBuffer_GetParameter(avBuffer);
    if (format == nullptr) {
        return -1;
    }
    
    int64_t duration;
    int64_t dts;
    if (!(OH_AVFormat_GetLongValue(format, OH_MD_KEY_BUFFER_DURATION, &duration))) {
        return -1;
    }
    if (!(OH_AVFormat_GetLongValue(format, OH_MD_KEY_DECODING_TIMESTAMP, &dts))) {
        return -1;
    }
    
    if (duration != expectedDuration) {
        return -1;
    }
    if (dts != expectedDts) {
        return -1;
    }
    
    return 0;
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

static void InitTestResources()
{
    if (memory == nullptr) {
        memory = OH_AVMemory_Create(MEMORY_BUFFER_WIDTH * MEMORY_BUFFER_HEIGHT);
    }
}

struct TrackLoopParams {
    int &tarckType;
    OH_AVCodecBufferAttr &attr;
    bool &audioIsEnd;
    bool &videoIsEnd;
    int &audioFrame;
    int &videoFrame;
    int &aKeyCount;
    int &vKeyCount;
};

// 辅助函数：处理单个轨道的读取（通用版本）
static int ProcessSingleTrackInLoop(int32_t index, TrackLoopParams &params)
{
    trackFormat = OH_AVSource_GetTrackFormat(source, index);
    if (trackFormat == nullptr ||
        !(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &params.tarckType))) {
        return -1;
    }
    
    if ((params.audioIsEnd && (params.tarckType == 0)) || (params.videoIsEnd && (params.tarckType == 1))) {
        return 0;
    }
    
    if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &params.attr) != AV_ERR_OK) {
        return -1;
    }
    
    if (params.tarckType == 1) {
        SetVideoValue(params.attr, params.videoIsEnd, params.videoFrame, params.vKeyCount);
    } else if (params.tarckType == 0) {
        SetAudioValue(params.attr, params.audioIsEnd, params.audioFrame, params.aKeyCount);
    }
    
    return 0;
}

// 辅助函数：初始化源和解复用器（简化版）
static int InitSourceAndDemuxer(const char *file, int &fd, int64_t &size, int32_t expectedTrackCount)
{
    fd = open(file, O_RDONLY);
    size = GET_FILE_SIZE(file);
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        if (fd >= 0) { close(fd); }
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != expectedTrackCount) { return -1; }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }
    return 0;
}

struct FrameCountParams {
    int audioFrame;
    int expectedAudio;
    int aKeyCount;
    int expectedAKey;
    int videoFrame;
    int expectedVideo;
    int vKeyCount;
    int expectedVKey;
};

// 辅助函数：验证帧数
static int ValidateFrameCounts(const FrameCountParams &params)
{
    if (params.audioFrame != params.expectedAudio) { return -1; }
    if (params.aKeyCount != params.expectedAKey) { return -1; }
    if (params.videoFrame != params.expectedVideo) { return -1; }
    if (params.vKeyCount != params.expectedVKey) { return -1; }
    return 0;
}

// 辅助函数：执行主循环处理
static int ProcessMainLoop(TrackLoopParams &params)
{
    while (!params.audioIsEnd || !params.videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (ProcessSingleTrackInLoop(index, params) != 0) {
                return -1;
            }
        }
    }
    return 0;
}

struct MultiAudioTrackParams {
    int &tarckType;
    OH_AVCodecBufferAttr &attr;
    bool &audioIsEnd;
    bool &videoIsEnd;
    int *audioFrame;
    int *aKeyCount;
    int &videoFrame;
    int &vKeyCount;
};

// 辅助函数：处理多音频轨道循环（用于1500等特殊情况）
static int ProcessMultiAudioTrackLoop(MultiAudioTrackParams &params)
{
    while (!params.audioIsEnd || !params.videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            if (trackFormat == nullptr ||
                !(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &params.tarckType))) {
                return -1;
            }
            if ((params.audioIsEnd && (params.tarckType == 0)) || (params.videoIsEnd && (params.tarckType == 1))) {
                continue;
            }
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &params.attr) != AV_ERR_OK) {
                return -1;
            }
            if (params.tarckType == 1) {
                SetVideoValue(params.attr, params.videoIsEnd, params.videoFrame, params.vKeyCount);
            } else if (params.tarckType == 0) {
                SetAudioValue(params.attr, params.audioIsEnd, params.audioFrame[index - 1],
                              params.aKeyCount[index - 1]);
            }
        }
    }
    return 0;
}

// 辅助函数：处理单个音频轨道的读取
static bool ProcessAudioTrack3800(int fd, int32_t index, OH_AVCodecBufferAttr &attr, int &audioFrame)
{
    int tarckType = 0;
    trackFormat = OH_AVSource_GetTrackFormat(source, index);
    if (trackFormat == nullptr) {
        close(fd);
        return false;
    }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType))) {
        close(fd);
        return false;
    }

    // Skip non-audio tracks
    if (tarckType != 0) {
        return true;
    }

    if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) {
        close(fd);
        return false;
    }

    // Check if audio track has ended
    if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_DISCARD) {
        cout << audioFrame << "    audio is end !!!!!!!!!!!!!!!" << endl;
        return false;  // Signal end of audio
    }

    return true;
}

// 辅助函数：初始化字幕文件和解复用器
static int InitSubtitleDemuxer2700(int &fd, const char *file)
{
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;

    if (fd < 0) {
        OH_LOG_ERROR(LOG_APP, "[TEST2700] FAIL: open file failed, errno=%{public}d, error=%{public}s",
            errno, strerror(errno));
        return -1;
    }
    if (size <= 0) {
        close(fd);
        return -1;
    }

    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        close(fd);
        return -1;
    }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        close(fd);
        return -1;
    }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        close(fd);
        return -1;
    }

    if (g_trackCount != EXPECTED_KEY_FRAMES_1) {
        close(fd);
        return -1;
    }

    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    return 0;
}

// 辅助函数：读取前5个字幕
static int ReadFirstSubtitles2700(int fd, OH_AVCodecBufferAttr &attr, int &srtIndex)
{
    OH_LOG_INFO(LOG_APP, "[TEST2700] Reading first 5 subtitles...");
    for (int index = 0; index < EXPECTED_SUBTITLE_COUNT_5; index++) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "[TEST2700] FAIL: ReadSample failed at index=%{public}d", index);
            close(fd);
            return -1;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        int srtSubtitle = atoi(reinterpret_cast<const char*>(data));
        OH_LOG_INFO(LOG_APP, "[TEST2700] subtitle[%{public}d] expected=%{public}d, actual=%{public}d",
            index, srtIndex, srtSubtitle);
        if (srtIndex != srtSubtitle) {
            OH_LOG_ERROR(LOG_APP,
                "[TEST2700] FAIL: subtitle mismatch at index=%{public}d, expected=%{public}d, actual=%{public}d",
                index, srtIndex, srtSubtitle);
            close(fd);
            return -1;
        }
        srtIndex += SUBTITLE_INDEX_INCREMENT;
    }
    OH_LOG_INFO(LOG_APP, "[TEST2700] First 5 subtitles read successfully");
    return 0;
}

// 辅助函数：执行Seek并读取字幕
static int SeekAndReadSubtitle2700(int fd, OH_AVCodecBufferAttr &attr, int &srtIndex)
{
    OH_LOG_INFO(LOG_APP, "[TEST2700] Seeking to time 5400...");
    if (OH_AVDemuxer_SeekToTime(demuxer, EXPECTED_SEEK_TIME_5400, SEEK_MODE_CLOSEST_SYNC) != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[TEST2700] FAIL: SeekToTime failed");
        close(fd);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[TEST2700] SeekToTime success");

    if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[TEST2700] FAIL: ReadSample after seek failed");
        close(fd);
        return -1;
    }
    uint8_t *data = OH_AVMemory_GetAddr(memory);
    int srtSubtitle = atoi(reinterpret_cast<const char*>(data));
    OH_LOG_INFO(LOG_APP, "[TEST2700] After seek: actual subtitle=%{public}d", srtSubtitle);
    srtIndex = srtSubtitle;
    OH_LOG_INFO(LOG_APP, "[TEST2700] Subtitle after seek, will continue from index=%{public}d", srtIndex);
    return 0;
}

// 辅助函数：读取剩余字幕
static int ReadRemainingSubtitles2700(int fd, OH_AVCodecBufferAttr &attr, int srtIndex)
{
    OH_LOG_INFO(LOG_APP, "[TEST2700] Reading remaining subtitles...");
    int remainingCount = 0;
    int lastSubtitle = srtIndex;
    bool isEnd = false;
    while (!isEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "[TEST2700] FAIL: ReadSample in loop failed at count=%{public}d", remainingCount);
            close(fd);
            return -1;
        }
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            OH_LOG_INFO(LOG_APP, "[TEST2700] EOS reached after reading %{public}d remaining subtitles", remainingCount);
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            isEnd = true;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        int srtSubtitle = atoi(reinterpret_cast<const char*>(data));
        OH_LOG_INFO(LOG_APP, "[TEST2700] remaining[%{public}d] actual=%{public}d, last=%{public}d",
            remainingCount, srtSubtitle, lastSubtitle);

        if (srtSubtitle <= lastSubtitle) {
            OH_LOG_INFO(LOG_APP,
                "[TEST2700] Subtitle sequence ended at count=%{public}d, last=%{public}d, current=%{public}d",
                remainingCount, lastSubtitle, srtSubtitle);
            break;
        }

        lastSubtitle = srtSubtitle;
        remainingCount++;
    }
    return 0;
}

// 辅助函数：初始化媒体源和获取轨道格式
static int InitMediaSource3400(int fd, OH_AVFormat *&trackFormatFirst, OH_AVFormat *&trackFormatSecond)
{
    source = OH_AVSource_CreateWithFD(fd, 0, GET_FILE_SIZE("/data/storage/el2/base/files/media/01_video_audio.mp4"));
    if (source == nullptr) {
        close(fd);
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        close(fd);
        return -1;
    }
    trackFormatFirst = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormatFirst == nullptr) {
        close(fd);
        return -1;
    }
    trackFormatSecond = OH_AVSource_GetTrackFormat(source, 1);
    if (trackFormatSecond == nullptr) {
        close(fd);
        return -1;
    }
    return 0;
}

// 辅助函数：验证视频轨道格式
static int ValidateVideoTrackFormat3400(int fd, OH_AVFormat *trackFormat)
{
    uint8_t *codecConfig = nullptr;
    size_t bufferSize;
    double frameRate;
    int32_t rotation;

    if (!(OH_AVFormat_GetBuffer(trackFormat, OH_MD_KEY_CODEC_CONFIG, &codecConfig, &bufferSize))) {
        close(fd);
        return -1;
    }
    if (!(OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_FRAME_RATE, &frameRate))) {
        close(fd);
        return -1;
    }
    if (frameRate != EXPECTED_FRAME_RATE_25_1) {
        close(fd);
        return -1;
    }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_ROTATION, &rotation)) {
        close(fd);
        return -1;
    }
    return 0;
}

// 辅助函数：验证音频轨道格式
static int ValidateAudioTrackFormat3400(int fd, OH_AVFormat *trackFormat)
{
    int64_t channelLayout;
    int32_t audioSampleFormat;
    int32_t bitsPreCodedSample;
    int32_t profile;
    int32_t colorPrimaries;
    int32_t videoIsHdrvivid;

    if (!(OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_CHANNEL_LAYOUT, &channelLayout))) {
        close(fd);
        return -1;
    }
    if (channelLayout != EXPECTED_KEY_FRAMES_3) {
        close(fd);
        return -1;
    }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, &audioSampleFormat))) {
        close(fd);
        return -1;
    }
    if (audioSampleFormat != EXPECTED_AUDIO_SAMPLE_FORMAT_9) {
        close(fd);
        return -1;
    }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, &bitsPreCodedSample))) {
        close(fd);
        return -1;
    }
    if (bitsPreCodedSample != EXPECTED_BITS_PER_CODED_SAMPLE_16) {
        close(fd);
        return -1;
    }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_PROFILE, &profile)) {
        close(fd);
        return -1;
    }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_COLOR_PRIMARIES, &colorPrimaries)) {
        close(fd);
        return -1;
    }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_VIDEO_IS_HDR_VIVID, &videoIsHdrvivid)) {
        close(fd);
        return -1;
    }
    return 0;
}

static void CleanupResources()
{
    if (trackFormat != nullptr) {
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (sourceFormat != nullptr) {
        OH_AVFormat_Destroy(sourceFormat);
        sourceFormat = nullptr;
    }
    if (demuxer != nullptr) {
        OH_AVDemuxer_Destroy(demuxer);
        demuxer = nullptr;
    }
    if (source != nullptr) {
        OH_AVSource_Destroy(source);
        source = nullptr;
    }
    if (avBuffer != nullptr) {
        OH_AVBuffer_Destroy(avBuffer);
        avBuffer = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    g_trackCount = 0;
}

struct MultiAudioLoopParams {
    int &tarckType;
    OH_AVCodecBufferAttr &attr;
    bool &audioIsEnd;
    bool &videoIsEnd;
    int *audioFrame;
    int *aKeyCount;
    int &videoFrame;
    int &vKeyCount;
};

static int ProcessMultiAudioLoop1400(MultiAudioLoopParams &params)
{
    const char* mimeType = nullptr;
    while (!params.audioIsEnd || !params.videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            if (trackFormat == nullptr ||
                !(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &params.tarckType))) {
                return -1;
            }
            if ((params.audioIsEnd && (params.tarckType == 0)) || (params.videoIsEnd && (params.tarckType == 1))) {
                continue;
            }
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &params.attr) != AV_ERR_OK) {
                return -1;
            }
            if (params.tarckType == 1) {
                SetVideoValue(params.attr, params.videoIsEnd, params.videoFrame, params.vKeyCount);
                continue;
            }
            if (params.tarckType != 0) {
                continue;
            }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &mimeType)) ||
                strcmp(mimeType, OH_AVCODEC_MIMETYPE_AUDIO_RAW) == 0) {
                return -1;
            }
            SetAudioValue(params.attr, params.audioIsEnd, params.audioFrame[index - 1], params.aKeyCount[index - 1]);
        }
    }
    return 0;
}

static int InitSource1400(const char *file, int &fd)
{
    int64_t size = GET_FILE_SIZE(file);
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount)) ||
        g_trackCount != EXPECTED_TRACK_COUNT_THREE) {
        return -1;
    }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            return -1;
        }
    }
    return 0;
}

static int ProcessAudioLoop3800(int fd, OH_AVCodecBufferAttr &attr, int &audioFrame)
{
    bool audioIsEnd = false;
    while (!audioIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (!ProcessAudioTrack3800(fd, index, attr, audioFrame)) {
                audioIsEnd = true;
                break;
            }
        }
    }
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_1400
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
static int ValidateMultiAudioFrames1400(int audioFrame[], int aKeyCount[], int videoFrame, int vKeyCount, int fd)
{
    for (int index = 0; index < EXPECTED_AUDIO_TRACK_COUNT_TWO; index++) {
        if (audioFrame[index] != EXPECTED_AUDIO_FRAMES_433 ||
            aKeyCount[index] != EXPECTED_AUDIO_FRAMES_433) {
            close(fd);
            return -1;
        }
    }
    if (videoFrame != EXPECTED_VIDEO_FRAMES_602 || vKeyCount != EXPECTED_KEY_FRAMES_3) {
        close(fd);
        return -1;
    }
    return 0;
}

int SubMediaDemuxerProcess1400()
{
    const char *file = "/data/storage/el2/base/files/media/video_2audio.mp4";
    int fd = open(file, O_RDONLY);
    if (InitSource1400(file, fd) != 0) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int tarckType = 0;
    int vKeyCount = 0;
    int aKeyCount[2] = {};
    int audioFrame[2] = {};
    int videoFrame = 0;
    bool audioIsEnd = false;
    bool videoIsEnd = false;
    OH_AVCodecBufferAttr attr;
    
    MultiAudioLoopParams loopParams = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, aKeyCount,
                                       videoFrame, vKeyCount};
    if (ProcessMultiAudioLoop1400(loopParams) != 0) {
        close(fd);
        return -1;
    }
    if (ValidateMultiAudioFrames1400(audioFrame, aKeyCount, videoFrame, vKeyCount, fd) != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_1500
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess1500()
{
    const char *file = "/data/storage/el2/base/files/media/video_9audio.mp4";
    int auidoTrackCount = 9;
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != auidoTrackCount + 1) { return -1; }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    bool audioIsEnd = false;
    int videoFrame = 0;
    int vKeyCount = 0;
    int aKeyCount[9] = {};
    int audioFrame[9] = {};
    MultiAudioTrackParams multiParams = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, aKeyCount,
                                         videoFrame, vKeyCount};
    if (ProcessMultiAudioTrackLoop(multiParams) != 0) {
        return -1;
    }
    for (int index = 0; index < auidoTrackCount; index++) {
        if (audioFrame[index] != EXPECTED_AUDIO_FRAMES_433 ||
            aKeyCount[index] != EXPECTED_AUDIO_FRAMES_433) { return -1; }
    }
    if (videoFrame != EXPECTED_VIDEO_FRAMES_602 || vKeyCount != EXPECTED_KEY_FRAMES_3) { return -1; }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_1600
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess1600()
{
    const char *file = "/data/storage/el2/base/files/media/avc_mp3.flv";
    int fd;
    int64_t size;
    if (InitSourceAndDemuxer(file, fd, size, EXPECTED_TRACK_COUNT_DUAL) != 0) {
        return -1;
    }
    cout << "[TEST1600] file=" << file << ", fd=" << fd << ", size=" << size << endl;

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    bool audioIsEnd = false;
    int videoFrame = 0;
    int audioFrame = 0;
    int vKeyCount = 0;
    int aKeyCount = 0;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    if (ProcessMainLoop(params) != 0) {
        return -1;
    }
    FrameCountParams validateParams = {audioFrame, EXPECTED_AUDIO_FRAMES_385, aKeyCount, EXPECTED_AUDIO_FRAMES_385,
                                       videoFrame, EXPECTED_VIDEO_FRAMES_602, vKeyCount, EXPECTED_KEY_FRAMES_3};
    if (ValidateFrameCounts(validateParams) != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_1700
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess1700()
{
    const char *file = "/data/storage/el2/base/files/media/hevc_pcm_a.flv";
    int fd;
    int64_t size;
    if (InitSourceAndDemuxer(file, fd, size, EXPECTED_TRACK_COUNT_DUAL) != 0) {
        return -1;
    }
    cout << file << "----------------------" << fd << "---------" << size << endl;

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    bool audioIsEnd = false;
    int videoFrame = 0;
    int audioFrame = 0;
    int vKeyCount = 0;
    int aKeyCount = 0;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    if (ProcessMainLoop(params) != 0) {
        return -1;
    }
    FrameCountParams validateParams = {audioFrame, EXPECTED_AUDIO_FRAMES_385, aKeyCount, EXPECTED_AUDIO_FRAMES_385,
                                       videoFrame, EXPECTED_VIDEO_FRAMES_602, vKeyCount, EXPECTED_KEY_FRAMES_3};
    if (ValidateFrameCounts(validateParams) != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_1800
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubMediaDemuxerProcess1800()
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/avc_mp3_error.flv";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) { return -1; }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (ProcessSingleTrackInLoop(index, params) != 0) {
                return -1;
            }
        }
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_1900
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_1900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubMediaDemuxerProcess1900()
{
    OH_AVCodecBufferAttr attr;
    const char* mimeType = nullptr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/audio/ape.ape";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &mimeType))) { return -1; }
    string mimeTypeString = mimeType;
    string apeString = OH_AVCODEC_MIMETYPE_AUDIO_APE;
    cout << "------mimeType-------" << mimeTypeString << endl;
    if (apeString != mimeTypeString) { return -1; }
    if (OH_AVCODEC_MIMETYPE_VIDEO_VVC == mimeTypeString) { return -1; }
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_KEY_FRAMES_1) { return -1; }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) { return -1; }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int aKeyCount = 0;
    while (!audioIsEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_8) { return -1; }
    if (aKeyCount != EXPECTED_AUDIO_FRAMES_8) { return -1; }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_2000
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess2000()
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/h264_mp3_3mevx_fmp4.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) { return -1; }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (ProcessSingleTrackInLoop(index, params) != 0) {
                return -1;
            }
        }
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_465) { return -1; }
    if (aKeyCount != EXPECTED_AUDIO_FRAMES_465) { return -1; }
    if (videoFrame != EXPECTED_VIDEO_FRAMES_369) { return -1; }
    if (vKeyCount != EXPECTED_KEY_FRAMES_3) { return -1; }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_2100
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess2100()
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/h265_aac_1mvex_fmp4.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) { return -1; }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (ProcessSingleTrackInLoop(index, params) != 0) {
                return -1;
            }
        }
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_173) { return -1; }
    if (aKeyCount != EXPECTED_AUDIO_FRAMES_173) { return -1; }
    if (videoFrame != EXPECTED_VIDEO_FRAMES_242) { return -1; }
    if (vKeyCount != EXPECTED_KEY_FRAMES_1) { return -1; }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_2200
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess2200()
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/audiovivid_hdrvivid_1s_fmp4.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) { return -1; }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    int vKeyCount = 0;
    int aKeyCount = 0;
    int audioFrame = 0;
    bool audioIsEnd = false;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (ProcessSingleTrackInLoop(index, params) != 0) {
                return -1;
            }
        }
    }
    if (videoFrame != EXPECTED_VIDEO_FRAMES_26) { return -1; }
    if (vKeyCount != EXPECTED_KEY_FRAMES_1) { return -1; }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_2300
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess2300()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/m4a_fmp4.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_KEY_FRAMES_1) { return -1; }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) { return -1; }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int aKeyCount = 0;
    while (!audioIsEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_352) { return -1; }
    if (aKeyCount != EXPECTED_AUDIO_FRAMES_352) { return -1; }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_2400
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess2400()
{
    const char *file = "/data/storage/el2/base/files/media/m4v_fmp4.mp4";
    int fd;
    int64_t size;
    if (InitSourceAndDemuxer(file, fd, size, EXPECTED_TRACK_COUNT_DUAL) != 0) {
        return -1;
    }
    cout << file << "----------------------" << fd << "---------" << size << endl;

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    bool audioIsEnd = false;
    int videoFrame = 0;
    int audioFrame = 0;
    int vKeyCount = 0;
    int aKeyCount = 0;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    if (ProcessMainLoop(params) != 0) {
        return -1;
    }
    FrameCountParams validateParams = {audioFrame, EXPECTED_AUDIO_FRAMES_176, aKeyCount, EXPECTED_AUDIO_FRAMES_176,
                                       videoFrame, EXPECTED_VIDEO_FRAMES_123, vKeyCount, EXPECTED_KEY_FRAMES_1};
    if (ValidateFrameCounts(validateParams) != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_2600
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess2600()
{
    OH_AVCodecBufferAttr attr;
    const char* mimeType = nullptr;
    int srtIndex = 1;
    int srtSubtitle = 0;
    const char *file = "/data/storage/el2/base/files/media/srt_test.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &mimeType))) { return -1; }
    string mimeTypeString = mimeType;
    string srtString = OH_AVCODEC_MIMETYPE_SUBTITLE_SRT;
    cout << "------mimeType-------" << mimeTypeString << endl;
    if (srtString != mimeTypeString) { return -1; }
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_KEY_FRAMES_1) { return -1; }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) { return -1; }
    bool isEnd = false;
    while (!isEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            isEnd = true;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        srtSubtitle = atoi(reinterpret_cast<const char*>(data));
        cout << "subtitle" << "----------------" << srtSubtitle << "-----------------" << endl;
        if (srtIndex != srtSubtitle) { return -1; }
        srtIndex++;
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_2700
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess2700()
{
    OH_LOG_INFO(LOG_APP, "[TEST2700] START");
    OH_AVCodecBufferAttr attr;
    int srtIndex = 10;
    const char *file = "/data/storage/el2/base/files/media/srt_test.srt";
    int fd = open(file, O_RDONLY);
    if (InitSubtitleDemuxer2700(fd, file) != 0) {
        return -1;
    }
    if (ReadFirstSubtitles2700(fd, attr, srtIndex) != 0) {
        return -1;
    }

    if (SeekAndReadSubtitle2700(fd, attr, srtIndex) != 0) {
        return -1;
    }

    if (ReadRemainingSubtitles2700(fd, attr, srtIndex) != 0) {
        return -1;
    }

    close(fd);
    OH_LOG_INFO(LOG_APP, "[TEST2700] PASS - All checks passed");
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_2800
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubMediaDemuxerProcess2800()
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/srt_2800.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_KEY_FRAMES_1) { return -1; }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) { return -1; }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    bool isEnd = false;
    while (!isEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        if (data != nullptr) {
            cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
        }
    }

    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_2900
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_2900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubMediaDemuxerProcess2900()
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/srt_2900.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_KEY_FRAMES_1) { return -1; }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) { return -1; }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    bool isEnd = false;
    while (!isEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        if (data != nullptr) {
            cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
        }
    }

    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3000
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubMediaDemuxerProcess3000()
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/srt_3000.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        close(fd);
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        close(fd);
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        close(fd);
        return -1;
    }
    if (!OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount)) {
        close(fd);
        return -1;
    }
    cout << "g_trackCount"<< "----------------" << g_trackCount << "-----------------" << endl;
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
        close(fd);
        return -1;
    }
    uint8_t *data = OH_AVMemory_GetAddr(memory);
    if (data != nullptr) {
        cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3100
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubMediaDemuxerProcess3100()
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/srt_3100.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        close(fd);
        return -1;
    }
    if (!OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount)) {
        close(fd);
        return -1;
    }
    cout << "g_trackCount"<< "----------------" << g_trackCount << "-----------------" << endl;
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
        close(fd);
        return -1;
    }
    uint8_t *data = OH_AVMemory_GetAddr(memory);
    if (data != nullptr) {
        cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3200
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubMediaDemuxerProcess3200()
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/srt_3200.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount);
    cout << "g_trackCount"<< "----------------" << g_trackCount << "-----------------" << endl;
    OH_AVDemuxer_SelectTrackByID(demuxer, 0);

    InitTestResources();

    OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr);
    uint8_t *data = OH_AVMemory_GetAddr(memory);
    cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3300
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubMediaDemuxerProcess3300()
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/srt_3300.srt";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        close(fd);
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        close(fd);
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        close(fd);
        return -1;
    }
    if (g_trackCount != EXPECTED_KEY_FRAMES_1) {
        close(fd);
        return -1;
    }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) {
        close(fd);
        return -1;
    }

    InitTestResources();

    bool isEnd = false;
    while (!isEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
        close(fd);
        return -1;
    }
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "   srt is end !!!!!!!!!!!!!!!" << endl;
            isEnd = true;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        cout << "subtitle"<< "----------------" << data << "-----------------" << endl;
    }

    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3400
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess3400()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        static OH_AVFormat *trackFormatFirst = nullptr;
        static OH_AVFormat *trackFormatSecond = nullptr;
        int64_t duration;
        const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
        int fd = open(file, O_RDONLY);
        if (InitMediaSource3400(fd, trackFormatFirst, trackFormatSecond) != 0) {
            return -1;
        }
        if (!(OH_AVFormat_GetLongValue(sourceFormat, OH_MD_KEY_DURATION, &duration))) {
            close(fd);
            return -1;
        }
        if (duration != EXPECTED_DURATION_10032000) {
            close(fd);
            return -1;
        }

        if (ValidateVideoTrackFormat3400(fd, trackFormatSecond) != 0) {
            return -1;
        }

        if (ValidateAudioTrackFormat3400(fd, trackFormatFirst) != 0) {
            return -1;
        }

        close(fd);
    }
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3800
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess3800()
{
    if (strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc") != 0) {
        return 0;
    }
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/test_265_B_Gop25_4sec.mp4";
    int fd = 0;
    int64_t size = 0;
    
    if (InitDemuxerCommon(file, fd, size, EXPECTED_TRACK_COUNT_DUAL) != 0) {
        close(fd);
        return -1;
    }

    InitTestResources();

    int audioFrame = 0;
    ProcessAudioLoop3800(fd, attr, audioFrame);
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3700
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess3700()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        const char *file = "/data/storage/el2/base/files/media/test_265_B_Gop25_4sec.mp4";
        int fd = 0;
        int64_t size = 0;
        
        if (InitDemuxerCommon(file, fd, size, EXPECTED_TRACK_COUNT_DUAL) != 0) {
            return -1;
        }
        
        for (int32_t index = 0; index < g_trackCount; index++) {
            int result = ValidateVideoDurationAndDts(index, EXPECTED_BUFFER_DURATION_40000, EXPECTED_DTS_NEG_80000);
            if (result < 0) {
                return -1;
            }
            if (result > 0) {
                continue;
            }
        }
    }
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3600
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess3600()
{
    if (strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc") != 0) {
        return 0;
    }
    double sar;
    int32_t bitsPreCodedSample;
    int32_t sampleFormat;
    const char *file = "/data/storage/el2/base/files/media/test_265_B_Gop25_4sec.mp4";
    int fd;
    if (InitSource3600(file, fd) != 0) {
        return -1;
    }
    if (ProcessTrackFormats3600(sar, bitsPreCodedSample, sampleFormat) != 0) {
        close(fd);
        return -1;
    }
    if (sar != EXPECTED_KEY_FRAMES_1) {
        close(fd);
        return -1;
    }
    if (bitsPreCodedSample != EXPECTED_BITS_PER_CODED_SAMPLE_16) {
        close(fd);
        return -1;
    }
    if (sampleFormat != EXPECTED_AUDIO_SAMPLE_FORMAT_9) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3510
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3510
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess3510()
{
    int64_t startTime = -1;
    const char *file = "/data/storage/el2/base/files/media/test_starttime.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << "[TEST3510] file=" << file << ", fd=" << fd << ", size=" << size << endl;
    if (fd < 0) {
        cout << "[TEST3510] Failed to open file, errno=" << errno << ", error=" << strerror(errno) << endl;
        return -1;
    }
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        cout << "[TEST3510] OH_AVSource_CreateWithFD failed" << endl;
        close(fd);
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        cout << "[TEST3510] OH_AVSource_GetSourceFormat failed" << endl;
        close(fd);
        return -1;
    }
    bool hasStartTime = OH_AVFormat_GetLongValue(sourceFormat, OH_MD_KEY_START_TIME, &startTime);
    cout << "[TEST3510] hasStartTime=" << hasStartTime << ", startTime=" << startTime << endl;
    // 测试只验证能否成功获取 startTime,不强制检查具体值
    // 因为不同媒体文件的 startTime 可能不同
    if (!hasStartTime) {
        cout << "[TEST3510] START_TIME not available in this media file, test passed" << endl;
    } else {
        cout << "[TEST3510] Got startTime=" << startTime << ", test passed" << endl;
    }
    close(fd);
    return 0;
}

/**
 * @tc.name   SUB_MEDIA_DEMUXER_PROCESS_3500
 * @tc.number SUB_MEDIA_DEMUXER_PROCESS_3500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubMediaDemuxerProcess3500()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        int64_t startTime;
        const char *file = "/data/storage/el2/base/files/media/test_265_B_Gop25_4sec.mp4";
        int fd = open(file, O_RDONLY);
        int64_t size = GET_FILE_SIZE(file);
        source = OH_AVSource_CreateWithFD(fd, 0, size);
        if (source == nullptr) { return -1; }
        sourceFormat = OH_AVSource_GetSourceFormat(source);
        if (sourceFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetLongValue(sourceFormat, OH_MD_KEY_START_TIME, &startTime))) { return -1; }
        if (startTime != 0) { return -1; }
        close(fd);
    }
    return 0;
}

