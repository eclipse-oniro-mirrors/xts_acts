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

export default function sliderReverseTest() {

  describe('SliderReverseTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderReverse001
     * @tc.name     testSliderReverse001
     * @tc.desc     testSliderReverse001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderReverse001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderReverse001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderReverse002
     * @tc.name     testSliderReverse002
     * @tc.desc     testSliderReverse002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderReverse002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderReverse002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderReverse003
     * @tc.name     testSliderReverse003
     * @tc.desc     testSliderReverse003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderReverse003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderReverse003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderReverse004
     * @tc.name     testSliderReverse004
     * @tc.desc     testSliderReverse004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderReverse004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderReverse004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderReverse005
     * @tc.name     testSliderReverse005
     * @tc.desc     testSliderReverse005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderReverse005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderReverse005()).assertEqual(0)
      done()
    })
  })
}
