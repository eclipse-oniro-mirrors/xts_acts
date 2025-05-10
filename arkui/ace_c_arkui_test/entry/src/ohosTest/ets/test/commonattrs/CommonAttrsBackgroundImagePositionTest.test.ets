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

export default function commonAttrsBackgroundImagePositionTest() {
    
  describe('CommonAttrsBackgroundImagePositionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGEPOSITION_0100
     * @tc.name       : testCommonAttrsBackgroundImagePosition001
     * @tc.desc       : testing backgroundimage position for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePosition001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePosition001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGEPOSITION_0200
     * @tc.name       : testCommonAttrsBackgroundImagePosition002
     * @tc.desc       : testing backgroundimage position for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePosition002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePosition002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGEPOSITION_0300
     * @tc.name       : testCommonAttrsBackgroundImagePosition003
     * @tc.desc       : testing backgroundimage position for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePosition003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePosition003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGEPOSITION_0400
     * @tc.name       : testCommonAttrsBackgroundImagePosition004
     * @tc.desc       : testing backgroundimage position for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePosition004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePosition004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGEPOSITION_0500
     * @tc.name       : testCommonAttrsBackgroundImagePosition005
     * @tc.desc       : testing backgroundimage position for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePosition005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePosition005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGEPOSITION_0600
     * @tc.name       : testCommonAttrsBackgroundImagePosition006
     * @tc.desc       : testing backgroundimage position for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePosition006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePosition006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGEPOSITION_0700
     * @tc.name       : testCommonAttrsBackgroundImagePosition007
     * @tc.desc       : testing backgroundimage position for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePosition007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePosition007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDIMAGEPOSITION_0800
     * @tc.name       : testCommonAttrsBackgroundImagePosition008
     * @tc.desc       : testing resetAttribute backgroundimage position
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundImagePosition008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundImagePosition008()).assertEqual(0)
      done()
    })
  })
}