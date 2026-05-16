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

export default function sliderValueTest() {

  describe('SliderValueTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderValue001
     * @tc.name     testSliderValue001
     * @tc.desc     testSliderValue001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderValue001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderValue001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderValue002
     * @tc.name     testSliderValue002
     * @tc.desc     testSliderValue002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderValue002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderValue002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderValue003
     * @tc.name     testSliderValue003
     * @tc.desc     testSliderValue003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderValue003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderValue003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderValue004
     * @tc.name     testSliderValue004
     * @tc.desc     testSliderValue004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderValue004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderValue004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderValue005
     * @tc.name     testSliderValue005
     * @tc.desc     testSliderValue005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderValue005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderValue005()).assertEqual(0)
      done()
    })
  })
}
