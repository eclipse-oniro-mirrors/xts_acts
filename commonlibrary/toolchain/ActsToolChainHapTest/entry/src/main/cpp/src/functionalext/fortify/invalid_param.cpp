/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <cerrno>
#include <csignal>
#include <pthread.h>
#include <sys/wait.h>
#include <cstdio>
#include <pthread.h>
#include <climits>
#include <clocale>
#include <cwchar>
#include <cstdlib>
#include <dirent.h>
#include <utime.h>
#include "functionalext.h"

static int Compare(const void *p, const void *q)
{
    return (*(int *)p - *(int *)q);
}
/**
 * @tc.name      : clearerr_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Clearerr0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("clearerr_0100: Error forking process");
    } else if (pid == 0) {
        clearerr(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("clearerr_0200", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : feof_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Feof0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("feof_0100: Error forking process");
    } else if (pid == 0) {
        feof(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("feof_0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : ferror_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Ferror0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("ferror_0100: Error forking process");
    } else if (pid == 0) {
        ferror(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("ferror_0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : fgetc_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
void Fgetc0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("fgetc_0100: Error forking process");
    } else if (pid == 0) {
        fgetc(nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("fgetc_0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : fgets_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Fgets0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("fgets_0100: Error forking process");
    } else if (pid == 0) {
        char buffer[32];
        fgets(buffer, sizeof(buffer), nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("fgets_0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : fprintf_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Fprintf0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("fprintf_0100: Error forking process");
    } else if (pid == 0) {
        char str[] = "test";
        fprintf(nullptr, "%s", str);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("fprintf_0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : fputc_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Fputc0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("fputc_0100: Error forking process");
    } else if (pid == 0) {
        fputc('a', nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("fputc_0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : fputs_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Fputs0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("fputs_0100: Error forking process");
    } else if (pid == 0) {
        fputs("", nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("fputs_0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : fread_0600
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Fread0600(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("fread_0600: Error forking process");
    } else if (pid == 0) {
        char buffer[1024];
        fread(buffer, sizeof(char), sizeof(buffer), nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("fread_0600", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : fscanf_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Fscanf0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("fscanf_0100: Error forking process");
    } else if (pid == 0) {
        char buffer[1024];
        fscanf(nullptr, "%s", buffer);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("fscanf_0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : fseek_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Fseek0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("fseek_0100: Error forking process");
    } else if (pid == 0) {
        char buffer[1024];
        fseek(nullptr, 0L, SEEK_END);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("fseek_0100", SIGABRT, sig);
        }
    }
}

/**
 * @tc.name      : fseeko_0100
 * @tc.desc      : Verify clearerr with invalid parameter
 * @tc.level     : Level 2
 */
static void Fseeko0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("fseeko_0100: Error forking process");
    } else if (pid == 0) {
        fseeko(nullptr, 0L, SEEK_END);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("fseeko_0100", SIGABRT, sig);
        }
    }
}

static int InvalidParamTestImpl(int argc, char *argv[])
{
    Clearerr0100();
    Feof0100();
    Ferror0100();
    Fgetc0100();
    Fgets0100();
    Fprintf0100();
    Fputc0100();
    Fputs0100();
    Fread0600();
    Fscanf0100();
    Fseek0100();
    return g_tStatus;
}

int InvalidParamTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return InvalidParamTestImpl(1, libcArgv);
}
