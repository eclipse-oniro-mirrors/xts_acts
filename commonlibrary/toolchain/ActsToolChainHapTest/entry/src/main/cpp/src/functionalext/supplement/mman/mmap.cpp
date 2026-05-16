/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstdlib>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include "functionalext.h"

const int EOK = 0;
const int SUCCESS = 0;
const int FAILED = -1;
constexpr mode_t FILE_MODE_0777 = 0777;
#define OFF_MASK ((-0x2000ULL << (8 * sizeof(long) - 1)) | (4096ULL - 1))

/**
 * @tc.name      : Mmap0100
 * @tc.desc      : The parameters are valid, prot is PROT_READ,
 *                 and flags is MAP_PRIVATE, which can map the file content into memory
 * @tc.level     : Level 0
 */
void Mmap0100(void)
{
    int fd;
    int mm;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_0100", fptr, nullptr);

    struct stat statbuff;
    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_0100", fgetc(fptr) != EOF);
    int back = stat(ptr, &statbuff);
    fclose(fptr);

    fd = open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_NE("mmap_0100", fd, -1);
    start = mmap(nullptr, statbuff.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    EXPECT_EQ("mmap_0100", back, SUCCESS);
    EXPECT_TRUE("mmap_0100", start != MAP_FAILED);

    mm = munmap(start, statbuff.st_size);
    EXPECT_EQ("mmap_0100", mm, SUCCESS);
    close(fd);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : Mmap0200
 * @tc.desc      : The parameters are valid, prot is PROT_READ|PROT_WRITE,
 *                 and flags is MAP_SHARED, which can map the file content into memory
 * @tc.level     : Level 0
 */
void Mmap0200(void)
{
    int fd;
    int mm;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_0200", fptr, nullptr);

    struct stat statbuff;
    struct stat sb;
    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_0200", fgetc(fptr) != EOF);

    int back = stat(ptr, &statbuff);
    fclose(fptr);
    fd = open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_NE("mmap_0200", fd, -1);
    start = mmap(nullptr, statbuff.st_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    EXPECT_EQ("mmap_0200", back, SUCCESS);
    EXPECT_TRUE("mmap_0200", start != MAP_FAILED);

    mm = munmap(start, statbuff.st_size);
    EXPECT_EQ("mmap_0200", mm, SUCCESS);
    close(fd);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : Mmap0300
 * @tc.desc      : The parameters are valid, prot is PROT_READ|PROT_WRITE, and flags is MAP_SHARED|MAP_ANON,
 *                 which can map the file content into memory
 * @tc.level     : Level 1
 */
void Mmap0300(void)
{
    void* start;
    int mm;
    start = mmap(nullptr, getpagesize(), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
    EXPECT_TRUE("mmap_0300", start != MAP_FAILED);
    mm = munmap(start, getpagesize());
    EXPECT_EQ("mmap_0300", mm, SUCCESS);
}

/**
 * @tc.name      : Mmap0400
 * @tc.desc      : The parameters are valid, prot is PROT_EXEC, and flags is MAP_LOCKED,
 *                 which can map the file content into memory
 * @tc.level     : Level 1
 */
void Mmap0400(void)
{
    int fd;
    int mm;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_0400", fptr, nullptr);

    struct stat statbuff;
    struct stat sb;
    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_0400", fgetc(fptr) != EOF);

    int back = stat(ptr, &statbuff);
    fclose(fptr);
    fd = open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_NE("mmap_0400", fd, -1);
    start = mmap(nullptr, statbuff.st_size, PROT_EXEC, MAP_PRIVATE | MAP_LOCKED, fd, 0);
    EXPECT_EQ("mmap_0400", back, SUCCESS);
    EXPECT_TRUE("mmap_0400", start != MAP_FAILED);
    mm = munmap(start, statbuff.st_size);
    EXPECT_EQ("mmap_0400", mm, SUCCESS);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
    close(fd);
}

/**
 * @tc.name      : Mmap0500
 * @tc.desc      : The parameters are valid, prot is PROT_READ|PROT_WRITE, and flags is MAP_PRIVATE|MAP_DENYWRITE,
 *                 which can map the file content into memory
 * @tc.level     : Level 1
 */
void Mmap0500(void)
{
    int fd;
    int mm;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_0500", fptr, nullptr);

    struct stat statbuff;
    struct stat sb;
    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_0500", fgetc(fptr) != EOF);

    int back = stat(ptr, &statbuff);
    fclose(fptr);
    fd = open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_NE("mmap_0500", fd, -1);

    start = mmap(nullptr, statbuff.st_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_DENYWRITE, fd, 0);
    EXPECT_EQ("mmap_0500", back, SUCCESS);
    EXPECT_TRUE("mmap_0500", start != MAP_FAILED);
    mm = munmap(start, statbuff.st_size);
    EXPECT_EQ("mmap_0500", mm, SUCCESS);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
    close(fd);
}

/**
 * @tc.name      : Mmap0600
 * @tc.desc      : The parameters are valid, prot is PROT_NONE, and flags is MAP_PRIVATE|MAP_FIXED,
 *                 which can map the file content into memory
 * @tc.level     : Level 2
 */
void Mmap0600(void)
{
    int fd;
    int mm;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_0600", fptr, nullptr);

    struct stat statbuff;
    struct stat sb;
    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_0600", fgetc(fptr) != EOF);

    int back = stat(ptr, &statbuff);
    fclose(fptr);
    fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY);
    EXPECT_NE("mmap_0600", fd, -1);
    start = mmap(nullptr, statbuff.st_size, PROT_NONE, MAP_PRIVATE | MAP_FIXED, -1, 0);
    EXPECT_EQ("mmap_0600", back, SUCCESS);
    EXPECT_EQ("mmap_0600", start, MAP_FAILED);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
    close(fd);
}

/**
 * @tc.name      : Mmap0700
 * @tc.desc      : The parameter is invalid, the off parameter is OFF_MASK,
 *                 the file content cannot be mapped into memory
 * @tc.level     : Level 2
 */
void Mmap0700(void)
{
    int fd;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_0700", fptr, nullptr);

    struct stat statbuff;
    struct stat sb;
    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_0700", fgetc(fptr) != EOF);

    int back = stat(ptr, &statbuff);
    fclose(fptr);
    fd = open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_NE("mmap_0700", fd, -1);

    start = mmap(nullptr, statbuff.st_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, OFF_MASK);
    EXPECT_EQ("mmap_0700", back, SUCCESS);
    EXPECT_EQ("mmap_0700", start, MAP_FAILED);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
    close(fd);
}

/**
 * @tc.name      : Mmap0800
 * @tc.desc      : The parameter is invalid, the len parameter exceeds the maximum value,
 *                 and the file content cannot be mapped into memory
 * @tc.level     : Level 2
 */
void Mmap0800(void)
{
    int fd;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_0800", fptr, nullptr);

    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_0800", fgetc(fptr) != EOF);

    fclose(fptr);
    fd = open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_NE("mmap_0800", fd, -1);

    start = mmap(nullptr, PTRDIFF_MAX + 1, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    EXPECT_EQ("mmap_0800", start, MAP_FAILED);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
    close(fd);
}

/**
 * @tc.name      : Mmap0900
 * @tc.desc      : The parameter is invalid, the len parameter is 0, the file content cannot be mapped into memory
 * @tc.level     : Level 2
 */
void Mmap0900(void)
{
    int fd;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_0900", fptr, nullptr);

    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_0900", fgetc(fptr) != EOF);

    fclose(fptr);
    fd = open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_NE("mmap_0900", fd, -1);

    start = mmap(nullptr, 0, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    EXPECT_EQ("mmap_0900", start, MAP_FAILED);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
    close(fd);
}

/**
 * @tc.name      : Mmap1000
 * @tc.desc      : The parameter is invalid, the flags parameter is MAP_SHARED|MAP_ANON, and the off parameter is
 *                 not an integer multiple of the page, the file content cannot be mapped into the memory
 * @tc.level     : Level 2
 */
void Mmap1000(void)
{
    int fd;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_1000", fptr, nullptr);

    struct stat statbuff;
    struct stat sb;
    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_1000", fgetc(fptr) != EOF);

    int back = stat(ptr, &statbuff);
    fclose(fptr);
    fd = open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_NE("mmap_1000", fd, -1);

    start = mmap(nullptr, statbuff.st_size, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, fd, getpagesize() - 1);
    EXPECT_EQ("mmap_1000", back, SUCCESS);
    EXPECT_EQ("mmap_1000", start, MAP_FAILED);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
    close(fd);
}

/**
 * @tc.name      : Mmap1100
 * @tc.desc      : The parameter is invalid, start is not an integer multiple of the page,
 *                 and the file content cannot be mapped into memory
 * @tc.level     : Level 1
 */
void Mmap1100(void)
{
    int fd;
    int mm;
    void* start;
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    static char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("mmap_1100", fptr, nullptr);

    struct stat statbuff;
    struct stat sb;
    fwrite(str, sizeof(char), strlen(str), fptr);
    fseek(fptr, 0L, SEEK_SET);
    EXPECT_TRUE("mmap_1100", fgetc(fptr) != EOF);

    int back = stat(ptr, &statbuff);
    fclose(fptr);
    fd = open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_NE("mmap_1100", fd, -1);

    int get = getpagesize() - 1;
    start = mmap(
        reinterpret_cast<void*>(&get), statbuff.st_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_DENYWRITE, fd, 0);
    EXPECT_EQ("mmap_1100", back, SUCCESS);
    EXPECT_TRUE("mmap_1100", start != MAP_FAILED);
    mm = munmap(start, statbuff.st_size);
    EXPECT_EQ("mmap_1100", mm, SUCCESS);
    remove(ptr);
    remove("/data/storage/el2/base/cache/test.txt");
    fptr = nullptr;
    ptr = nullptr;
    close(fd);
}

static int MmapTestImpl(int argc, char* argv[])
{
    Mmap0100();
    Mmap0200();
    Mmap0300();
    Mmap0400();
    Mmap0500();
    Mmap0600();
    Mmap0700();
    Mmap0800();
    Mmap0900();
    Mmap1000();
    Mmap1100();

    return T_STATUS;
}

int MmapTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return MmapTestImpl(1, libcArgv);
}
