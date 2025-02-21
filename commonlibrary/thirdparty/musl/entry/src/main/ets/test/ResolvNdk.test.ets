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
import resolv from 'libresolvndk.so'

export default function resolvNdkTest() {
  describe('MuslResolvTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOLV_RESINIT_0100
     * @tc.name       : testMuslResolvResInit001
     * @tc.desc       : test res_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResolvResInit001', 0, async (done: Function) => {
      let result: number = resolv.resInit();
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOLV_RESMKQUERY_0100
     * @tc.name       : testMuslResolvResMkquery001
     * @tc.desc       : test res_mkquery
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResolvResMkquery001', 0, async (done: Function) => {
      let param = -1;
      let result: number = resolv.resMkquery(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOLV_RESMKQUERY_0200
     * @tc.name       : testMuslResolvResMkquery002
     * @tc.desc       : test res_mkquery
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResolvResMkquery002', 0, async (done: Function) => {
      let param = 0;
      let result: number = resolv.resMkquery(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOLV_DN_EXPAND_0100
     * @tc.name       : testMuslReSoLvDnExpand001
     * @tc.desc       : test dn_expand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslReSoLvDnExpand001', 0, async (done: Function) => {
      let result = false;
      if (resolv.dn_expand() != -1) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });
  })

}
