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

#ifndef FUNC_TEST_HELPER_H
#define FUNC_TEST_HELPER_H

#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avmemory.h>
#include <cstdint>
#include <string>

// 全局变量声明
extern OH_AVSource *source;
extern OH_AVDemuxer *demuxer;
extern OH_AVFormat *sourceFormat;
extern OH_AVFormat *trackFormat;
extern OH_AVMemory *memory;
extern int32_t g_trackCount;

// 结构体：封装双轨道处理参数
struct DualTrackParams {
    bool *audioIsEnd;
    bool *videoIsEnd;
    int *audioFrame;
    int *videoFrame;
    int *aKeyCount;
    int *vKeyCount;
};

// 结构体：封装样本处理参数
struct SampleProcessParams {
    OH_AVDemuxer *demuxer;
    int32_t index;
    OH_AVMemory *memory;
    OH_AVCodecBufferAttr *attr;
    int count;
    int pos;
    bool *isEnd;
};

// 路径常量定义
#ifndef AV_CODEC_PATH
#define AV_CODEC_PATH "/system/lib64/media/av_codec"
#endif

extern const std::string HEVC_LIB_PATH;

// 测试预期值常量定义
constexpr int EXPECTED_TRACK_COUNT_DUAL = 2;
constexpr int EXPECTED_TRACK_COUNT_SINGLE = 1;
constexpr int EXPECTED_AUDIO_FRAMES_433 = 433;
constexpr int EXPECTED_AUDIO_FRAMES_431 = 431;
constexpr int EXPECTED_AUDIO_FRAMES_384 = 384;
constexpr int EXPECTED_AUDIO_FRAMES_385 = 385;
constexpr int EXPECTED_AUDIO_FRAMES_1500 = 1500;
constexpr int EXPECTED_AUDIO_FRAMES_1501 = 1501;
constexpr int EXPECTED_AUDIO_FRAMES_2288 = 2288;
constexpr int EXPECTED_AUDIO_FRAMES_5146 = 5146;
constexpr int EXPECTED_AUDIO_FRAMES_9150 = 9150;
constexpr int EXPECTED_AUDIO_FRAMES_9457 = 9457;
constexpr int EXPECTED_AUDIO_FRAMES_10293 = 10293;
constexpr int EXPECTED_AUDIO_FRAMES_11439 = 11439;
constexpr int EXPECTED_VIDEO_FRAMES_602 = 602;
constexpr int EXPECTED_VIDEO_FRAMES_600 = 600;
constexpr int EXPECTED_VIDEO_FRAMES_303 = 303;
constexpr int EXPECTED_VIDEO_FRAMES_301 = 301;
constexpr int EXPECTED_KEY_FRAMES_3 = 3;
constexpr int EXPECTED_KEY_FRAMES_10 = 10;
constexpr int EXPECTED_KEY_FRAMES_26 = 26;
constexpr int EXPECTED_KEY_FRAMES_51 = 51;
constexpr int EXPECTED_SAMPLE_RATE_44100 = 44100;
constexpr int EXPECTED_CHANNEL_COUNT_2 = 2;
constexpr int64_t EXPECTED_BITRATE_319999 = 319999;
constexpr int MEMORY_BUFFER_WIDTH = 3840;
constexpr int MEMORY_BUFFER_HEIGHT = 2160;
constexpr int64_t TIME_DIVISOR_1000 = 1000;
constexpr int64_t TIME_INCREMENT_1000 = 1000;
constexpr int64_t TIME_INCREMENT_1000000 = 1000000;
constexpr int64_t TIME_TOLERANCE_40000 = 40000;
constexpr int EXPECTED_TRACK_COUNT_THREE = 3;
constexpr int EXPECTED_AUDIO_TRACK_COUNT_TWO = 2;

// 辅助函数声明
int64_t GetFileSize(const char *fileName);
int GetSecureRandomInt(int max);
int InitDemuxerSimple(const char *file, int &fd, int64_t &size);
int SelectAllTracksSimple();
int ReadSamplesToPosition(int32_t trackIndex, int targetPos, int64_t &startPts);
bool ProcessSample4300(SampleProcessParams &params);
void SetAudioValue(OH_AVCodecBufferAttr attr, bool &audioIsEnd, int &audioFrame, int &aKeyCount);
void SetVideoValue(OH_AVCodecBufferAttr attr, bool &videoIsEnd, int &videoFrame, int &vKeyCount);
void SetVarValue(OH_AVCodecBufferAttr attr, const int &tarckType, bool &audioIsEnd, bool &videoIsEnd);
void SetFirstFrameFlag(bool &isFirstFrame);
void SetEndFlag(bool &audioIsEnd, bool &videoIsEnd);
int ProcessDualTrackLoop(DualTrackParams &params);
void InitTestResources();
void CleanupResources();

#define GET_FILE_SIZE GetFileSizeHelper

#endif // FUNC_TEST_HELPER_H
