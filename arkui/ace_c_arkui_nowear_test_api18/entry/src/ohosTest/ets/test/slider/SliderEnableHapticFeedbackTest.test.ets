/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function SliderTest() {

  describe('SliderTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_ENABLEHAPTICFEEDBACK_0100
    * @tc.name: testSliderEnableHpaticFeedback001
    * @tc.desc: testing EnableHpaticFeedback for slider with default value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderEnableHpaticFeedback001',  Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSliderEnableHpaticFeedback001()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_ENABLEHAPTICFEEDBACK_0200
    * @tc.name: testSliderEnableHpaticFeedback002
    * @tc.desc: testing EnableHpaticFeedback for slider with true
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderEnableHpaticFeedback002',  Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSliderEnableHpaticFeedback002()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_ENABLEHAPTICFEEDBACK_0300
    * @tc.name: testSliderEnableHpaticFeedback003
    * @tc.desc: testing EnableHpaticFeedback for slider with false
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderEnableHpaticFeedback003',  Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSliderEnableHpaticFeedback003()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_ENABLEHAPTICFEEDBACK_0400
    * @tc.name: testSliderSEnableHpaticFeedback004
    * @tc.desc: testing EnableHpaticFeedback for slider with negative value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 2
    */
    it('testSliderEnableHpaticFeedback004',  Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSliderEnableHpaticFeedback004()).assertEqual(0)
      done()
    })

    /*
    * @tc.number: SUB_ARKUI_CAPI_SLIDER_ENABLEHAPTICFEEDBACK_0500
    * @tc.name: testSliderEnableHpaticFeedback005
    * @tc.desc: testing EnableHpaticFeedback for slider with zero value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testSliderEnableHpaticFeedback005',  Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSliderEnableHpaticFeedback005()).assertEqual(0)
      done()
    })
  })
}
