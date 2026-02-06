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

export default function commonAttrsFocusOnTouchTest() {

  describe('CommonAttrsFocusOnTouchTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_BUTTON_FOCUSONTOUCH_0100
     * @tc.name       : testCommonAttrsFocusOnTouch001
     * @tc.desc       : testing focusontouch for commonAttrs with valid value 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsFocusOnTouch001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`commonattrs/CommonAttrsFocusOnTouchTest`, done);
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('btnFocusOnTouch').$attrs.backgroundColor).assertEqual('#0xFF00FF00')
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_BUTTON_FOCUSONTOUCH_0200
     * @tc.name       : testCommonAttrsFocusOnTouch002
     * @tc.desc       : testing focusontouch for commonAttrs with invalid value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsFocusOnTouch002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsFocusOnTouch002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_BUTTON_FOCUSONTOUCH_0300
     * @tc.name       : testCommonAttrsFocusOnTouch003
     * @tc.desc       : testing focusontouch for commonAttrs with null value 2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsFocusOnTouch003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsFocusOnTouch003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_BUTTON_FOCUSONTOUCH_0400
     * @tc.name       : testCommonAttrsFocusOnTouch004
     * @tc.desc       : testing focusontouch for commonAttrs with valid value -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsFocusOnTouch004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsFocusOnTouch004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_BUTTON_FOCUSONTOUCH_0500
     * @tc.name       : testCommonAttrsFocusOnTouch005
     * @tc.desc       : testing focusontouch for commonAttrs with reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsFocusOnTouch005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsFocusOnTouch005()).assertEqual(0)
      done()
    })
  })
}
