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

export default function calendarPickerEdgeAlignTest() {

  describe('CalendarPickerEdgeAlignTest', () => {
    beforeAll((): void => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_testwearcrop.static", "EntryAbility")
      console.info("[ui] beforeAll end");
    });

    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testCalendarPickerEdgeAlign001
     * @tc.name     testCalendarPickerEdgeAlign001
     * @tc.desc     testCalendarPickerEdgeAlign001
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerEdgeAlign001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerEdgeAlign001()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerEdgeAlign002
     * @tc.name     testCalendarPickerEdgeAlign002
     * @tc.desc     testCalendarPickerEdgeAlign002
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerEdgeAlign002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerEdgeAlign002()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerEdgeAlign003
     * @tc.name     testCalendarPickerEdgeAlign003
     * @tc.desc     testCalendarPickerEdgeAlign003
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerEdgeAlign003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerEdgeAlign003()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerEdgeAlign004
     * @tc.name     testCalendarPickerEdgeAlign004
     * @tc.desc     testCalendarPickerEdgeAlign004
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerEdgeAlign004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerEdgeAlign004()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerEdgeAlign005
     * @tc.name     testCalendarPickerEdgeAlign005
     * @tc.desc     testCalendarPickerEdgeAlign005
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerEdgeAlign005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerEdgeAlign005()).assertEqual(0)
      done()
    })

  })
}
