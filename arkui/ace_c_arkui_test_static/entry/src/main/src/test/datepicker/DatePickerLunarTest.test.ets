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

export default function datePickerLunarTest() {

  describe('DatePickerLunarTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testDatePickerLunar001
     * @tc.name     testDatePickerLunar001
     * @tc.desc     testDatePickerLunar001
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerLunar001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerLunar001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerLunar002
     * @tc.name     testDatePickerLunar002
     * @tc.desc     testDatePickerLunar002
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerLunar002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerLunar002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerLunar003
     * @tc.name     testDatePickerLunar003
     * @tc.desc     testDatePickerLunar003
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerLunar003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerLunar003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerLunar004
     * @tc.name     testDatePickerLunar004
     * @tc.desc     testDatePickerLunar004
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerLunar004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerLunar003()).assertEqual(0)
      done()
    })
  })
}
