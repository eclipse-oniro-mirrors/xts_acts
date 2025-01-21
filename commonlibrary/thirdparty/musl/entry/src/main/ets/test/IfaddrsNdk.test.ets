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

import { describe, expect, it } from '@ohos/hypium'
import ifAddrs from 'libifaddrsndk.so'


export default function muslIfaddrsNdkTest() {
  describe('MuslIfAddrsTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_IFADDRS_GETIFADDRS_0100
     * @tc.name       : testMuslIfAddrsGetIfAddrs001
     * @tc.desc       : test getifaddrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslIfAddrsGetIfAddrs001', 0, async (done: Function) => {
      let data: string = ifAddrs.getIfAddrs();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_IFADDRS_FREEIFADDRS_0200
     * @tc.name       : testMuslIfAddrsFreeIfAddrs002
     * @tc.desc       : test freeifaddrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslIfAddrsFreeIfAddrs002', 0, async (done: Function) => {
      let data: string = ifAddrs.freeIfAddrs();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
  })
}
