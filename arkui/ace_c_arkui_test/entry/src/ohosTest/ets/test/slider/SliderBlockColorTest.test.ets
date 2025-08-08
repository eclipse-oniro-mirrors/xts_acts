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

export default function sliderBlockColorTest() {

  describe('SliderBlockColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKCOLOR_0100
     * @tc.name: testSliderBlockColor001
     * @tc.desc: testing blockColor for slider with default value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockColor001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKCOLOR_0200
     * @tc.name: testSliderBlockColor002
     * @tc.desc: testing blockColor for slider with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKCOLOR_0300
     * @tc.name: testSliderBlockColor003
     * @tc.desc: testing blockColor for slider with boundary value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockColor003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKCOLOR_0400
     * @tc.name: testSliderBlockColor004
     * @tc.desc: testing blockColor for slider with boundary value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockColor004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockColor004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKCOLOR_0500
     * @tc.name: testSliderBlockColor005
     * @tc.desc: testing blockColor for slider with full transparent black value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockColor005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockColor005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKCOLOR_0600
     * @tc.name: testSliderBlockColor006
     * @tc.desc: testing blockColor for slider with translucent black value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockColor006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockColor006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_BLOCKCOLOR_0700
     * @tc.name: testSliderBlockColor007
     * @tc.desc: testing blockColor for slider with zero value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderBlockColor007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderBlockColor007()).assertEqual(0)
      done()
    })
  })
}
