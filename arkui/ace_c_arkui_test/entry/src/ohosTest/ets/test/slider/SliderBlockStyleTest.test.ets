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

export default function sliderBlockStyleTest() {

  describe('SliderBlockStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSliderBlockStyle001
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0100
     * @tc.desc   testing blockStyle for slider with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle002
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0200
     * @tc.desc   testing blockStyle for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle003
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0300
     * @tc.desc   testing blockStyle for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle004
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0400
     * @tc.desc   testing blockStyle for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle005
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0500
     * @tc.desc   testing blockStyle for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle006
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0600
     * @tc.desc   testing blockStyle for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle007
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0700
     * @tc.desc   testing blockStyle for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle008
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0800
     * @tc.desc   testing blockStyle for slider with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle009
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0900
     * @tc.desc   testing blockStyle for slider with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle010
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_1000
     * @tc.desc   testing blockStyle for slider with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle011
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_1100
     * @tc.desc   testing blockStyle for slider with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderBlockStyle012
     * @tc.number SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_1200
     * @tc.desc   testing blockStyle for slider with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderBlockStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle012()).assertEqual(0)
      done()
    })
  })
}
