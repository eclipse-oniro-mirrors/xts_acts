/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsAlignItemsTest() {

  describe('CommonAttrsAlignItemsTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNITEMS_0100
     * @tc.name: testCommonAttrsAlignItems001
     * @tc.desc: testing alignItems for row with top value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignItems001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignItems001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNITEMS_0200
     * @tc.name: testCommonAttrsAlignItems002
     * @tc.desc: testing alignItems for row with center value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignItems002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignItems002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNITEMS_0300
     * @tc.name: testCommonAttrsAlignItems003
     * @tc.desc: testing alignItems for row with bottom value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignItems003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignItems003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNITEMS_0400
     * @tc.name: testCommonAttrsAlignItems004
     * @tc.desc: testing alignItems for column with start value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignItems004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignItems004()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNITEMS_0500
     * @tc.name: testCommonAttrsAlignItems005
     * @tc.desc: testing alignItems for column with center value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignItems005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignItems005()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNITEMS_0600
     * @tc.name: testCommonAttrsAlignItems006
     * @tc.desc: testing alignItems for column with end value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignItems006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignItems006()).assertEqual(0)
      done();
    })
  })
}
