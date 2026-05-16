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

export default function sliderStepTest() {

  describe('SliderStepTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderStep001
     * @tc.name     testSliderStep001
     * @tc.desc     testSliderStep001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStep001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStep001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderStep002
     * @tc.name     testSliderStep002
     * @tc.desc     testSliderStep002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStep002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStep002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderStep003
     * @tc.name     testSliderStep003
     * @tc.desc     testSliderStep003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStep003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStep003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderStep004
     * @tc.name     testSliderStep004
     * @tc.desc     testSliderStep004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStep004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStep004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderStep005
     * @tc.name     testSliderStep005
     * @tc.desc     testSliderStep005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStep005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStep005()).assertEqual(0)
      done()
    })
  })
}
