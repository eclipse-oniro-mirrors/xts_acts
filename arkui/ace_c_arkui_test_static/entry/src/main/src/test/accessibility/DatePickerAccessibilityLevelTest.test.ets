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

export default function datePickerAccessibilityLevelTest() {

  describe('DatePickerAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testDatePickerAccessibilityLevel001
     * @tc.name     testDatePickerAccessibilityLevel001
     * @tc.desc     testDatePickerAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerAccessibilityLevel002
     * @tc.name     testDatePickerAccessibilityLevel002
     * @tc.desc     testDatePickerAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerAccessibilityLevel003
     * @tc.name     testDatePickerAccessibilityLevel003
     * @tc.desc     testDatePickerAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerAccessibilityLevel004
     * @tc.name     testDatePickerAccessibilityLevel004
     * @tc.desc     testDatePickerAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerAccessibilityLevel005
     * @tc.name     testDatePickerAccessibilityLevel005
     * @tc.desc     testDatePickerAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerAccessibilityLevel006
     * @tc.name     testDatePickerAccessibilityLevel006
     * @tc.desc     testDatePickerAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
