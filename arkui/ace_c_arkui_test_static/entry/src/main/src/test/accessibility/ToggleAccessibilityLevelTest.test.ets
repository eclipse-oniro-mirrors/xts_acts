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

export default function toggleAccessibilityLevelTest() {

  describe('ToggleAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testToggleAccessibilityLevel001
     * @tc.name     testToggleAccessibilityLevel001
     * @tc.desc     testToggleAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testToggleAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testToggleAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testToggleAccessibilityLevel002
     * @tc.name     testToggleAccessibilityLevel002
     * @tc.desc     testToggleAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testToggleAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testToggleAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testToggleAccessibilityLevel003
     * @tc.name     testToggleAccessibilityLevel003
     * @tc.desc     testToggleAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testToggleAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testToggleAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testToggleAccessibilityLevel004
     * @tc.name     testToggleAccessibilityLevel004
     * @tc.desc     testToggleAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testToggleAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testToggleAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testToggleAccessibilityLevel005
     * @tc.name     testToggleAccessibilityLevel005
     * @tc.desc     testToggleAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testToggleAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testToggleAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testToggleAccessibilityLevel006
     * @tc.name     testToggleAccessibilityLevel006
     * @tc.desc     testToggleAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testToggleAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testToggleAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
