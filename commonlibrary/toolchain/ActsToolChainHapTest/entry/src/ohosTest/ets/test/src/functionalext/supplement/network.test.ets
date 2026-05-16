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

import * as testNapi from "libentry.so";
import { describe, expect, it, Level } from "@ohos/hypium";

export default function network_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_network", () => {
    /**
     * @tc.name   h_errno_location
     * @tc.number SUB_THIRDPARTY_MUSL_H_ERRNO_LOCATION_0100
     * @tc.desc   libc-test __h_errno_location
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("h_errno_location", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__h_errno_location");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   recvmmsg_time64
     * @tc.number SUB_THIRDPARTY_MUSL_RECVMMSG_TIME_0100
     * @tc.desc   libc-test __recvmmsg_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("recvmmsg_time64", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__recvmmsg_time64");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dn_comp
     * @tc.number SUB_THIRDPARTY_MUSL_DN_COMP_0100
     * @tc.desc   libc-test dn_comp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dn_comp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dn_comp");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dn_skipname
     * @tc.number SUB_THIRDPARTY_MUSL_DN_SKIPNAME_0100
     * @tc.desc   libc-test dn_skipname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dn_skipname", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dn_skipname");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   freeaddrinfo
     * @tc.number SUB_THIRDPARTY_MUSL_FREEADDRINFO_0100
     * @tc.desc   libc-test freeaddrinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("freeaddrinfo", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("freeaddrinfo");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   freeifaddrs
     * @tc.number SUB_THIRDPARTY_MUSL_FREEIFADDRS_0100
     * @tc.desc   libc-test freeifaddrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("freeifaddrs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("freeifaddrs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   gai_strerror
     * @tc.number SUB_THIRDPARTY_MUSL_GAI_STRERROR_0100
     * @tc.desc   libc-test gai_strerror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gai_strerror", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gai_strerror");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   gethostent
     * @tc.number SUB_THIRDPARTY_MUSL_GETHOSTENT_0100
     * @tc.desc   libc-test gethostent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gethostent", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gethostent");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getifaddrs
     * @tc.number SUB_THIRDPARTY_MUSL_GETIFADDRS_0100
     * @tc.desc   libc-test getifaddrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getifaddrs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getifaddrs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getnetent
     * @tc.number SUB_THIRDPARTY_MUSL_GETNETENT_0100
     * @tc.desc   libc-test getnetent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getnetent", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getnetent");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getservbyname
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVBYNAME_0100
     * @tc.desc   libc-test getservbyname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getservbyname", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getservbyname");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getservbyport
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVBYPORT_0100
     * @tc.desc   libc-test getservbyport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getservbyport", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getservbyport");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hstrerror
     * @tc.number SUB_THIRDPARTY_MUSL_HSTRERROR_0100
     * @tc.desc   libc-test hstrerror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hstrerror", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hstrerror");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   htonl
     * @tc.number SUB_THIRDPARTY_MUSL_HTONL_0100
     * @tc.desc   libc-test htonl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("htonl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("htonl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   htons
     * @tc.number SUB_THIRDPARTY_MUSL_HTONS_0100
     * @tc.desc   libc-test htons
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("htons", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("htons");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   if_indextoname
     * @tc.number SUB_THIRDPARTY_MUSL_IF_INDEXTONAME_0100
     * @tc.desc   libc-test if_indextoname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("if_indextoname", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("if_indextoname");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   if_nameindex
     * @tc.number SUB_THIRDPARTY_MUSL_IF_NAMEINDEX_0100
     * @tc.desc   libc-test if_nameindex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("if_nameindex", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("if_nameindex");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   inet_aton
     * @tc.number SUB_THIRDPARTY_MUSL_INET_ATON_0100
     * @tc.desc   libc-test inet_aton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_aton", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_aton");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   inet_lnaof
     * @tc.number SUB_THIRDPARTY_MUSL_INET_LNAOF_0100
     * @tc.desc   libc-test inet_lnaof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_lnaof", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_lnaof");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   inet_makeaddr
     * @tc.number SUB_THIRDPARTY_MUSL_INET_MAKEADDR_0100
     * @tc.desc   libc-test inet_makeaddr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_makeaddr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_makeaddr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   inet_netof
     * @tc.number SUB_THIRDPARTY_MUSL_INET_NETOF_0100
     * @tc.desc   libc-test inet_netof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_netof", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_netof");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   inet_network
     * @tc.number SUB_THIRDPARTY_MUSL_INET_NETWORK_0100
     * @tc.desc   libc-test inet_network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_network", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_network");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   inet_ntoa
     * @tc.number SUB_THIRDPARTY_MUSL_INET_NTOA_0100
     * @tc.desc   libc-test inet_ntoa
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_ntoa", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_ntoa");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   proto
     * @tc.number SUB_THIRDPARTY_MUSL_PROTO_0100
     * @tc.desc   libc-test proto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("proto", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("proto");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sendmsg
     * @tc.number SUB_THIRDPARTY_MUSL_SENDMSG_0100
     * @tc.desc   libc-test sendmsg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sendmsg", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sendmsg");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setprotoent
     * @tc.number SUB_THIRDPARTY_MUSL_SETPROTOENT_0100
     * @tc.desc   libc-test setprotoent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setprotoent", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setprotoent");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   socketpair
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKETPAIR_0100
     * @tc.desc   libc-test socketpair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("socketpair", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("socketpair");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   accept4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_ACCEPT_FOUR_BASIC_0100
     * @tc.desc   libc-test accept4
     */
    it("accept4", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("accept4");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getaddrinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_0100
     * @tc.desc   libc-test getaddrinfo
     */
    it("getaddrinfo", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getaddrinfo");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getpeername
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_GETPEERNAME_0100
     * @tc.desc   libc-test getpeername
     */
    it("getpeername", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getpeername");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getsockopt_network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_GETSOCKOPT_NETWORK_0100
     * @tc.desc   libc-test getsockopt_network
     */
    it("getsockopt_network", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getsockopt_network");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   listen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_LISTEN_0100
     * @tc.desc   libc-test listen
     */
    it("listen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("listen");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   recv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_RECV_0100
     * @tc.desc   libc-test recv
     */
    it("recv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("recv");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   recvmmsg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_RECVMMSG_0100
     * @tc.desc   libc-test recvmmsg
     */
    it("recvmmsg", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("recvmmsg");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   recvmsg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_RECVMSG_0100
     * @tc.desc   libc-test recvmsg
     */
    it("recvmsg", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("recvmsg");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   send
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_SEND_0100
     * @tc.desc   libc-test send
     */
    it("send", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("send");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   shutdown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_SHUTDOWN_0100
     * @tc.desc   libc-test shutdown
     */
    it("shutdown", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("shutdown");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   inet_addr
     * @tc.number SUB_THIRDPARTY_MUSL_INET_ADDR_0100
     * @tc.desc   libc-test inet_addr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_addr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_addr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   inet_ntop
     * @tc.number SUB_THIRDPARTY_MUSL_INET_NTOP_0100
     * @tc.desc   libc-test inet_ntop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_ntop", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_ntop");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   res_mkquery
     * @tc.number SUB_THIRDPARTY_MUSL_RES_MKQUERY_0100
     * @tc.desc   libc-test res_mkquery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("res_mkquery", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("res_mkquery");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   res_query
     * @tc.number SUB_THIRDPARTY_MUSL_RES_QUERY_0100
     * @tc.desc   libc-test res_query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("res_query", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("res_query");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   res_querydomain
     * @tc.number SUB_THIRDPARTY_MUSL_RES_QUERYDOMAIN_0100
     * @tc.desc   libc-test res_querydomain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("res_querydomain", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("res_querydomain");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sendmmsg
     * @tc.number SUB_THIRDPARTY_MUSL_SENDMMSG_0100
     * @tc.desc   libc-test sendmmsg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sendmmsg", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sendmmsg");
      expect(result).assertEqual(0);
      done();
    });
  });
}
