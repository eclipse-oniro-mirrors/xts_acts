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

export default function sliderValueTest() {

  describe('SliderValueTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSliderValue001
     * @tc.number SUB_ARKUI_CAPI_SLIDER_VALUE_0100
     * @tc.desc   testing progress value for slider with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderValue001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderValue001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderValue002
     * @tc.number SUB_ARKUI_CAPI_SLIDER_VALUE_0200
     * @tc.desc   testing progress value for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderValue002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderValue002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderValue003
     * @tc.number SUB_ARKUI_CAPI_SLIDER_VALUE_0300
     * @tc.desc   testing progress value for slider with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderValue003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderValue003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderValue004
     * @tc.number SUB_ARKUI_CAPI_SLIDER_VALUE_0400
     * @tc.desc   testing progress value for slider with value greater than 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderValue004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderValue004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderValue005
     * @tc.number SUB_ARKUI_CAPI_SLIDER_VALUE_0500
     * @tc.desc   testing progress value for slider with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderValue005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderValue005()).assertEqual(0)
      done()
    })
  })
}
