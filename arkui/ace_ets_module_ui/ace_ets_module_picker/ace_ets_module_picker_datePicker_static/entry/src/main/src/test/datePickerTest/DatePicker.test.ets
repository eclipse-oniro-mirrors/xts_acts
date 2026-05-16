/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function DatePickerTest() {
  describe('DatePickerTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DatePickerTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.picker.datePicker.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('DatePickerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/DatePicker',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DatePickerTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DatePicker') {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DatePickerTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('DatePickerTest after each called');
    });

    /**
     * @tc.number DatePickerTest_001
     * @tc.name datePickerDialogOptionsCanLoop
     * @tc.desc Test DatePickerDialogOptions canLoop property (canLoop?: boolean)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('datePickerDialogOptionsCanLoop', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DatePickerTest execute: datePickerDialogOptionsCanLoop START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('datePickerCanLoopCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        
        // 验证DatePickerDialogOptions.canLoop属性
        let datePickerState = AppStorage.get<string>('DatePickerPageState') ?? '';
        console.info('DatePickerTest datePickerState: ' + datePickerState);
        expect(datePickerState.includes('datePickerCanLoop')).assertEqual(true);

        console.info('DatePickerTest execute: datePickerDialogOptionsCanLoop END');
        done();
      } catch (error) {
        console.error('DatePickerTest execute: datePickerDialogOptionsCanLoop error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}