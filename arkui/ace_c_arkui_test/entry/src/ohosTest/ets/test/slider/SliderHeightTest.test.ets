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

export default function sliderHeightTest() {

  describe('SliderHeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_HEIGHT_0100
     * @tc.name: testSliderHeight001
     * @tc.desc: testing height for slider with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderHeight001', 0, async (done: Function) => {
      expect(nativeFunc.testSliderHeight001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_HEIGHT_0200
     * @tc.name: testSliderHeight002
     * @tc.desc: testing height for slider with large value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSliderHeight002', 0, async (done: Function) => {
      expect(nativeFunc.testSliderHeight002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_HEIGHT_0300
     * @tc.name: testSliderHeight003
     * @tc.desc: testing height for slider with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderHeight003', 0, async (done: Function) => {
      expect(nativeFunc.testSliderHeight003()).assertEqual(0)
      done()
    })

  })
}
