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

#include <bits/alltypes.h>
#include <thread>
#include <unistd.h>
#include <string>
#include <sys/wait.h>
#include <csignal>
#include <securec.h>
#include <pthread.h>
#include <cstdlib>
#include <cstdio>
#include <semaphore.h>
#include <sched.h>
#include <dirent.h>
#include <sanitizer/tsan_interface.h>
#include "napi/native_api.h"

#ifdef __APPLE__
#include <mach/mach_time.h>
#endif

#if TSAN_VECTORIZE
#include <emmintrin.h>
#include <smmintrin.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

void AnnotateRWLockReleased(const char *f, int l, void *m, long isw);

#ifdef __cplusplus
}
#endif

const unsigned COUNTNUM = 2;
constexpr int MAX_BUFFER_SIZE = 128;

static int FindDirAndCheck(DIR *dir, char *fileResult, int pid)
{
    struct dirent *ptr;
    char file[MAX_BUFFER_SIZE];
    int filenameres = snprintf_s(file, sizeof(file), sizeof(file) - 1, "%s.%s.%d", "tsanXtsLog", "appspawn", pid);
    if (filenameres < 0) {
        return -1;
    }
    while((ptr = readdir(dir)) != NULL) {
        if (strstr(ptr->d_name, file) != NULL) {
            int findRes = snprintf_s(fileResult, MAX_BUFFER_SIZE, MAX_BUFFER_SIZE - 1, "%s/%s",
                "/data/storage/el2/log/", ptr->d_name);
            if (findRes < 0) {
                return -1;
            }
            return 1;
        }
    }
    return -1;
}

static std::string GetBuffer(int pid)
{
    std::string buffer;
    char file[MAX_BUFFER_SIZE];
    DIR *logdir = opendir("/data/storage/el2/log/");
    int findRes = FindDirAndCheck(logdir, file, pid);
    if (findRes < 0) {
        return buffer;
    }
    FILE *fp = fopen(file, "r+");
    if (!fp) {
        return buffer;
    }
    if (fseek(fp, 0, SEEK_END) == -1) {
        return buffer;
    }
    int size = ftell(fp);
    if (size <= 0) {
        ftruncate(fileno(fp), 0);
        rewind(fp);
        fclose(fp);
        return buffer;
    }
    buffer.resize(size);
    if (fseek(fp, 0, SEEK_SET) == -1) {
        ftruncate(fileno(fp), 0);
        rewind(fp);
        fclose(fp);
        return buffer;
    }
    int rsize = fread(&buffer[0], 1, size, fp);
    if (rsize == 0) {
        ftruncate(fileno(fp), 0);
        rewind(fp);
        fclose(fp);
        return buffer;
    }
    ftruncate(fileno(fp), 0);
    rewind(fp);
    fclose(fp);
    return buffer;
}

static bool CheckTsanLog(const std::string& errType, const std::string& buffer)
{
    if (buffer.empty()) {
        return false;
    }
    bool checkEventTypeFail = buffer.find(errType.c_str()) == std::string::npos;
    if (checkEventTypeFail) {
        return false;
    }
    return true;
}

namespace DoubleUnlockedMutex {
__attribute__((optnone)) static napi_value DoubleUnlockedMutex(napi_env env, napi_callback_info info)
{
    int m = 0;
    AnnotateRWLockReleased(__FILE__, __LINE__, &m, 1);
    std::string bufferLog = GetBuffer(getpid());
    bool findTsanLog = CheckTsanLog("ThreadSanitizer: unlock of an unlocked mutex (or by a wrong thread)", bufferLog) &&
        CheckTsanLog("stack of main thread", bufferLog);
    int checkRes = findTsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "doubleUnlockedMutex", nullptr, DoubleUnlockedMutex::DoubleUnlockedMutex, nullptr, nullptr, nullptr,
            napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
