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

export default function calendarPickerTextStyleTest() {

  describe('CalendarPickerTextStyleTest', () => {
    beforeAll((): void => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_testwearcrop.static", "EntryAbility")
      console.info("[ui] beforeAll end");
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testCalendarPickerTextStyle001
     * @tc.name     testCalendarPickerTextStyle001
     * @tc.desc     testCalendarPickerTextStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle001()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle002
     * @tc.name     testCalendarPickerTextStyle002
     * @tc.desc     testCalendarPickerTextStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle002()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle003
     * @tc.name     testCalendarPickerTextStyle003
     * @tc.desc     testCalendarPickerTextStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle003()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle004
     * @tc.name     testCalendarPickerTextStyle004
     * @tc.desc     testCalendarPickerTextStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle004()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle005
     * @tc.name     testCalendarPickerTextStyle005
     * @tc.desc     testCalendarPickerTextStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle005()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle006
     * @tc.name     testCalendarPickerTextStyle006
     * @tc.desc     testCalendarPickerTextStyle006
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle006()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle007
     * @tc.name     testCalendarPickerTextStyle007
     * @tc.desc     testCalendarPickerTextStyle007
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle007()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle008
     * @tc.name     testCalendarPickerTextStyle008
     * @tc.desc     testCalendarPickerTextStyle008
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle008()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle009
     * @tc.name     testCalendarPickerTextStyle009
     * @tc.desc     testCalendarPickerTextStyle009
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle009()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle010
     * @tc.name     testCalendarPickerTextStyle010
     * @tc.desc     testCalendarPickerTextStyle010
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle010()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle011
     * @tc.name     testCalendarPickerTextStyle011
     * @tc.desc     testCalendarPickerTextStyle011
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle011()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle012
     * @tc.name     testCalendarPickerTextStyle012
     * @tc.desc     testCalendarPickerTextStyle012
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle012()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle013
     * @tc.name     testCalendarPickerTextStyle013
     * @tc.desc     testCalendarPickerTextStyle013
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle013()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle014
     * @tc.name     testCalendarPickerTextStyle014
     * @tc.desc     testCalendarPickerTextStyle014
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle014()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle015
     * @tc.name     testCalendarPickerTextStyle015
     * @tc.desc     testCalendarPickerTextStyle015
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle015()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testCalendarPickerTextStyle016
     * @tc.name     testCalendarPickerTextStyle016
     * @tc.desc     testCalendarPickerTextStyle016
     * @tc.level    Level.LEVEL1
     */
    it('testCalendarPickerTextStyle016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCalendarPickerTextStyle016()).assertEqual(0)
      done()
    })

  })
}
