/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// WARNING: failed to inject status
#include "include/CommonTool.h"
#ifdef _XOPEN_SOURCE
#include <ftw.h>
#include "libc_test_shim.h"

template <typename T> static void TypePun()
{
    (void)static_cast<T*>(nullptr);
}

template <typename T, typename F> static void CheckField(T& obj, F T::*member)
{
    F* ptr = &(obj.*member);
    (void)ptr;
}

static void IgnoreConst(int value)
{
    (void)value;
}

static void CheckFtwConstants()
{
    TypePun<struct FTW>();
    TypePun<struct stat>();
    IgnoreConst(FTW_F);
    IgnoreConst(FTW_D);
    IgnoreConst(FTW_DNR);
    IgnoreConst(FTW_DP);
    IgnoreConst(FTW_NS);
    IgnoreConst(FTW_SL);
    IgnoreConst(FTW_SLN);
    IgnoreConst(FTW_PHYS);
    IgnoreConst(FTW_MOUNT);
    IgnoreConst(FTW_DEPTH);
    IgnoreConst(FTW_CHDIR);
    IgnoreConst(S_IRWXU);
    IgnoreConst(S_IRUSR);
    IgnoreConst(S_IWUSR);
    IgnoreConst(S_IXUSR);
    IgnoreConst(S_IRWXG);
    IgnoreConst(S_IRGRP);
    IgnoreConst(S_IWGRP);
    IgnoreConst(S_IXGRP);
    IgnoreConst(S_IRWXO);
    IgnoreConst(S_IROTH);
    IgnoreConst(S_IWOTH);
    IgnoreConst(S_IXOTH);
    IgnoreConst(S_ISUID);
    IgnoreConst(S_ISGID);
    IgnoreConst(S_ISVTX);
    IgnoreConst(S_IFMT);
    IgnoreConst(S_IFBLK);
    IgnoreConst(S_IFCHR);
    IgnoreConst(S_IFIFO);
    IgnoreConst(S_IFREG);
    IgnoreConst(S_IFDIR);
    IgnoreConst(S_IFLNK);
    IgnoreConst(S_IFSOCK);
    IgnoreConst(S_ISBLK(0));
    IgnoreConst(S_ISCHR(0));
    IgnoreConst(S_ISDIR(0));
    IgnoreConst(S_ISFIFO(0));
    IgnoreConst(S_ISREG(0));
    IgnoreConst(S_ISLNK(0));
    IgnoreConst(S_ISSOCK(0));
}

static void CheckFtwStructFields()
{
    {
        struct FTW x;
        CheckField(x, &FTW::base);
        CheckField(x, &FTW::level);
    }
    {
        struct stat x;
        CheckField(x, &stat::st_dev);
        CheckField(x, &stat::st_ino);
        CheckField(x, &stat::st_mode);
        CheckField(x, &stat::st_nlink);
        CheckField(x, &stat::st_uid);
        CheckField(x, &stat::st_gid);
        CheckField(x, &stat::st_rdev);
        CheckField(x, &stat::st_size);
        CheckField(x, &stat::st_atim);
        CheckField(x, &stat::st_mtim);
        CheckField(x, &stat::st_ctim);
        CheckField(x, &stat::st_blksize);
        CheckField(x, &stat::st_blocks);
    }
}

static void CheckFtwFunctionPointers()
{
    {
        int (*p)(const char*, int (*)(const char*, const struct stat*, int), int) = ftw;
        (void)p;
    }
    {
        int (*p)(const char*, int (*)(const char*, const struct stat*, int, struct FTW*), int, int) = nftw;
        (void)p;
    }
}

static void FtwBody()
{
    CheckFtwConstants();
    CheckFtwStructFields();
    CheckFtwFunctionPointers();
}
#endif

int FtwTest()
{
#ifdef _XOPEN_SOURCE
    FtwBody();
#endif
    return SUCCESS_CODE;
}
