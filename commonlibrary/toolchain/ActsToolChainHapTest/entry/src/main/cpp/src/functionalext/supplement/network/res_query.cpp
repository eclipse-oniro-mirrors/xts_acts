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

#include <resolv.h>
#include <cstdio>
#include <cstdlib>
#include "test.h"

const char DNAME[] = "www.baidu.com";
const int QCLASS = C_IN;
const int QTYPE = T_TXT;

/**
 * @tc.name      : ResQuery0100
 * @tc.desc      : query the name server.
 * @tc.level     : Level 0
 */
void ResQuery0100(void)
{
    unsigned char buf[BUFSIZ] = {0};
    int result = res_query(DNAME, QCLASS, QTYPE, buf, sizeof(buf));
    // Because XTS test can not access internet, it is expected to return (-1).
    if (result != -1) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : ResQuery0200
 * @tc.desc      : query the name server with an invalid type
 * @tc.level     : Level 2
 */
void ResQuery0200(void)
{
    unsigned char buf[BUFSIZ] = {0};
    int result = res_query(DNAME, QCLASS, T_ANY + 1, buf, sizeof(buf));
    if (result != -1) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

static int ResQueryTestImpl(int argc, char *argv[])
{
    ResQuery0200();
    return T_STATUS;
}

int ResQueryTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ResQueryTestImpl(1, libcArgv);
}
