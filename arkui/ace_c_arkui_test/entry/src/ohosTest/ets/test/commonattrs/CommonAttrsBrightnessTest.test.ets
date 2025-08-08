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

export default function commonAttrsBrightnessTest() {
    
  describe('CommonAttrsBrightnessTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0100
     * @tc.name       : testCommonAttrsBrightness001
     * @tc.desc       : testing brightness for commonAttrs with valid value 0.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBrightness001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBrightness001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0200
     * @tc.name       : testCommonAttrsBrightness002
     * @tc.desc       : testing brightness for commonAttrs with valid value 1.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBrightness002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBrightness002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0300
     * @tc.name       : testCommonAttrsBrightness003
     * @tc.desc       : testing brightness for commonAttrs with valid value 0.5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBrightness003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBrightness003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0400
     * @tc.name       : testCommonAttrsBrightness004
     * @tc.desc       : testing brightness for commonAttrs with valid value 1.5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBrightness004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBrightness004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0500
     * @tc.name       : testCommonAttrsBrightness005
     * @tc.desc       : testing brightness for commonAttrs with valid value 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBrightness005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBrightness005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0600
     * @tc.name       : testCommonAttrsBrightness006
     * @tc.desc       : testing brightness for commonAttrs with invalid value -1.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBrightness006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBrightness006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0700
     * @tc.name       : testCommonAttrsBrightness007
     * @tc.desc       : testing brightness for commonAttrs with invalid value -20
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBrightness007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBrightness007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BRIGHTNESS_0800
     * @tc.name       : testCommonAttrsBrightness008
     * @tc.desc       : testing resetAttribute brightness for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBrightness008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBrightness008()).assertEqual(0)
      done()
    })
  })
}
