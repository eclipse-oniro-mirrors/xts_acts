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

export default function sliderMinTest() {

  describe('SliderMinTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MIN_0100
    * @tc.name: testSliderMin001
    * @tc.desc: testing min value for slider with default value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderMin001', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMin001()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MIN_0200
    * @tc.name: testSliderMin002
    * @tc.desc: testing min value for slider with normal value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderMin002', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMin002()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MIN_0300
    * @tc.name: testSliderMin003
    * @tc.desc: testing min value for slider with negative value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 2
    */
    it('testSliderMin003', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMin003()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MIN_0400
    * @tc.name: testSliderMin004
    * @tc.desc: testing min value for slider with value greater than 100
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderMin004', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMin004()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MIN_0500
    * @tc.name: testSliderMin005
    * @tc.desc: testing min value for slider with zero value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderMin005', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMin005()).assertEqual(0)
      done()
    })
  })
}
