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

export default function timePickerAccessibilityLevelTest() {

  describe('TimePickerAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testTimePickerAccessibilityLevel001
     * @tc.name     testTimePickerAccessibilityLevel001
     * @tc.desc     testTimePickerAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testTimePickerAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTimePickerAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTimePickerAccessibilityLevel002
     * @tc.name     testTimePickerAccessibilityLevel002
     * @tc.desc     testTimePickerAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testTimePickerAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTimePickerAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTimePickerAccessibilityLevel003
     * @tc.name     testTimePickerAccessibilityLevel003
     * @tc.desc     testTimePickerAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testTimePickerAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTimePickerAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTimePickerAccessibilityLevel004
     * @tc.name     testTimePickerAccessibilityLevel004
     * @tc.desc     testTimePickerAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testTimePickerAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTimePickerAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTimePickerAccessibilityLevel005
     * @tc.name     testTimePickerAccessibilityLevel005
     * @tc.desc     testTimePickerAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testTimePickerAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTimePickerAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTimePickerAccessibilityLevel006
     * @tc.name     testTimePickerAccessibilityLevel006
     * @tc.desc     testTimePickerAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testTimePickerAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTimePickerAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
