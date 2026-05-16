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

#ifndef CFI_UTIL_H_H
#define CFI_UTIL_H_H

#include <cstdio>
#include <cstring>
#include <dirent.h>
#include <string>
#include <unistd.h>

#include "test.h"

#define FAULTLOG_DIR "/data/log/faultlog/faultlogger/"
#define UBSAN_LOG_TAG "ubsan"
#define DEBUG 0
#define BUFFER_SIZE 4096

static inline bool JoinLogPath(char* out, size_t outSize, const char* dir, const char* name)
{
    const size_t dlen = strlen(dir);
    const size_t nlen = strlen(name);
    if (dlen + 1U + nlen + 1U > outSize) {
        return false;
    }
    std::memcpy(out, dir, dlen);
    out[dlen] = '/';
    std::memcpy(out + dlen + 1U, name, nlen + 1U);
    return true;
}

static void ClearCfiLog(const char* logTag, const char* logDir);
static void FindAndCheck(const char* pattern, const char* logTag, const char* logDir);

static void ShowCfiLogFile()
{
    DIR* dir;
    struct dirent* ptr;
    dir = opendir(FAULTLOG_DIR);
    while ((ptr = readdir(dir)) != NULL) {
        if (strstr(ptr->d_name, UBSAN_LOG_TAG) != NULL) {
            printf("%s: %s\n", FAULTLOG_DIR, ptr->d_name);
        }
    }
    closedir(dir);
}

static void ClearCfiLog()
{
    ClearCfiLog(UBSAN_LOG_TAG, FAULTLOG_DIR);
}

static void ClearCfiLog(const char* logTag, const char* logDir)
{
    DIR* dir;
    struct dirent* ptr;
    dir = opendir(logDir);
    while ((ptr = readdir(dir)) != NULL) {
        if (strstr(ptr->d_name, logTag) != NULL) {
            char tmp[BUFFER_SIZE];
            if (JoinLogPath(tmp, BUFFER_SIZE, logDir, ptr->d_name)) {
                (void)remove(tmp);
            }
        }
    }
    closedir(dir);
}

static void CheckCfiLog(char* file, const char* needle)
{
    if (DEBUG) {
        printf("[cfi checking]:%s\n", file);
    }

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

    if (buffer.find(needle) != std::string::npos) {
        printf("[cfi checking] %s is ok.\n", needle);
    } else {
        t_error("FAIL %s is failed!\n", needle);
    }

    (void)fclose(fp);
}

template <typename CallbackT> static void FindDirAndCheck(DIR* dir, CallbackT&& callback)
{
    FindDirAndCheck(dir, UBSAN_LOG_TAG, FAULTLOG_DIR, callback);
}

template <typename CallbackT>
static void FindDirAndCheck(DIR* dir, const char* logTag, const char* logDir, CallbackT&& callback)
{
    sleep(1);
    struct dirent* ptr;
    while ((ptr = readdir(dir)) != NULL) {
        if (strstr(ptr->d_name, logTag) != NULL) {
            char tmp[BUFFER_SIZE];
            if (JoinLogPath(tmp, BUFFER_SIZE, logDir, ptr->d_name)) {
                callback(tmp);
            }
        }
    }
}

static void FindAndCheck(const char* pattern)
{
    DIR* faultlogDir = opendir(FAULTLOG_DIR);
    auto callback = [=](char* file) { CheckCfiLog(file, pattern); };
    FindDirAndCheck(faultlogDir, callback);
    closedir(faultlogDir);
}

static void FindAndCheck(const char* pattern, const char* logTag, const char* logDir)
{
    DIR* faultlogDir = opendir(logDir);
    auto callback = [=](char* file) { CheckCfiLog(file, pattern); };
    FindDirAndCheck(faultlogDir, logTag, logDir, callback);
    closedir(faultlogDir);
}

static void ExpectCfiOk()
{
    DIR* faultlogDir = opendir(FAULTLOG_DIR);
    auto callback = [](char* file) { t_error("FAIL CFI check failed!\n"); };
    FindDirAndCheck(faultlogDir, callback);
    closedir(faultlogDir);
}

#endif // CFI_UTIL_H_H
