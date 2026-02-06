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

export default function datePickerStartTest() {

  describe('DatePickerStartTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testDatePickerStart001
     * @tc.name     testDatePickerStart001
     * @tc.desc     testDatePickerStart001
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerStart001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerStart001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerStart002
     * @tc.name     testDatePickerStart002
     * @tc.desc     testDatePickerStart002
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerStart002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerStart002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerStart003
     * @tc.name     testDatePickerStart003
     * @tc.desc     testDatePickerStart003
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerStart003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerStart003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerStart004
     * @tc.name     testDatePickerStart004
     * @tc.desc     testDatePickerStart004
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerStart004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerStart004()).assertEqual(0)
      done()
    })
  })
}
