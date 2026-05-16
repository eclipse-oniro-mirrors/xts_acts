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

/**
 * @tc.name      : Clearerr0100
 * @tc.desc      : The parameter is valid and can clear (reset) the error flag of the file stream.
 * @tc.level     : Level 0
 */
void Clearerr0100(void)
{
    (void)putc('c', stdin);
    if (ferror(stdin)) {
        clearerr(stdin);
    }
    EXPECT_EQ("Clearerr0100", ferror(stdin), 0);
}

static int ClearerrTestWithArgs(int argc, char* argv[])
{
    Clearerr0100();
    return T_STATUS;
}

int ClearerrTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return ClearerrTestWithArgs(1, libcArgvStub);
}
