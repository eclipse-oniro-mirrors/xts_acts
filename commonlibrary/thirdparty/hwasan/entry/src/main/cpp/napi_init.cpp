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

#include <iostream>
#include <securec.h>
#include <string>
#include <sys/wait.h>
#include <unistd.h>
#include "napi/native_api.h"

constexpr int MAX_BUFFER_SIZE = 128;
constexpr const char *HWASAN_LOG_FILE_PATH = "/data/storage/el2/log/hwasanXtsLog.appspawn";
const int NUMBERTEN = 10;
const int NUMBERELEVEN = 11;
const int NUMBERTWELVE = 12;

static std::string GetBuffer(int pid)
{
    std::string buffer;
    char file[MAX_BUFFER_SIZE];
    int filePathRes = snprintf_s(file, sizeof(file), sizeof(file) - 1, "%s.%d", HWASAN_LOG_FILE_PATH, pid);
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

static bool CheckHWAsanLog(const std::string& errType, const std::string& buffer)
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
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        int a[NUMBERTEN];
        a[NUMBERELEVEN] = 1;
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findHWAsanLog = CheckHWAsanLog("HWAddressSanitizer: tag-mismatch", bufferLog) &&
        CheckHWAsanLog("WRITE of size 4", bufferLog) &&
        CheckHWAsanLog("stack of thread", bufferLog) &&
        CheckHWAsanLog("[08]", bufferLog);
    checkRes = findHWAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) static napi_value StackBufferUnderflow(napi_env env, napi_callback_info info)
{
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        int a[10];
        a[-1] = 1;
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findHWAsanLog = CheckHWAsanLog("HWAddressSanitizer: tag-mismatch", bufferLog) &&
        CheckHWAsanLog("WRITE of size 4", bufferLog) &&
        CheckHWAsanLog("stack of thread", bufferLog) &&
        CheckHWAsanLog("[08]", bufferLog);
    checkRes = findHWAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) static napi_value HeapBufferOverflow(napi_env env, napi_callback_info info)
{
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        char *buffer = (char *)malloc(NUMBERTEN);
        *(buffer + NUMBERTWELVE) = 'n';
        free(buffer);
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findHWAsanLog = CheckHWAsanLog("HWAddressSanitizer: tag-mismatch", bufferLog) &&
        CheckHWAsanLog("WRITE of size 1", bufferLog) &&
        CheckHWAsanLog("heap-buffer-overflow", bufferLog) &&
        CheckHWAsanLog("[0a]", bufferLog);
    checkRes = findHWAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) static napi_value HeapBufferUnderflow(napi_env env, napi_callback_info info)
{
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        char *x = (char*)malloc(NUMBERTEN * sizeof(char));
        memset_s(x, NUMBERTEN * sizeof(char), 0, NUMBERTEN * sizeof(char));
        int res = x[-1];
        free(x);
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findHWAsanLog = CheckHWAsanLog("HWAddressSanitizer: tag-mismatch", bufferLog) &&
        CheckHWAsanLog("READ of size 1", bufferLog) &&
        CheckHWAsanLog("heap-buffer-overflow", bufferLog);
    checkRes = findHWAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) static napi_value HeapUseAfterFree(napi_env env, napi_callback_info info)
{
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        char *x = (char*)malloc(10 * sizeof(char));
        free(x);
        char tmp = x[5];
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findHWAsanLog = CheckHWAsanLog("HWAddressSanitizer: tag-mismatch", bufferLog) &&
        CheckHWAsanLog("use-after-free", bufferLog) &&
        CheckHWAsanLog("READ of size 1", bufferLog) &&
        CheckHWAsanLog("freed by thread", bufferLog);
    checkRes = findHWAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) int* GetLocalPointer()
{
    int num = 10;
    return &num;
}

__attribute__((optnone)) static napi_value StackUseAfterScope(napi_env env, napi_callback_info info)
{
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        int* ptr = GetLocalPointer();
        std::cout << *ptr << std::endl;
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findHWAsanLog = CheckHWAsanLog("HWAddressSanitizer: tag-mismatch", bufferLog) &&
        CheckHWAsanLog("stack of thread", bufferLog) &&
        CheckHWAsanLog("READ of size 4", bufferLog) &&
        CheckHWAsanLog("[00]", bufferLog);
    checkRes = findHWAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) int* Fun()
{
    int a = 3;
    return &a;
}
__attribute__((optnone)) static napi_value StackUseAfterReturn(napi_env env, napi_callback_info info)
{
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        int* p = Fun();
        int c = *p;
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findHWAsanLog = CheckHWAsanLog("HWAddressSanitizer: tag-mismatch", bufferLog) &&
        CheckHWAsanLog("stack of thread", bufferLog) &&
        CheckHWAsanLog("READ of size 4", bufferLog) &&
        CheckHWAsanLog("[00]", bufferLog);
    checkRes = findHWAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) static napi_value DoubleFree(napi_env env, napi_callback_info info)
{
    char *x = (char*)malloc(NUMBERTEN * sizeof(char));
    memset_s(x, NUMBERTEN * sizeof(char), 0, NUMBERTEN * sizeof(char));
    free(x);
    free(x);
    std::string bufferLog = GetBuffer(getpid());
    bool findHWAsanLog = CheckHWAsanLog("HWAddressSanitizer: invalid-free", bufferLog) &&
        CheckHWAsanLog("use-after-free", bufferLog) &&
        CheckHWAsanLog("freed by thread", bufferLog);
    int checkRes = findHWAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) static napi_value WildFree(napi_env env, napi_callback_info info)
{
    int* ptr = new int(1);
    delete ptr;
    delete ptr;
    std::string bufferLog = GetBuffer(getpid());
    bool findHWAsanLog = CheckHWAsanLog("HWAddressSanitizer: invalid-free", bufferLog) &&
        CheckHWAsanLog("use-after-free", bufferLog) &&
        CheckHWAsanLog("freed by thread", bufferLog);
    int checkRes = findHWAsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
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
