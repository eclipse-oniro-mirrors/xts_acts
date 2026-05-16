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

export default function CommonMarkAnchorModifierUndefinedTest() {
  describe('CommonMarkAnchorModifierUndefinedTest', () => {
    beforeAll(async () => {
      console.info('CommonMarkAnchorModifierUndefinedTest beforeAll start');

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('CommonMarkAnchorModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/commonMarkAnchorModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get CommonMarkAnchorModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('commonMarkAnchorModifierUndefined' == pages.name)) {
          console.info('get CommonMarkAnchorModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CommonMarkAnchorModifierUndefinedTest page error:' + err);
      }
      console.info('CommonMarkAnchorModifierUndefinedTest beforeEach end');

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   CommonMarkAnchorModifierUndefinedTest_static_0100
     * @tc.name     CommonMarkAnchorModifierUndefinedTest_static_0100
     * @tc.desc     CommonMarkAnchorModifierUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('CommonMarkAnchorModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonMarkAnchorModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('common_markAnchor');
      await CommonFunc.sleep(1000);

      console.info('[CommonMarkAnchorModifierUndefinedTest_static_0100] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[CommonMarkAnchorModifierUndefinedTest_static_0100] markAnchor: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('markAnchor')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('markAnchor')))
        .assertContain('0.00vp');

      let changeBtn = await driver.findComponent(ON.id('changeButton'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[CommonMarkAnchorModifierUndefinedTest_static_0100] click Common_markAnchor');
      strJson = inspector.getInspectorByKey('common_markAnchor');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('markAnchor')))
        .assertContain('{"x":"-50.00vp","y":"0.00vp"}');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[CommonMarkAnchorModifierUndefinedTest_static_0100] END');
      done();
    });

  })
}