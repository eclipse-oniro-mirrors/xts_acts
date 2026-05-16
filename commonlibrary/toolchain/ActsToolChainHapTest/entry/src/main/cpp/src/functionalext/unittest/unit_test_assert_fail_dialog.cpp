/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <cassert>
#include <info/fatal_message.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <cstring>
#include <cstdlib>
#include <dlfcn.h>
#include <csignal>

#undef assert
#define assert(x) ((void)((x) || (__assert_fail(#x, __FILE__, __LINE__, __func__), 0)))

#define FILE_ABORT "abort.txt"
#define FILE_IGNORE "ignore.txt"
#define FILE_RETRY "retry.txt"
#define ASSERT_ABORT_INFO "ASSERT_ABORT"
#define ASSERT_IGNORE_INFO "ASSERT_IGNORE"
#define ASSERT_RETRY_INFO "ASSERT_RETRY"
#define MAX_FILE_SIZE 1024

typedef enum {
    ASSERT_ABORT = 0,
    ASSERT_IGNORE = 1,
    ASSERT_RETRY = 2
} AssertStatus;

typedef struct {
    const char *expression;
    const char *file;
    int line;
    const char *function;
} AssertFailureInfo;

typedef AssertStatus (*AssertCallback)(AssertFailureInfo);

void WriteToFile(const char *filename, const char *content)
{
    FILE *file = fopen(filename, "w");
    if (file != nullptr) {
        fprintf(file, "%s\n", content);
        fclose(file);
    } else {
        perror("fopen");
    }
}

char* ReadFile(const char *filename)
{
    static char buffer[MAX_FILE_SIZE];
    FILE *file;

    file = fopen(filename, "r");
    if (file == nullptr) {
        perror("fopen");
        return nullptr;
    }
    if (fgets(buffer, sizeof(buffer), file) == nullptr) {
        perror("fgets");
        fclose(file);
        return nullptr;
    }

    fclose(file);
    return buffer;
}

AssertStatus CallbackFunctionAbort(AssertFailureInfo assertFail)
{
    char content[MAX_FILE_SIZE] = ASSERT_ABORT_INFO;
    WriteToFile(FILE_ABORT, content);
    AssertStatus res = ASSERT_ABORT;
    return res;
}

AssertStatus CallbackFunctionIgnore(AssertFailureInfo assertFail)
{
    char content[MAX_FILE_SIZE] = ASSERT_IGNORE_INFO;
    WriteToFile(FILE_IGNORE, content);
    AssertStatus res = ASSERT_IGNORE;
    return res;
}

AssertStatus CallbackFunctionRetry(AssertFailureInfo assertFail)
{
    char content[MAX_FILE_SIZE] = ASSERT_RETRY_INFO;
    WriteToFile(FILE_RETRY, content);
    AssertStatus res = ASSERT_RETRY;
    return res;
}

void ProcessAbort()
{
    typedef void (*SetAssertCallbackFunc)(AssertCallback);
    SetAssertCallbackFunc setAssertCallback =
        (SetAssertCallbackFunc)dlsym(RTLD_DEFAULT, "set_assert_callback");
    if (setAssertCallback) {
        setAssertCallback(CallbackFunctionAbort);
    }
    assert(0);
}

void ProcessIgnore()
{
    typedef void (*SetAssertCallbackFunc)(AssertCallback);
    SetAssertCallbackFunc setAssertCallback =
        (SetAssertCallbackFunc)dlsym(RTLD_DEFAULT, "set_assert_callback");
    if (setAssertCallback) {
        setAssertCallback(CallbackFunctionIgnore);
    }
    assert(0);
}

void ProcessRetry()
{
    typedef void (*SetAssertCallbackFunc)(AssertCallback);
    SetAssertCallbackFunc setAssertCallback =
        (SetAssertCallbackFunc)dlsym(RTLD_DEFAULT, "set_assert_callback");
    if (setAssertCallback) {
        setAssertCallback(CallbackFunctionRetry);
    }
    assert(0);
}

static int UnittestFatalMessageAssertFailDialogTestImpl(void)
{
    signal(SIGUSR1, SIG_DFL);
    pid_t pid1;
    pid_t pid2;
    pid_t pid3;
    int status;

    // Create the first child process
    pid1 = fork();
    if (pid1 < 0) {
        // Failed to create the process
        fprintf(stderr, "Fork failed for Process One\n");
        return 1;
    } else if (pid1 == 0) {
        // Child process one
        ProcessAbort(); // Specific operations for Child Process One can be added here
        return 0;
    }

    // Create the second child process
    pid2 = fork();
    if (pid2 < 0) {
        // Failed to create the process
        fprintf(stderr, "Fork failed for Process Two\n");
        return 1;
    } else if (pid2 == 0) {
        // Child process two
        ProcessIgnore(); // Specific operations for Child Process Two can be added here
        return 0;
    }

    // Create the third child process
    pid3 = fork();
    if (pid3 < 0) {
        // Failed to create the process
        fprintf(stderr, "Fork failed for Process Three\n");
        return 1;
    } else if (pid3 == 0) {
        // Child process three
        ProcessRetry(); // Specific operations for Child Process Three can be added here
        return 0;
    }

    // Wait for all child processes to finish
    waitpid(pid1, &status, 0);
    waitpid(pid2, &status, 0);
    waitpid(pid3, &status, 0);

    char *bufferAbort = ReadFile(FILE_ABORT);
    char *bufferIgnore = ReadFile(FILE_IGNORE);
    char *bufferRetry = ReadFile(FILE_RETRY);

    if (bufferAbort && bufferIgnore && bufferRetry &&
        strcmp(bufferAbort, ASSERT_ABORT_INFO) == 0 &&
        strcmp(bufferIgnore, ASSERT_IGNORE_INFO) == 0 &&
        strcmp(bufferRetry, ASSERT_RETRY_INFO) == 0) {
        printf("All processes finished.\n");
    }

    return 0;
}

int UnittestFatalMessageAssertFailDialogTest(void)
{
    return UnittestFatalMessageAssertFailDialogTestImpl();
}
