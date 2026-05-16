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

export default function commonAttrsBackgroundImagePixelMapTest() {

  describe('CommonAttrsBackgroundImagePixelMapTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsBackgroundImagePixelMap001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0100
     * @tc.desc   testing backgroundImagePixelMap for commonAttrs with valid value pixelmap,NoRepeat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImagePixelMap002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0200
     * @tc.desc   testing backgroundImagePixelMap for commonAttrs with valid value pixelmap,X
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImagePixelMap003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0300
     * @tc.desc   testing backgroundImagePixelMap for commonAttrs with valid value pixelmap,Y
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImagePixelMap004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0400
     * @tc.desc   testing backgroundImagePixelMap for commonAttrs with valid value pixelmap,XY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImagePixelMap005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0500
     * @tc.desc   testing backgroundImagePixelMap for commonAttrs with invalid value pixelmap,-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImagePixelMap006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0600
     * @tc.desc   testing backgroundImagePixelMap for commonAttrs with invalid value pixelmap,4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImagePixelMap007
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0700
     * @tc.desc   testing backgroundImagePixelMap for commonAttrs with invalid value nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePixelMap007()).assertEqual(0)
      done()
    })
  })
}
