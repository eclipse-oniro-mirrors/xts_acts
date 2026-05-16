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
#include <hilog/log.h>

#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <cmath>
#include <thread>

using namespace std;

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "DemuxerFunc2Test"

// 全局变量声明
static OH_AVSource *source = nullptr;
static OH_AVDemuxer *demuxer = nullptr;
static OH_AVFormat *sourceFormat = nullptr;
static OH_AVFormat *trackFormat = nullptr;
static OH_AVMemory *memory = nullptr;
static int32_t g_trackCount = 0;
static bool g_initResult = false;
static OH_AVBuffer *avBuffer = nullptr;
static bool g_isRefult = false;
static int32_t g_unselect = -1;

// 常量定义
static const int32_t TRACKNUM_0 = 0;
static const int32_t TRACKNUM_1 = 1;
static const int32_t TRACKNUM_2 = 2;
static const int32_t TRACKNUM_3 = 3;
static const int32_t TRACKNUM_4 = 4;
static const int32_t TRACKFRAME_231 = 231;
static const int32_t TRACKFRAME_431 = 431;
static const int32_t TRACKFRAME_16 = 16;
static const int32_t TRACKFRAME_77 = 77;
static const int32_t TRACKFRAME_223 = 223;
static const int32_t TRACKFRAME_417 = 417;
static const int64_t VIDEOTRACKSEEK = 900000;
static const int64_t AUDIOTRACKSEEK = 130604;
static const int32_t THOUSAND = 1000;
static const std::string TRACK_REF_TYPE_DEPTH = "vdep";
static const std::string TRACK_REF_TYPE_PREY = "auxl";
static const std::string TRACK_REF_TYPE_CDSC = "cdsc";
static const std::string AUXILIARY_DEPTH_TRACK_KEY = "com.openharmony.moviemode.depth";
static const std::string AUXILIARY_PREY_TRACK_KEY = "com.openharmony.moviemode.prey";
static const std::string TIMED_METADATA_KEY = "timed_metadata";
static int32_t g_trackType = 0;

// 结构体定义：用于减少函数参数
struct TrackState {
    bool *isEnd1;
    bool *isEnd2;
    bool *isEnd3;
    int *frame1;
    int *frame2;
    int *frame3;
};

// 测试预期值常量
static constexpr int EXPECTED_BUFFER_SIZE_2 = 2;
static constexpr int EXPECTED_AUDIO_FRAMES_40 = 40;
static constexpr int EXPECTED_AUDIO_FRAMES_20 = 20;
static constexpr int EXPECTED_AUDIO_FRAMES_11 = 11;
static constexpr int EXPECTED_AUDIO_FRAMES_21 = 21;
static constexpr int EXPECTED_AUDIO_FRAMES_26 = 26;
static constexpr int EXPECTED_AUDIO_FRAMES_59 = 59;
static constexpr int EXPECTED_AUDIO_FRAMES_1876 = 1876;
static constexpr int EXPECTED_SEEK_TIME_2487 = 2487;

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

static int OpenFile(const char *fileName, int fd, OH_AVSource **src, OH_AVDemuxer **audioDemuxer)
{
    int64_t size = GET_FILE_SIZE(fileName);
    cout << fileName << "----------------------" << fd << "---------" << size << endl;
    *src = OH_AVSource_CreateWithFD(fd, 0, size);
    if (*src == nullptr) { return -1; }

    *audioDemuxer = OH_AVDemuxer_CreateWithSource(*src);
    if (*audioDemuxer == nullptr) { return -1; }
    return 0;
}

static int CheckTrackCount(OH_AVFormat **srcFormat, OH_AVSource *src, int32_t *trackCount, int trackNum)
{
    *srcFormat = OH_AVSource_GetSourceFormat(src);
    if (!(OH_AVFormat_GetIntValue(*srcFormat, OH_MD_KEY_TRACK_COUNT, trackCount))) { return -1; }
    if (*trackCount != trackNum) { return -1; }
    return 0;
}

static int CheckTrackSelect(int32_t trackCount, OH_AVDemuxer *audioDemuxer)
{
    for (int32_t index = 0; index < trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(audioDemuxer, index) != AV_ERR_OK) { return -1; }
    }
    return 0;
}

static int CountAudioFrames(OH_AVDemuxer *audioDemuxer, OH_AVMemory *mem,
    int32_t trackCount, int audioFrameNum, int audioKeyNum)
{
    int audioFrame = 0;
    int keyCount = 0;
    bool audioIsEnd = false;
    OH_AVCodecBufferAttr attr;

    while (!audioIsEnd) {
        for (int32_t index = 0; index < trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(audioDemuxer, index, mem, &attr) != AV_ERR_OK) { return -1; }
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
    if (audioFrameNum != audioFrame) { return -1; }
    if (audioKeyNum != keyCount) { return -1; }
    return 0;
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
static int InitFile(const char *file, int32_t trackNum, int &fd)
{
    g_initResult = false;
    fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != trackNum) { return -1; }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (g_unselect != index) {
            if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
        }
    }
    avBuffer = OH_AVBuffer_Create(size);
    if (avBuffer == nullptr) { return -1; }
    g_initResult = true;
    return 0;
}

static int GetDepthTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) { return -1; }
    if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) { return -1; }
    if (bufferSize != TRACKNUM_2) { return -1; }
    if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_1) { return -1; }
    if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_3) { return -1; }
    g_isRefult = true;
    return 0;
}

static int GetPreyTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) { return -1; }
    if (strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize))) { return -1; }
    if (bufferSize != TRACKNUM_1) { return -1; }
    if (trackIdsPrey[TRACKNUM_0] != TRACKNUM_2) { return -1; }
    g_isRefult = true;
    return 0;
}

static int GetTimedMetaTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_CDSC.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) { return -1; }
    if (strcmp(trackdescription, TIMED_METADATA_KEY.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) { return -1; }
    if (bufferSize != TRACKNUM_1) { return -1; }
    if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_1) { return -1; }
    g_isRefult = true;
    return 0;
}

static int GetDepthAndIdsTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) { return -1; }
    if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) { return -1; }
    if (bufferSize != TRACKNUM_3) { return -1; }
    if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_0) { return -1; }
    if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_2) { return -1; }
    if (trackIdsDepth[TRACKNUM_2] != TRACKNUM_3) { return -1; }
    g_isRefult = true;
    return 0;
}

static int GetPreyAndIdsTrack()
{
    g_isRefult = false;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) { return -1; }
    if (strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()) != 0) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(
        trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize))) { return -1; }
    if (bufferSize != TRACKNUM_2) { return -1; }
    if (trackIdsPrey[TRACKNUM_0] != TRACKNUM_0) { return -1; }
    if (trackIdsPrey[TRACKNUM_1] != TRACKNUM_1) { return -1; }
    g_isRefult = true;
    return 0;
}

// 辅助函数：处理读取样本失败的情况
static bool HandleReadSampleError(OH_AVErrCode readResult, int32_t index, const char *funcName,
    OH_AVFormat *&trackFormat)
{
    if (readResult == AV_ERR_OK) {
        return true;
    }
    
    OH_LOG_INFO(LOG_APP, "[%{public}s] ReadSampleBuffer failed for index=%{public}d, error=%{public}d",
        funcName, index, readResult);
    
    if (index != TRACKNUM_0) {
        return false;
    }
    
    OH_LOG_INFO(LOG_APP, "[%{public}s] Ignoring track 0 read failure, continuing...", funcName);
    OH_AVFormat_Destroy(trackFormat);
    trackFormat = nullptr;
    return true;
}

// 辅助函数：处理特定轨道类型的数据
static int ProcessTrackByType(int32_t index, int32_t trackType, OH_AVCodecBufferAttr &bufferAttr,
    TrackState &state, const char *funcName)
{
    if (index == TRACKNUM_1 && trackType == MEDIA_TYPE_AUXILIARY) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Processing track 1 (depth)", funcName);
        GetDepthAndIdsTrack();
        if (!(g_isRefult)) { return -1; }
        SetVideoValue(bufferAttr, *state.isEnd1, *state.frame1);
    } else if (index == TRACKNUM_2 && trackType == MEDIA_TYPE_AUXILIARY) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Processing track 2 (prey/auxl)", funcName);
        GetPreyAndIdsTrack();
        if (!(g_isRefult)) { return -1; }
        SetVideoValue(bufferAttr, *state.isEnd2, *state.frame2);
    } else if (index == TRACKNUM_3 && trackType == MEDIA_TYPE_TIMED_METADATA) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Processing track 3 (timed metadata)", funcName);
        GetTimedMetaTrack();
        if (!(g_isRefult)) { return -1; }
        SetVideoValue(bufferAttr, *state.isEnd3, *state.frame3);
    }
    return 0;
}

// 辅助函数：处理特定轨道类型的数据（Track0140版本）
static int ProcessTrackByType0140(int32_t index, int32_t trackType, OH_AVCodecBufferAttr &bufferAttr,
    TrackState &state, const char *funcName)
{
    if (index == TRACKNUM_1 && trackType == MEDIA_TYPE_AUXILIARY) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Processing track 1 (depth)", funcName);
        GetDepthTrack();
        if (!(g_isRefult)) { return -1; }
        SetVideoValue(bufferAttr, *state.isEnd1, *state.frame1);
    } else if (index == TRACKNUM_2 && trackType == MEDIA_TYPE_AUXILIARY) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Processing track 2 (prey)", funcName);
        GetPreyTrack();
        if (!(g_isRefult)) { return -1; }
        SetVideoValue(bufferAttr, *state.isEnd2, *state.frame2);
    } else if (index == TRACKNUM_3 && trackType == MEDIA_TYPE_TIMED_METADATA) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Processing track 3 (timed metadata)", funcName);
        GetTimedMetaTrack();
        if (!(g_isRefult)) { return -1; }
        SetVideoValue(bufferAttr, *state.isEnd3, *state.frame3);
    }
    return 0;
}

// 辅助函数：验证单个帧数
static int ValidateSingleFrame(int frame, int expected, const char *name, const char *funcName)
{
    if (frame != expected) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] %{public}s mismatch: %{public}d != %{public}d",
            funcName, name, frame, expected);
        return -1;
    }
    return 0;
}

struct FrameValidationParams {
    int frame1;
    int expected1;
    int frame2;
    int expected2;
    int frame3;
    int expected3;
    const char *funcName;
};

// 辅助函数：验证帧数结果
static int ValidateFrameCounts(const FrameValidationParams &params)
{
    if (ValidateSingleFrame(params.frame1, params.expected1, "frame1", params.funcName) != 0 ||
        ValidateSingleFrame(params.frame2, params.expected2, "frame2", params.funcName) != 0 ||
        ValidateSingleFrame(params.frame3, params.expected3, "frame3", params.funcName) != 0) {
        return -1;
    }
    return 0;
}

// 辅助函数：处理单个轨道的读取和处理（AudioTrack版本）
static int ProcessSingleTrackAudio(int32_t index, bool videoIsEnd1, bool videoIsEnd2, bool videoIsEnd3,
    OH_AVCodecBufferAttr &bufferAttr, bool &outEnd1, bool &outEnd2, bool &outEnd3,
    int &frame1, int &frame2, int &frame3, const char *funcName)
{
    trackFormat = OH_AVSource_GetTrackFormat(source, index);
    if (trackFormat == nullptr) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] GetTrackFormat failed for index=%{public}d", funcName, index);
        return -1;
    }
    
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] GetIntValue failed for index=%{public}d", funcName, index);
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[%{public}s] Processing index=%{public}d, trackType=%{public}d",
        funcName, index, g_trackType);
    
    if ((videoIsEnd1 && (index == TRACKNUM_1)) ||
        (videoIsEnd2 && (index == TRACKNUM_2)) ||
        (videoIsEnd3 && (index == TRACKNUM_3))) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Skipping ended track %{public}d", funcName, index);
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
        return 1;
    }
    
    OH_LOG_INFO(LOG_APP, "[%{public}s] About to call ReadSampleBuffer for index=%{public}d", funcName, index);
    OH_AVErrCode readResult = OH_AVDemuxer_ReadSampleBuffer(demuxer, index, avBuffer);
    OH_LOG_INFO(LOG_APP, "[%{public}s] ReadSampleBuffer returned: %{public}d for index=%{public}d",
        funcName, readResult, index);
    
    if (!HandleReadSampleError(readResult, index, funcName, trackFormat)) {
        return -1;
    }
    
    if (readResult != AV_ERR_OK) {
        return 1;
    }
    
    if (avBuffer == nullptr) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] avBuffer is nullptr for index=%{public}d", funcName, index);
        return -1;
    }
    
    if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] GetBufferAttr failed for index=%{public}d", funcName, index);
        return -1;
    }
    
    TrackState state = {&outEnd1, &outEnd2, &outEnd3, &frame1, &frame2, &frame3};
    if (ProcessTrackByType(index, g_trackType, bufferAttr, state, funcName) != 0) {
        return -1;
    }
    
    OH_AVFormat_Destroy(trackFormat);
    trackFormat = nullptr;
    return 0;
}

// 辅助函数：处理单个轨道的读取和处理（AudioTrack0140版本）
static int ProcessSingleTrackAudio0140(int32_t index, bool videoIsEnd1, bool videoIsEnd2, bool videoIsEnd3,
    OH_AVCodecBufferAttr &bufferAttr, bool &outEnd1, bool &outEnd2, bool &outEnd3,
    int &frame1, int &frame2, int &frame3, const char *funcName)
{
    trackFormat = OH_AVSource_GetTrackFormat(source, index);
    if (trackFormat == nullptr) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] GetTrackFormat failed for index=%{public}d", funcName, index);
        return -1;
    }
    
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] GetIntValue failed for index=%{public}d", funcName, index);
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[%{public}s] Processing index=%{public}d, trackType=%{public}d",
        funcName, index, g_trackType);
    
    if ((videoIsEnd1 && (index == TRACKNUM_1)) ||
        (videoIsEnd2 && (index == TRACKNUM_2)) ||
        (videoIsEnd3 && (index == TRACKNUM_3))) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Skipping ended track %{public}d", funcName, index);
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
        return 1;
    }
    
    OH_LOG_INFO(LOG_APP, "[%{public}s] About to call ReadSampleBuffer for index=%{public}d", funcName, index);
    OH_AVErrCode readResult = OH_AVDemuxer_ReadSampleBuffer(demuxer, index, avBuffer);
    OH_LOG_INFO(LOG_APP, "[%{public}s] ReadSampleBuffer returned: %{public}d for index=%{public}d",
        funcName, readResult, index);
    
    if (!HandleReadSampleError(readResult, index, funcName, trackFormat)) {
        return -1;
    }
    
    if (readResult != AV_ERR_OK) {
        return 1;
    }
    
    if (avBuffer == nullptr) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] avBuffer is nullptr for index=%{public}d", funcName, index);
        return -1;
    }
    
    if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] GetBufferAttr failed for index=%{public}d", funcName, index);
        return -1;
    }
    
    TrackState state = {&outEnd1, &outEnd2, &outEnd3, &frame1, &frame2, &frame3};
    if (ProcessTrackByType0140(index, g_trackType, bufferAttr, state, funcName) != 0) {
        return -1;
    }
    
    OH_AVFormat_Destroy(trackFormat);
    trackFormat = nullptr;
    return 0;
}

struct SingleTrackSimpleParams {
    int32_t index;
    TrackState &inState;
    OH_AVCodecBufferAttr &bufferAttr;
    TrackState &outState;
    const char *funcName;
    int (*processFunc)(int32_t, int32_t, OH_AVCodecBufferAttr&, TrackState&, const char*);
};

// 辅助函数：处理单个轨道（Track版本，无详细日志）
static int ProcessSingleTrackSimple(SingleTrackSimpleParams &params)
{
    trackFormat = OH_AVSource_GetTrackFormat(source, params.index);
    if (trackFormat == nullptr ||
        !(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) {
        OH_AVFormat_Destroy(trackFormat);
        return -1;
    }
    
    if ((*params.inState.isEnd1 && params.index == TRACKNUM_1) ||
        (*params.inState.isEnd2 && params.index == TRACKNUM_2) ||
        (*params.inState.isEnd3 && params.index == TRACKNUM_3)) {
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
        return 1;
    }
    
    if (OH_AVDemuxer_ReadSampleBuffer(demuxer, params.index, avBuffer) != AV_ERR_OK || avBuffer == nullptr ||
        OH_AVBuffer_GetBufferAttr(avBuffer, &params.bufferAttr) != AV_ERR_OK) {
        return -1;
    }
    
    if (params.processFunc(params.index, g_trackType, params.bufferAttr, params.outState, params.funcName) != 0) {
        return -1;
    }
    
    OH_AVFormat_Destroy(trackFormat);
    trackFormat = nullptr;
    return 0;
}

// 辅助函数：初始化 VTT 解复用器
static int InitVttDemuxer6100(int &fd, const char *file)
{
    int64_t size = GET_FILE_SIZE(file);
    OH_LOG_INFO(LOG_APP, "[VTT_6100] File: %{public}s, fd=%{public}d, size=%{public}lld", file, fd, (long long)size);
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] CreateWithFD failed");
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] CreateWithSource failed");
        return -1;
    }
    return 0;
}

// 辅助函数：验证 VTT 轨道信息
static int ValidateVttTrack6100()
{
    const char* mimeType = nullptr;
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] GetTrackFormat failed");
        return -1;
    }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &mimeType))) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] GetStringValue CODEC_MIME failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[VTT_6100] mimeType=%{public}s, expected=%{public}s",
        mimeType, OH_AVCODEC_MIMETYPE_SUBTITLE_WEBVTT);
    if (strcmp(mimeType, OH_AVCODEC_MIMETYPE_SUBTITLE_WEBVTT) != 0) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] mimeType mismatch!");
        return -1;
    }
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] GetIntValue TRACK_COUNT failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[VTT_6100] trackCount=%{public}d, expected=1", g_trackCount);
    if (g_trackCount != 1) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] trackCount mismatch!");
        return -1;
    }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] SelectTrackByID failed");
        return -1;
    }
    int tarckType = 0;
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType))) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] GetIntValue TRACK_TYPE failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[VTT_6100] trackType=%{public}d, expected=%{public}d", tarckType, MEDIA_TYPE_SUBTITLE);
    if (tarckType != MEDIA_TYPE_SUBTITLE) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] trackType mismatch!");
        return -1;
    }
    return 0;
}

// 辅助函数：读取 VTT 样本数据
static int ReadVttSamples6100(OH_AVCodecBufferAttr &attr)
{
    int frameCount = 0;
    bool isEnd = false;
    while (!isEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
            OH_LOG_INFO(LOG_APP, "[VTT_6100] ReadSample failed at frame %{public}d", frameCount);
            return -1;
        }
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            OH_LOG_INFO(LOG_APP, "[VTT_6100] EOS reached, total frames=%{public}d", frameCount);
            isEnd = true;
            break;
        }
        uint8_t *data = OH_AVMemory_GetAddr(memory);
        frameCount++;
        OH_LOG_INFO(LOG_APP, "[VTT_6100] Frame %{public}d read successfully", frameCount);
    }
    return 0;
}

// 辅助函数：验证轨道描述信息
static int ValidateTrackDescription(int32_t trackIndex, int32_t expectedType,
    const std::string &expectedDesc, const char *funcName)
{
    trackFormat = OH_AVSource_GetTrackFormat(source, trackIndex);
    if (trackFormat == nullptr) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] GetTrackFormat failed for track %{public}d", funcName, trackIndex);
        return -1;
    }
    
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] GetIntValue TRACK_TYPE failed for track %{public}d",
            funcName, trackIndex);
        OH_AVFormat_Destroy(trackFormat);
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[%{public}s] Track %{public}d type=%{public}d, expected=%{public}d",
        funcName, trackIndex, g_trackType, expectedType);
    
    if (g_trackType != expectedType) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Track %{public}d type mismatch!", funcName, trackIndex);
        OH_AVFormat_Destroy(trackFormat);
        return -1;
    }
    
    const char *trackdescription = nullptr;
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] GetStringValue TRACK_DESCRIPTION failed for track %{public}d",
            funcName, trackIndex);
        OH_AVFormat_Destroy(trackFormat);
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[%{public}s] Track %{public}d description=%{public}s, expected=%{public}s",
        funcName, trackIndex, trackdescription, expectedDesc.c_str());
    
    if (strcmp(trackdescription, expectedDesc.c_str()) != 0) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] Track %{public}d description mismatch!", funcName, trackIndex);
        OH_AVFormat_Destroy(trackFormat);
        return -1;
    }
    
    OH_AVFormat_Destroy(trackFormat);
    return 0;
}

int SubMediaDemuxerVtt6100()
{
    OH_LOG_INFO(LOG_APP, "[VTT_6100] START");
    int32_t width = 3840;
    int32_t height = 2160;
    memory = OH_AVMemory_Create(width * height);
    if (memory == nullptr) {
        OH_LOG_INFO(LOG_APP, "[VTT_6100] OH_AVMemory_Create failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[VTT_6100] Memory created successfully");

    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/vtt_6100.vtt";
    int fd = open(file, O_RDONLY);
    if (InitVttDemuxer6100(fd, file) != 0) {
        OH_AVMemory_Destroy(memory);
        memory = nullptr;
        return -1;
    }
    
    if (ValidateVttTrack6100() != 0) {
        OH_AVMemory_Destroy(memory);
        memory = nullptr;
        return -1;
    }
    
    if (ReadVttSamples6100(attr) != 0) {
        OH_AVMemory_Destroy(memory);
        memory = nullptr;
        return -1;
    }

    OH_AVMemory_Destroy(memory);
    memory = nullptr;
    close(fd);
    OH_LOG_INFO(LOG_APP, "[VTT_6100] SUCCESS");
    return 0;
}

int DemuxerMeta0090()
{
    OH_AVFormat *metaFormat = OH_AVSource_GetCustomMetadataFormat(nullptr);
    if (nullptr != metaFormat) { return -1; }
    return 0;
}

int DemuxerWavAlawFunc0001()
{
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_410_8b_1.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, 1, 1);
    close(fd);
    return 0;
}

int DemuxerWavAlawFunc0002()
{
    int64_t seekTime = 0;
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_410_8b_1.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    if (OH_AVDemuxer_SeekToTime(demuxer, seekTime, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) { return -1; }
    CountAudioFrames(demuxer, memory, g_trackCount, 1, 1);
    close(fd);
    return 0;
}

int DemuxerWavAlawFunc0003()
{
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_8K_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, EXPECTED_AUDIO_FRAMES_20, EXPECTED_AUDIO_FRAMES_20);
    close(fd);
    return 0;
}

int DemuxerWavAlawFunc0004()
{
    int32_t seekTime = 2304000;
    int32_t thousand = 1000;
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_8K_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    if (OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, SEEK_MODE_PREVIOUS_SYNC) != AV_ERR_OK) { return -1; }
    CountAudioFrames(demuxer, memory, g_trackCount, EXPECTED_AUDIO_FRAMES_11, EXPECTED_AUDIO_FRAMES_11);
    close(fd);
    return 0;
}

int DemuxerWavAlawFunc0005()
{
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_16K_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, EXPECTED_AUDIO_FRAMES_40, EXPECTED_AUDIO_FRAMES_40);
    close(fd);
    return 0;
}

int DemuxerWavAlawFunc0006()
{
    int32_t seekTime = 2432000;
    int32_t thousand = 1000;
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_16K_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    if (OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, SEEK_MODE_CLOSEST_SYNC) != AV_ERR_OK) { return -1; }
    CountAudioFrames(demuxer, memory, g_trackCount, EXPECTED_AUDIO_FRAMES_21, EXPECTED_AUDIO_FRAMES_21);
    close(fd);
    return 0;
}

int DemuxerWavAlawFunc0007()
{
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_48K_8b_1.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, EXPECTED_AUDIO_FRAMES_59, EXPECTED_AUDIO_FRAMES_59);
    close(fd);
    return 0;
}

int DemuxerWavAlawFunc0008()
{
    int32_t seekTime = 2816000;
    int32_t thousand = 1000;
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_48K_8b_1.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    if (OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) { return -1; }
    CountAudioFrames(demuxer, memory, g_trackCount, EXPECTED_AUDIO_FRAMES_26, EXPECTED_AUDIO_FRAMES_26);
    close(fd);
    return 0;
}

int DemuxerWavAlawFunc0009()
{
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_768001_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    CountAudioFrames(demuxer, memory, g_trackCount, EXPECTED_AUDIO_FRAMES_1876, EXPECTED_AUDIO_FRAMES_1876);
    close(fd);
    return 0;
}

int DemuxerWavAlawFunc0010()
{
    int32_t seekTime = 4973326;
    int32_t thousand = 1000;
    const char *file = "/data/storage/el2/base/files/media/audio/wav_alaw_768001_8b_2.wav";
    int fd = open(file, O_RDONLY);
    OpenFile(file, fd, &source, &demuxer);
    CheckTrackCount(&sourceFormat, source, &g_trackCount, 1);
    CheckTrackSelect(g_trackCount, demuxer);
    if (OH_AVDemuxer_SeekToTime(demuxer, seekTime / thousand, SEEK_MODE_PREVIOUS_SYNC) != AV_ERR_OK) { return -1; }
    CountAudioFrames(demuxer, memory, g_trackCount, EXPECTED_AUDIO_FRAMES_11, EXPECTED_AUDIO_FRAMES_11);
    close(fd);
    return 0;
}

int DemuxerFunctionTrack0010()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0020()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    const char *trackRefType = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
    OH_AVFormat_Destroy(trackFormat);

    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()) != 0) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0030()
{
    OH_LOG_INFO(LOG_APP, "[TRACK_0030] START");
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        OH_LOG_INFO(LOG_APP, "[TRACK_0030] InitFile failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[TRACK_0030] InitFile success, trackCount=%{public}d", g_trackCount);

    if (ValidateTrackDescription(TRACKNUM_1, MEDIA_TYPE_AUXILIARY, AUXILIARY_DEPTH_TRACK_KEY, "TRACK_0030") != 0) {
        return -1;
    }
    
    if (ValidateTrackDescription(TRACKNUM_2, MEDIA_TYPE_AUXILIARY, AUXILIARY_PREY_TRACK_KEY, "TRACK_0030") != 0) {
        return -1;
    }
    
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    OH_LOG_INFO(LOG_APP, "[TRACK_0030] SUCCESS");
    return 0;
}

int DemuxerFunctionTrack0040()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    int32_t *trackIdsDepth = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    int bufferSizeResult = 3;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS,
        &trackIdsDepth, &bufferSize))) { return -1; }
    if (bufferSize != bufferSizeResult) { return -1; }
    OH_AVFormat_Destroy(trackFormat);

    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS,
        &trackIdsPrey, &bufferSize))) { return -1; }
    bufferSizeResult = EXPECTED_BUFFER_SIZE_2;
    if (bufferSize != bufferSizeResult) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0050()
{
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    if (OH_AVFormat_GetIntBuffer(nullptr, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize)) { return -1; }
    return 0;
}

int DemuxerFunctionTrack0060()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (OH_AVFormat_GetIntBuffer(trackFormat, nullptr, &trackIdsDepth, &bufferSize)) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0061()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS,
        &trackIdsDepth, &bufferSize))) { return -1; }
    int bufferSizeResult = 3;
    if (bufferSize != bufferSizeResult) { return -1; }
    if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_0) { return -1; }
    if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_2) { return -1; }
    if (trackIdsDepth[TRACKNUM_2] != TRACKNUM_3) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0070()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    const char *trackRefType = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    if (OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &doubleData)) { return -1; }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &intData)) { return -1; }
    if (OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &longData)) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0080()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    const char *trackdescription = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    if (OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &doubleData)) { return -1; }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &intData)) { return -1; }
    if (OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &longData)) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) { return -1; }
    if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0090()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &doubleData)) { return -1; }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &intData)) { return -1; }
    if (OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &longData)) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS,
        &trackIdsDepth, &bufferSize))) { return -1; }
    int bufferSizeResult = 3;
    if (bufferSize != bufferSizeResult) { return -1; }
    if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_0) { return -1; }
    if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_2) { return -1; }
    if (trackIdsDepth[TRACKNUM_2] != TRACKNUM_3) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0130()
{
    OH_LOG_INFO(LOG_APP, "[DEMUXER_FUNCTION_TRACK_0130] START");
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        OH_LOG_INFO(LOG_APP, "[DEMUXER_FUNCTION_TRACK_0130] InitFile failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[DEMUXER_FUNCTION_TRACK_0130] InitFile success, trackCount=%{public}d", g_trackCount);
    
    bool videoIsEnd1 = false;
    bool videoIsEnd2 = false;
    bool videoIsEnd3 = false;
    int videoFrame1 = 0;
    int videoFrame2 = 0;
    int videoFrame3 = 0;
    OH_AVCodecBufferAttr bufferAttr;
    
    while (!videoIsEnd1 || !videoIsEnd2 || !videoIsEnd3) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            TrackState inState = {&videoIsEnd1, &videoIsEnd2, &videoIsEnd3, &videoFrame1, &videoFrame2, &videoFrame3};
            TrackState outState = {&videoIsEnd1, &videoIsEnd2, &videoIsEnd3, &videoFrame1, &videoFrame2, &videoFrame3};
            SingleTrackSimpleParams trackParams = {index, inState, bufferAttr, outState,
                                                   "DEMUXER_FUNCTION_TRACK_0130", ProcessTrackByType};
            int result = ProcessSingleTrackSimple(trackParams);
            if (result < 0) {
                return -1;
            }
            if (result > 0) {
                continue;
            }
        }
    }
    
    FrameValidationParams validateParams = {videoFrame1, TRACKFRAME_77, videoFrame2, TRACKFRAME_16,
                                            videoFrame3, TRACKFRAME_16, "DEMUXER_FUNCTION_TRACK_0130"};
    if (ValidateFrameCounts(validateParams) != 0) {
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[DEMUXER_FUNCTION_TRACK_0130] SUCCESS");
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0140()
{
    OH_LOG_INFO(LOG_APP, "[TRACK_0140] START");
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_01.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        OH_LOG_INFO(LOG_APP, "[TRACK_0140] InitFile failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[TRACK_0140] InitFile success, trackCount=%{public}d", g_trackCount);
    
    bool videoIsEnd1 = false;
    bool videoIsEnd2 = false;
    bool videoIsEnd3 = false;
    int videoFrame1 = 0;
    int videoFrame2 = 0;
    int videoFrame3 = 0;
    OH_AVCodecBufferAttr bufferAttr;
    
    while (!videoIsEnd1 || !videoIsEnd2 || !videoIsEnd3) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            TrackState inState = {&videoIsEnd1, &videoIsEnd2, &videoIsEnd3, &videoFrame1, &videoFrame2, &videoFrame3};
            TrackState outState = {&videoIsEnd1, &videoIsEnd2, &videoIsEnd3, &videoFrame1, &videoFrame2, &videoFrame3};
            SingleTrackSimpleParams trackParams = {index, inState, bufferAttr, outState,
                                                   "TRACK_0140", ProcessTrackByType0140};
            int result = ProcessSingleTrackSimple(trackParams);
            if (result < 0) {
                return -1;
            }
            if (result > 0) {
                continue;
            }
        }
    }
    
    FrameValidationParams validateParams = {videoFrame1, TRACKFRAME_77, videoFrame2, TRACKFRAME_16,
                                            videoFrame3, TRACKFRAME_16, "TRACK_0140"};
    if (ValidateFrameCounts(validateParams) != 0) {
        return -1;
    }
    
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    OH_LOG_INFO(LOG_APP, "[TRACK_0140] SUCCESS");
    return 0;
}

int DemuxerFunctionTrack0150()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_3);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_3, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_TIMED_METADATA) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_CDSC.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, TIMED_METADATA_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_1) { return -1; }
            if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_1) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (videoFrame != TRACKFRAME_16) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0160()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_2, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_2) { return -1; }
            if (trackIdsPrey[TRACKNUM_0] != TRACKNUM_0) { return -1; }
            if (trackIdsPrey[TRACKNUM_1] != TRACKNUM_1) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (videoFrame != TRACKFRAME_16) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0170()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_04.mp4";
    int fd = 0;
    g_unselect = 0;
    InitFile(file, TRACKNUM_3, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    if (OH_AVDemuxer_SeekToTime(demuxer, VIDEOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) { return -1; }
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_2, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_1) { return -1; }
            if (trackIdsPrey[TRACKNUM_0] != TRACKNUM_2) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0180()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_3) { return -1; }
            if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_0) { return -1; }
            if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_2) { return -1; }
            if (trackIdsDepth[TRACKNUM_2] != TRACKNUM_3) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (videoFrame != TRACKFRAME_77) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionTrack0190()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_04.mp4";
    int fd = 0;
    g_unselect = 0;
    InitFile(file, TRACKNUM_3, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    if (OH_AVDemuxer_SeekToTime(demuxer, VIDEOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) { return -1; }
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_1) { return -1; }
            if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_1) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0010()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0020()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    const char *trackRefType = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
    OH_AVFormat_Destroy(trackFormat);

    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()) != 0) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0030()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    const char *trackdescription = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) { return -1; }
    if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) { return -1; }
    OH_AVFormat_Destroy(trackFormat);

    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) { return -1; }
    if (strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()) != 0) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0040()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    int32_t *trackIdsDepth = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    int bufferSizeResult = 3;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS,
        &trackIdsDepth, &bufferSize))) { return -1; }
    if (bufferSize != bufferSizeResult) { return -1; }
    OH_AVFormat_Destroy(trackFormat);

    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS,
        &trackIdsPrey, &bufferSize))) { return -1; }
    bufferSizeResult = EXPECTED_BUFFER_SIZE_2;
    if (bufferSize != bufferSizeResult) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0050()
{
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    if (OH_AVFormat_GetIntBuffer(nullptr, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize)) { return -1; }
    return 0;
}

int DemuxerFunctionAudioTrack0060()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (OH_AVFormat_GetIntBuffer(trackFormat, nullptr, &trackIdsDepth, &bufferSize)) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0061()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS,
        &trackIdsDepth, &bufferSize))) { return -1; }
    int bufferSizeResult = 3;
    if (bufferSize != bufferSizeResult) { return -1; }
    if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_0) { return -1; }
    if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_2) { return -1; }
    if (trackIdsDepth[TRACKNUM_2] != TRACKNUM_3) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0070()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    const char *trackRefType = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    if (OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &doubleData)) { return -1; }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &intData)) { return -1; }
    if (OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &longData)) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, &trackRefType))) { return -1; }
    if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0080()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    const char *trackdescription = nullptr;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    if (OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &doubleData)) { return -1; }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &intData)) { return -1; }
    if (OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &longData)) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION, &trackdescription))) { return -1; }
    if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0090()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
    if (trackFormat == nullptr) { return -1; }
    int intData = 0;
    double doubleData;
    int64_t longData = 0;
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
    if (g_trackType != MEDIA_TYPE_AUXILIARY) { return -1; }
    if (OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &doubleData)) { return -1; }
    if (OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &intData)) { return -1; }
    if (OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &longData)) { return -1; }
    if (!(OH_AVFormat_GetIntBuffer(trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS,
        &trackIdsDepth, &bufferSize))) { return -1; }
    int bufferSizeResult = 3;
    if (bufferSize != bufferSizeResult) { return -1; }
    if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_0) { return -1; }
    if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_2) { return -1; }
    if (trackIdsDepth[TRACKNUM_2] != TRACKNUM_3) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0130()
{
    OH_LOG_INFO(LOG_APP, "[AUDIO_TRACK_0130] START");
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        OH_LOG_INFO(LOG_APP, "[AUDIO_TRACK_0130] InitFile failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[AUDIO_TRACK_0130] InitFile success, trackCount=%{public}d", g_trackCount);

    bool videoIsEnd1 = false;
    bool videoIsEnd2 = false;
    bool videoIsEnd3 = false;
    int videoFrame1 = 0;
    int videoFrame2 = 0;
    int videoFrame3 = 0;
    OH_AVCodecBufferAttr bufferAttr;
    
    while (!videoIsEnd1 || !videoIsEnd2 || !videoIsEnd3) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            int result = ProcessSingleTrackAudio(index, videoIsEnd1, videoIsEnd2, videoIsEnd3,
                bufferAttr, videoIsEnd1, videoIsEnd2, videoIsEnd3,
                videoFrame1, videoFrame2, videoFrame3, "AUDIO_TRACK_0130");
            if (result < 0) {
                return -1;
            }
            if (result > 0) {
                continue;
            }
        }
    }
    
    FrameValidationParams validateParams = {videoFrame1, TRACKFRAME_431, videoFrame2, TRACKFRAME_431,
                                            videoFrame3, TRACKFRAME_231, "AUDIO_TRACK_0130"};
    if (ValidateFrameCounts(validateParams) != 0) {
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[AUDIO_TRACK_0130] SUCCESS");
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0140()
{
    OH_LOG_INFO(LOG_APP, "[AUDIO_TRACK_0140] START");
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_03.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        OH_LOG_INFO(LOG_APP, "[AUDIO_TRACK_0140] InitFile failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[AUDIO_TRACK_0140] InitFile success, trackCount=%{public}d", g_trackCount);

    bool videoIsEnd1 = false;
    bool videoIsEnd2 = false;
    bool videoIsEnd3 = false;
    int videoFrame1 = 0;
    int videoFrame2 = 0;
    int videoFrame3 = 0;
    OH_AVCodecBufferAttr bufferAttr;
    
    while (!videoIsEnd1 || !videoIsEnd2 || !videoIsEnd3) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            int result = ProcessSingleTrackAudio0140(index, videoIsEnd1, videoIsEnd2, videoIsEnd3,
                bufferAttr, videoIsEnd1, videoIsEnd2, videoIsEnd3,
                videoFrame1, videoFrame2, videoFrame3, "AUDIO_TRACK_0140");
            if (result < 0) {
                return -1;
            }
            if (result > 0) {
                continue;
            }
        }
    }
    
    FrameValidationParams validateParams = {videoFrame1, TRACKFRAME_417, videoFrame2, TRACKFRAME_417,
                                            videoFrame3, TRACKFRAME_223, "AUDIO_TRACK_0140"};
    if (ValidateFrameCounts(validateParams) != 0) {
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[AUDIO_TRACK_0140] SUCCESS");
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0150()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_3);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_3, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_TIMED_METADATA) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_CDSC.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, TIMED_METADATA_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_1) { return -1; }
            if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_1) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (videoFrame != TRACKFRAME_231) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0160()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_2, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_2) { return -1; }
            if (trackIdsPrey[TRACKNUM_0] != TRACKNUM_0) { return -1; }
            if (trackIdsPrey[TRACKNUM_1] != TRACKNUM_1) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (videoFrame != TRACKFRAME_431) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0170()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    if (OH_AVDemuxer_SeekToTime(demuxer, AUDIOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) { return -1; }
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_2, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_2) { return -1; }
            if (trackIdsPrey[TRACKNUM_0] != TRACKNUM_0) { return -1; }
            if (trackIdsPrey[TRACKNUM_1] != TRACKNUM_1) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0180()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_3) { return -1; }
            if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_0) { return -1; }
            if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_2) { return -1; }
            if (trackIdsDepth[TRACKNUM_2] != TRACKNUM_3) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (videoFrame != TRACKFRAME_431) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0190()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) { return -1; }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    if (OH_AVDemuxer_SeekToTime(demuxer, AUDIOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) { return -1; }
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) { return -1; }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer) != AV_ERR_OK) { return -1; }
        if (avBuffer == nullptr) { return -1; }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) { return -1; }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) { return -1; }
            if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) { return -1; }
            if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) { return -1; }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) { return -1; }
            if (bufferSize != TRACKNUM_3) { return -1; }
            if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_0) { return -1; }
            if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_2) { return -1; }
            if (trackIdsDepth[TRACKNUM_2] != TRACKNUM_3) { return -1; }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAdd0010()
{
    const char *file = "/data/storage/el2/base/files/media/test_size_large.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_2, fd);
    if (!(g_initResult)) { return -1; }
    if (OH_AVDemuxer_SeekToTime(demuxer, EXPECTED_SEEK_TIME_2487, SEEK_MODE_NEXT_SYNC) != AV_ERR_UNKNOWN) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAdd0020()
{
    const char *file = "/data/storage/el2/base/files/media/test_size_large.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_2, fd);
    if (!(g_initResult)) { return -1; }
    if (OH_AVDemuxer_ReadSampleBuffer(demuxer, 1, avBuffer) != AV_ERR_UNKNOWN) { return -1; }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAdd0030()
{
    OH_LOG_INFO(LOG_APP, "[ADD_0030] START");

    // 初始化 memory (需要用于 OH_AVDemuxer_ReadSample)
    int32_t width = 3840;
    int32_t height = 2160;
    memory = OH_AVMemory_Create(width * height);
    if (memory == nullptr) {
        OH_LOG_INFO(LOG_APP, "[ADD_0030] OH_AVMemory_Create failed");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ADD_0030] Memory created successfully");

    const char *file = "/data/storage/el2/base/files/media/test_size_large.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_2, fd);
    if (!(g_initResult)) {
        OH_LOG_INFO(LOG_APP, "[ADD_0030] InitFile failed");
        OH_AVMemory_Destroy(memory);
        memory = nullptr;
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ADD_0030] InitFile success, trackCount=%{public}d", g_trackCount);

    OH_AVCodecBufferAttr attr;
    OH_LOG_INFO(LOG_APP, "[ADD_0030] Calling ReadSample with track 1, expecting AV_ERR_UNKNOWN");
    int result = OH_AVDemuxer_ReadSample(demuxer, 1, memory, &attr);
    OH_LOG_INFO(LOG_APP, "[ADD_0030] ReadSample returned: %{public}d, expected: AV_ERR_UNKNOWN", result);

    OH_AVMemory_Destroy(memory);
    memory = nullptr;

    if (result != AV_ERR_UNKNOWN) {
        OH_LOG_INFO(LOG_APP, "[ADD_0030] Result mismatch!");
        if (fd >= 0) {
            close(fd);
            fd = -1;
        }
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ADD_0030] SUCCESS");
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}