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

export default function textImmutablfFontWeight(){

  describe('textImmutablfFontWeight', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0100
     * @tc.name       : textImmutablfFontWeight_001
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The input invalid value is 850.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0200
     * @tc.name       : textImmutablfFontWeight_002
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value AKUI_FONT_WEIGHT_W100 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0300
     * @tc.name       : textImmutablfFontWeight_003
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value AKUI_FONT_WEIGHT_W200 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0400
     * @tc.name       : textImmutablfFontWeight_004
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W300 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0500
     * @tc.name       : textImmutablfFontWeight_005
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W400 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0600
     * @tc.name       : textImmutablfFontWeight_006
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W500 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0700
     * @tc.name       : textImmutablfFontWeight_007
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W600 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0800
     * @tc.name       : textImmutablfFontWeight_008
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W700 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0900
     * @tc.name       : textImmutablfFontWeight_009
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W800 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1000
     * @tc.name       : textImmutablfFontWeight_010
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W900 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1100
     * @tc.name       : textImmutablfFontWeight_011
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_BOLD is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1200
     * @tc.name       : textImmutablfFontWeight_012
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_NORMAL is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1300
     * @tc.name       : textImmutablfFontWeight_013
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_BOLDER is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1400
     * @tc.name       : textImmutablfFontWeight_014
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_LIGHTER is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1500
     * @tc.name       : textImmutablfFontWeight_015
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_MEDIUM is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1600
     * @tc.name       : textImmutablfFontWeight_016
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_REGULAR is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('textImmutablfFontWeight_016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textImmutablfFontWeight_016()).assertEqual(0)
      done()
    })
  })
}