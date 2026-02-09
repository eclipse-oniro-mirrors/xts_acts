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

export default function calendarPickerWidthTest() {

  describe('CalendarPickerWidthTest', () => {
    beforeAll((): void => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_testwearcrop.static", "EntryAbility")
      console.info("[ui] beforeAll end");
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testCalendarPickerWidth001
     * @tc.name     testCalendarPickerWidth001
     * @tc.desc     testCalendarPickerWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerWidth001()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerWidth002
     * @tc.name     testCalendarPickerWidth002
     * @tc.desc     testCalendarPickerWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerWidth002()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerWidth003
     * @tc.name     testCalendarPickerWidth003
     * @tc.desc     testCalendarPickerWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerWidth003()).assertEqual(0)
      done()
    })

  })
}
