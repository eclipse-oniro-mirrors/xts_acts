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
#include "functionalext.h"
#include <cerrno>
#include <fcntl.h>
#include <cstdio>
#include <cstring>
#include "filepath_util.h"

const char *STR = "Hello";
/**
 * @tc.name      : copy_file_range_0100
 * @tc.desc      : Copy a range of data from one file to another
 * @tc.level     : Level 0
 */
void CopyFileRange0100(void)
{
    int fdIn;
    int fdOut;
    int wlen;
    int result;
    char buffer[BUFSIZ];

    char path_in[PATH_MAX] = {0};
    char path_out[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_FILE_IN_TXT, path_in);
    FILE_ABSOLUTE_PATH(STR_FILE_OUT_TXT, path_out);

    fdIn = open(path_in, O_RDWR | O_CREAT, TEST_MODE);
    if (fdIn == -1) {
        t_error("%s open path_in failed\n", __func__);
        return;
    }

    wlen = write(fdIn, STR, strlen(STR));
    if (wlen != strlen(STR)) {
        t_error("%s write failed\n", __func__);
        return;
    }

    close(fdIn);
    fdIn = open(path_in, O_RDONLY);

    fdOut = open(path_out, O_RDWR | O_CREAT, TEST_MODE);
    if (fdOut == -1) {
        t_error("%s open path_out failed\n", __func__);
        return;
    }

    do {
        result = copy_file_range(fdIn, NULL, fdOut, NULL, wlen, 0);
        if (result == -1) {
            t_error("%s copy_file_range failed\n", __func__);
            return;
        }
        wlen -= result;
    } while (wlen > 0 && result > 0);

    close(fdOut);
    fdOut = open(path_out, O_RDONLY);
    memset(buffer, 0, sizeof(buffer));
    result = read(fdOut, buffer, sizeof(buffer));
    if (result == -1) {
        t_error("%s read failed\n", __func__);
    }
    if (strcmp(STR, buffer)) {
        t_error("%s buffer is %s, not %s", __func__, buffer, STR);
    }

    close(fdIn);
    close(fdOut);
    remove(path_in);
    remove(path_out);
}

/**
 * @tc.name      : copy_file_range_0200
 * @tc.desc      : One or more file descriptors are not valid
 * @tc.level     : Level 2
 */
void CopyFileRange0200(void)
{
    errno = 0;
    int result = copy_file_range(-1, NULL, -1, NULL, 0, 0);
    if (result != -1) {
        t_error("%s copy_file_range should failed, result is %d\n", __func__, result);
    }
    if (errno != EBADF) {
        t_error("%s errno is %d, not EBADF", __func__, errno);
    }
}

/**
 * @tc.name      : copy_file_range_0300
 * @tc.desc      : File permissions are restricted
 * @tc.level     : Level 2
 */
void CopyFileRange0300(void)
{
    int fdIn;
    int fdOut;
    int wlen;
    int result;
    char buffer[BUFSIZ];

    char path_in[PATH_MAX] = {0};
    char path_out[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_FILE_IN_TXT, path_in);
    FILE_ABSOLUTE_PATH(STR_FILE_OUT_TXT, path_out);

    fdIn = open(path_in, O_WRONLY | O_CREAT, TEST_MODE);
    if (fdIn == -1) {
        t_error("%s open path_in failed\n", __func__);
        return;
    }

    wlen = write(fdIn, STR, strlen(STR));
    if (wlen != strlen(STR)) {
        t_error("%s write failed\n", __func__);
        return;
    }

    close(fdIn);
    fdIn = open(path_in, O_WRONLY);

    fdOut = open(path_out, O_RDONLY | O_CREAT, TEST_MODE);
    if (fdOut == -1) {
        t_error("%s open path_out failed\n", __func__);
        return;
    }

    errno = 0;
    result = copy_file_range(fdIn, NULL, fdOut, NULL, wlen, 0);
    if (result != -1) {
        t_error("%s copy_file_range should failded\n", __func__);
    }
    if (errno != EBADF) {
        t_error("%s errno is %d, not EBADF\n", __func__, errno);
    }

    close(fdIn);
    close(fdOut);
    remove(path_in);
    remove(path_out);
}

static int CopyFileRangeTestWithArgs(int argc, char *argv[])
{
    CopyFileRange0100();
    CopyFileRange0200();
    CopyFileRange0300();
    return g_tStatus;
}

int CopyFileRangeTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return CopyFileRangeTestWithArgs(1, libcArgv);
}
