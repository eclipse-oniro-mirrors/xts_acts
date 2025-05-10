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

export default function sliderBlockStyleTest() {

  describe('SliderBlockStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0100
     * @tc.name: testSliderBlockStyle001
     * @tc.desc: testing blockStyle for slider with default value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0200
     * @tc.name: testSliderBlockStyle002
     * @tc.desc: testing blockStyle for slider with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0300
     * @tc.name: testSliderBlockStyle003
     * @tc.desc: testing blockStyle for slider with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0400
     * @tc.name: testSliderBlockStyle004
     * @tc.desc: testing blockStyle for slider with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0500
     * @tc.name: testSliderBlockStyle005
     * @tc.desc: testing blockStyle for slider with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0600
     * @tc.name: testSliderBlockStyle006
     * @tc.desc: testing blockStyle for slider with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockStyle006', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0700
     * @tc.name: testSliderBlockstyle007
     * @tc.desc: testing blockStyle for slider with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockStyle007', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0800
     * @tc.name: testSliderBlockstyle008
     * @tc.desc: testing blockStyle for slider with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSliderBlockStyle008', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_0900
     * @tc.name: testSliderBlockstyle009
     * @tc.desc: testing blockStyle for slider with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSliderBlockStyle009', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_1000
     * @tc.name: testSliderBlockstyle010
     * @tc.desc: testing blockStyle for slider with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSliderBlockStyle010', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_1100
     * @tc.name: testSliderBlockstyle011
     * @tc.desc: testing blockStyle for slider with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSliderBlockStyle011', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKSTYLE_1200
     * @tc.name: testSliderBlockstyle012
     * @tc.desc: testing blockStyle for slider with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSliderBlockStyle012', 0, async (done: Function) => {
      expect(nativeFunc.testSliderBlockStyle012()).assertEqual(0)
      done()
    })
  })
}
