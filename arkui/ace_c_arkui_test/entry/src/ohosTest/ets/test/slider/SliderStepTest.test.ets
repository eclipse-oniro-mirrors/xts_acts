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

export default function sliderStepTest() {

  describe('SliderStepTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSliderStep001
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STEP_0100
     * @tc.desc   testing step for slider with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStep001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStep001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderStep002
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STEP_0200
     * @tc.desc   testing step for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStep002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStep002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderStep003
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STEP_0300
     * @tc.desc   testing step for slider with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStep003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStep003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderStep004
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STEP_0400
     * @tc.desc   testing step for slider with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStep004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStep004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderStep005
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STEP_0500
     * @tc.desc   testing step for slider with value greater than 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStep005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStep005()).assertEqual(0)
      done()
    })
  })
}
