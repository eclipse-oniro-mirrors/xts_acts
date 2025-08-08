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

export default function commonAttrsBackgroundImagePixelMapTest() {

  describe('CommonAttrsBackgroundImagePixelMapTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0100
     * @tc.name       : testCommonAttrsBackgroundImagePixelMap001
     * @tc.desc       : testing backgroundImagePixelMap for commonAttrs with valid value pixelmap,NoRepeat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePixelMap001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0200
     * @tc.name       : testCommonAttrsBackgroundImagePixelMap002
     * @tc.desc       : testing backgroundImagePixelMap for commonAttrs with valid value pixelmap,X
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePixelMap002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0300
     * @tc.name       : testCommonAttrsBackgroundImagePixelMap003
     * @tc.desc       : testing backgroundImagePixelMap for commonAttrs with valid value pixelmap,Y
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePixelMap003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0400
     * @tc.name       : testCommonAttrsBackgroundImagePixelMap004
     * @tc.desc       : testing backgroundImagePixelMap for commonAttrs with valid value pixelmap,XY
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePixelMap004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0500
     * @tc.name       : testCommonAttrsBackgroundImagePixelMap005
     * @tc.desc       : testing backgroundImagePixelMap for commonAttrs with invalid value pixelmap,-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePixelMap005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0600
     * @tc.name       : testCommonAttrsBackgroundImagePixelMap006
     * @tc.desc       : testing backgroundImagePixelMap for commonAttrs with invalid value pixelmap,4
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePixelMap006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0700
     * @tc.name       : testCommonAttrsBackgroundImagePixelMap007
     * @tc.desc       : testing backgroundImagePixelMap for commonAttrs with invalid value nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePixelMap007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap007()).assertEqual(0)
      done()
    })
  })
}
