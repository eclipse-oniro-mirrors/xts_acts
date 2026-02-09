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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {  Driver,  ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function GridRowModifierUndefinedTest() {
  describe('GridRowModifierUndefinedTest', () => {
    beforeAll(async () => {
      console.info('GridRowModifierUndefinedTest beforeAll start');

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('GridRowModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid_Row/gridRowModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get GridRowModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('gridRowModifierUndefined' == pages.name)) {
          console.info('get GridRowModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push GridRowModifierUndefinedTest page error:' + err);
      }
      console.info('GridRowModifierUndefinedTest beforeEach end');

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   GridRowModifierUndefinedTest_static_0100
     * @tc.name     GridRowModifierUndefinedTest_static_0100
     * @tc.desc     GridRowModifierUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('GridRowModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridRowModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGridRowModifier1');
      await CommonFunc.sleep(1000);

      console.info('[GridRowModifierUndefinedTest_static_0100] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[GridRowAttrsModifierUndefinedTest_static_0100] alignItems: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('alignItems')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('alignItems')))
        .assertEqual('\"ItemAlign.End\"');

      let changeBtn = await driver.findComponent(ON.id('GridRowModifier_AlignItems'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[GridRowModifierUndefinedTest_static_0100] click GridRowModifier_AlignItems');
      strJson = inspector.getInspectorByKey('MyGridRowModifier1');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('alignItems')))
        .assertEqual('\"ItemAlign.Start\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GridRowModifierUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   GridRowModifierUndefinedTest_static_0200
     * @tc.name     GridRowModifierUndefinedTest_static_0200
     * @tc.desc     GridRowModifierUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('GridRowModifierUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridRowModifierUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.id('GridRowModifier_Text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('xs');
      await CommonFunc.sleep(1000);

      let changeBtn_Breakpoint = await driver.findComponent(ON.id('ChangeBreakpoint'));
      await (changeBtn_Breakpoint?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      text = await driver.findComponent(ON.id('GridRowModifier_Text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('sm');
      await CommonFunc.sleep(1000);


      let changeBtn = await driver.findComponent(ON.id('GridRow_onBreakpointChange'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[GridRowModifierUndefinedTest_static_0200] click GridRow_onBreakpointChange');
      await (changeBtn_Breakpoint?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      text = await driver.findComponent(ON.id('GridRowModifier_Text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('sm');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GridRowModifierUndefinedTest_static_0200] END');
      done();
    });
  })
}
