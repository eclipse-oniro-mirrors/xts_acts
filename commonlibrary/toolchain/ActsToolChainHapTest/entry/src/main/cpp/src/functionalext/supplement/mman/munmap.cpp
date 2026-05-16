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

#include <sys/mman.h>
#include <sys/stat.h>
#include "functionalext.h"

/*
 * @tc.name      : munmap_0100
 * @tc.desc      : Verify that the parameters are valid to unmap the memory
 * @tc.level     : Level 0
 */
void Munmap0100(void)
{
    const char* ptr = "/data/storage/el2/base/cache/test.txt";
    const char str[] = "this is a sample!";
    FILE* fptr = fopen(ptr, "w+");
    EXPECT_PTRNE("Munmap0100", fptr, nullptr);

    size_t writeCount = fwrite(str, sizeof(char), strlen(str), fptr);
    EXPECT_EQ("Munmap0100", writeCount, strlen(str));
    int seekRet = fseek(fptr, 0L, SEEK_SET);
    EXPECT_EQ("Munmap0100", seekRet, 0);
    void* pMap = mmap(nullptr, sizeof(char) * 10, PROT_READ | PROT_WRITE, MAP_SHARED, fileno(fptr), 0);
    int closeRet = fclose(fptr);
    EXPECT_EQ("Munmap0100", closeRet, 0);
    int data = munmap(pMap, sizeof(char) * 10);
    EXPECT_EQ("Munmap0100", data, 0);
    int removeRet = remove(ptr);
    EXPECT_EQ("Munmap0100", removeRet, 0);
}

static int MunmapTestImpl(int argc, char* argv[])
{
    Munmap0100();
    return T_STATUS;
}

int MunmapTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return MunmapTestImpl(1, libcArgv);
}
