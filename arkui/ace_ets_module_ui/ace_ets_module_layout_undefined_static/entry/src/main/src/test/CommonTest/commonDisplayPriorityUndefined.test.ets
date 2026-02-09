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

export default function CommonDisplayPriorityUndefinedTest() {
  describe('CommonDisplayPriorityUndefinedTest', () => {
    beforeAll(async () => {
      console.info('CommonDisplayPriorityUndefinedTest beforeAll start');

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('CommonDisplayPriorityUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/commonDisplayPriorityUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get CommonDisplayPriorityUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('commonDisplayPriorityUndefined' == pages.name)) {
          console.info('get CommonDisplayPriorityUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CommonDisplayPriorityUndefinedTest page error:' + err);
      }
      console.info('CommonDisplayPriorityUndefinedTest beforeEach end');

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   CommonDisplayPriorityUndefinedTest_static_0001
     * @tc.name     CommonDisplayPriorityUndefinedTest_static_0001
     * @tc.desc     test displayPriority
     * @tc.level    Level.LEVEL1
     */
    it('CommonDisplayPriorityUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonDisplayPriorityUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('LayoutConstraints_1');
      console.info('[CommonDisplayPriorityUndefinedTest_static_0001] displayPriority: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('displayPriority'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('displayPriority'))
        .assertEqual(1);

      let changeBtn = await driver.findComponent(ON.id('LayoutConstraints_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('LayoutConstraints_1');
      console.info('[CommonDisplayPriorityUndefinedTest_static_0001] displayPriority: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('displayPriority'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('displayPriority'))
        .assertEqual(2);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('LayoutConstraints_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('displayPriority'))
        .assertEqual(1);
      console.info('[CommonDisplayPriorityUndefinedTest_static_0001] END');
      done();
    });
  })
}