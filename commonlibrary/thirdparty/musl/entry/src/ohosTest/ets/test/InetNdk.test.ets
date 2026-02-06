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
import inet from 'libinetndk.so'


export default function muslInetNdkTest() {
  describe('MuslInetTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_ADDR_0100
     * @tc.name       : testMuslInetInetAddr001
     * @tc.desc       : test inet_addr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetAddr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetAddr(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1346044170);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_ADDR_0200
     * @tc.name       : testMuslInetInetAddr002
     * @tc.desc       : test inet_addr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetAddr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetAddr(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1677830336);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_ADDR_0300
     * @tc.name       : testMuslInetInetAddr003
     * @tc.desc       : test inet_addr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetAddr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetAddr(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(23374016);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_ATON_0100
     * @tc.name       : testMuslInetInetAton001
     * @tc.desc       : test inet_aton
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetAton001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetAton(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_ATON_0200
     * @tc.name       : testMuslInetInetAton002
     * @tc.desc       : test inet_aton
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetAton002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetAton(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_ATON_0300
     * @tc.name       : testMuslInetInetAton003
     * @tc.desc       : test inet_aton
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetAton003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetAton(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_LNAOF_0100
     * @tc.name       : testMuslInetInetLnaof001
     * @tc.desc       : test inet_lnaof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetLnaof001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetLnaof(1346044170);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(80720);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_LNAOF_0200
     * @tc.name       : testMuslInetInetLnaof002
     * @tc.desc       : test inet_lnaof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetLnaof002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetLnaof(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_LNAOF_0300
     * @tc.name       : testMuslInetInetLnaof003
     * @tc.desc       : test inet_lnaof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetLnaof003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetLnaof(1677830336);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(100);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_MAKEADDR_0100
     * @tc.name       : testMuslInetInetMakeaddr001
     * @tc.desc       : test inet_makeaddr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetMakeaddr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetMakeaddr(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_MAKEADDR_0200
     * @tc.name       : testMuslInetInetMakeaddr002
     * @tc.desc       : test inet_makeaddr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetMakeaddr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetMakeaddr(1074644938);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1074644938);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_MAKEADDR_0300
     * @tc.name       : testMuslInetInetMakeaddr003
     * @tc.desc       : test inet_makeaddr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetMakeaddr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetMakeaddr(1677830336);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1677830336);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NETOF_0100
     * @tc.name       : testMuslInetInetNetof001
     * @tc.desc       : test inet_netof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNetof001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetNetof(1677830336);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(12625921);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NETOF_0200
     * @tc.name       : testMuslInetInetNetof002
     * @tc.desc       : test inet_netof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNetof002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetNetof(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NETOF_0300
     * @tc.name       : testMuslInetInetNetof003
     * @tc.desc       : test inet_netof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNetof003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetNetof(1346044170);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(10);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NETWORK_0100
     * @tc.name       : testMuslInetInetNetwork001
     * @tc.desc       : test inet_network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNetwork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetNetwork(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(167852880);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NETWORK_0200
     * @tc.name       : testMuslInetInetNetwork002
     * @tc.desc       : test inet_network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNetwork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetNetwork(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(-1062706175);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NETWORK_0300
     * @tc.name       : testMuslInetInetNetwork003
     * @tc.desc       : test inet_network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNetwork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetNetwork(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(-1062731420);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NTOA_0100
     * @tc.name       : testMuslInetInetNtoa001
     * @tc.desc       : test inet_ntoa
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNtoa001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: string = inet.inetNtoa(1346044170);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("10.1.59.80");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NTOA_0200
     * @tc.name       : testMuslInetInetNtoa002
     * @tc.desc       : test inet_ntoa
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNtoa002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: string = inet.inetNtoa(1677830336);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("192.168.1.100");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NTOA_0300
     * @tc.name       : testMuslInetInetNtoa003
     * @tc.desc       : test inet_ntoa
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNtoa003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: string = inet.inetNtoa(23374016);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("192.168.100.1");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_PTON_0100
     * @tc.name       : testMuslInetInetPton001
     * @tc.desc       : test inet_pton
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetPton001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetPton(23374016);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_PTON_0200
     * @tc.name       : testMuslInetInetPton002
     * @tc.desc       : test inet_pton
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetPton002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetPton(1677830336);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_PTON_0300
     * @tc.name       : testMuslInetInetPton003
     * @tc.desc       : test inet_pton
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetPton003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetPton(1346044170);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NTOP_0100
     * @tc.name       : testMuslInetInetNtop001
     * @tc.desc       : test inet_ntop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNtop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetNtop(23374016);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NTOP_0200
     * @tc.name       : testMuslInetInetNtop002
     * @tc.desc       : test inet_ntop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNtop002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetNtop(1677830336);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INET_INET_NTOP_0300
     * @tc.name       : testMuslInetInetNtop003
     * @tc.desc       : test inet_ntop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInetInetNtop003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = inet.inetNtop(1346044170);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
  })
}
