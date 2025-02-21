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
import ifAddrs from 'libifaddrsndk1.so'


export default function muslIfaddrsNdk1Test() {
  describe('MuslIfAddrs1Test', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_IFADDRS_FREEIFADDRS_0100
     * @tc.name       : testMuslIfAddrsFreeIfAddrs001
     * @tc.desc       : test freeifaddrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslIfAddrsFreeIfAddrs001', 0, async (done: Function) => {
      expect(ifAddrs.freeIfAddrs()).assertEqual(0);
      done()
    });
  })
}
