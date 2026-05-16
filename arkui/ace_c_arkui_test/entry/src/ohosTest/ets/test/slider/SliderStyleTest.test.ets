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

export default function sliderStyleTest() {

  describe('SliderStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSliderStyle001
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STYLE_0100
     * @tc.desc   testing style for slider with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderStyle002
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STYLE_0200
     * @tc.desc   testing style for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderStyle003
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STYLE_0300
     * @tc.desc   testing style for slider with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderStyle004
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STYLE_0400
     * @tc.desc   testing style for slider with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderStyle005
     * @tc.number SUB_ARKUI_CAPI_SLIDER_STYLE_0500
     * @tc.desc   testing style for slider with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderStyle005()).assertEqual(0)
      done()
    })
  })
}
