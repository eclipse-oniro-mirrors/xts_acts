/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function startPointUndefinedTest() {
  describe('startPointUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.draw.undefined01.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('startPointUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Line/startPointUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get startPointUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('startPointUndefinedTest' == pages.name)) {
          console.info('get startPointUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push startPointUndefinedTest page error:' + err);
      }
      console.info('startPointUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    startPointUndefinedTest_static_0100
     * @tc.name      startPointUndefinedTest_static_0100
     * @tc.desc      startPointUndefinedTest_static_0100
     * @tc.level     0
     */
    it('startPointUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('startPointUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('line1');
      console.info('startPoint true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('startPoint')));
      let startPointValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('startPoint'));
      expect(startPointValue).assertEqual('[50,0]');

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('startPointChange')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('line1');
      console.info('startPoint true value: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('startPoint')));
      let startPointValue1 = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('startPoint'));
      expect(startPointValue1).assertEqual('[0,0]');
      done();
    });
  })
}
