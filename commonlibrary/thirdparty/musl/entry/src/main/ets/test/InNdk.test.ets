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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import inndk from 'libinndk.so'

export default function inNdkTest() {
  describe('MuslInTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_IN_NTOHL_0100
     * @tc.name       : testMuslInNtohl001
     * @tc.desc       : test ntohl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInNtohl001', 0, async (done: Function) => {
      let data: number = inndk.ntohl();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(2018915346);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_IN_NTOHS_0100
     * @tc.name       : testMuslInNtohs001
     * @tc.desc       : test ntohs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInNtohs001', 0, async (done: Function) => {
      let data: number = inndk.ntohs();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(13330);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_IN_HTONL_0100
     * @tc.name       : testMuslInHtonl001
     * @tc.desc       : test htonl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInHtonl001', 0, async (done: Function) => {
      let data: number = inndk.htonl();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_IN_HTONS_0100
     * @tc.name       : testMuslInHtons001
     * @tc.desc       : test htons
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInHtons001', 0, async (done: Function) => {
      let data: number = inndk.htons();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_IN6ADDR_ANY_0100
     * @tc.name       : testMuslIn6addrAny001
     * @tc.desc       : test __in6addr_any
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslIn6addrAny001', 0, async (done: Function) => {
      let result: number = inndk.in6addrAny();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_IN6ADDR_LOOPBACK_0100
     * @tc.name       : testMuslIn6addrLoopback001
     * @tc.desc       : test __in6addr_loopback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslIn6addrLoopback001', 0, async (done: Function) => {
      let result: number = inndk.in6addrLoopback();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

  })
}