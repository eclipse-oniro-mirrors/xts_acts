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
#include <multimedia/player_framework/native_avbuffer.h>

#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>

using namespace std;

// 测试预期值常量定义
static constexpr int32_t MEMORY_BUFFER_WIDTH = 3840;
static constexpr int32_t MEMORY_BUFFER_HEIGHT = 2160;
static constexpr int INVALID_FD_2 = 2;
static constexpr int INVALID_FD_3 = 3;

static int32_t g_width = MEMORY_BUFFER_WIDTH;
static int32_t g_height = MEMORY_BUFFER_HEIGHT;
static OH_AVMemory *memory = nullptr;
static OH_AVBuffer *buffer = nullptr;
static OH_AVSource *source = nullptr;
static OH_AVDemuxer *demuxer = nullptr;
static int g_fd1 = 0;
static int64_t g_size = 0;
const char *FILE1 = "/data/storage/el2/base/files/media/01_video_audio.mp4";
const char *FILE2 = "/data/storage/el2/base/files/media/avcc_10sec.mp4";

static void TestSetUp()
{
    memory = OH_AVMemory_Create(g_width * g_height);
    buffer = OH_AVBuffer_Create(g_width * g_height);
    g_fd1 = open(FILE1, O_RDONLY);

    struct stat fileStatus {};
    if (stat(FILE1, &fileStatus) == 0) {
        g_size = static_cast<int64_t>(fileStatus.st_size);
    }
    source = OH_AVSource_CreateWithFD(g_fd1, 0, g_size);
    std::cout << g_fd1 << "----------" << FILE1 << "=====" << g_size << std::endl;
}

static void TestTearDown()
{
    if (g_fd1 > 0) {
        close(g_fd1);
        g_fd1 = 0;
    }
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

int OhAvSourceCreateWithDataSource0100()
{
    TestSetUp();
    source = OH_AVSource_CreateWithDataSource(nullptr);
    if (source != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int OhAvSourceCreateWithDataSourceExt0100()
{
    TestSetUp();
    OH_AVSource* source_local = OH_AVSource_CreateWithDataSourceExt(nullptr, nullptr);
    if (source_local != nullptr) {
        TestTearDown();
        return -1;
    }

    OH_AVDataSourceExt dataSourceExt = {1000, nullptr};
    source_local = OH_AVSource_CreateWithDataSourceExt(&dataSourceExt, nullptr);
    if (source_local != nullptr) {
        TestTearDown();
        return -1;
    }

    int dummy = 123;
    source_local = OH_AVSource_CreateWithDataSourceExt(nullptr, &dummy);
    if (source_local != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara0100()
{
    TestSetUp();
    source = OH_AVSource_CreateWithURI(nullptr);
    if (source != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara0200()
{
    TestSetUp();
    source = OH_AVSource_CreateWithFD(INVALID_FD_2, 0, 0);
    if (source != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara0700()
{
    TestSetUp();
    source = OH_AVSource_CreateWithFD(INVALID_FD_3, 0, -1);
    if (source != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara0800()
{
    TestSetUp();
    source = OH_AVSource_CreateWithFD(INVALID_FD_3, -1, 1);
    if (source != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara0300()
{
    TestSetUp();
    if (OH_AVSource_Destroy(nullptr) != AV_ERR_INVALID_VAL) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara0400()
{
    TestSetUp();
    OH_AVFormat *format = OH_AVSource_GetSourceFormat(nullptr);
    if (format != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara0500()
{
    TestSetUp();
    OH_AVFormat *format = OH_AVSource_GetTrackFormat(nullptr, 0);
    if (format != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara0600()
{
    TestSetUp();
    source = OH_AVSource_CreateWithFD(g_fd1, 0, g_size);
    if (source == nullptr) {
        TestTearDown();
        return -1;
    }
    OH_AVFormat *format = OH_AVSource_GetTrackFormat(source, -1);
    if (format != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara2300()
{
    TestSetUp();
    source = OH_AVSource_CreateWithFD(g_fd1, 0, 0);
    if (source != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara0900()
{
    TestSetUp();
    demuxer = OH_AVDemuxer_CreateWithSource(nullptr);
    if (demuxer != nullptr) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara1000()
{
    TestSetUp();
    if (OH_AVDemuxer_Destroy(nullptr) != AV_ERR_INVALID_VAL) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara1100()
{
    TestSetUp();
    if (OH_AVDemuxer_SelectTrackByID(nullptr, 0) != AV_ERR_INVALID_VAL) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara1200()
{
    TestSetUp();
    source = OH_AVSource_CreateWithFD(g_fd1, 0, g_size);
    if (source == nullptr) {
        TestTearDown();
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (OH_AVDemuxer_SelectTrackByID(demuxer, -1) != AV_ERR_INVALID_VAL) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara1300()
{
    TestSetUp();
    if (OH_AVDemuxer_UnselectTrackByID(nullptr, 0) != AV_ERR_INVALID_VAL) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara1400()
{
    TestSetUp();
    source = OH_AVSource_CreateWithFD(g_fd1, 0, g_size);
    if (source == nullptr) {
        TestTearDown();
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        TestTearDown();
        return -1;
    }
    if (OH_AVDemuxer_UnselectTrackByID(demuxer, -1) != AV_ERR_OK) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara1500()
{
    TestSetUp();
    uint32_t trackIndex = 0;
    OH_AVCodecBufferAttr bufferAttr;
    if (OH_AVDemuxer_ReadSample(nullptr, trackIndex, memory, &bufferAttr) != AV_ERR_INVALID_VAL) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara1600()
{
    TestSetUp();
    uint32_t trackIndex = -1;
    OH_AVCodecBufferAttr bufferAttr;
    source = OH_AVSource_CreateWithFD(g_fd1, 0, g_size);
    if (source == nullptr) {
        TestTearDown();
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        TestTearDown();
        return -1;
    }
    if (OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &bufferAttr) != AV_ERR_OPERATE_NOT_PERMIT) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}

int DemuxerIllegalPara1700()
{
    TestSetUp();
    uint32_t trackIndex = 0;
    OH_AVMemory *memory1 = OH_AVMemory_Create(2);
    OH_AVCodecBufferAttr bufferAttr;
    source = OH_AVSource_CreateWithFD(g_fd1, 0, g_size);
    if (source == nullptr) {
        TestTearDown();
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        TestTearDown();
        return -1;
    }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) {
        TestTearDown();
        return -1;
    }
    if (OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory1, &bufferAttr) != AV_ERR_NO_MEMORY) {
        OH_AVMemory_Destroy(memory1);
        TestTearDown();
        return -1;
    }

    OH_AVMemory_Destroy(memory1);
    TestTearDown();
    return 0;
}

int DemuxerApi0200()
{
    TestSetUp();
    OH_AVSource *source1 = OH_AVSource_CreateWithFD(g_fd1, 0, g_size);
    if (source1 == nullptr) {
        TestTearDown();
        return -1;
    }
    int fd2 = open(FILE2, O_RDONLY);
    int64_t size2 = 0;

    struct stat fileStatus {};
    if (stat(FILE2, &fileStatus) == 0) {
        size2 = static_cast<int64_t>(fileStatus.st_size);
    }

    OH_AVSource *source2 = OH_AVSource_CreateWithFD(fd2, 0, size2);
    cout << size2 << "------------------" << endl;
    if (source2 == nullptr) {
        close(fd2);
        TestTearDown();
        return -1;
    }
    if (OH_AVSource_Destroy(source1) != AV_ERR_OK) {
        close(fd2);
        TestTearDown();
        return -1;
    }
    if (OH_AVSource_Destroy(source2) != AV_ERR_OK) {
        close(fd2);
        TestTearDown();
        return -1;
    }
    source1 = nullptr;
    source2 = nullptr;
    close(fd2);
    TestTearDown();
    return 0;
}

int DemuxerApi1100()
{
    TestSetUp();
    OH_AVErrCode ret = AV_ERR_OK;
    source = OH_AVSource_CreateWithFD(g_fd1, 0, g_size);
    if (source == nullptr) {
        TestTearDown();
        return -1;
    }

    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        TestTearDown();
        return -1;
    }
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    if (ret != AV_ERR_OK) {
        TestTearDown();
        return -1;
    }
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    if (ret != AV_ERR_OK) {
        TestTearDown();
        return -1;
    }
    TestTearDown();
    return 0;
}
