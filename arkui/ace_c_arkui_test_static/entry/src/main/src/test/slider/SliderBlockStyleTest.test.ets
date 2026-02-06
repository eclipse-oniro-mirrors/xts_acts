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

export default function sliderBlockStyleTest() {

  describe('SliderBlockStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderBlockStyle001
     * @tc.name     testSliderBlockStyle001
     * @tc.desc     testSliderBlockStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle002
     * @tc.name     testSliderBlockStyle002
     * @tc.desc     testSliderBlockStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle003
     * @tc.name     testSliderBlockStyle003
     * @tc.desc     testSliderBlockStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle004
     * @tc.name     testSliderBlockStyle004
     * @tc.desc     testSliderBlockStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle005
     * @tc.name     testSliderBlockStyle005
     * @tc.desc     testSliderBlockStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle006
     * @tc.name     testSliderBlockStyle006
     * @tc.desc     testSliderBlockStyle006
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle007
     * @tc.name     testSliderBlockStyle007
     * @tc.desc     testSliderBlockStyle007
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle008
     * @tc.name     testSliderBlockStyle008
     * @tc.desc     testSliderBlockStyle008
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle009
     * @tc.name     testSliderBlockStyle009
     * @tc.desc     testSliderBlockStyle009
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle010
     * @tc.name     testSliderBlockStyle010
     * @tc.desc     testSliderBlockStyle010
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle011
     * @tc.name     testSliderBlockStyle011
     * @tc.desc     testSliderBlockStyle011
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockStyle012
     * @tc.name     testSliderBlockStyle012
     * @tc.desc     testSliderBlockStyle012
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockStyle012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockStyle012()).assertEqual(0)
      done()
    })
  })
}
