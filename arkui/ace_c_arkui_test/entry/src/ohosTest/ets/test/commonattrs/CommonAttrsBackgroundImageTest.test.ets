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

export default function commonAttrsBackgroundImageTest() {

  describe('CommonAttrsBackgroundImageTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsBackgroundImage001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0100
     * @tc.desc   testing backgroundImage for commonAttrs with valid value "icon.png"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0200
     * @tc.desc   testing backgroundImage for commonAttrs with valid value "icon.png" (bgcolor with red)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0300
     * @tc.desc   testing backgroundImage for commonAttrs with valid value ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0400
     * @tc.desc   testing backgroundImage for commonAttrs with valid value ”abcdefg”
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0500
     * @tc.desc   testing backgroundImage for commonAttrs with invalid value "icon.png",-100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0600
     * @tc.desc   testing backgroundImage for commonAttrs with invalid value "icon.png",NoRepeat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage007
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0700
     * @tc.desc   testing backgroundImage for commonAttrs with valid value "icon.png",X
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage008
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0800
     * @tc.desc   testing backgroundImage for commonAttrs with valid value "icon.png",Y
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage009
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_0900
     * @tc.desc   testing backgroundImage for commonAttrs with valid value "icon.png",XY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage010
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_1000
     * @tc.desc   testing backgroundImage for commonAttrs with valid value "icon.png",XY (bgcolor with red)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImage011
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGE_1100
     * @tc.desc   testing resetAttribute backgroundImage for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImage011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImage011()).assertEqual(0)
      done()
    })
  })
}
