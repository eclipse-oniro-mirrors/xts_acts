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

export default function sliderAccessibilityLevelTest() {

  describe('SliderAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderAccessibilityLevel001
     * @tc.name     testSliderAccessibilityLevel001
     * @tc.desc     testSliderAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderAccessibilityLevel002
     * @tc.name     testSliderAccessibilityLevel002
     * @tc.desc     testSliderAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderAccessibilityLevel003
     * @tc.name     testSliderAccessibilityLevel003
     * @tc.desc     testSliderAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderAccessibilityLevel004
     * @tc.name     testSliderAccessibilityLevel004
     * @tc.desc     testSliderAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderAccessibilityLevel005
     * @tc.name     testSliderAccessibilityLevel005
     * @tc.desc     testSliderAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderAccessibilityLevel006
     * @tc.name     testSliderAccessibilityLevel006
     * @tc.desc     testSliderAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testSliderAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
