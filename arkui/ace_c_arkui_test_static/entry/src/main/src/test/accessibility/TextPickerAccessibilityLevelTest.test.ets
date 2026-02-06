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

export default function textPickerAccessibilityLevelTest() {

  describe('TextPickerAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testTextPickerAccessibilityLevel001
     * @tc.name     testTextPickerAccessibilityLevel001
     * @tc.desc     testTextPickerAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testTextPickerAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextPickerAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextPickerAccessibilityLevel002
     * @tc.name     testTextPickerAccessibilityLevel002
     * @tc.desc     testTextPickerAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testTextPickerAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextPickerAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextPickerAccessibilityLevel003
     * @tc.name     testTextPickerAccessibilityLevel003
     * @tc.desc     testTextPickerAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testTextPickerAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextPickerAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextPickerAccessibilityLevel004
     * @tc.name     testTextPickerAccessibilityLevel004
     * @tc.desc     testTextPickerAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testTextPickerAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextPickerAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextPickerAccessibilityLevel005
     * @tc.name     testTextPickerAccessibilityLevel005
     * @tc.desc     testTextPickerAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testTextPickerAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextPickerAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextPickerAccessibilityLevel006
     * @tc.name     testTextPickerAccessibilityLevel006
     * @tc.desc     testTextPickerAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testTextPickerAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextPickerAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
