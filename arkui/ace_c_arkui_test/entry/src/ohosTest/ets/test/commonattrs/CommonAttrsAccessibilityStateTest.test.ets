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

export default function commonAttrsAccessibilityStateTest() {

  describe('CommonAttrsAccessibilityStateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_0100
     * @tc.name       : testCommonAttrsAccessibilityState001
     * @tc.desc       : testing accessibility state for commonAttrs with valid value create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_0200
     * @tc.name       : testCommonAttrsAccessibilityState002
     * @tc.desc       : testing accessibility state for commonAttrs with valid value dispose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_0300
     * @tc.name       : testCommonAttrsAccessibilityState003
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_0400
     * @tc.name       : testCommonAttrsAccessibilityState004
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_0500
     * @tc.name       : testCommonAttrsAccessibilityState005
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_0600
     * @tc.name       : testCommonAttrsAccessibilityState006
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_0700
     * @tc.name       : testCommonAttrsAccessibilityState007
     * @tc.desc       : testing accessibility state for commonAttrs with valid value -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_0800
     * @tc.name       : testCommonAttrsAccessibilityState008
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_0900
     * @tc.name       : testCommonAttrsAccessibilityState009
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1000
     * @tc.name       : testCommonAttrsAccessibilityState010
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1100
     * @tc.name       : testCommonAttrsAccessibilityState011
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1200
     * @tc.name       : testCommonAttrsAccessibilityState012
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1300
     * @tc.name       : testCommonAttrsAccessibilityState013
     * @tc.desc       : testing accessibility state for commonAttrs with valid value -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1400
     * @tc.name       : testCommonAttrsAccessibilityState014
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1500
     * @tc.name       : testCommonAttrsAccessibilityState015
     * @tc.desc       : testing accessibility state for commonAttrs with valid value ARKUI_ACCESSIBILITY_CHECKED
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1600
     * @tc.name       : testCommonAttrsAccessibilityState016
     * @tc.desc       : testing accessibility state for commonAttrs with valid value ARKUI_ACCESSIBILITY_UNCHECKED
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1700
     * @tc.name       : testCommonAttrsAccessibilityState017
     * @tc.desc       : testing accessibility state for commonAttrs with valid value ARKUI_ACCESSIBILITY_CHECKED
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1800
     * @tc.name       : testCommonAttrsAccessibilityState018
     * @tc.desc       : testing accessibility state for commonAttrs with valid value ARKUI_ACCESSIBILITY_UNCHECKED
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_1900
     * @tc.name       : testCommonAttrsAccessibilityState019
     * @tc.desc       : testing accessibility state for commonAttrs with valid value -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_2000
     * @tc.name       : testCommonAttrsAccessibilityState020
     * @tc.desc       : testing accessibility state for commonAttrs with valid value 2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYSTATE_2100
     * @tc.name       : testCommonAttrsAccessibilityState021
     * @tc.desc       : testing resetAttribute accessibility state for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsAccessibilityState021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityState021()).assertEqual(0)
      done()
    })
  })
}