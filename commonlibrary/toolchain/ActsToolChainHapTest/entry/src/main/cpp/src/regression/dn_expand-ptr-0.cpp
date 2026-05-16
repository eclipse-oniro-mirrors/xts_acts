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
// dn_expand should handle offset pointer to 0 byte
#include <cstring>
#include <resolv.h>
#include "test.h"

enum {
    K_DNS_PACKET_END_OFFSET = 6,
    K_DNS_FIRST_NAME_BUF_LEN = 3,
    K_DNS_EXPAND_RET_NON_EMPTY = 5,
    K_DNS_SECOND_PACKET_END = 3,
    K_DNS_SECOND_NAME_BUF_LEN = 1,
    K_DNS_EXPAND_RET_EMPTY = 2,
    K_NAME_SCRATCH_COPY_LEN = 5,
};

int DnExpandPtr0Test(void)
{
    static const unsigned char kInitialDnsPacket[] = { 2, 'p', 'q', 0xc0, 5, 0 };
    unsigned char packet[sizeof(kInitialDnsPacket)];
    for (size_t i = 0; i < sizeof(packet); ++i) {
        packet[i] = kInitialDnsPacket[i];
    }
    char name[] = "XXXX";
    int r;

    /* non-empty name with pointer to 0 */
    r = dn_expand(packet, packet + K_DNS_PACKET_END_OFFSET, packet, name, K_DNS_FIRST_NAME_BUF_LEN);
    if (r != K_DNS_EXPAND_RET_NON_EMPTY) {
        t_error("dn_expand(\"\\2pq\\xc0\\5\", name, 3) returned %d, wanted 5\n", r);
    }
    if (strcmp(name, "pq")) {
        t_error("dn_expand(\"\\2pq\\xc0\\5\", name, 3) failed: got \"%s\" name, wanted \"pq\"\n", name);
    }

    /* empty name with pointer to 0 */
    /* 与 memcpy(packet, "\\xc0\\2", 3) 一致：两字节数据 + 字面量中的 '\\0' 作为第三字节 */
    {
        const unsigned char p2[] = { 0xc0, 0x02, 0x00 };
        for (size_t i = 0; i < K_DNS_SECOND_PACKET_END; ++i) {
            packet[i] = p2[i];
        }
    }
    {
        const char nm[] = "XXXX";
        for (size_t i = 0; i < K_NAME_SCRATCH_COPY_LEN; ++i) {
            name[i] = nm[i];
        }
    }
    r = dn_expand(packet, packet + K_DNS_SECOND_PACKET_END, packet, name, K_DNS_SECOND_NAME_BUF_LEN);
    if (r != K_DNS_EXPAND_RET_EMPTY) {
        t_error("dn_expand(\"\\xc0\\2\", name, 1) returned %d, wanted 2\n", r);
    }
    if (name[0]) {
        t_error("dn_expand(\"\\xc0\\2\", name, 1) failed: got \"%s\" name, wanted \"\"\n", name);
    }

    return T_STATUS;
}
