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

void AnnotateRWLockAcquired(const char *f, int l, void *m, long isw);

#ifdef __cplusplus
}
#endif

constexpr int MAX_BUFFER_SIZE = 128;
constexpr const char *TSAN_LOG_FILE_PATH = "/data/storage/el2/log/tsanXtsLog.appspawn";

static std::string GetBuffer(int pid)
{
    std::string buffer;
    char file[MAX_BUFFER_SIZE];
    int filePathRes = snprintf_s(file, sizeof(file), sizeof(file) - 1, "%s.%d", TSAN_LOG_FILE_PATH, pid);
    if (filePathRes < 0) {
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

namespace DoubleLockedMutex {
void *ThreadFunc(void *m)
{
    AnnotateRWLockAcquired(__FILE__, __LINE__, m, 1);
    return nullptr;
}

__attribute__((optnone)) static napi_value DoubleLockedMutex(napi_env env, napi_callback_info info)
{
    int m = 0;
    AnnotateRWLockAcquired(__FILE__, __LINE__, &m, 1);
    pthread_t th;
    pthread_create(&th, nullptr, ThreadFunc, &m);
    pthread_join(th, nullptr);
    std::string bufferLog = GetBuffer(getpid());
    bool findTsanLog = CheckTsanLog("ThreadSanitizer: double lock of a mutex", bufferLog) &&
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
        { "doubleLockedMutex", nullptr, DoubleLockedMutex::DoubleLockedMutex, nullptr, nullptr, nullptr,
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
