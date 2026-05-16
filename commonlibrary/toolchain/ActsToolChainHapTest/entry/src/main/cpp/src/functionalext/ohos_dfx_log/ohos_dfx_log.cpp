/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
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
#include <cstdio>
#include <cstring>
#include <dirent.h>
#include <string>
#include <unistd.h>
#include "test.h"

constexpr int MAX_BUFFER_SIZE = 128;
constexpr int LARGE_LOG_LINE_AMOUNT = 5000;
constexpr const char* FAULTLOG_DIR = "/data/log/faultlog/faultlogger/";
constexpr const char* LOG_TAG = "ohos_dfx_log";
constexpr const char* DEFAULT_LOGPATH = "faultlogger";

namespace {
constexpr unsigned K_LOG_POLL_DELAY_US = 500000U;
} // namespace

/* Linker symbol remains ohos_dfx_log for weak resolution with runtime DFX. */
extern "C" __attribute__((weak)) int OhosDfxLog(const char* s, const char* p) asm("ohos_dfx_log");

static void ClearDfxLogs()
{
    DIR* dir;
    struct dirent* ptr;
    dir = opendir(FAULTLOG_DIR);
    if (dir == nullptr) {
        return;
    }
    while ((ptr = readdir(dir)) != nullptr) {
        if (strstr(ptr->d_name, LOG_TAG) != nullptr) {
            char tmp[MAX_BUFFER_SIZE];
            (void)std::snprintf(tmp, MAX_BUFFER_SIZE, "%s/%s", FAULTLOG_DIR, ptr->d_name);
            (void)remove(tmp);
        }
    }
    closedir(dir);
}

static void CheckLogContent(char* file, const char* content)
{
    FILE* fp = fopen(file, "r");
    if (!fp) {
        return;
    }
    if (fseek(fp, 0, SEEK_END) == -1) {
        return;
    }
    int size = ftell(fp);
    if (size <= 0) {
        (void)fclose(fp);
        t_error("FAIL %s size is <=0!\n", file);
        return;
    }

    std::string buffer;
    buffer.resize(size);

    if (fseek(fp, 0, SEEK_SET) == -1) {
        (void)fclose(fp);
        return;
    }
    int rsize = fread(&buffer[0], 1, size, fp);
    if (rsize == 0) {
        (void)fclose(fp);
        return;
    }

    if (buffer.find(content) != std::string::npos) {
        printf("[OhosDfxLog] check pass:\n%s\n", content);
    } else {
        t_error("[OhosDfxLog] failed:\n%s\n", content);
    }

    (void)fclose(fp);
}

static void CheckLog(const char* content)
{
    usleep(K_LOG_POLL_DELAY_US);
    DIR* faultlogDir = opendir(FAULTLOG_DIR);
    if (faultlogDir == nullptr) {
        return;
    }
    struct dirent* ptr;
    while ((ptr = readdir(faultlogDir)) != nullptr) {
        if (strstr(ptr->d_name, LOG_TAG) != nullptr) {
            char tmp[MAX_BUFFER_SIZE];
            (void)std::snprintf(tmp, MAX_BUFFER_SIZE, "%s/%s", FAULTLOG_DIR, ptr->d_name);
            CheckLogContent(tmp, content);
            break;
        }
    }
    closedir(faultlogDir);
}

static void TestAsanLog()
{
    ClearDfxLogs();
    if (&OhosDfxLog) {
        OhosDfxLog("[OhosDfxLog] output something to the log path.\n", DEFAULT_LOGPATH);
        OhosDfxLog("End Asan report\n", DEFAULT_LOGPATH);
        CheckLog("[OhosDfxLog] output something to the log path.\nEnd Asan report");
    } else {
        t_error("[OhosDfxLog] cannot find OhosDfxLog");
    }
}

static void TestHWAsanLog()
{
    ClearDfxLogs();
    if (&OhosDfxLog) {
        OhosDfxLog("[OhosDfxLog] output something to the log path.\n", DEFAULT_LOGPATH);
        OhosDfxLog("End Hwasan report\n", DEFAULT_LOGPATH);
        CheckLog("[OhosDfxLog] output something to the log path.\nEnd Hwasan report");
    } else {
        t_error("[OhosDfxLog] cannot find OhosDfxLog");
    }
}

static void TestTsanLog()
{
    ClearDfxLogs();
    if (&OhosDfxLog) {
        OhosDfxLog("[OhosDfxLog] output something to the log path.\n", DEFAULT_LOGPATH);
        OhosDfxLog("End Tsan report\n", DEFAULT_LOGPATH);
        CheckLog("[OhosDfxLog] output something to the log path.\nEnd Tsan report");
    } else {
        t_error("[OhosDfxLog] cannot find OhosDfxLog");
    }
}

static void TestUbsanLog()
{
    ClearDfxLogs();
    if (&OhosDfxLog) {
        OhosDfxLog("[OhosDfxLog] output something to the log path.\n", DEFAULT_LOGPATH);
        OhosDfxLog("End Ubsan report\n", DEFAULT_LOGPATH);
        CheckLog("[OhosDfxLog] output something to the log path.\nEnd Ubsan report");
    } else {
        t_error("[OhosDfxLog] cannot find OhosDfxLog");
    }
}

static void TestCfiLog()
{
    ClearDfxLogs();
    if (&OhosDfxLog) {
        OhosDfxLog("[OhosDfxLog] output something to the log path.\n", DEFAULT_LOGPATH);
        OhosDfxLog("End CFI report\n", DEFAULT_LOGPATH);
        CheckLog("[OhosDfxLog] output something to the log path.\nEnd CFI report");
    } else {
        t_error("[OhosDfxLog] cannot find OhosDfxLog");
    }
}

static void TestBufferExpand()
{
    ClearDfxLogs();
    if (&OhosDfxLog) {
        for (int i = 0; i < LARGE_LOG_LINE_AMOUNT; ++i) {
            OhosDfxLog("OhosDfxLog output something to the log path OhosDfxLog output something to the log path.\n",
                       DEFAULT_LOGPATH);
        }
        OhosDfxLog("End Asan report\n", DEFAULT_LOGPATH);
        CheckLog("End Asan report");
    } else {
        t_error("[OhosDfxLog] cannot find OhosDfxLog");
    }
}

static int OhosDfxLogTestImpl()
{
    TestAsanLog();
    TestHWAsanLog();
    TestTsanLog();
    TestUbsanLog();
    TestCfiLog();
    TestBufferExpand();
    return T_STATUS;
}

int OhosDfxLogTest(void)
{
    return OhosDfxLogTestImpl();
}
