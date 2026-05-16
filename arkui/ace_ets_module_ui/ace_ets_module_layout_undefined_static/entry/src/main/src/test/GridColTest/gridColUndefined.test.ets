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
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function GridColUndefinedTest() {
  describe('GridColUndefinedTest', () => {
    beforeAll(async () => {
      console.info('GridColUndefinedTest beforeAll start');
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('GridColUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid_Col/gridColUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get GridColUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('gridColUndefined' == pages.name)) {
          console.info('get GridColUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push GridColUndefinedTest page error:' + err);
      }
      console.info('GridColUndefinedTest beforeEach end');

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   GridColUndefinedTest_static_0100
     * @tc.name     GridColUndefinedTest_static_0100
     * @tc.desc     GridColUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('GridColUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridColUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGridCol1');
      await CommonFunc.sleep(1000);

      console.info('[GridColUndefinedTest_static_0100] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[GridColUndefinedTest_static_0100] span: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('span')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('span')))
        .assertEqual('\"3\"');

      let changeBtn = await driver.findComponent(ON.id('GridCol_Span'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[GridColUndefinedTest_static_0100] click GridCol_Span');
      strJson = inspector.getInspectorByKey('MyGridCol1');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('span')))
        .assertEqual('\"1\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GridColUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   GridColUndefinedTest_static_0200
     * @tc.name     GridColUndefinedTest_static_0200
     * @tc.desc     GridColUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('GridColUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridColUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGridCol2');
      await CommonFunc.sleep(1000);

      console.info('[GridColUndefinedTest_static_0200] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[GridColUndefinedTest_static_0200] order: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('order')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('order')))
        .assertEqual('\"4\"');

      let changeBtn = await driver.findComponent(ON.id('GridCol_Order'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[GridColUndefinedTest_static_0200] click GridCol_Order');
      strJson = inspector.getInspectorByKey('MyGridCol2');
      await CommonFunc.sleep(2000);
      console.info('[GridColUndefinedTest_static_0200] order: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('order')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('order')))
        .assertEqual('\"0\"');
      await CommonFunc.sleep(1000);
      console.info('[GridColUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   GridColUndefinedTest_static_0300
     * @tc.name     GridColUndefinedTest_static_0300
     * @tc.desc     GridColUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('GridColUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridColUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGridCol2');
      await CommonFunc.sleep(1000);

      console.info('[GridColUndefinedTest_static_0300] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[GridColUndefinedTest_static_0300] gridColOffset: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('gridColOffset')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('gridColOffset')))
        .assertEqual('\"4\"');

      let changeBtn = await driver.findComponent(ON.id('GridCol_Offset'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[GridColUndefinedTest_static_0300] click GridCol_Order');
      strJson = inspector.getInspectorByKey('MyGridCol2');
      await CommonFunc.sleep(2000);
      console.info('[GridColUndefinedTest_static_0300] gridColOffset: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('gridColOffset')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('gridColOffset')))
        .assertEqual('\"0\"');
      await CommonFunc.sleep(1000);
      console.info('[GridColUndefinedTest_static_0300] END');
      done();
    });
  })
}