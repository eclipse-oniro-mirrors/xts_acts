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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {  Driver,  ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function CommonPaddingModifierUndefinedTest() {
  describe('CommonPaddingModifierUndefinedTest', () => {
    beforeAll(async () => {
      console.info('CommonPaddingModifierUndefinedTest beforeAll start');

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('CommonPaddingModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/commonPaddingModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get CommonPaddingModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('commonPaddingModifierUndefined' == pages.name)) {
          console.info('get CommonPaddingModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CommonPaddingModifierUndefinedTest page error:' + err);
      }
      console.info('CommonPaddingModifierUndefinedTest beforeEach end');

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   CommonPaddingModifierUndefinedTest_static_0100
     * @tc.name     CommonPaddingModifierUndefinedTest_static_0100
     * @tc.desc     CommonPaddingModifierUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('CommonPaddingModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonPaddingModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyRow1');
      await CommonFunc.sleep(1000);

      console.info('[CommonPaddingModifierUndefinedTest_static_0100] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[CommonPaddingModifierUndefinedTest_static_0100] padding: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('padding')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('padding')))
        .assertEqual('\"{\\"top\\":\\"5.00vp\\",\\"right\\":\\"20.00vp\\",\\"bottom\\":\\"15.00vp\\",\\"left\\":\\"10.00vp\\"}\"');

      let changeBtn = await driver.findComponent(ON.id('Common_Padding'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[CommonPaddingModifierUndefinedTest_static_0100] click Common_Padding');
      strJson = inspector.getInspectorByKey('MyRow1');
      await CommonFunc.sleep(2000);
      console.info('[CommonPaddingModifierUndefinedTest_static_0100] padding: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('padding')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('padding')))
        .assertEqual('\"0.00px\"');
      await CommonFunc.sleep(1000);
      console.info('[CommonPaddingModifierUndefinedTest_static_0100] END');
      done();
    });

  })
}