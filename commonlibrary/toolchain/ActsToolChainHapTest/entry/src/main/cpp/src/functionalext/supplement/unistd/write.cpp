/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <fcntl.h>
#include <cstdio>
#include <cstring>
#include <unistd.h>
#include "filepath_util.h"

/**
 * @tc.name      : write_0100
 * @tc.desc      : Test the write function, the return value is the specified buf length
 * @tc.level     : Level 0
 */
void Write0100(void)
{
    const char *msg = "This is a c test code for write function";
    char path[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_WRITE_TEST_TXT, path);
    int len = strlen(msg);
    char buf[1024] = {0};
    int fd = open(path, O_RDWR | O_RSYNC | O_CREAT, 0664);
    if (fd == -1) {
        t_error("%s write create file error", __func__);
        return;
    }
    int result = write(fd, msg, len);
    if (result != len) {
        t_error("%s write get result is %d not want %d", __func__, result, len);
    }
    close(fd);
    fd = open(path, O_RDWR);
    int bytes = read(fd, buf, len);
    if (bytes == -1) {
        t_error("%s read file failed", __func__);
        return;
    }
    if (strcmp(msg, buf)) {
        t_error("%s wrong string written to file", __func__);
    }
    close(fd);
    remove(path);
}

/**
 * @tc.name      : write_0200
 * @tc.desc      : test the return value of write when the count parameter is 0
 * @tc.level     : Level 1
 */
void Write0200(void)
{
    const char *msg = "This is a c test code for write function";
    char path[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_WRITE_TEST_TXT, path);
    int len = 0;
    int fd = open(path, O_RDWR | O_RSYNC | O_CREAT, 0664);
    if (fd == -1) {
        t_error("%s write create file error", __func__);
        return;
    }
    int result = write(fd, msg, len);
    if (result != len) {
        t_error("%s write get result is %d not want %d", __func__, result, len);
    }
    close(fd);
    remove(path);
}

/**
 * @tc.name      : write_0300
 * @tc.desc      : test the return result of write when count is greater than the length of buf
 * @tc.level     : Level 1
 */
void Write0300(void)
{
    const char *msg = "This is a c test code for write function";
    char path[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_WRITE_TEST_TXT, path);
    int len = strlen(msg) + 1;
    int fd = open(path, O_RDWR | O_RSYNC | O_CREAT, 0664);
    if (fd == -1) {
        t_error("%s write create file error", __func__);
        return;
    }
    int result = write(fd, msg, len);
    if (result == -1) {
        t_error("%s write get result is %d not want -1", __func__, result);
    }
    close(fd);
    remove(path);
}

/**
 * @tc.name      : write_0400
 * @tc.desc      : test the return value of write when fd is abnormal
 * @tc.level     : Level 2
 */
void Write0400(void)
{
    const char *msg = "This is a c test code for write function";
    char path[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_WRITE_TEST_TXT, path);
    int len = strlen(msg);
    int fd = open(path, O_RDWR);
    int result = write(fd, msg, len);
    if (result != -1) {
        t_error("%s write get result is %d not want -1", __func__, result);
    }
    close(fd);
    remove(path);
}

/**
 * @tc.name      : write_0500
 * @tc.desc      : test the return value of write when buf is NULL
 * @tc.level     : Level 2
 */
void Write0500(void)
{
    const char *msg = nullptr;
    char path[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_WRITE_TEST_TXT, path);
    int len = 1;
    int fd = open(path, O_RDWR | O_RSYNC | O_CREAT, 0664);
    if (fd == -1) {
        t_error("%s write create file error", __func__);
        return;
    }
    int result = write(fd, msg, len);
    if (result != -1) {
        t_error("%s write get result is %d not want -1", __func__, result);
    }
    close(fd);
    remove(path);
}

static int WriteTestImpl(int argc, char *argv[])
{
    Write0100();
    Write0200();
    Write0300();
    Write0400();
    Write0500();
    return g_tStatus;
}

int WriteTest(void)
{
    static char libcProg[] = "libc_test";
    char *__libc_argv[] = { libcProg, nullptr };
    return WriteTestImpl(1, __libc_argv);
}
