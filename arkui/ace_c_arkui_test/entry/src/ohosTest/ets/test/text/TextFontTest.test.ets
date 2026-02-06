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

export default function textFontTest() {

  describe('TextFontTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextFont001
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_0100
     * @tc.desc   testing font for text with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont002
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_0200
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont003
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_0300
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont004
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_0400
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont005
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_0500
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont006
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_0600
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont007
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_0700
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont008
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_0800
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont009
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_0900
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont010
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_1000
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont011
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_1100
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont012
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_1200
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont013
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_1300
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont014
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT1400
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont015
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_1500
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont016
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_1600
     * @tc.desc   testing font for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont017
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_1700
     * @tc.desc   testing font for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFont018
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONT_1800
     * @tc.desc   testing font for text with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFont018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFont018()).assertEqual(0)
      done()
    })


  })
}
