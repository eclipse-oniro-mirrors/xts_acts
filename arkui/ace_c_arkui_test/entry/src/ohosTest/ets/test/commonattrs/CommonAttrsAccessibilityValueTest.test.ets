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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsAccessibilityValueTest() {

  describe('CommonAttrsAccessibilityValueTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0100
     * @tc.name       : testCommonAttrsAccessibilityValue001
     * @tc.desc       : testing accessibility value for commonAttrs with valid value create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0200
     * @tc.name       : testCommonAttrsAccessibilityValue002
     * @tc.desc       : testing accessibility value for commonAttrs with invalid value dispose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0300
     * @tc.name       : testCommonAttrsAccessibilityValue003
     * @tc.desc       : testing accessibility value for commonAttrs with null value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0400
     * @tc.name       : testCommonAttrsAccessibilityValue004
     * @tc.desc       : testing accessibility value for commonAttrs with empty value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0500
     * @tc.name       : testCommonAttrsAccessibilityValue005
     * @tc.desc       : testing accessibility value for commonAttrs with min value -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0600
     * @tc.name       : testCommonAttrsAccessibilityValue006
     * @tc.desc       : testing accessibility value for commonAttrs with min value 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0700
     * @tc.name       : testCommonAttrsAccessibilityValue007
     * @tc.desc       : testing accessibility value for commonAttrs with valid value min 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0800
     * @tc.name       : testCommonAttrsAccessibilityValue008
     * @tc.desc       : testing accessibility value for commonAttrs with valid value min 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_0900
     * @tc.name       : testCommonAttrsAccessibilityValue009
     * @tc.desc       : testing accessibility value for commonAttrs with max value 200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1000
     * @tc.name       : testCommonAttrsAccessibilityValue010
     * @tc.desc       : testing accessibility value for commonAttrs with max value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1100
     * @tc.name       : testCommonAttrsAccessibilityValue011
     * @tc.desc       : testing accessibility value for commonAttrs with valid value 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1200
     * @tc.name       : testCommonAttrsAccessibilityValue012
     * @tc.desc       : testing accessibility value for commonAttrs with max value 200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue012', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1300
     * @tc.name       : testCommonAttrsAccessibilityValue013
     * @tc.desc       : testing accessibility value for commonAttrs with max value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue013', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1400
     * @tc.name       : testCommonAttrsAccessibilityValue014
     * @tc.desc       : testing accessibility value for commonAttrs with max value -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue014', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYVALUE_1500
     * @tc.name       : testCommonAttrsAccessibilityValue015
     * @tc.desc       : testing resetAttribute accessibility value for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityValue015', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityValue015()).assertEqual(0)
      done()
    })
  })
}