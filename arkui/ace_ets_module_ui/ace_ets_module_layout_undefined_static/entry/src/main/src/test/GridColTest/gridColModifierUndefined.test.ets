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
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function GridColModifierUndefinedTest() {
  describe('GridColModifierUndefinedTest', () => {
    beforeAll(async () => {
      console.info('GridColModifierUndefinedTest beforeAll start');

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('GridColModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid_Col/gridColModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get GridColModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('gridColModifierUndefined' == pages.name)) {
          console.info('get GridColModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push GridColModifierUndefinedTest page error:' + err);
      }
      console.info('GridColModifierUndefinedTest beforeEach end');

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   GridColModifierUndefinedTest_static_0100
     * @tc.name     GridColModifierUndefinedTest_static_0100
     * @tc.desc     GridColModifierUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('GridColModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridColModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGridColModifier1');
      await CommonFunc.sleep(1000);

      console.info('[GridColModifierUndefinedTest_static_0100] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[GridColModifierUndefinedTest_static_0100] span: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('span')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('span')))
        .assertEqual('\"3\"');

      let changeBtn = await driver.findComponent(ON.id('GridColModifier_Span'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[GridColModifierUndefinedTest_static_0100] click GridColModifier_Span');
      strJson = inspector.getInspectorByKey('MyGridColModifier1');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('span')))
        .assertEqual('\"1\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GridColModifierUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   GridColAttrsModifierUndefinedTest_static_0200
     * @tc.name     GridColAttrsModifierUndefinedTest_static_0200
     * @tc.desc     GridColAttrsModifierUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('GridColAttrsModifierUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridColAttrsModifierUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGridColModifier2');
      await CommonFunc.sleep(1000);

      console.info('[GridColAttrsModifierUndefinedTest_static_0200] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[GridColAttrsModifierUndefinedTest_static_0200] order: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('order')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('order')))
        .assertEqual('\"4\"');

      let changeBtn = await driver.findComponent(ON.id('GridCol_Order'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[GridColAttrsModifierUndefinedTest_static_0200] click GridCol_Order');
      strJson = inspector.getInspectorByKey('MyGridColModifier2');
      await CommonFunc.sleep(2000);
      console.info('[GridColAttrsModifierUndefinedTest_static_0200] order: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('order')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('order')))
        .assertEqual('\"0\"');
      await CommonFunc.sleep(1000);
      console.info('[GridColAttrsModifierUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   GridColAttrsModifierUndefinedTest_static_0300
     * @tc.name     GridColAttrsModifierUndefinedTest_static_0300
     * @tc.desc     GridColAttrsModifierUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('GridColAttrsModifierUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridColAttrsModifierUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGridColModifier2');
      await CommonFunc.sleep(1000);

      console.info('[GridColAttrsModifierUndefinedTest_static_0300] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[GridColAttrsModifierUndefinedTest_static_0300] gridColOffset: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('gridColOffset')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('gridColOffset')))
        .assertEqual('\"4\"');

      let changeBtn = await driver.findComponent(ON.id('GridCol_Offset'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[GridColAttrsModifierUndefinedTest_static_0300] click GridCol_Order');
      strJson = inspector.getInspectorByKey('MyGridColModifier2');
      await CommonFunc.sleep(2000);
      console.info('[GridColAttrsModifierUndefinedTest_static_0300] gridColOffset: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('gridColOffset')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('gridColOffset')))
        .assertEqual('\"0\"');
      await CommonFunc.sleep(1000);
      console.info('[GridColAttrsModifierUndefinedTest_static_0300] END');
      done();
    });
  })
}
