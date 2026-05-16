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

export default function datePickerTest() {

  describe('DatePickerTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api18.static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testDatePickerMode001
     * @tc.name     testDatePickerMode001
     * @tc.desc     testDatePickerMode001
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerMode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestDatePickerMode';
      await Utils.pushPage(`datePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('datePickerMode1');
      console.log('testDatePickerMode001' + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('mode'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
      done();
    });

    
    /**
     * @tc.number   testDatePickerMode002
     * @tc.name     testDatePickerMode002
     * @tc.desc     testDatePickerMode002
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerMode002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestDatePickerMode';
      await Utils.pushPage(`datePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('datePickerMode2');
      console.log('testDatePickerMode002' + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('mode'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.YEAR_AND_MONTH');
      done();
    });

    
    /**
     * @tc.number   testDatePickerMode003
     * @tc.name     testDatePickerMode003
     * @tc.desc     testDatePickerMode003
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerMode003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestDatePickerMode';
      await Utils.pushPage(`datePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('datePickerMode3');
      console.log('testDatePickerMode003' + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('mode'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.MONTH_AND_DAY');
      done();
    });
  })
}