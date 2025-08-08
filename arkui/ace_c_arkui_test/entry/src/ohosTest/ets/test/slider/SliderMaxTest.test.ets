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

export default function sliderMaxTest() {

  describe('SliderMaxTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MAX_0100
    * @tc.name: testSliderMax001
    * @tc.desc: testing max value for slider with default value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderMax001', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMax001()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MAX_0200
    * @tc.name: testSliderMax002
    * @tc.desc: testing max value for slider with normal value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderMax002', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMax002()).assertEqual(0)
      done()
    })


    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MAX_0300
    * @tc.name: testSliderMax003
    * @tc.desc: testing max value for slider with abnormal value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 2
    */
    it('testSliderMax003', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMax003()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MAX_0400
    * @tc.name: testSliderMax004
    * @tc.desc: testing max value for slider with value greater than 100
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderMax004', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMax004()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_MAX_0500
    * @tc.name: testSliderMax005
    * @tc.desc: testing max value for slider with zero value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderMax005', 0, async (done: Function) => {
      expect(nativeFunc.testSliderMax005()).assertEqual(0)
      done()
    })
  })
}
