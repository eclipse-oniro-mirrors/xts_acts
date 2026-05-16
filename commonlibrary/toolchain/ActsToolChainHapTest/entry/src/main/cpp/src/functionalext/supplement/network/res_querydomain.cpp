/*
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

#include <resolv.h>
#include <cstdio>
#include <cstdlib>
#include "test.h"

const char NAME[] = "www";
const char DOMAIN[] = "baidu.com";
const int QCLASS = C_IN;
const int QTYPE = T_TXT;

/**
 * @tc.name      : ResQuerydomain0100
 * @tc.desc      : query the name server, device need to access internet.
 * @tc.level     : Level 0
 */
void ResQuerydomain0100(void)
{
    unsigned char buf[BUFSIZ] = {0};
    int result = res_querydomain(NAME, DOMAIN, QCLASS, QTYPE, buf, sizeof(buf));
    // Because XTS test can not access internet, it is expected to return (-1).
    if (result != -1) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : ResQuerydomain0200
 * @tc.desc      : query the name server with an invalid type
 * @tc.level     : Level 2
 */
void ResQuerydomain0200(void)
{
    unsigned char buf[BUFSIZ] = {0};
    int result = res_querydomain(NAME, DOMAIN, QCLASS, T_ANY + 1, buf, sizeof(buf));
    if (result != -1) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

static int ResQuerydomainTestImpl(int argc, char *argv[])
{
    ResQuerydomain0200();
    return T_STATUS;
}

int ResQuerydomainTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ResQuerydomainTestImpl(1, libcArgv);
}
