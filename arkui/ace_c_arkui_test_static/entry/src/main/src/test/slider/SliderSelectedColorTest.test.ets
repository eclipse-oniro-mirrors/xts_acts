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

export default function sliderSelectedColorTest() {

  describe('SliderSelectedColorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderSelectedColor002
     * @tc.name     testSliderSelectedColor002
     * @tc.desc     testSliderSelectedColor002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderSelectedColor002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderSelectedColor002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderSelectedColor003
     * @tc.name     testSliderSelectedColor003
     * @tc.desc     testSliderSelectedColor003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderSelectedColor003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderSelectedColor003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderSelectedColor004
     * @tc.name     testSliderSelectedColor004
     * @tc.desc     testSliderSelectedColor004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderSelectedColor004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderSelectedColor004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderSelectedColor005
     * @tc.name     testSliderSelectedColor005
     * @tc.desc     testSliderSelectedColor005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderSelectedColor005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderSelectedColor005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderSelectedColor006
     * @tc.name     testSliderSelectedColor006
     * @tc.desc     testSliderSelectedColor006
     * @tc.level    Level.LEVEL1
     */
    it('testSliderSelectedColor006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderSelectedColor006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderSelectedColor007
     * @tc.name     testSliderSelectedColor007
     * @tc.desc     testSliderSelectedColor007
     * @tc.level    Level.LEVEL1
     */
    it('testSliderSelectedColor007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderSelectedColor007()).assertEqual(0)
      done()
    })


  })
}
