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

export default function sliderMaxTest() {

  describe('SliderMaxTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSliderMax001
     * @tc.name     testSliderMax001
     * @tc.desc     testSliderMax001
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMax001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMax001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderMax002
     * @tc.name     testSliderMax002
     * @tc.desc     testSliderMax002
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMax002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMax002()).assertEqual(0)
      done()
    })


    
    
/**
     * @tc.number   testSliderMax003
     * @tc.name     testSliderMax003
     * @tc.desc     testSliderMax003
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMax003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMax003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderMax004
     * @tc.name     testSliderMax004
     * @tc.desc     testSliderMax004
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMax004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMax004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSliderMax005
     * @tc.name     testSliderMax005
     * @tc.desc     testSliderMax005
     * @tc.level    Level.LEVEL1
     */
    it('testSliderMax005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderMax005()).assertEqual(0)
      done()
    })
  })
}
