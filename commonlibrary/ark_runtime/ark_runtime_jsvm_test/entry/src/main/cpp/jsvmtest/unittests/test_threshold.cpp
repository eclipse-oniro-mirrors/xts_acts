/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifdef TEST_THRESHOLD

#include <chrono>
#include <fstream>
#include <sys/types.h>
#include <sys/wait.h>
#include <thread>
#include <unistd.h>

#include "jsvmtest.h"

static bool g_heapThresholdCallbackCalled = false;
static uint64_t g_callbackThreshold = 0;
static void* g_callbackData = nullptr;

void OnHeapThresholdReached(JSVM_VM vm, uint64_t threshold, void* data)
{
    g_heapThresholdCallbackCalled = true;
    g_callbackThreshold = threshold;
    g_callbackData = data;
}

TEST(JSVMHeapThresholdCallbackBasicTest)
{
    g_heapThresholdCallbackCalled = false;
    g_callbackThreshold = 0;
    g_callbackData = nullptr;

    int testData = 0x12345678;

    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, 1024 * 1024, OnHeapThresholdReached, &testData) == JSVM_OK);
    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, 2048 * 1024, OnHeapThresholdReached, &testData) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_ClearHeapThresholdCallback(vm, 1024 * 1024, OnHeapThresholdReached, &testData) == JSVM_OK);
    CHECK(OH_JSVM_ClearHeapThresholdCallback(vm, 1024 * 1024, OnHeapThresholdReached, &testData) == JSVM_INVALID_ARG);
}

TEST(JSVMHeapThresholdCallbackNegativeTest)
{
    int testData = 0x12345678;

    CHECK(OH_JSVM_SetHeapThresholdCallback(nullptr, 1024 * 1024, OnHeapThresholdReached, &testData) ==
        JSVM_INVALID_ARG);
    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, 1024 * 1024, nullptr, &testData) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, 0, OnHeapThresholdReached, &testData) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, UINT64_MAX, OnHeapThresholdReached, &testData) ==
        JSVM_INVALID_ARG);

    CHECK(OH_JSVM_ClearHeapThresholdCallback(nullptr, 1024 * 1024, OnHeapThresholdReached, &testData) ==
        JSVM_INVALID_ARG);
    CHECK(OH_JSVM_ClearHeapThresholdCallback(vm, 1024 * 1024, nullptr, &testData) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_ClearHeapThresholdCallback(vm, 999999, OnHeapThresholdReached, &testData) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_ClearHeapThresholdCallback(vm, 1024 * 1024, OnHeapThresholdReached, &testData) ==
        JSVM_INVALID_ARG);
}

TEST(JSVMHeapThresholdCallbackTriggerTest)
{
    g_heapThresholdCallbackCalled = false;
    g_callbackThreshold = 0;
    g_callbackData = nullptr;

    int testData = 0xDEADBEEF;
    uint64_t smallThreshold = 1024;

    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, smallThreshold, OnHeapThresholdReached, &testData) == JSVM_OK);

    jsvm::TryTriggerGC();
    std::this_thread::sleep_for(std::chrono::milliseconds(100));

    CHECK(g_heapThresholdCallbackCalled == true);
    CHECK(g_callbackThreshold == smallThreshold);
    CHECK(g_callbackData == &testData);

    CHECK(OH_JSVM_ClearHeapThresholdCallback(vm, smallThreshold, OnHeapThresholdReached, &testData) == JSVM_OK);
}

static bool g_selfRemoveCallbackRemoved = false;
static bool g_selfRemoveReAddSucceeded = false;
static int g_selfRemoveTestData1 = 0;
static int g_selfRemoveTestData2 = 0;
static uint64_t g_selfRemoveThreshold = 0;

static void SelfRemoveAndReAddCallback(JSVM_VM vm, uint64_t threshold, void* data)
{
    g_heapThresholdCallbackCalled = true;
    g_callbackThreshold = threshold;
    g_callbackData = data;

    if (!g_selfRemoveCallbackRemoved) {
        g_selfRemoveCallbackRemoved = true;
        int* dataPtr = reinterpret_cast<int*>(data);
        JSVM_Status removeStatus =
            OH_JSVM_ClearHeapThresholdCallback(vm, threshold, SelfRemoveAndReAddCallback, dataPtr);
        if (removeStatus == JSVM_OK) {
            JSVM_Status addStatus =
                OH_JSVM_SetHeapThresholdCallback(vm, threshold, OnHeapThresholdReached, &g_selfRemoveTestData2);
            g_selfRemoveReAddSucceeded = (addStatus == JSVM_OK);
        }
    }
}

TEST(JSVMHeapThresholdCallbackRemoveAndReAddInCallback)
{
    g_heapThresholdCallbackCalled = false;
    g_selfRemoveCallbackRemoved = false;
    g_selfRemoveReAddSucceeded = false;
    g_selfRemoveTestData1 = 0x11111111;
    g_selfRemoveTestData2 = 0x22222222;
    g_selfRemoveThreshold = 1024;

    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, g_selfRemoveThreshold, SelfRemoveAndReAddCallback,
        &g_selfRemoveTestData1) == JSVM_OK);

    jsvm::TryTriggerGC();
    std::this_thread::sleep_for(std::chrono::milliseconds(100));

    CHECK(g_heapThresholdCallbackCalled == true);
    CHECK(g_selfRemoveCallbackRemoved == true);
    CHECK(g_selfRemoveReAddSucceeded == true);

    CHECK(OH_JSVM_ClearHeapThresholdCallback(vm, g_selfRemoveThreshold, OnHeapThresholdReached,
        &g_selfRemoveTestData2) == JSVM_OK);
}

static void WriteBinaryFile(const char* path, const uint8_t* data, size_t byteLength)
{
    std::ofstream outfile(path, std::ofstream::binary);
    outfile.write(reinterpret_cast<const char*>(data), byteLength);
}

static bool g_snapshotStreamCallbackCalled = false;

bool TestOutputStream(const char* data, int size, void* streamData)
{
    g_snapshotStreamCallbackCalled = true;
    WriteBinaryFile("/data/storage/el2/base/test.rawheap", reinterpret_cast<const uint8_t*>(data),
        static_cast<size_t>(size));
    return true;
}

TEST(JSVMTakeRawHeapSnapshotBasicTest)
{
    g_snapshotStreamCallbackCalled = false;
    JSVM_Status status = OH_JSVM_TakeRawHeapSnapshot(vm, TestOutputStream, nullptr);
    CHECK(status == JSVM_OK);
    CHECK(g_snapshotStreamCallbackCalled == true);
}

static bool SnapshotStreamCallback(const char* data, int size, void* streamData)
{
    if (data != nullptr && size > 0) {
        g_snapshotStreamCallbackCalled = true;
    }
    return true;
}

TEST(JSVMTakeRawHeapSnapshotNegativeTest)
{
    CHECK(OH_JSVM_TakeRawHeapSnapshot(nullptr, SnapshotStreamCallback, nullptr) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_TakeRawHeapSnapshot(vm, nullptr, nullptr) == JSVM_INVALID_ARG);
}

static bool g_snapshotTakenPtr = false;

static void SnapshotCallback(JSVM_VM vm, uint64_t threshold, void* data)
{
    g_heapThresholdCallbackCalled = true;
    if (!g_snapshotTakenPtr) {
        g_snapshotTakenPtr = true;
        pid_t pid = fork();
        if (pid < 0) {
            perror("fork failed");
        } else if (pid == 0) {
            CHECK(OH_JSVM_TakeRawHeapSnapshot(vm, SnapshotStreamCallback, nullptr) == JSVM_OK);
            _exit(0);
        }
    }
}

TEST(JSVMHeapThresholdCallbackWithTakeRawHeapSnapshot)
{
    g_heapThresholdCallbackCalled = false;
    g_snapshotTakenPtr = false;

    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, 1024, SnapshotCallback, nullptr) == JSVM_OK);

    jsvm::TryTriggerGC();

    int status;
    pid_t child_pid;
    while ((child_pid = waitpid(-1, &status, WNOHANG)) == 0) {
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }

    CHECK(g_heapThresholdCallbackCalled == true);
    CHECK(OH_JSVM_ClearHeapThresholdCallback(vm, 1024, SnapshotCallback, nullptr) == JSVM_OK);
}

static bool g_syncSnapshotFinished = false;

static bool SyncSnapshotStreamCallback(const char* data, int len, void* stream)
{
    if (len > 0) {
        g_syncSnapshotFinished = true;
    }
    return true;
}

static void SyncSnapshotThresholdCallback(JSVM_VM vm, uint64_t threshold, void* data)
{
    g_heapThresholdCallbackCalled = true;
    CHECK(OH_JSVM_TakeRawHeapSnapshot(vm, SyncSnapshotStreamCallback, nullptr) == JSVM_OK);
}

TEST(JSVMHeapThresholdCallbackWithSyncSnapshot)
{
    g_heapThresholdCallbackCalled = false;
    g_syncSnapshotFinished = false;

    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, 1024, SyncSnapshotThresholdCallback, nullptr) == JSVM_OK);

    jsvm::TryTriggerGC();

    CHECK(g_heapThresholdCallbackCalled == true);
    CHECK(g_syncSnapshotFinished == true);
    CHECK(OH_JSVM_ClearHeapThresholdCallback(vm, 1024, SyncSnapshotThresholdCallback, nullptr) == JSVM_OK);
}

TEST(JSVMHeapThresholdAddCallbackWithOutRemove)
{
    g_heapThresholdCallbackCalled = false;
    g_syncSnapshotFinished = false;

    CHECK(OH_JSVM_SetHeapThresholdCallback(vm, 1024, SyncSnapshotThresholdCallback, nullptr) == JSVM_OK);

    jsvm::TryTriggerGC();

    CHECK(g_heapThresholdCallbackCalled == true);
    CHECK(g_syncSnapshotFinished == true);
}
#endif  // TEST_THRESHOLD
