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

export default function checkboxAccessibilityLevelTest() {

  describe('CheckboxAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCheckboxAccessibilityLevel001
     * @tc.name     testCheckboxAccessibilityLevel001
     * @tc.desc     testCheckboxAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxAccessibilityLevel002
     * @tc.name     testCheckboxAccessibilityLevel002
     * @tc.desc     testCheckboxAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxAccessibilityLevel003
     * @tc.name     testCheckboxAccessibilityLevel003
     * @tc.desc     testCheckboxAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxAccessibilityLevel004
     * @tc.name     testCheckboxAccessibilityLevel004
     * @tc.desc     testCheckboxAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxAccessibilityLevel005
     * @tc.name     testCheckboxAccessibilityLevel005
     * @tc.desc     testCheckboxAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxAccessibilityLevel006
     * @tc.name     testCheckboxAccessibilityLevel006
     * @tc.desc     testCheckboxAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
