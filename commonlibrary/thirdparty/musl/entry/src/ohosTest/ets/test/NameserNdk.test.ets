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
import nameser from 'libnameserndk.so'

export default function muslNameserNdkTest() {
  describe('MuslNameserTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NAMESER_NSGET16_0100
     * @tc.name       : testMuslNameserNsGet16001
     * @tc.desc       : ns_get16
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNameserNsGet16001', 0, async (done: Function) => {
      let a: number = nameser.nsGet16();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NAMESER_NSGET32_0100
     * @tc.name       : testMuslNameserNsGet32001
     * @tc.desc       : ns_get32
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNameserNsGet32001', 0, async (done: Function) => {
      let a: number = nameser.nsGet32();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NAMESER_NSPUT16_0100
     * @tc.name       : testMuslNameserNsPut16001
     * @tc.desc       : ns_put16
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNameserNsPut16001', 0, async (done: Function) => {
      let a: number = nameser.nsPut16();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NAMESER_NSINITPARSE_0100
     * @tc.name       : testMuslNameserNsInitParse001
     * @tc.desc       : ns_initparse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNameserNsInitParse001', 0, async (done: Function) => {
      let a: number = nameser.nsInitParse();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NAMESER_NSNAMEUNCOMPRESS_0100
     * @tc.name       : testMuslNameserNsNameUnCompress001
     * @tc.desc       : ns_nameuncompress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNameserNsNameUnCompress001', 0, async (done: Function) => {
      let a: number = nameser.nsNameUnCompress();
      expect(a).assertEqual(0);
      done()
    });
  })
}