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
#include <cstring>
#include "test.h"

static const char *WRSTRING = "This is a test sample!";
static const char *PATH = "/data/storage/el2/base/cache/test.txt";

/**
 * @tc.name      : Fseeko0100
 * @tc.desc      : Verify that the file pointer is moved to the beginning of the file
 * @tc.level     : Level 0
 */
void Fseeko0100(void)
{
    FILE *fp = fopen(PATH, "w+");
    if (!fp) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fp);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int result = fseeko(fp, 0L, SEEK_SET);
    char ch = fgetc(fp);
    if (result != 0) {
        t_error("%s fseeko failed, result is %d\n", __func__, result);
    }
    if (ch != 'T') {
        t_error("%s fseeko failed, ch is %c\n", __func__, ch);
    }

    (void)fclose(fp);
    (void)remove(PATH);
}

/**
 * @tc.name      : Fseeko0200
 * @tc.desc      : Verify that the file pointer is moved to any position in the file
 * @tc.level     : Level 0
 */
void Fseeko0200(void)
{
    FILE *fp = fopen(PATH, "w+");
    if (!fp) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fp);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int result = fseeko(fp, 8L, SEEK_SET);
    char ch = fgetc(fp);
    if (result != 0) {
        t_error("%s fseeko failed, result is %d\n", __func__, result);
    }
    if (ch != 'a') {
        t_error("%s fseeko failed, ch is %c\n", __func__, ch);
    }

    (void)fclose(fp);
    (void)remove(PATH);
}

/**
 * @tc.name      : Fseeko0300
 * @tc.desc      : Verify that the file pointer is moved to the current position of the file
 * @tc.level     : Level 0
 */
void Fseeko0300(void)
{
    FILE *fp = fopen(PATH, "w+");
    if (!fp) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fp);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int code = fseeko(fp, 10L, SEEK_SET);
    if (code != 0) {
        t_error("%s fseeko failed, code is %d\n", __func__, code);
    }

    int data = fseeko(fp, 0L, SEEK_CUR);
    if (data != 0) {
        t_error("%s fseeko failed, data is %d\n", __func__, data);
    }

    char ch = fgetc(fp);
    if (ch != 't') {
        t_error("%s fseeko failed, ch is %c\n", __func__, ch);
    }

    (void)fclose(fp);
    (void)remove(PATH);
}

/**
 * @tc.name      : Fseeko0400
 * @tc.desc      : Verify that the file pointer is moved to the end of the file
 * @tc.level     : Level 0
 */
void Fseeko0400(void)
{
    FILE *fp = fopen(PATH, "w+");
    if (!fp) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fp);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int result = fseeko(fp, -1L, SEEK_END);
    char ch = fgetc(fp);
    if (result != 0) {
        t_error("%s fseeko failed, result is %d\n", __func__, result);
    }
    if (ch != '!') {
        t_error("%s fseeko failed, ch is %c\n", __func__, ch);
    }

    (void)fclose(fp);
    (void)remove(PATH);
}

/**
 * @tc.name      : Fseeko0500
 * @tc.desc      : Verify that the moved file pointer position exceeds the starting position pointer movement failed
 * @tc.level     : Level 2
 */
void Fseeko0500(void)
{
    FILE *fp = fopen(PATH, "w+");
    if (!fp) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fp);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int result = fseeko(fp, -10L, SEEK_SET);
    if (result != -1) {
        t_error("%s fseeko should be failed, result is %d\n", __func__, result);
    }

    (void)fclose(fp);
    (void)remove(PATH);
}

/**
 * @tc.name      : Fseeko0600
 * @tc.desc      : Verify that the moved file pointer position exceeds the end position pointer movement failed
 * @tc.level     : Level 1
 */
void Fseeko0600(void)
{
    FILE *fp = fopen(PATH, "w+");
    if (!fp) {
        t_error("%s fopen failed\n", __func__);
    }

    size_t ret = fwrite(WRSTRING, sizeof(char), strlen(WRSTRING), fp);
    if (ret < 0) {
        t_error("%s fwrite failed\n", __func__);
    }

    int result = fseeko(fp, 10L, SEEK_END);
    if (result != 0) {
        t_error("%s fseeko failed, result is %d\n", __func__, result);
    }

    (void)fclose(fp);
    (void)remove(PATH);
}

static int FseekoTestImpl(int argc, char *argv[])
{
    Fseeko0100();
    Fseeko0200();
    Fseeko0300();
    Fseeko0400();
    Fseeko0500();
    Fseeko0600();

    return g_tStatus;
}

int FseekoTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FseekoTestImpl(1, libcArgv);
}
