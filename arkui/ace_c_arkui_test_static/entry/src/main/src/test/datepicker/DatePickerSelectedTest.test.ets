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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil: LibUtil = new LibUtil();

export default function datePickerSelectedTest() {

  describe('DatePickerSelectedTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testDatePickerSelected001
     * @tc.name     testDatePickerSelected001
     * @tc.desc     testDatePickerSelected001
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelected001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelected001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testDatePickerSelected002
     * @tc.name     testDatePickerSelected002
     * @tc.desc     testDatePickerSelected002
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelected002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelected002()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testDatePickerSelected003
     * @tc.name     testDatePickerSelected003
     * @tc.desc     testDatePickerSelected003
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelected003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelected003()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testDatePickerSelected004
     * @tc.name     testDatePickerSelected004
     * @tc.desc     testDatePickerSelected004
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelected004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelected004()).assertEqual(0)
      done()
    })
  })
}
