/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import netdb from 'libnetdbndk.so'


export default function muslNetdbNdkTest() {
  describe('MuslNetdbTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOENT_0100
     * @tc.name       : testMuslNetDbGetProtoEnt001
     * @tc.desc       : test getprotoent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getProtoEnt();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNAME_0100
     * @tc.name       : testMuslNetDbGetProtoByName001
     * @tc.desc       : test getprotobyname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: string = netdb.getProtoByName("tcp");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("tcp");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNAME_0200
     * @tc.name       : testMuslNetDbGetProtoByName002
     * @tc.desc       : test getprotobynumber
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: string = netdb.getProtoByName("ipv6");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("ipv6");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNAME_0300
     * @tc.name       : testMuslNetDbGetProtoByName003
     * @tc.desc       : test getprotobyname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: string = netdb.getProtoByName("esp");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("esp");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNUMBER_0100
     * @tc.name       : testMuslNetDbGetProtoByNumber001
     * @tc.desc       : test getprotobynumber
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: string = netdb.getProtoByNumber(6);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("tcp");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNUMBER_0200
     * @tc.name       : testMuslNetDbGetProtoByNumber002
     * @tc.desc       : test getprotobynumber
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByNumber002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: string = netdb.getProtoByNumber(17);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("udp");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETSERVBYNAME_0100
     * @tc.name       : testMuslNetDbGetServByName001
     * @tc.desc       : test getservbyname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetServByName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getServByName();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETSERVBYPORT_0100
     * @tc.name       : testMuslNetDbGetServByPort001
     * @tc.desc       : test getservbyport
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetServByPort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getServByPort();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETHOSTBYADDR_R_0100
     * @tc.name       : testMuslNetDbGetHostByAddrR001
     * @tc.desc       : test gethostbyaddr_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetHostByAddrR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getHostByAddrR();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETNAMEINFO_0100
     * @tc.name       : testMuslNetDbGetNameInfo001
     * @tc.desc       : test getnameinfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetDbGetNameInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getNameInfo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETHOSTENT_0100
     * @tc.name       : testMuslNetDbGetHostEnt001
     * @tc.desc       : test gethostent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetDbGetHostEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getHostEnt();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETSERVENT_0100
     * @tc.name       : testMuslNetDbGetServEnt001
     * @tc.desc       : test getservent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetDbGetServEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getServEnt();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETNETENT_0100
     * @tc.name       : testMuslNetDbGetNetEnt001
     * @tc.desc       : test getnetent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetDbGetNetEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getNetEnt();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETHOSTBYADDR_0100
     * @tc.name       : testMuslNetDbGetHostByAddr001
     * @tc.desc       : test gethostbyaddr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetDbGetHostByAddr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getHostByAddr();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETHOSTBYNAMER_0100
     * @tc.name       : testMuslNetDbGetHostByNameR001
     * @tc.desc       : test gethostbyname_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetDbGetHostByNameR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getHostByNameR();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETHOSTBYNAME2_0100
     * @tc.name       : testMuslNetDbGetHostByName2001
     * @tc.desc       : test gethostbyname2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetDbGetHostByName2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getHostByName2();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETHOSTBYNAME2_R_0100
     * @tc.name       : testMuslNetDbGetHostByName2R001
     * @tc.desc       : test gethostbyname2_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetDbGetHostByName2R001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getHostByName2R();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_HSTRERROR_0100
     * @tc.name       : testMuslNetDbHstrerror001
     * @tc.desc       : test hstrerror
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbHstrerror001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.hstrerror();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_HERROR_0100
     * @tc.name       : testMuslNetDbHerror001
     * @tc.desc       : test herror
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbHerror001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.herror();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETHOSTBYNAME_0100
     * @tc.name       : testMuslNetDbGetHostByName001
     * @tc.desc       : test getservbyport
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetHostByName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = netdb.getHostByName();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_SETHOSTENT_0100
     * @tc.name       : testMuslNetdbSethostent001
     * @tc.desc       : test sethostent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetdbSethostent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = netdb.sethostent();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_SETNETENT_0100
     * @tc.name       : testMuslNetdbSetnetent001
     * @tc.desc       : test setnetent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetdbSetnetent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = netdb.setnetent();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_SETPROTOENT_0100
     * @tc.name       : testMuslNetdbSetprotoent001
     * @tc.desc       : test setprotoent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetdbSetprotoent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = netdb.setprotoent();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_SETSERVENT_0100
     * @tc.name       : testMuslNetdbSetservent001
     * @tc.desc       : test setservent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetdbSetservent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = netdb.setservent();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_ENDSERVENT_0100
     * @tc.name       : testMuslNetdbEndServEnt001
     * @tc.desc       : test endservent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetdbEndServEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(netdb.endservent()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_ENDPROTOENT_0100
     * @tc.name       : testMuslNetdbEndProToEnt001
     * @tc.desc       : test endprotoent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetdbEndProToEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(netdb.endprotoent()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_ENDNETENT_0100
     * @tc.name       : testMuslNetdbEndNetEnt001
     * @tc.desc       : test endnetent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetdbEndNetEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(netdb.endnetent()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_ENDHOSTENT_0100
     * @tc.name       : testMuslNetdbEndHostEnt001
     * @tc.desc       : test endhostent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslNetdbEndHostEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(netdb.endhostent()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GAI_STRERROR_0100
     * @tc.name       : testMuslNetDbGaiStrerror001
     * @tc.desc       : test gai_strerror
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGaiStrerror001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = 1;
      let data: number = netdb.gaiStrerror();
      expect(data).assertEqual(result);
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_FREEADDRINFO_0100
    * @tc.name       : testMuslNetdbFreeaddrinfo001
    * @tc.desc       : test freeaddrinfo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testMuslNetdbFreeaddrinfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data : number = netdb.freeaddrinfo();
      expect(data).assertEqual(0);
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETADDRINFO_0100
    * @tc.name       : testMuslNetdbGetaddrinfo001
    * @tc.desc       : test getaddrinfo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testMuslNetdbGetaddrinfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data:number = netdb.getaddrinfo();
      expect(data).assertEqual(0);
      done()
    });

  })
}