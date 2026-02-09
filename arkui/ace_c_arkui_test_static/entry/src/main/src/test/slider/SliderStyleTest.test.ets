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

export default function sliderStyleTest() {

  describe('SliderStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderStyle001
     * @tc.name     testSliderStyle001
     * @tc.desc     testSliderStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderStyle002
     * @tc.name     testSliderStyle002
     * @tc.desc     testSliderStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStyle002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderStyle003
     * @tc.name     testSliderStyle003
     * @tc.desc     testSliderStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStyle003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderStyle004
     * @tc.name     testSliderStyle004
     * @tc.desc     testSliderStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStyle004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderStyle005
     * @tc.name     testSliderStyle005
     * @tc.desc     testSliderStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderStyle005()).assertEqual(0)
      done()
    })
  })
}
