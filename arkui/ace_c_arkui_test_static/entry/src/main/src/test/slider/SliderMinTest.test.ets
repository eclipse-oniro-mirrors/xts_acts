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

export default function sliderMinTest() {

  describe('SliderMinTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderMin001
     * @tc.name     testSliderMin001
     * @tc.desc     testSliderMin001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMin001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMin001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderMin002
     * @tc.name     testSliderMin002
     * @tc.desc     testSliderMin002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMin002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMin002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderMin003
     * @tc.name     testSliderMin003
     * @tc.desc     testSliderMin003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMin003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMin003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderMin004
     * @tc.name     testSliderMin004
     * @tc.desc     testSliderMin004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMin004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMin004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderMin005
     * @tc.name     testSliderMin005
     * @tc.desc     testSliderMin005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMin005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMin005()).assertEqual(0)
      done()
    })
  })
}
