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
#include <cstring>

#include "test.h"

#define DNS_HEADER_OFFSET 12
#define DNS_QBUF_OFFSET 4
#define DATA_LENGTH 0

const int OP = QUERY;
const int DNS_CLASS = C_IN;
const int TYPE = T_TXT;
const char DNAME[] = "www.example.com";
const unsigned char *DATA = reinterpret_cast<const unsigned char *>("");
const char QBUF[] = "\0\1\0\0\0\0\0\0";
const char QNAME[] = "\3www\7example\3com";

/**
 * @tc.name      : ResMkquery0100
 * @tc.desc      : construct a query message
 * @tc.level     : Level 0
 */
void ResMkquery0100(void)
{
    unsigned char buf[BUFSIZ] = {0};

    int result = res_mkquery(OP, DNAME, DNS_CLASS, TYPE, DATA, DATA_LENGTH, nullptr, buf, sizeof(buf));
    if (result < 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = memcmp(buf + DNS_HEADER_OFFSET, QNAME, sizeof(QNAME) - 1);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = memcmp(buf + DNS_QBUF_OFFSET, QBUF, sizeof(QBUF) - 1);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : ResMkquery0200
 * @tc.desc      : construct a query message with an invalid type
 * @tc.level     : Level 2
 */
void ResMkquery0200(void)
{
    int result = res_mkquery(OP, DNAME, DNS_CLASS, T_ANY + 1, DATA, DATA_LENGTH, nullptr, nullptr, DATA_LENGTH);
    if (result == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

static int ResMkqueryTestImpl(int argc, char *argv[])
{
    ResMkquery0100();
    ResMkquery0200();

    return T_STATUS;
}

int ResMkqueryTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ResMkqueryTestImpl(1, libcArgv);
}

