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

export default function sliderDirectionTest() {

  describe('SliderDirectionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderDirection001
     * @tc.name     testSliderDirection001
     * @tc.desc     testSliderDirection001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderDirection001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderDirection001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderDirection002
     * @tc.name     testSliderDirection002
     * @tc.desc     testSliderDirection002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderDirection002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderDirection002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderDirection003
     * @tc.name     testSliderDirection003
     * @tc.desc     testSliderDirection003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderDirection003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderDirection003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderDirection004
     * @tc.name     testSliderDirection004
     * @tc.desc     testSliderDirection004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderDirection004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderDirection004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderDirection005
     * @tc.name     testSliderDirection005
     * @tc.desc     testSliderDirection005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderDirection005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderDirection005()).assertEqual(0)
      done()
    })
  })
}
