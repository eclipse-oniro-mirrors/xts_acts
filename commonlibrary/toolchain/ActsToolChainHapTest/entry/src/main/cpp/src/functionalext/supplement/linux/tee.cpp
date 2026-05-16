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

#include <cstdio>
#include <fcntl.h>
#include <cstring>
#include <unistd.h>
#include "filepath_util.h"

#define BUFF_SIZE (20)
#define TEE_BUFFER_SIZE (32768)
#define FILE_PERMISSIONS (0666)
#define FAILURE_CODE (-1)

/**
 * @tc.name      : Tee0100
 * @tc.desc      : Copy data between two pipe file descriptors
 * @tc.level     : Level 0
 */
void Tee0100(void)
{
    char buf[BUFF_SIZE];
    char *text = "Hello";
    int result;
    memset(buf, 0, sizeof(buf));

    int pipefd1[2];
    result = pipe(pipefd1);
    if (result == FAILURE_CODE) {
        t_error("%s pipe stdout failed\n", __func__);
    }
    if (write(pipefd1[1], text, strlen(text)) == FAILURE_CODE) {
        t_error("%s write failed\n", __func__);
    }

    int pipefd2[2];
    result = pipe(pipefd2);
    if (result == FAILURE_CODE) {
        t_error("%s pipe file failed\n", __func__);
    }

    result = tee(pipefd1[0], pipefd2[1], TEE_BUFFER_SIZE, SPLICE_F_NONBLOCK);
    if (result == FAILURE_CODE) {
        t_error("%s tee failed\n", __func__);
    }
    if (read(pipefd2[0], buf, sizeof(buf)) == FAILURE_CODE) {
        t_error("%s read failed\n", __func__);
    }

    if (strcmp(buf, text)) {
        t_error("%s tee failed, buf = %s\n", __func__, buf);
    }
    close(pipefd1[0]);
    close(pipefd1[1]);
    close(pipefd2[0]);
    close(pipefd2[1]);
}

/**
 * @tc.name      : Tee0200
 * @tc.desc      : Input argument is not a pipe descriptor
 * @tc.level     : Level 2
 */
void Tee0200(void)
{
    char buf[BUFF_SIZE];
    char *text = "Hello";
    int result;
    char path[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_FILE_TXT, path, sizeof(path))) {
        return;
    }

    int fd = open(path, O_CREAT | O_WRONLY | O_TRUNC, FILE_PERMISSIONS);
    if (fd < 0) {
        t_error("%s open failed\n", __func__);
    }

    int pipefd2[2];
    result = pipe(pipefd2);
    if (result == FAILURE_CODE) {
        t_error("%s pipe file failed\n", __func__);
    }

    result = tee(fd, pipefd2[1], TEE_BUFFER_SIZE, SPLICE_F_NONBLOCK);
    if (result != FAILURE_CODE) {
        t_error("%s test failed\n", __func__);
    }
    close(fd);
    close(pipefd2[0]);
    close(pipefd2[1]);
}

static int TeeTestImpl(int argc, char *argv[])
{
    Tee0100();
    Tee0200();
    return T_STATUS;
}

int TeeTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TeeTestImpl(1, libcArgv);
}
