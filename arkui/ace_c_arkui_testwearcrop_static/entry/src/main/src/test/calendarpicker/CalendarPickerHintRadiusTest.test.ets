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

export default function calendarPickerHintRadiusTest() {

  describe('CalendarPickerHintRadiusTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_testwearcrop.static", "EntryAbility")
      console.info("[ui] beforeAll end");
    });

    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testCalendarPickerHintRadius001
     * @tc.name     testCalendarPickerHintRadius001
     * @tc.desc     testCalendarPickerHintRadius001
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerHintRadius001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerHintRadius001()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerHintRadius002
     * @tc.name     testCalendarPickerHintRadius002
     * @tc.desc     testCalendarPickerHintRadius002
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerHintRadius002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerHintRadius002()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerHintRadius003
     * @tc.name     testCalendarPickerHintRadius003
     * @tc.desc     testCalendarPickerHintRadius003
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerHintRadius003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerHintRadius003()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerHintRadius004
     * @tc.name     testCalendarPickerHintRadius004
     * @tc.desc     testCalendarPickerHintRadius004
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerHintRadius004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerHintRadius004()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerHintRadius005
     * @tc.name     testCalendarPickerHintRadius005
     * @tc.desc     testCalendarPickerHintRadius005
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerHintRadius005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerHintRadius005()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerHintRadius006
     * @tc.name     testCalendarPickerHintRadius006
     * @tc.desc     testCalendarPickerHintRadius006
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerHintRadius006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerHintRadius006()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerHintRadius007
     * @tc.name     testCalendarPickerHintRadius007
     * @tc.desc     testCalendarPickerHintRadius007
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerHintRadius007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerHintRadius007()).assertEqual(0)
      done()
    })
  })
}
