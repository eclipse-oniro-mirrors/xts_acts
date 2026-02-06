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

export default function datePickerAccessibilityGroupTest() {

  describe('DatePickerAccessibilityGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testDatePickerAccessibilityGroup001
     * @tc.name     testDatePickerAccessibilityGroup001
     * @tc.desc     testDatePickerAccessibilityGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityGroup001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerAccessibilityGroup002
     * @tc.name     testDatePickerAccessibilityGroup002
     * @tc.desc     testDatePickerAccessibilityGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityGroup002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerAccessibilityGroup003
     * @tc.name     testDatePickerAccessibilityGroup003
     * @tc.desc     testDatePickerAccessibilityGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityGroup003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerAccessibilityGroup004
     * @tc.name     testDatePickerAccessibilityGroup004
     * @tc.desc     testDatePickerAccessibilityGroup004
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerAccessibilityGroup004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
