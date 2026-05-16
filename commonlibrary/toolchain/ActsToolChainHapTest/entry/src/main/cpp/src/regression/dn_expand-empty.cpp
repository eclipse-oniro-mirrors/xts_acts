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

// dn_expand should accept empty name (single \0)
#include <resolv.h>
#include "test.h"

enum {
    K_DNS_EMPTY_PACKET_END_OFFSET = 1,
    K_DNS_EMPTY_NAME_BUF_LEN = 1,
    K_DNS_EXPAND_RET_EMPTY_LABEL = 1,
};

int DnExpandEmptyTest(void)
{
    unsigned char packet[] = "";
    char name[] = "XX";
    int r;

    /* empty name in packet */
    r = dn_expand(packet, packet + K_DNS_EMPTY_PACKET_END_OFFSET, packet, name, K_DNS_EMPTY_NAME_BUF_LEN);
    if (r != K_DNS_EXPAND_RET_EMPTY_LABEL) {
        t_error("dn_expand(\"\", name, 1) returned %d, wanted 1\n", r);
    }
    if (name[0]) {
        t_error("dn_expand(\"\", name, 1) failed: got \"%s\" name, wanted \"\"\n", name);
    }

    return T_STATUS;
}
