/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {  Component,  Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function ColumnSplitDividerUndefinedTest() {
  describe('ColumnSplitDividerUndefinedTest', () => {
    beforeAll(async () => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('ColumnSplitDividerUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column_Split/columnSplitDividerUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get ColumnSplitDividerUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('columnSplitDividerUndefined' == pages.name)) {
          console.info('get ColumnSplitDividerUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ColumnSplitDividerUndefinedTest page error:' + err);
      }
      console.info('ColumnSplitDividerUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    ColumnSplitDividerUndefinedTest_0100
     * @tc.name      ColumnSplitDividerUndefinedTest_0100
     * @tc.desc      ColumnSplitDividerUndefinedTest_0100
     * @tc.level     Level.LEVEL1
     */
    it('ColumnSplitDividerUndefinedTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ColumnSplitDividerUndefinedTest_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('ColumnSplit_Divider');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj.getElement('$attrs'));
      console.info('Test component obj.divider is: ' + obj.getElement('$attrs').getElement('divider'));
      let divider = obj.getElement('$attrs').getElement('divider');
      expect(divider.getString('startMargin')).assertEqual('10.00vp');
      expect(divider.getString('endMargin')).assertEqual('20.00vp');


      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('ColumnSplit_Divider');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj1.getElement('$attrs'));
      console.info('Test component obj.divider is: ' + obj1.getElement('$attrs').getElement('divider'));
      let divider1 = obj1.getElement('$attrs').getElement('divider');
      expect(divider1.getString('startMargin')).assertEqual('0.00vp');
      expect(divider1.getString('endMargin')).assertEqual('0.00vp');
      console.info('ColumnSplitDividerUndefinedTest_0100 END');
      done();
    });
  })
}