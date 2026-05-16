/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <cerrno>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <dirent.h>
#include <fcntl.h>
#include <hilog_common.h>
#include <linux/socket.h>
#include <log_base.h>
#include <pthread.h>
#include <securec.h>
#include <sys/socket.h>
#include <sys/un.h>
#include "functionalext.h"
#include "test.h"

#undef LOG_DOMAIN
#define LOG_DOMAIN 0xD003F07

#undef LOG_TAG
#define LOG_TAG "HILOGBASETEST"

#define SOME_LOGS 10
#define SHORT_LOG 16
#define NEGATIVE_ONE (-1)
#define DEFAULT_BUF_SIZE 256

typedef enum {
    DEBUG_METHOD = 0,
    INFO_METHOD = 1,
    WARN_METHOD = 2,
    ERROR_METHOD = 3,
    FATAL_METHOD = 4,
    METHODS_NUMBER = 5
} LogInterfaceType;

typedef void (*LogMethodFunc)(const char* msg);

static const char* g_methodNames[METHODS_NUMBER] = { "Debug", "Info", "Warn", "Error", "Fatal" };

static void HilogBaseDebug(const char* msg)
{
    HILOG_BASE_DEBUG(LOG_CORE, "%{public}s", msg);
}

static void HilogBaseInfo(const char* msg)
{
    HILOG_BASE_INFO(LOG_CORE, "%{public}s", msg);
}

static void HilogBaseWarn(const char* msg)
{
    HILOG_BASE_WARN(LOG_CORE, "%{public}s", msg);
}

static void HilogBaseError(const char* msg)
{
    HILOG_BASE_ERROR(LOG_CORE, "%{public}s", msg);
}

static void HilogBaseFatal(const char* msg)
{
    HILOG_BASE_FATAL(LOG_CORE, "%{public}s", msg);
}

static LogMethodFunc g_logCMethods[METHODS_NUMBER] = { HilogBaseDebug,
                                                       HilogBaseInfo,
                                                       HilogBaseWarn,
                                                       HilogBaseError,
                                                       HilogBaseFatal };

/* Trusted fixed command only — avoids static analysis flagging popen with external input. */
static char* ReadHilogPopenOutput(void)
{
    static const char kHilogCmd[] = "/system/bin/hilog -x";
    FILE* fp = popen(kHilogCmd, "re");
    if (!fp) {
        return nullptr;
    }

    char* buf = (char*)malloc(DEFAULT_BUF_SIZE);
    if (!buf) {
        pclose(fp);
        return nullptr;
    }

    size_t bufSize = DEFAULT_BUF_SIZE;
    size_t totalRead = 0;
    size_t chunkSize = 0;

    while ((chunkSize = fread(buf + totalRead, 1, bufSize - totalRead - 1, fp)) > 0) {
        totalRead += chunkSize;

        // 如果缓冲区满了，需要扩容
        if (totalRead >= bufSize - 1) {
            size_t newSize = bufSize * 2; // 2 : 扩容两倍
            char* newBuf = (char*)malloc(newSize);
            if (!newBuf) {
                free(buf);
                pclose(fp);
                return nullptr;
            }

            if (MemcpyS(newBuf, newSize, buf, totalRead) != 0) {
                free(newBuf);
                free(buf);
                pclose(fp);
                return nullptr;
            }

            free(buf);
            buf = newBuf; // 更新指针和大小
            bufSize = newSize;
        }
    }

    // 确保字符串以\0结尾
    if (totalRead < bufSize - 1) {
        buf[totalRead] = '\0';
    } else {
        // 如果刚好填满，也需要加终止符
        buf[bufSize - 1] = '\0';
    }
    pclose(fp);
    return buf;
}

char* RandomStringGenerator(uint32_t len)
{
    if (len == UINT32_MAX) {
        return nullptr;
    }
    char* str = static_cast<char*>(malloc(static_cast<size_t>(len) + 1U));
    if (str == nullptr) {
        return nullptr; // 内存分配失败
    }

    int fd = open("/dev/random", O_RDONLY);
    if (fd == NEGATIVE_ONE) {
        free(str);
        return nullptr;
    }
    // 读取len个随机字节
    if (read(fd, str, len) != len) {
        close(fd);
        free(str);
        return nullptr;
    }

    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    // 将随机字节映射到charset的范围
    for (uint32_t i = 0; i < len; ++i) {
        str[i] = charset[str[i] % (sizeof(charset) - 1)];
    }

    str[len] = '\0';
    close(fd);
    return str;
}

void HiLogWriteTest(char* funcName, LogMethodFunc loggingMethod, uint32_t logCount, uint32_t logLen, bool isDebug)
{
    char* logMsg = RandomStringGenerator(logLen);
    if (!logMsg) {
        t_error("Faild to generate random string\n");
        return;
    }
    for (uint32_t i = 0; i < logCount; ++i) {
        // 创建带序号的日志消息
        char fullMsg[MAX_LOG_LEN];
        if (snprintf_s(fullMsg, MAX_LOG_LEN, MAX_LOG_LEN - 1, "%s%u", logMsg, i) < 0) {
            t_error("logMsg exceeds MAX_LOG_LEN");
            free(logMsg);
            return;
        }
        loggingMethod(fullMsg);
    }
    if (strlen(logMsg) > MAX_LOG_LEN - 1) {
        logMsg[MAX_LOG_LEN - 1] = '\0'; // 直接截断字符串
    }
    usleep(1000); /* 1000: 睡眠 1 毫秒 */
    const char* cmd = "/system/bin/hilog -x";
    char* logMsgs = ReadHilogPopenOutput();
    if (!logMsgs) {
        t_error("Failed to execute command: %s\n", cmd);
        free(logMsg);
        return;
    }
    uint32_t realCount = 0;
    char* line = strtok(logMsgs, "\n");
    while (line != nullptr) {
        if (strstr(line, logMsg) != nullptr) {
            ++realCount;
        }
        line = strtok(nullptr, "\n");
    }
    uint32_t allowedLeastLogCount = logCount - logCount / 10; /* 1 / 10: 丢失率少于10% */
    if (isDebug) {
        allowedLeastLogCount = 0; /* 0: 调试模式关闭统计 */
    }
    free(logMsg);
    free(logMsgs);
    EXPECT_GTE(funcName, realCount, allowedLeastLogCount);
}

/**
 * @tc.name     : HiLogBasePrint0010
 * @tc.desc     : test HiLogBasePrint for some logs
 * @tc.level    : Level 2
 */
static void HiLogBasePrint0010(void)
{
    for (uint32_t i = 0; i < METHODS_NUMBER; ++i) {
        printf("Starting %s test\n", g_methodNames[i]);
        HiLogWriteTest("HiLogBasePrint0010", g_logCMethods[i], SOME_LOGS, SHORT_LOG, i == DEBUG_METHOD);
    }
}

/**
 * @tc.name     : HiLogBaseIsLoggable0010
 * @tc.desc     : test HiLogBaseIsLoggable for long logs
 * @tc.level    : Level 2
 */
static void HiLogBaseIsLoggable0010(void)
{
    EXPECT_TRUE("HiLogBaseIsLoggable LOG_DEBUG", HiLogBaseIsLoggable(LOG_DOMAIN, LOG_TAG, LOG_DEBUG));
    EXPECT_TRUE("HiLogBaseIsLoggable LOG_INFO", HiLogBaseIsLoggable(LOG_DOMAIN, LOG_TAG, LOG_INFO));
    EXPECT_TRUE("HiLogBaseIsLoggable LOG_WARN", HiLogBaseIsLoggable(LOG_DOMAIN, LOG_TAG, LOG_WARN));
    EXPECT_TRUE("HiLogBaseIsLoggable LOG_ERROR", HiLogBaseIsLoggable(LOG_DOMAIN, LOG_TAG, LOG_ERROR));
    EXPECT_TRUE("HiLogBaseIsLoggable LOG_FATAL", HiLogBaseIsLoggable(LOG_DOMAIN, LOG_TAG, LOG_FATAL));
    EXPECT_TRUE("HiLogBaseIsLoggable LOG_WARN", HiLogBaseIsLoggable(LOG_DOMAIN, "abc", LOG_WARN));
    EXPECT_FALSE("HiLogBaseIsLoggable LOG_LEVEL_MIN", HiLogBaseIsLoggable(LOG_DOMAIN, "abc", LOG_LEVEL_MIN));
}

static int UnittestHilogBaseTestImpl(void)
{
    // 解除限制
    system("/bin/hilog -q pidoff");
    system("/bin/hilog -q domainoff");

    HiLogBasePrint0010();
    HiLogBaseIsLoggable0010();

    // 恢复限制
    system("/bin/hilog -q pidon");
    system("/bin/hilog -q domainon");
    return T_STATUS;
}

int UnittestHilogBaseTest(void)
{
    return UnittestHilogBaseTestImpl();
}
