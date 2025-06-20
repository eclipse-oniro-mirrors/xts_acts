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

export default function sliderTrackColorTest() {

  describe('SliderTrackColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_TRACKCOLOR_0100
    * @tc.name: testSliderTrackColor001
    * @tc.desc: testing trackColor for slider with normal value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderTrackColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackColor001()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_TRACKCOLOR_0200
    * @tc.name: testSliderTrackColor002
    * @tc.desc: testing trackColor for slider with boundary value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderTrackColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackColor002()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_TRACKCOLOR_0300
    * @tc.name: testSliderTrackColor003
    * @tc.desc: testing trackColor for slider with boundary value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderTrackColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackColor003()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_TRACKCOLOR_0400
    * @tc.name: testSliderTrackColor004
    * @tc.desc: testing trackColor for slider with full transparent black value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderTrackColor004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackColor004()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_TRACKCOLOR_0500
    * @tc.name: testSliderTrackColor005
    * @tc.desc: testing trackColor for slider with translucent black value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderTrackColor005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackColor005()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_TRACKCOLOR_0600
    * @tc.name: testSliderTrackColor006
    * @tc.desc: testing trackColor for slider with zero value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderTrackColor006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackColor006()).assertEqual(0)
      done()
    })
  })
}
