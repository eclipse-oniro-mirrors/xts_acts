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

export default function textFontTest() {

  describe('TextFontTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_0100
     * @tc.name       : testTextFont001
     * @tc.desc       : testing font for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont001', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_0200
     * @tc.name       : testTextFont002
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont002', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_0300
     * @tc.name       : testTextFont003
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont003', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_0400
     * @tc.name       : testTextFont004
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont004', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_0500
     * @tc.name       : testTextFont005
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont005', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_0600
     * @tc.name       : testTextFont006
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont006', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_0700
     * @tc.name       : testTextFont007
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont007', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_0800
     * @tc.name       : testTextFont008
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont008', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_0900
     * @tc.name       : testTextFont009
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont009', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_1000
     * @tc.name       : testTextFont010
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont010', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_1100
     * @tc.name       : testTextFont011
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont011', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_1200
     * @tc.name       : testTextFont012
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont012', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_1300
     * @tc.name       : testTextFont013
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont013', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT1400
     * @tc.name       : testTextFont014
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont014', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_1500
     * @tc.name       : testTextFont015
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont015', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_1600
     * @tc.name       : testTextFont016
     * @tc.desc       : testing font for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont016', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_1700
     * @tc.name       : testTextFont017
     * @tc.desc       : testing font for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextFont017', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONT_1800
     * @tc.name       : testTextFont018
     * @tc.desc       : testing font for text with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFont018', 0, async (done: Function) => {
      expect(nativeFunc.testTextFont018()).assertEqual(0)
      done()
    })


  })
}
