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
#include "include/FuncHelperTest.h"

#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <cmath>
#include <thread>

using namespace std;

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
    if (trackFormat == nullptr) {
        return -1;
    }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &params.tarckType))) {
        return -1;
    }
    OH_AVFormat_Destroy(trackFormat);
    trackFormat = nullptr;

    if ((params.audioIsEnd && (params.tarckType == MEDIA_TYPE_AUD)) ||
        (params.videoIsEnd && (params.tarckType == MEDIA_TYPE_VID))) {
        return 0;
    }
    
    if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &params.attr) != AV_ERR_OK) {
        return -1;
    }
    
    if (params.tarckType == MEDIA_TYPE_AUD) {
        SetAudioValue(params.attr, params.audioIsEnd, params.audioFrame, params.aKeyCount);
    } else if (params.tarckType == MEDIA_TYPE_VID) {
        SetVideoValue(params.attr, params.videoIsEnd, params.videoFrame, params.vKeyCount);
    }
    
    return 0;
}

// 辅助函数：初始化源和解复用器
static int InitDemuxerWithFD(const char *file, int &fd, int64_t offset, int64_t size)
{
    source = OH_AVSource_CreateWithFD(fd, offset, size);
    if (source == nullptr) {
        if (fd >= 0) { close(fd); }
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    return 0;
}

// 辅助函数：处理单音频轨道循环
static int ProcessSingleAudioTrackLoop(OH_AVCodecBufferAttr &attr, bool &audioIsEnd, int &audioFrame, int &keyCount)
{
    while (!audioIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) {
                return -1;
            }
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
    return 0;
}

struct LoopUntilPosParams {
    int pos;
    bool &audioIsEnd;
    bool &videoIsEnd;
    int &count;
    int &tarckType;
    OH_AVCodecBufferAttr &attr;
};

static int ProcessLoopUntilPos3700(LoopUntilPosParams &params)
{
    while (!params.audioIsEnd || !params.videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            if (trackFormat == nullptr ||
                !(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &params.tarckType))) {
                return -1;
            }
            OH_AVFormat_Destroy(trackFormat);
            trackFormat = nullptr;
            if ((params.audioIsEnd && (params.tarckType == MEDIA_TYPE_AUD)) ||
                (params.videoIsEnd && (params.tarckType == MEDIA_TYPE_VID))) {
                continue;
            }
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &params.attr) != AV_ERR_OK) {
                return -1;
            }
            if (params.count == params.pos) {
                SetEndFlag(params.audioIsEnd, params.videoIsEnd);
                break;
            }
            SetVarValue(params.attr, params.tarckType, params.audioIsEnd, params.videoIsEnd);
        }
        params.count++;
    }
    return 0;
}

static int InitSourceAndMemory3700(const char *file, int &fd, int64_t &fileSize)
{
    fd = open(file, O_RDONLY);
    fileSize = GET_FILE_SIZE(file);
    source = OH_AVSource_CreateWithFD(fd, 0, fileSize);
    if (source == nullptr) {
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount)) ||
        g_trackCount != EXPECTED_TRACK_COUNT_DUAL) {
        return -1;
    }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            return -1;
        }
    }
    memory = OH_AVMemory_Create(fileSize);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    return 0;
}

static int ProcessLoopUntilPos3800(int pos, bool &isEnd, int &count, OH_AVCodecBufferAttr &attr)
{
    while (!isEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) {
                return -1;
            }
            if (count == pos || (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS)) {
                isEnd = true;
                break;
            }
            count++;
        }
    }
    return 0;
}

static int ProcessLoopUntilPos3900(int pos, bool &isEnd, int &count, OH_AVCodecBufferAttr &attr)
{
    while (!isEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) {
                return -1;
            }
            if (count == pos) {
                isEnd = true;
                cout << "curr_pts = attr.pts" << endl;
                break;
            }
            if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
                isEnd = true;
            }
            count++;
        }
    }
    return 0;
}

static int InitSourceAndMemory38003900(const char *file, int &fd, int64_t &size)
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
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr ||
        !(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        return -1;
    }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            return -1;
        }
    }
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    return 0;
}

int DemuxerFunction0400()
{
    const char *file = "/data/media/noPermission.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    cout << file << "------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (nullptr != demuxer) { return -1; }

    close(fd);
    return 0;
}

int DemuxerFunction0500()
{
    const char *file = "/data/storage/el2/base/files/media/invalid.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (nullptr == source) {
        close(fd);
        return 0;
    }

    close(fd);
    return -1;
}

int DemuxerFunction0700()
{
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    bool videoIsEnd = false;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
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

    int64_t starttime = 0;
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            trackFormat = OH_AVSource_GetTrackFormat(source, index);
            if (trackFormat == nullptr) { return -1; }
            if (!(OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_TRACK_START_TIME, &starttime))) { return -1; }
            if (starttime != 0) { return -1; }
            if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType))) { return -1; }
            OH_AVFormat_Destroy(trackFormat);
            trackFormat = nullptr;

            if ((audioIsEnd && (tarckType == MEDIA_TYPE_AUD)) ||
                (videoIsEnd && (tarckType == MEDIA_TYPE_VID))) {
                continue;
            }
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }

            SetVarValue(attr, tarckType, audioIsEnd, videoIsEnd);
        }
    }
    close(fd);
    return 0;
}

int DemuxerFunction0800()
{
    const char *file = "/data/storage/el2/base/files/media/avcc_10sec.mp4";
    int fd = open(file, O_RDONLY);
    bool audioIsEnd = false;
    bool videoIsEnd = false;
    int audioFrame = 0;
    int videoFrame = 0;

    DemuxerInitParams initParams = {file, &fd, &source, &demuxer, &sourceFormat, &g_trackCount};
    if (InitDemuxerWithFile(&initParams) != 0) { return -1; }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) {
        close(fd);
        return -1;
    }
    if (SelectAllTracks(demuxer, g_trackCount) != 0) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int aKeyCount = 0;
    int vKeyCount = 0;
    OH_AVCodecBufferAttr attr;
    int tarckType = 0;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (ProcessSingleTrackInLoop(index, params) != 0) {
                return -1;
            }
        }
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_431 || videoFrame != EXPECTED_VIDEO_FRAMES_600 ||
        aKeyCount != EXPECTED_AUDIO_FRAMES_431 || vKeyCount != EXPECTED_KEY_FRAMES_10) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction0900()
{
    const char *file = "/data/storage/el2/base/files/media/hvcc.mp4";
    int fd = open(file, O_RDONLY);
    bool audioIsEnd = false;
    bool videoIsEnd = false;
    int audioFrame = 0;
    int videoFrame = 0;

    DemuxerInitParams initParams = {file, &fd, &source, &demuxer, &sourceFormat, &g_trackCount};
    if (InitDemuxerWithFile(&initParams) != 0) { return -1; }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) {
        close(fd);
        return -1;
    }
    if (SelectAllTracks(demuxer, g_trackCount) != 0) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int aKeyCount = 0;
    int vKeyCount = 0;
    OH_AVCodecBufferAttr attr;
    int tarckType = 0;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (ProcessSingleTrackInLoop(index, params) != 0) {
                return -1;
            }
        }
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_433 || videoFrame != EXPECTED_VIDEO_FRAMES_602 ||
        aKeyCount != EXPECTED_AUDIO_FRAMES_433 || vKeyCount != EXPECTED_KEY_FRAMES_3) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1000()
{
    const char *file = "/data/storage/el2/base/files/media/mpeg2.mp4";
    int fd = open(file, O_RDONLY);
    bool audioIsEnd = false;
    bool videoIsEnd = false;
    int audioFrame = 0;
    int videoFrame = 0;

    DemuxerInitParams initParams = {file, &fd, &source, &demuxer, &sourceFormat, &g_trackCount};
    if (InitDemuxerWithFile(&initParams) != 0) { return -1; }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) {
        close(fd);
        return -1;
    }
    if (SelectAllTracks(demuxer, g_trackCount) != 0) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int aKeyCount = 0;
    int vKeyCount = 0;
    OH_AVCodecBufferAttr attr;
    int tarckType = 0;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (ProcessSingleTrackInLoop(index, params) != 0) {
                return -1;
            }
        }
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_433 || videoFrame != EXPECTED_VIDEO_FRAMES_303 ||
        aKeyCount != EXPECTED_AUDIO_FRAMES_433 || vKeyCount != EXPECTED_KEY_FRAMES_26) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1100()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;

    const char *file = "/data/storage/el2/base/files/media/audio/M4A_48000_1.m4a";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != 1) { return -1; }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int keyCount = 0;
    while (!audioIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }
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

    if (audioFrame != EXPECTED_AUDIO_FRAMES_10293) { return -1; }
    if (keyCount != EXPECTED_AUDIO_FRAMES_10293) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1200()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;

    const char *file = "/data/storage/el2/base/files/media/audio/AAC_48000_1.aac";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != 1) { return -1; }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int keyCount = 0;
    while (!audioIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }
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
    if (audioFrame != EXPECTED_AUDIO_FRAMES_9457) { return -1; }
    if (keyCount != EXPECTED_AUDIO_FRAMES_9457) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1300()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;

    const char *file = "/data/storage/el2/base/files/media/audio/MP3_48000_1.mp3";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != 1) { return -1; }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int keyCount = 0;
    while (!audioIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }
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
    if (audioFrame != EXPECTED_AUDIO_FRAMES_9150) { return -1; }
    if (keyCount != EXPECTED_AUDIO_FRAMES_9150) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1400()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;

    const char *file = "/data/storage/el2/base/files/media/audio/OGG_48000_1.ogg";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != 1) { return -1; }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int keyCount = 0;
    while (!audioIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }
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
    if (audioFrame != EXPECTED_AUDIO_FRAMES_11439) { return -1; }
    if (keyCount != EXPECTED_AUDIO_FRAMES_11439) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1500()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;

    const char *file = "/data/storage/el2/base/files/media/audio/FLAC_48000_1.flac";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != 1) { return -1; }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int keyCount = 0;
    while (!audioIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }
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
    if (audioFrame != EXPECTED_AUDIO_FRAMES_2288) { return -1; }
    if (keyCount != EXPECTED_AUDIO_FRAMES_2288) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1600()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;

    const char *file = "/data/storage/el2/base/files/media/audio/wav_48000_1.wav";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != 1) { return -1; }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int keyCount = 0;
    while (!audioIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }
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
    if (audioFrame != EXPECTED_AUDIO_FRAMES_5146) { return -1; }
    if (keyCount != EXPECTED_AUDIO_FRAMES_5146) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1700()
{
    const char *file = "/data/storage/el2/base/files/media/ts_video.ts";
    int fd = open(file, O_RDONLY);
    bool audioIsEnd = false;
    bool videoIsEnd = false;
    int audioFrame = 0;
    int videoFrame = 0;

    DemuxerInitParams initParams = {file, &fd, &source, &demuxer, &sourceFormat, &g_trackCount};
    if (InitDemuxerWithFile(&initParams) != 0) { return -1; }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) {
        close(fd);
        return -1;
    }
    if (SelectAllTracks(demuxer, g_trackCount) != 0) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int vKeyCount = 0;
    int aKeyCount = 0;
    OH_AVCodecBufferAttr attr;
    int tarckType = 0;
    TrackLoopParams params = {tarckType, attr, audioIsEnd, videoIsEnd, audioFrame, videoFrame, aKeyCount, vKeyCount};
    while (!audioIsEnd || !videoIsEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (ProcessSingleTrackInLoop(index, params) != 0) {
                return -1;
            }
        }
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_384 || aKeyCount != EXPECTED_AUDIO_FRAMES_384 ||
        videoFrame != EXPECTED_VIDEO_FRAMES_602 || vKeyCount != EXPECTED_KEY_FRAMES_51) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1800()
{
    const char *file = "/data/storage/el2/base/files/media/mkv.mkv";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction1900()
{
    const char *file = "/data/storage/el2/base/files/media/zero_track.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != 0) { return -1; }

    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_INVALID_VAL) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction2000()
{
    const char *file1 = "/data/storage/el2/base/files/media/audio/MP3_48000_1.mp3";
    int64_t size1 = GET_FILE_SIZE(file1);
    const char *file = "/data/storage/el2/base/files/media/MP3_avcc_10sec.bin";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    if (fd < 0 || size1 <= 0 || size <= 0) {
        cout << "DEMUXER_FUNCTION_2000: file not found or invalid size" << endl;
        if (fd >= 0) { close(fd); }
        return 0;
    }
    if (InitDemuxerWithFD(file, fd, 0, size1) != 0) {
        close(fd);
        return -1;
    }
    if (g_trackCount != 1) {
        close(fd);
        return -1;
    }
    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            close(fd);
            return -1;
        }
    }
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    int keyCount = 0;
    if (ProcessSingleAudioTrackLoop(attr, audioIsEnd, audioFrame, keyCount) != 0) {
        close(fd);
        return -1;
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_9150 || keyCount != EXPECTED_AUDIO_FRAMES_9150) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction2100()
{
    const char *file1 = "/data/storage/el2/base/files/media/audio/MP3_48000_1.mp3";
    const char *file2 = "/data/storage/el2/base/files/media/avcc_10sec.mp4";
    const char *file = "/data/storage/el2/base/files/media/MP3_avcc_10sec.bin";
    int fd = open(file, O_RDONLY);
    int64_t size1 = GET_FILE_SIZE(file1);
    int64_t size2 = GET_FILE_SIZE(file2);
    int64_t size = GET_FILE_SIZE(file);
    if (fd < 0 || size1 <= 0 || size2 <= 0 || size <= 0) {
        if (fd >= 0) { close(fd); }
        return -1;
    }
    source = OH_AVSource_CreateWithFD(fd, size1, size2);
    if (source == nullptr || CreateDemuxerAndGetTrackCount(source, &demuxer, &sourceFormat, &g_trackCount) != 0 ||
        g_trackCount != EXPECTED_TRACK_COUNT_DUAL || SelectAllTracks(demuxer, g_trackCount) != 0) {
        close(fd);
        return -1;
    }

    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    bool audioIsEnd = false;
    bool videoIsEnd = false;
    int audioFrame = 0;
    int videoFrame = 0;
    int aKeyCount = 0;
    int vKeyCount = 0;
    DualTrackParams params = {&audioIsEnd, &videoIsEnd, &audioFrame, &videoFrame, &aKeyCount, &vKeyCount};
    if (ProcessDualTrackLoop(params) != 0) {
        close(fd);
        return -1;
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_431 || videoFrame != EXPECTED_VIDEO_FRAMES_600 ||
        aKeyCount != EXPECTED_AUDIO_FRAMES_431 || vKeyCount != EXPECTED_KEY_FRAMES_10) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction2200()
{
    const char *file1 = "/data/storage/el2/base/files/media/audio/MP3_48000_1.mp3";
    const char *file = "/data/storage/el2/base/files/media/MP3_OGG_48000_1.bin";
    int fd = open(file, O_RDONLY);
    int64_t size1 = GET_FILE_SIZE(file1);
    int64_t size = GET_FILE_SIZE(file);
    if (fd < 0 || size1 <= 0 || size <= 0) {
        if (fd >= 0) { close(fd); }
        return 0;
    }
    source = OH_AVSource_CreateWithFD(fd, 0, size1);
    if (source == nullptr ||
        CreateDemuxerAndGetTrackCount(source, &demuxer, &sourceFormat, &g_trackCount) != 0 ||
        g_trackCount != 1 || SelectAllTracks(demuxer, g_trackCount) != 0) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    bool audioIsEnd = false;
    int audioFrame = 0;
    int keyCount = 0;
    OH_AVCodecBufferAttr attr;
    if (ProcessSingleAudioTrackLoop(attr, audioIsEnd, audioFrame, keyCount) != 0 ||
        audioFrame != EXPECTED_AUDIO_FRAMES_9150 || keyCount != EXPECTED_AUDIO_FRAMES_9150) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction2300()
{
    const char *file1 = "/data/storage/el2/base/files/media/audio/MP3_48000_1.mp3";
    const char *file2 = "/data/storage/el2/base/files/media/audio/OGG_48000_1.ogg";
    const char *file = "/data/storage/el2/base/files/media/MP3_OGG_48000_1.bin";
    int fd = open(file, O_RDONLY);
    int64_t size1 = GET_FILE_SIZE(file1);
    int64_t size2 = GET_FILE_SIZE(file2);
    int64_t size = GET_FILE_SIZE(file);
    if (fd < 0 || size1 <= 0 || size2 <= 0 || size <= 0) {
        if (fd >= 0) { close(fd); }
        return 0;
    }
    source = OH_AVSource_CreateWithFD(fd, size1, size2);
    if (source == nullptr ||
        CreateDemuxerAndGetTrackCount(source, &demuxer, &sourceFormat, &g_trackCount) != 0 ||
        g_trackCount != 1 || SelectAllTracks(demuxer, g_trackCount) != 0) {
        close(fd);
        return -1;
    }

    InitTestResources();
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    bool audioIsEnd = false;
    int audioFrame = 0;
    int keyCount = 0;
    OH_AVCodecBufferAttr attr;
    if (ProcessSingleAudioTrackLoop(attr, audioIsEnd, audioFrame, keyCount) != 0 ||
        audioFrame != EXPECTED_AUDIO_FRAMES_11439 || keyCount != EXPECTED_AUDIO_FRAMES_11439) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction2400()
{
    const char *file1 = "/data/storage/el2/base/files/media/ts_video.ts";
    const char *file = "/data/storage/el2/base/files/media/test_video_avcc_10sec.bin";
    int fd = open(file, O_RDONLY);
    int64_t size1 = GET_FILE_SIZE(file1);
    int64_t size = GET_FILE_SIZE(file);
    if (fd < 0 || size1 <= 0 || size <= 0) {
        if (fd >= 0) { close(fd); }
        return -1;
    }
    source = OH_AVSource_CreateWithFD(fd, 0, size1);
    if (source == nullptr || CreateDemuxerAndGetTrackCount(source, &demuxer, &sourceFormat, &g_trackCount) != 0 ||
        g_trackCount != EXPECTED_TRACK_COUNT_DUAL || SelectAllTracks(demuxer, g_trackCount) != 0) {
        close(fd);
        return -1;
    }

    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    bool audioIsEnd = false;
    bool videoIsEnd = false;
    int audioFrame = 0;
    int videoFrame = 0;
    int aKeyCount = 0;
    int vKeyCount = 0;
    DualTrackParams params = {&audioIsEnd, &videoIsEnd, &audioFrame, &videoFrame, &aKeyCount, &vKeyCount};
    if (ProcessDualTrackLoop(params) != 0) {
        return -1;
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_384 || videoFrame != EXPECTED_VIDEO_FRAMES_602 ||
        aKeyCount != EXPECTED_AUDIO_FRAMES_384 || vKeyCount != EXPECTED_KEY_FRAMES_51) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction3100()
{
    uint32_t trackIndex = 0;
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = 0;
    int64_t size = 0;
    
    if (InitDemuxerSimple(file, fd, size) != 0) { return -1; }
    cout << g_trackCount << "####################" << endl;
    if (SelectAllTracksSimple() != 0) { return -1; }
    
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int pos = GetSecureRandomInt(250);
    int64_t startPts = 0;
    if (ReadSamplesToPosition(trackIndex, pos, startPts) != 0) { return -1; }
    
    if (OH_AVDemuxer_SeekToTime(demuxer, startPts / TIME_DIVISOR_1000,
        SEEK_MODE_PREVIOUS_SYNC) != AV_ERR_OK) { return -1; }
    if (OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr) != AV_ERR_OK) { return -1; }
    if (startPts != attr.pts) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction3200()
{
    uint32_t trackIndex = 0;
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = 0;
    int64_t size = 0;
    
    if (InitDemuxerSimple(file, fd, size) != 0) { return -1; }
    if (SelectAllTracksSimple() != 0) { return -1; }
    
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int pos = GetSecureRandomInt(250);
    int64_t startPts = 0;
    if (ReadSamplesToPosition(trackIndex, pos, startPts) != 0) { return -1; }

    if (OH_AVDemuxer_SeekToTime(demuxer, startPts / TIME_DIVISOR_1000, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) { return -1; }
    if (OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr) != AV_ERR_OK) { return -1; }
    if (startPts != attr.pts) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction3300()
{
    uint32_t trackIndex = 0;
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = 0;
    int64_t size = 0;
    
    if (InitDemuxerSimple(file, fd, size) != 0) { return -1; }
    if (SelectAllTracksSimple() != 0) { return -1; }
    
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int pos = GetSecureRandomInt(250);
    int64_t startPts = 0;
    if (ReadSamplesToPosition(trackIndex, pos, startPts) != 0) { return -1; }
    
    if (OH_AVDemuxer_SeekToTime(demuxer, startPts / TIME_DIVISOR_1000,
        SEEK_MODE_CLOSEST_SYNC) != AV_ERR_OK) { return -1; }
    if (OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr) != AV_ERR_OK) { return -1; }
    if (startPts != attr.pts) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction3400()
{
    bool isEnd = false;
    uint32_t trackIndex = 1;
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int count = 0;
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    cout << g_trackCount << "####################" << endl;

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int64_t endPts = 0;
    while (!isEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }

            if (static_cast<uint32_t>(index) != trackIndex) {
                continue;
            }
            if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
                isEnd = true;
                cout << "is end!!!!!!!!" << endl;
            } else {
                endPts = attr.pts;
            }
            count++;
        }
        cout << "count: " << count << endl;
    }
    if (OH_AVDemuxer_SeekToTime(demuxer, endPts / TIME_DIVISOR_1000,
        SEEK_MODE_PREVIOUS_SYNC) != AV_ERR_OK) { return -1; }
    if (OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr) != AV_ERR_OK) { return -1; }
    if (endPts != attr.pts) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction3500()
{
    uint32_t trackIndex = 1;
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = 0;
    int64_t size = 0;
    
    if (InitDemuxerSimple(file, fd, size) != 0) { return -1; }
    cout << g_trackCount << "####################" << endl;
    if (SelectAllTracksSimple() != 0) { return -1; }
    
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    
    int64_t endPts = 0;
    bool isEnd = false;
    while (!isEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }
            if (static_cast<uint32_t>(index) != trackIndex) {
                continue;
            }
            if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
                isEnd = true;
            } else {
                endPts = attr.pts;
            }
        }
    }
    
    if (OH_AVDemuxer_SeekToTime(demuxer, endPts / TIME_DIVISOR_1000, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) { return -1; }
    endPts += TIME_INCREMENT_1000;
    if (OH_AVDemuxer_SeekToTime(demuxer, endPts / TIME_DIVISOR_1000, SEEK_MODE_NEXT_SYNC) !=
        AV_ERR_UNKNOWN) { return -1; }
    endPts += TIME_INCREMENT_1000000;
    if (OH_AVDemuxer_SeekToTime(demuxer, endPts / TIME_DIVISOR_1000, SEEK_MODE_NEXT_SYNC) !=
        AV_ERR_OPERATE_NOT_PERMIT) { return -1; }
    if (OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr) != AV_ERR_OK) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction3600()
{
    bool isEnd = false;
    uint32_t trackIndex = 1;
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int count = 0;
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    cout << g_trackCount << "####################" << endl;

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }

    int64_t endPts = 0;
    while (!isEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }
            if (static_cast<uint32_t>(index) != trackIndex) {
                continue;
            }
            if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
                isEnd = true;
                cout << "is end!!!!!!!!" << endl;
            } else {
                endPts = attr.pts;
            }
            count++;
        }
        cout << "count: " << count << endl;
    }
    if (OH_AVDemuxer_SeekToTime(demuxer, endPts / TIME_DIVISOR_1000,
        SEEK_MODE_CLOSEST_SYNC) != AV_ERR_OK) { return -1; }
    if (OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr) != AV_ERR_OK) { return -1; }
    if (endPts != attr.pts) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction3700()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd;
    int64_t fileSize;
    int pos = GetSecureRandomInt(250);
    int posTo = GetSecureRandomInt(250);
    int64_t toMs = posTo * 40000;
    
    if (InitSourceAndMemory3700(file, fd, fileSize) != 0) {
        return -1;
    }
    cout << file << "pos: " << pos << "toMs: " << toMs << " fd:" << fd << " size:" << fileSize << endl;
    
    bool audioIsEnd = false;
    bool videoIsEnd = false;
    int count = 0;
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    LoopUntilPosParams loopParams = {pos, audioIsEnd, videoIsEnd, count, tarckType, attr};
    if (ProcessLoopUntilPos3700(loopParams) != 0) {
        close(fd);
        return -1;
    }
    if (OH_AVDemuxer_SeekToTime(demuxer, toMs / TIME_DIVISOR_1000, SEEK_MODE_PREVIOUS_SYNC) != AV_ERR_OK ||
        OH_AVDemuxer_ReadSample(demuxer, 1, memory, &attr) != AV_ERR_OK ||
        abs(toMs - attr.pts) >= TIME_TOLERANCE_40000) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction3800()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd;
    int64_t size;
    if (InitSourceAndMemory38003900(file, fd, size) != 0) {
        return -1;
    }
    
    int pos = GetSecureRandomInt(250);
    int posTo = GetSecureRandomInt(250);
    int64_t toMs = posTo * TIME_TOLERANCE_40000;
    bool isEnd = false;
    int count = 0;
    OH_AVCodecBufferAttr attr;
    
    if (ProcessLoopUntilPos3800(pos, isEnd, count, attr) != 0) {
        close(fd);
        return -1;
    }
    if (OH_AVDemuxer_SeekToTime(demuxer, toMs / TIME_DIVISOR_1000, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK ||
        OH_AVDemuxer_ReadSample(demuxer, 1, memory, &attr) != AV_ERR_OK ||
        abs(toMs - attr.pts) >= TIME_TOLERANCE_40000) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction3900()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd;
    int64_t size;
    if (InitSourceAndMemory38003900(file, fd, size) != 0) {
        return -1;
    }
    
    int pos = GetSecureRandomInt(250);
    int posTo = GetSecureRandomInt(250);
    int64_t toMs = posTo * TIME_TOLERANCE_40000;
    bool isEnd = false;
    int count = 0;
    OH_AVCodecBufferAttr attr;
    
    if (ProcessLoopUntilPos3900(pos, isEnd, count, attr) != 0) {
        close(fd);
        return -1;
    }
    if (OH_AVDemuxer_SeekToTime(demuxer, toMs / TIME_DIVISOR_1000, SEEK_MODE_CLOSEST_SYNC) != AV_ERR_OK ||
        OH_AVDemuxer_ReadSample(demuxer, 1, memory, &attr) != AV_ERR_OK ||
        abs(toMs - attr.pts) >= TIME_TOLERANCE_40000) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction4000()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) { return -1; }

    if (demuxer == nullptr) { return -1; }
    int64_t invalidPts = 12000 * 16666;
    ret = OH_AVDemuxer_SeekToTime(demuxer, invalidPts, SEEK_MODE_CLOSEST_SYNC);
    if (AV_ERR_OK == ret) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction4100()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    ret = OH_AVDemuxer_UnselectTrackByID(demuxer, 0);
    if (ret != AV_ERR_OK) { return -1; }
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    if (ret != AV_ERR_OK) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction4200()
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    bool isEnd = false;

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
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    while (!isEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            if (OH_AVDemuxer_ReadSample(demuxer, index, memory, &attr) != AV_ERR_OK) { return -1; }
            if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
                isEnd = true;
                cout << "is end !!!!!!!!!!!!!!!" << endl;
            }
        }
    }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_UnselectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    int32_t memorySize = OH_AVMemory_GetSize(memory);
    if (memorySize == 0) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction4300()
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    bool isEnd = false;
    int count = 0;
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
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    int pos = GetSecureRandomInt(250);
    cout << " pos= " << pos << endl;
    while (!isEnd) {
        for (int32_t index = 0; index < g_trackCount; index++) {
            SampleProcessParams sampleParams = {demuxer, index, memory, &attr, count, pos, &isEnd};
            if (!ProcessSample4300(sampleParams)) {
                return -1;
            }
            if (count != pos) {
                count++;
                continue;
            }
            break;
        }
    }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_UnselectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }

    int32_t memorySize = OH_AVMemory_GetSize(memory);
    if (memorySize == 0) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction4400()
{
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";

    int audioCount = 0;
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
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    int pos = GetSecureRandomInt(250);
    cout << " pos= " << pos << endl;

    bool reachedPos = false;
    while (!reachedPos) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        if (OH_AVDemuxer_ReadSample(demuxer, 1, memory, &attr) != AV_ERR_OK) { return -1; }
        if (audioCount == pos) {
            cout << audioCount << " audioCount == pos remove audio track!!!!!!!!!" << endl;
            if (OH_AVDemuxer_UnselectTrackByID(demuxer, 1) != AV_ERR_OK) { return -1; }
            if (OH_AVDemuxer_ReadSample(demuxer, 1, memory, &attr) == AV_ERR_OK) { return -1; }
            if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
            reachedPos = true;
            break;
        }
        audioCount++;
    }

    bool isEnd = false;
    while (!isEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        if (attr.flags & OH_AVCodecBufferFlags::AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "is end !!!!!!!!!!!!!!!" << endl;
            isEnd = true;
            break;
        }
    }
    close(fd);
    return 0;
}

int DemuxerFunction4500()
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t trackIndex = 0;
    OH_AVCodecBufferAttr attr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
    if (AV_ERR_OPERATE_NOT_PERMIT != ret) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction7000()
{
    OH_AVFormat *trackFormat2 = nullptr;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    cout << OH_AVFormat_DumpInfo(sourceFormat) << "sourceFormat" << endl;

    trackFormat = OH_AVSource_GetTrackFormat(source, 1);
    if (trackFormat == nullptr) { return -1; }
    cout << OH_AVFormat_DumpInfo(trackFormat) << "trackformat1" << endl;

    trackFormat2 = OH_AVSource_GetTrackFormat(source, 0);
    cout << OH_AVFormat_DumpInfo(trackFormat2) << "trackformat0" << endl;
    OH_AVFormat_Destroy(trackFormat2);
    trackFormat2 = nullptr;
    close(fd);
    return 0;
}

int DemuxerFunction7100()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != EXPECTED_TRACK_COUNT_DUAL) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction7200()
{
    const char *stringVal;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) { return -1; }
    if (OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_AAC_IS_ADTS, &stringVal)) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction7300()
{
    int64_t br = 0;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetLongValue(trackFormat, OH_MD_KEY_BITRATE, &br))) { return -1; }
    if (br != EXPECTED_BITRATE_319999) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction7400()
{
    int32_t cc = 0;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, &cc))) { return -1; }

    if (cc != EXPECTED_CHANNEL_COUNT_2) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction7500()
{
    int32_t sr = 0;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_AUD_SAMPLE_RATE, &sr))) { return -1; }
    if (sr != EXPECTED_SAMPLE_RATE_44100) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction7600()
{
    int32_t height = 0;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    trackFormat = OH_AVSource_GetTrackFormat(source, 1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_HEIGHT, &height))) { return -1; }
    if (height != 0) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction7700()
{
    int32_t weight = 0;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    trackFormat = OH_AVSource_GetTrackFormat(source, 1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_WIDTH, &weight))) { return -1; }
    if (weight != 0) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction7800()
{
    const char *stringVal;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    trackFormat = OH_AVSource_GetTrackFormat(source, 1);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &stringVal))) { return -1; }
    if (strcmp(stringVal, OH_AVCODEC_MIMETYPE_VIDEO_MPEG4) != 0) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction7900()
{
    int32_t type = 0;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &type))) { return -1; }

    if (MEDIA_TYPE_AUD != type) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8000()
{
    const char *stringVal;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_TITLE, &stringVal))) { return -1; }
    if (strcmp(stringVal, "title") != 0) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8100()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_ALBUM, &stringVal)) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8200()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_ALBUM_ARTIST, &stringVal)) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8300()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_DATE, &stringVal))) { return -1; }
    if (strcmp(stringVal, "2023") != 0) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8400()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_COMMENT, &stringVal))) { return -1; }
    if (strcmp(stringVal, "COMMENT") != 0) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8500()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_GENRE, &stringVal))) { return -1; }
    if (strcmp(stringVal, "Classical") != 0) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8600()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_COPYRIGHT, &stringVal)) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8700()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_LANGUAGE, &stringVal)) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8800()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_DESCRIPTION, &stringVal)) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction8900()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_LYRICS, &stringVal)) { return -1; }
    close(fd);
    return 0;
}

int DemuxerFunction9000()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) { return -1; }
    const char *stringVal;
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_ARTIST, &stringVal))) { return -1; }
    if (strcmp(stringVal, "sam") != 0) { return -1; }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction0200()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/audio/amr_nb_8000_1.amr";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != 1) { return -1; }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) { return -1; }
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    int aKeyCount = 0;
    while (!audioIsEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
    }
    cout << file << "audioFrame " << audioFrame <<   "   aKeyCount " << aKeyCount  << endl;
    if (audioFrame != EXPECTED_AUDIO_FRAMES_1501) { return -1; }
    if (aKeyCount != EXPECTED_AUDIO_FRAMES_1501) { return -1; }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction0300()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/audio/amr_wb_16000_1.amr";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) { return -1; }
    if (g_trackCount != 1) { return -1; }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) { return -1; }
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    int aKeyCount = 0;
    while (!audioIsEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
    }
    cout << file << "audioFrame " << audioFrame <<  "   aKeyCount " << aKeyCount << endl;
    if (audioFrame != EXPECTED_AUDIO_FRAMES_1500) { return -1; }
    if (aKeyCount != EXPECTED_AUDIO_FRAMES_1500) { return -1; }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction1000()
{
    const char *file = "/data/storage/el2/base/files/media/audio/amr_nb_8000_1.amr";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) { return -1; }
    const char *codecMime = "";
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &codecMime))) { return -1; }
    cout << "codecMime" << codecMime << endl;
    if (strcmp(codecMime, OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB) != 0) { return -1; }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction1100()
{
    const char *file = "/data/storage/el2/base/files/media/audio/amr_wb_16000_1.amr";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) { return -1; }
    const char *codecMime = "";
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &codecMime))) { return -1; }
    cout << "codecMime" << codecMime << endl;
    if (strcmp(codecMime, OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB) != 0) { return -1; }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction1200()
{
    if (access(HEVC_LIB_PATH.c_str(), F_OK) != 0) { return 0; }
    
    const char *file = "/data/storage/el2/base/files/media/hevc_v_a.ts";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (!(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount)) ||
        g_trackCount != EXPECTED_TRACK_COUNT_DUAL) { return -1; }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) { return -1; }
    }
    
    bool audioIsEnd = false;
    bool videoIsEnd = false;
    int audioFrame = 0;
    int videoFrame = 0;
    int aKeyCount = 0;
    int vKeyCount = 0;
    DualTrackParams params = {&audioIsEnd, &videoIsEnd, &audioFrame, &videoFrame, &aKeyCount, &vKeyCount};
    if (ProcessDualTrackLoop(params) != 0) {
        return -1;
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_384 || aKeyCount != EXPECTED_AUDIO_FRAMES_384 ||
        videoFrame != EXPECTED_VIDEO_FRAMES_602 || vKeyCount != EXPECTED_KEY_FRAMES_3) { return -1; }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction1300()
{
    if (access(HEVC_LIB_PATH.c_str(), F_OK) != 0) {
        return 0;
    }
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/hevc_v.ts";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) { return -1; }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) { return -1; }

    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) { return -1; }
    int vKeyCount = 0;
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, 0);
        if (trackFormat == nullptr) { return -1; }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType))) { return -1; }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
        if (videoIsEnd && (tarckType == MEDIA_TYPE_VID)) {
            continue;
        }
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) { return -1; }
        SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
    }
    if (videoFrame != EXPECTED_VIDEO_FRAMES_602) { return -1; }
    if (vKeyCount != EXPECTED_KEY_FRAMES_3) { return -1; }
    close(fd);
    return 0;
}