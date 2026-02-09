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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { LibUtil } from '../../../ets/pages/LibUtil';

const libUtil: LibUtil = new LibUtil();

export default function calendarPickerSelectedDateTest() {

  describe('CalendarPickerSelectedDateTest', () => {
    beforeAll((): void => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_testwearcrop.static", "EntryAbility")
      console.info("[ui] beforeAll end");
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testCalendarPickerSelectedDate001
     * @tc.name     testCalendarPickerSelectedDate001
     * @tc.desc     testCalendarPickerSelectedDate001
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerSelectedDate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerSelectedDate001()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerSelectedDate002
     * @tc.name     testCalendarPickerSelectedDate002
     * @tc.desc     testCalendarPickerSelectedDate002
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerSelectedDate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerSelectedDate002()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerSelectedDate003
     * @tc.name     testCalendarPickerSelectedDate003
     * @tc.desc     testCalendarPickerSelectedDate003
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerSelectedDate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerSelectedDate003()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerSelectedDate004
     * @tc.name     testCalendarPickerSelectedDate004
     * @tc.desc     testCalendarPickerSelectedDate004
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerSelectedDate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerSelectedDate004()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerSelectedDate005
     * @tc.name     testCalendarPickerSelectedDate005
     * @tc.desc     testCalendarPickerSelectedDate005
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerSelectedDate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerSelectedDate005()).assertEqual(0)
      done()
    })

  })
}
