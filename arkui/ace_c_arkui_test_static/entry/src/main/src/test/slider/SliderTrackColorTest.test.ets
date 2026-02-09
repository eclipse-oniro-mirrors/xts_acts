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

export default function sliderTrackColorTest() {

  describe('SliderTrackColorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderTrackColor001
     * @tc.name     testSliderTrackColor001
     * @tc.desc     testSliderTrackColor001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderTrackColor001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderTrackColor001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderTrackColor002
     * @tc.name     testSliderTrackColor002
     * @tc.desc     testSliderTrackColor002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderTrackColor002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderTrackColor002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderTrackColor003
     * @tc.name     testSliderTrackColor003
     * @tc.desc     testSliderTrackColor003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderTrackColor003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderTrackColor003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderTrackColor004
     * @tc.name     testSliderTrackColor004
     * @tc.desc     testSliderTrackColor004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderTrackColor004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderTrackColor004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderTrackColor005
     * @tc.name     testSliderTrackColor005
     * @tc.desc     testSliderTrackColor005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderTrackColor005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderTrackColor005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderTrackColor006
     * @tc.name     testSliderTrackColor006
     * @tc.desc     testSliderTrackColor006
     * @tc.level    Level.LEVEL1
     */
    it('testSliderTrackColor006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderTrackColor006()).assertEqual(0)
      done()
    })
  })
}
