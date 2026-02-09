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

export default function CommonFlexShrinkUndefinedTest() {
  describe('CommonFlexShrinkUndefinedTest', () => {
    beforeAll(async () => {
      console.info('CommonFlexShrinkUndefinedTest beforeAll start');

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('CommonFlexShrinkUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/commonFlexShrinkUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get CommonFlexShrinkUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('commonFlexShrinkUndefined' == pages.name)) {
          console.info('get CommonFlexShrinkUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CommonFlexShrinkUndefinedTest page error:' + err);
      }
      console.info('CommonFlexShrinkUndefinedTest beforeEach end');

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   CommonFlexShrinkUndefinedTest_static_0001
     * @tc.name     CommonFlexShrinkUndefinedTest_static_0001
     * @tc.desc     test flexShrink
     * @tc.level    Level.LEVEL1
     */
    it('CommonFlexShrinkUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonFlexShrinkUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('common_FlexShrink');
      console.info('[CommonFlexShrinkUndefinedTest_static_0001] flexShrink: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('flexShrink'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('flexShrink'))
        .assertEqual(8);

      let changeBtn = await driver.findComponent(ON.id('changeButton'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('common_FlexShrink');
      console.info('[CommonFlexShrinkUndefinedTest_static_0001] flexShrink: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('flexShrink'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('flexShrink'))
        .assertEqual(1);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      console.info('[CommonFlexShrinkUndefinedTest_static_0001] END');
      done();
    });
  })
}