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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {  Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function CommonAspectRatioModifierUndefinedTest() {
  describe('CommonAspectRatioModifierUndefinedTest', () => {
    beforeAll(async () => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('CommonAspectRatioModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/commonAspectRatioModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get CommonAspectRatioModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('commonAspectRatioModifierUndefined' == pages.name)) {
          console.info('get CommonAspectRatioModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CommonAspectRatioModifierUndefinedTest page error:' + err);
      }
      console.info('CommonAspectRatioModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    CommonAspectRatioModifierUndefinedTest_static_0100
     * @tc.name      CommonAspectRatioModifierUndefinedTest_static_0100
     * @tc.desc      CommonAspectRatioModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('CommonAspectRatioModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CommonAspectRatioModifierUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('common_aspectRatio_modifier');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj.getElement('$attrs'));
      console.info('Test component obj.aspectRatio is: ' + obj.getElement('$attrs').getDouble('aspectRatio'));
      expect(obj.getElement('$attrs').getDouble('aspectRatio')).assertEqual(1.5);

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('common_aspectRatio_modifier');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj1.getElement('$attrs'));
      console.info('Test component obj.aspectRatio is: ' + obj1.getElement('$attrs').getString('aspectRatio'));
      expect(obj1.getElement('$attrs').getString('aspectRatio')).assertEqual('');
      console.info('CommonAspectRatioModifierUndefinedTest_static_0100 START');
      done();
    });
  })
}