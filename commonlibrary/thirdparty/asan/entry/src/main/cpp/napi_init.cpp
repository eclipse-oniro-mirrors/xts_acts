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

#include <securec.h>
#include <string>
#include <unistd.h>
#include "napi/native_api.h"

constexpr int MAX_BUFFER_SIZE = 128;
constexpr const char *ASAN_LOG_FILE_PATH = "/data/storage/el2/log/asanXtsLog.appspawn";
const int NUMFIVE = 5;
const int NUMTEN = 10;
const int NUMELEVEN = 11;
const int NUMTWELVE = 12;
const int NUMNEGATIVEONE = -1;
static std::string GetBuffer(int pid)
{
    std::string buffer;
    char file[MAX_BUFFER_SIZE];
    int filePathRes = snprintf_s(file, sizeof(file), sizeof(file) - 1, "%s.%d", ASAN_LOG_FILE_PATH, pid);
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

static bool CheckAsanLog(const std::string& errType, const std::string& buffer)
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

__attribute__((optnone)) static napi_value StackBufferOverflow(napi_env env, napi_callback_info info)
{
    int a[NUMTEN];
    a[NUMELEVEN] = 1;
    std::string bufferLog = GetBuffer(getpid());
    bool findAsanLog = CheckAsanLog("AddressSanitizer: stack-buffer-overflow", bufferLog) &&
        CheckAsanLog("WRITE of size 4", bufferLog) &&
        CheckAsanLog("thread T0", bufferLog) &&
        CheckAsanLog("'a' (line 84)", bufferLog) &&
        CheckAsanLog("[f2]", bufferLog);
    int checkRes = findAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) static napi_value StackBufferUnderflow(napi_env env, napi_callback_info info)
{
    int a[NUMTEN];
    a[NUMNEGATIVEONE] = 1;
    std::string bufferLog = GetBuffer(getpid());
    bool findAsanLog = CheckAsanLog("AddressSanitizer: stack-buffer-underflow", bufferLog) &&
        CheckAsanLog("WRITE of size 4", bufferLog) &&
        CheckAsanLog("thread T0", bufferLog) &&
        CheckAsanLog("'a' (line 100)", bufferLog) &&
        CheckAsanLog("[f1]", bufferLog);
    int checkRes = findAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, findAsanLog, &result);
    return result;
}

__attribute__((optnone)) static napi_value HeapBufferOverflow(napi_env env, napi_callback_info info)
{
    char *buffer = (char *)malloc(NUMTEN);
    if (buffer != nullptr) {
        *(buffer + NUMTWELVE) = 'n';
    }
    free(buffer);
    std::string bufferLog = GetBuffer(getpid());
    bool findAsanLog = CheckAsanLog("AddressSanitizer: heap-buffer-overflow", bufferLog) &&
        CheckAsanLog("WRITE of size 1", bufferLog) &&
        CheckAsanLog("thread T0", bufferLog) &&
        CheckAsanLog("[02]", bufferLog);
    int checkRes = findAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, findAsanLog, &result);
    return result;
}

__attribute__((optnone)) static napi_value HeapBufferUnderflow(napi_env env, napi_callback_info info)
{
    char *x = (char*)malloc(NUMTEN * sizeof(char));
    memset_s(x, NUMTEN * sizeof(char), 0, NUMTEN * sizeof(char));
    int res = x[NUMNEGATIVEONE];
    free(x);
    std::string bufferLog = GetBuffer(getpid());
    bool findAsanLog = CheckAsanLog("AddressSanitizer: heap-buffer-overflow", bufferLog) &&
        CheckAsanLog("READ of size 1", bufferLog) &&
        CheckAsanLog("thread T0", bufferLog) &&
        CheckAsanLog("[fa]", bufferLog);
    int checkRes = findAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, findAsanLog, &result);
    return result;
}

__attribute__((optnone)) static napi_value HeapUseAfterFree(napi_env env, napi_callback_info info)
{
    char *x = (char*)malloc(NUMTEN * sizeof(char));
    free(x);
    char tmp = x[5];
    std::string bufferLog = GetBuffer(getpid());
    bool findAsanLog = CheckAsanLog("AddressSanitizer: heap-use-after-free", bufferLog) &&
        CheckAsanLog("READ of size 1", bufferLog) &&
        CheckAsanLog("thread T0", bufferLog) &&
        CheckAsanLog("[fd]", bufferLog);
    int checkRes = findAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, findAsanLog, &result);
    return result;
}

volatile int *g_p = nullptr;
__attribute__((optnone)) static napi_value StackUseAfterScope(napi_env env, napi_callback_info info)
{
    {
        int x = 0;
        g_p = &x;
    }
    *g_p = NUMFIVE;
    std::string bufferLog = GetBuffer(getpid());
    bool findAsanLog = CheckAsanLog("AddressSanitizer: stack-use-after-scope", bufferLog) &&
        CheckAsanLog("WRITE of size 4", bufferLog) &&
        CheckAsanLog("thread T0", bufferLog) &&
        CheckAsanLog("'x' (line 169)", bufferLog) &&
        CheckAsanLog("[f8]", bufferLog);
    int checkRes = findAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, findAsanLog, &result);
    return result;
}

__attribute__((optnone)) int* Fun()
{
    int a = 3;
    return &a;
}

__attribute__((optnone)) static napi_value StackUseAfterReturn(napi_env env, napi_callback_info info)
{
    g_p = Fun();
    int c = *g_p;
    std::string bufferLog = GetBuffer(getpid());
    bool findAsanLog = CheckAsanLog("AddressSanitizer: stack-use-after-return", bufferLog) &&
        CheckAsanLog("READ of size 4", bufferLog) &&
        CheckAsanLog("thread T0", bufferLog) &&
        CheckAsanLog("'a' (line 187)", bufferLog) &&
        CheckAsanLog("[f5]", bufferLog);
    int checkRes = findAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, findAsanLog, &result);
    return result;
}

__attribute__((optnone)) static napi_value DoubleFree(napi_env env, napi_callback_info info)
{
    char *x = (char*)malloc(NUMTEN * sizeof(char));
    memset_s(x, NUMTEN * sizeof(char), 0, NUMTEN * sizeof(char));
    int res = x[1];
    free(x);
    free(x);
    std::string bufferLog = GetBuffer(getpid());
    bool findAsanLog = CheckAsanLog("AddressSanitizer: attempting double-free", bufferLog) &&
        CheckAsanLog("in thread T0", bufferLog);
    int checkRes = findAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, findAsanLog, &result);
    return result;
}

__attribute__((optnone)) static napi_value WildFree(napi_env env, napi_callback_info info)
{
    char *x = (char*)malloc(NUMTEN * sizeof(char));
    memset_s(x, NUMTEN * sizeof(char), 0, NUMTEN * sizeof(char));
    int res = x[NUMTEN];
    free(x + NUMFIVE);
    std::string bufferLog = GetBuffer(getpid());
    bool findAsanLog = CheckAsanLog("AddressSanitizer: attempting free on address which was not malloc()", bufferLog) &&
        CheckAsanLog("allocated by thread T0", bufferLog);
    int checkRes = findAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, findAsanLog, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "stackBufferOverflow", nullptr, StackBufferOverflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "stackBufferUnderflow", nullptr, StackBufferUnderflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "heapBufferOverflow", nullptr, HeapBufferOverflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "heapBufferUnderflow", nullptr, HeapBufferUnderflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "heapUseAfterFree", nullptr, HeapUseAfterFree, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "stackUseAfterScope", nullptr, StackUseAfterScope, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "stackUseAfterReturn", nullptr, StackUseAfterReturn, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "doubleFree", nullptr, DoubleFree, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wildFree", nullptr, WildFree, nullptr, nullptr, nullptr, napi_default, nullptr }
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
