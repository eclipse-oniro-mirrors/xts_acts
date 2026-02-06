'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function sliderAccessibilityGroupTest() {

  describe('SliderAccessibilityGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderAccessibilityGroup001
     * @tc.name     testSliderAccessibilityGroup001
     * @tc.desc     testSliderAccessibilityGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityGroup001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderAccessibilityGroup002
     * @tc.name     testSliderAccessibilityGroup002
     * @tc.desc     testSliderAccessibilityGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityGroup002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderAccessibilityGroup003
     * @tc.name     testSliderAccessibilityGroup003
     * @tc.desc     testSliderAccessibilityGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityGroup003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderAccessibilityGroup004
     * @tc.name     testSliderAccessibilityGroup004
     * @tc.desc     testSliderAccessibilityGroup004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityGroup004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
