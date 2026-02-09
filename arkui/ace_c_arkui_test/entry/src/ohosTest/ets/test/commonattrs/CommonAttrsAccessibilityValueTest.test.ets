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

export default function commonAttrsAccessibilityValueTest() {

  describe('CommonAttrsAccessibilityValueTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsAccessibilityValue001
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0100
     * @tc.desc   testing accessibility value for commonAttrs with valid value create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue002
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0200
     * @tc.desc   testing accessibility value for commonAttrs with invalid value dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue003
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0300
     * @tc.desc   testing accessibility value for commonAttrs with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue004
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0400
     * @tc.desc   testing accessibility value for commonAttrs with empty value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue005
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0500
     * @tc.desc   testing accessibility value for commonAttrs with min value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue006
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0600
     * @tc.desc   testing accessibility value for commonAttrs with min value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue007
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0700
     * @tc.desc   testing accessibility value for commonAttrs with valid value min 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue008
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0800
     * @tc.desc   testing accessibility value for commonAttrs with valid value min 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue009
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0900
     * @tc.desc   testing accessibility value for commonAttrs with max value 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue010
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1000
     * @tc.desc   testing accessibility value for commonAttrs with max value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue011
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1100
     * @tc.desc   testing accessibility value for commonAttrs with valid value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue012
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1200
     * @tc.desc   testing accessibility value for commonAttrs with max value 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue013
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1300
     * @tc.desc   testing accessibility value for commonAttrs with max value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue014
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1400
     * @tc.desc   testing accessibility value for commonAttrs with max value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityValue015
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1500
     * @tc.desc   testing resetAttribute accessibility value for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityValue015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue015()).assertEqual(0)
      done()
    })
  })
}