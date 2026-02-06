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

export default function commonAttrsSaturateTest() {

  describe('CommonAttrsSaturateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsSaturate001
     * @tc.number SUB_ARKUI_CAPI_IMAGE_SATURATE_0100
     * @tc.desc   testing saturate for commonAttrs with valid value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSaturate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSaturate001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSaturate002
     * @tc.number SUB_ARKUI_CAPI_IMAGE_SATURATE_0200
     * @tc.desc   testing saturate for commonAttrs with valid value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSaturate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSaturate002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSaturate003
     * @tc.number SUB_ARKUI_CAPI_IMAGE_SATURATE_0300
     * @tc.desc   testing saturate for commonAttrs with valid value 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSaturate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSaturate003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSaturate004
     * @tc.number SUB_ARKUI_CAPI_IMAGE_SATURATE_0400
     * @tc.desc   testing saturate for commonAttrs with valid value 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSaturate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSaturate004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSaturate005
     * @tc.number SUB_ARKUI_CAPI_IMAGE_SATURATE_0500
     * @tc.desc   testing saturate for commonAttrs with invalid value 51
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSaturate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSaturate005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSaturate006
     * @tc.number SUB_ARKUI_CAPI_IMAGE_SATURATE_0600
     * @tc.desc   testing saturate for commonAttrs with invalid value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSaturate006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSaturate006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSaturate007
     * @tc.number SUB_ARKUI_CAPI_IMAGE_SATURATE_0700
     * @tc.desc   testing resetAttribute saturate for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSaturate007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSaturate007()).assertEqual(0)
      done()
    })
  })
}