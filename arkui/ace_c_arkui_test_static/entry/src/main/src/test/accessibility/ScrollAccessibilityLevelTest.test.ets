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

export default function scrollAccessibilityLevelTest() {

  describe('ScrollAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollAccessibilityLevel001
     * @tc.name     testScrollAccessibilityLevel001
     * @tc.desc     testScrollAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testScrollAccessibilityLevel002
     * @tc.name     testScrollAccessibilityLevel002
     * @tc.desc     testScrollAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testScrollAccessibilityLevel003
     * @tc.name     testScrollAccessibilityLevel003
     * @tc.desc     testScrollAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testScrollAccessibilityLevel004
     * @tc.name     testScrollAccessibilityLevel004
     * @tc.desc     testScrollAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testScrollAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testScrollAccessibilityLevel005
     * @tc.name     testScrollAccessibilityLevel005
     * @tc.desc     testScrollAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testScrollAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testScrollAccessibilityLevel006
     * @tc.name     testScrollAccessibilityLevel006
     * @tc.desc     testScrollAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testScrollAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
