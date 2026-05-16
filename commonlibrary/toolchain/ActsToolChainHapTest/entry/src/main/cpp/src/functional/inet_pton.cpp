/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// inet_addr, inet_ntoa, inet_pton and inet_ntop tests with roundtrip check
#include <cerrno>
#include <cstring>
#include <cstdio>
#include <arpa/inet.h>
#include "test.h"

#define INVALID_AF (12345)
#define HEX_DIGIT_PAIR (2)
#define MAX_DIGIT (9)
#define HEX_WIDTH (10)
#define HEX_BASE (16)
#define DECIMAL_BASE (10)
#define IPV4_BYTES (4)
#define IPV4_ADDR_SIZE (4)
#define IPV6_ADDR_SIZE (16)
#define IPV4_MAPPED_PREFIX_LEN (24)

static int Digit(int c)
{
    c -= '0';
    if (c > MAX_DIGIT) {
        c -= 'a' - '0' - DECIMAL_BASE;
    }
    return c;
}

static void Tobin(void *d, const char *s)
{
    int i;
    unsigned char *p = static_cast<unsigned char*>(d);
    for (i = 0; s[HEX_DIGIT_PAIR * i]; i++) {
        p[i] = Digit(s[HEX_DIGIT_PAIR * i]) * HEX_BASE + Digit(s[HEX_DIGIT_PAIR * i + 1]);
    }
}

static void Tohex(char *d, void *s, int n)
{
    int i;
    unsigned char *p = static_cast<unsigned char*>(s);
    for (i = 0; i < n; i++) {
        (void)sprintf(d + HEX_DIGIT_PAIR * i, "%02x", p[i]);
    }
}

static void TestInetPtonV6(const char *src, int ret, const char *hex, const char *srcExpr, const char *hexExpr)
{
    int r;
    char binaddr[16] = {0};
    char hexaddr[40] = {0};
    char txtaddr[60] = {0};

    r = inet_pton(AF_INET6, src, binaddr);
    if (r != ret) {
        t_error("inet_pton(AF_INET6, %s, addr) returned %d, want %d\n", srcExpr, r, ret);
    }
    if (ret != 1) {
        return;
    }
    Tohex(hexaddr, binaddr, IPV6_ADDR_SIZE);
    if (strcmp(hexaddr, hex)) {
        t_error("inet_pton(AF_INET6, %s, addr) got addr %s, want %s\n", srcExpr, hexaddr, hex);
    }

    Tobin(binaddr, hex);
    if (inet_ntop(AF_INET6, binaddr, txtaddr, sizeof txtaddr) != txtaddr) {
        t_error("inet_ntop(AF_INET6, <%s>, buf, size) did not return buf\n", hexExpr);
    }
    if (inet_pton(AF_INET6, txtaddr, binaddr) != 1) {
        t_error("inet_ntop(AF_INET6, <%s>, buf, size) got %s, it is rejected by inet_pton\n", hexExpr, txtaddr);
    }
    Tohex(hexaddr, binaddr, IPV6_ADDR_SIZE);
    if (strcmp(hexaddr, hex)) {
        t_error("inet_ntop(AF_INET6, <%s>, buf, size) got %s that is %s, want %s\n", hexExpr, txtaddr, hexaddr, hex);
    }
    if (strncmp(hex, "00000000000000000000ffff", IPV4_MAPPED_PREFIX_LEN) == 0 && !strchr(txtaddr, '.')) {
        t_error("inet_ntop(AF_INET6, <%s>, buf, size) got %s, should be ipv4 mapped\n", hexExpr, txtaddr);
    }
}

#define V6(src, ret, hex) TestInetPtonV6(src, ret, hex, #src, #hex)

static void TestInetPtonV4(const char *src, int ret, const char *hex, const char *srcExpr, const char *hexExpr)
{
    int r;
    uint32_t a;
    struct in_addr in;
    char buf[20] = {0};
    char *p;

    a = inet_addr(src);
    Tohex(buf, &a, IPV4_BYTES);
    if (strcmp(buf, hex)) {
        t_error("inet_addr(%s) returned %s, want %s\n", srcExpr, buf, hex);
    }

    r = inet_pton(AF_INET, src, &a);
    if (r != ret) {
        t_error("inet_pton(AF_INET, %s, addr) returned %d, want %d\n", srcExpr, r, ret);
    }

    if (ret != 1) {
        return;
    }

    Tohex(buf, &a, IPV4_ADDR_SIZE);
    if (strcmp(buf, hex)) {
        t_error("inet_pton(AF_INET, %s, addr) got addr %s, want %s\n", srcExpr, buf, hex);
    }

    Tobin(&a, hex);
    if (inet_ntop(AF_INET, &a, buf, sizeof buf) != buf) {
        t_error("inet_ntop(AF_INET, <%s>, buf, size) did not return buf\n", hexExpr);
    }
    if (strcmp(buf, src)) {
        t_error("inet_ntop(AF_INET, <%s>, buf, size) got %s, want %s\n", hexExpr, buf, src);
    }

    in.s_addr = a;
    p = inet_ntoa(in);
    if (strcmp(p, src)) {
        t_error("inet_ntoa(<%s>) returned %s, want %s\n", hexExpr, p, src);
    }
}

#define V4(src, ret, hex) TestInetPtonV4(src, ret, hex, #src, #hex)

static void TestInetPtonErrors(void)
{
    if (inet_pton(INVALID_AF, "", nullptr) != -1 || errno != EAFNOSUPPORT) {
        t_error("inet_pton(12345,,) should fail with EAFNOSUPPORT, got %s\n", strerror(errno));
    }
    errno = 0;
    if (inet_ntop(AF_INET, "xxxx", "", 0) != nullptr || errno != ENOSPC) {
        t_error("inet_ntop(,,0,0) should fail with ENOSPC, got %s\n", strerror(errno));
    }
    errno = 0;
}

static void TestIPv4Addresses(void)
{
    V4("0.0.0.0", 1, "00000000");
    V4("127.0.0.1", 1, "7f000001");
    V4("10.0.128.31", 1, "0a00801f");
    V4("255.255.255.255", 1, "ffffffff");

    V4("1.2.03.4", 0, "01020304");
    V4("1.2.0x33.4", 0, "01023304");
    V4("1.2.0XAB.4", 0, "0102ab04");
    V4("1.2.0xabcd", 0, "0102abcd");
    V4("1.0xabcdef", 0, "01abcdef");
    V4("00377.0x0ff.65534", 0, "fffffffe");

    V4(".1.2.3", 0, "ffffffff");
    V4("1..2.3", 0, "ffffffff");
    V4("1.2.3.", 0, "ffffffff");
    V4("1.2.3.4.5", 0, "ffffffff");
    V4("1.2.3.a", 0, "ffffffff");
    V4("1.256.2.3", 0, "ffffffff");
    V4("1.2.4294967296.3", 0, "ffffffff");
    V4("1.2.-4294967295.3", 0, "ffffffff");
    V4("1.2. 3.4", 0, "ffffffff");
}

static void TestIPv6BasicAddresses(void)
{
    V6(":", 0, "");
    V6("::", 1, "00000000000000000000000000000000");
    V6("::1", 1, "00000000000000000000000000000001");
    V6(":::", 0, "");
    V6("192.168.1.1", 0, "");
    V6(":192.168.1.1", 0, "");
    V6("::192.168.1.1", 1, "000000000000000000000000c0a80101");
    V6("0:0:0:0:0:0:192.168.1.1", 1, "000000000000000000000000c0a80101");
    V6("0:0::0:0:0:192.168.1.1", 1, "000000000000000000000000c0a80101");
    V6("::012.34.56.78", 0, "");
    V6(":ffff:192.168.1.1", 0, "");
    V6("::ffff:192.168.1.1", 1, "00000000000000000000ffffc0a80101");
    V6(".192.168.1.1", 0, "");
    V6(":.192.168.1.1", 0, "");
}

static void TestIPv6ComplexAddresses(void)
{
    V6("a:0b:00c:000d:E:F::", 1, "000a000b000c000d000e000f00000000");
    V6("a:0b:00c:000d:0000e:f::", 0, "");
    V6("1:2:3:4:5:6::", 1, "00010002000300040005000600000000");
    V6("1:2:3:4:5:6:7::", 1, "00010002000300040005000600070000");
    V6("1:2:3:4:5:6:7:8::", 0, "");
    V6("1:2:3:4:5:6:7::9", 0, "");
    V6("::1:2:3:4:5:6", 1, "00000000000100020003000400050006");
    V6("::1:2:3:4:5:6:7", 1, "00000001000200030004000500060007");
    V6("::1:2:3:4:5:6:7:8", 0, "");
    V6("a:b::c:d:e:f", 1, "000a000b00000000000c000d000e000f");
    V6("ffff:c0a8:5e4", 0, "");
    V6(":ffff:c0a8:5e4", 0, "");
    V6("0:0:0:0:0:ffff:c0a8:5e4", 1, "00000000000000000000ffffc0a805e4");
    V6("0:0:0:0:ffff:c0a8:5e4", 0, "");
    V6("0::ffff:c0a8:5e4", 1, "00000000000000000000ffffc0a805e4");
    V6("::0::ffff:c0a8:5e4", 0, "");
    V6("c0a8", 0, "");
}

static int InetPtonTestImpl(void)
{
    TestInetPtonErrors();
    TestIPv4Addresses();
    TestIPv6BasicAddresses();
    TestIPv6ComplexAddresses();
    return g_tStatus;
}

int InetPtonTest(void)
{
    return InetPtonTestImpl();
}
