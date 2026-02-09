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

export default function sliderBlockColorTest() {

  describe('SliderBlockColorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderBlockColor001
     * @tc.name     testSliderBlockColor001
     * @tc.desc     testSliderBlockColor001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockColor001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockColor001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockColor002
     * @tc.name     testSliderBlockColor002
     * @tc.desc     testSliderBlockColor002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockColor002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockColor002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockColor003
     * @tc.name     testSliderBlockColor003
     * @tc.desc     testSliderBlockColor003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockColor003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockColor003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockColor004
     * @tc.name     testSliderBlockColor004
     * @tc.desc     testSliderBlockColor004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockColor004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockColor004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockColor005
     * @tc.name     testSliderBlockColor005
     * @tc.desc     testSliderBlockColor005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockColor005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockColor005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockColor006
     * @tc.name     testSliderBlockColor006
     * @tc.desc     testSliderBlockColor006
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockColor006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockColor006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderBlockColor007
     * @tc.name     testSliderBlockColor007
     * @tc.desc     testSliderBlockColor007
     * @tc.level    Level.LEVEL1
     */
    it('testSliderBlockColor007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderBlockColor007()).assertEqual(0)
      done()
    })
  })
}
