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

export default function commonAttrsBackgroundImageSizeTest() {

  describe('CommonAttrsBackgroundImageSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_0100
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value 100,100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_0200
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value 100,-100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_0300
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value -100,100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_0400
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value -100,-100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_0500
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value ,100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_0600
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value 100,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize007
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_0700
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value 300,300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize008
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_0800
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value Auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize009
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_0900
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value Cover
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize010
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_1000
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value Contain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize011
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_1100
     * @tc.desc   testing backgroundImageSize for commonAttrs with valid value Fill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize012
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_1200
     * @tc.desc   testing backgroundImageSize for commonAttrs with invalid value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize013
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_1300
     * @tc.desc   testing backgroundImageSize for commonAttrs with invalid value 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBackgroundImageSize014
     * @tc.number SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGESIZE_1400
     * @tc.desc   testing resetAttribute backgroundImageSize for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBackgroundImageSize014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImageSize014()).assertEqual(0)
      done()
    })
  })
}