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

export default function fontSizeModifierUndefinedTest() {
  describe('fontSizeModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.information01.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('fontSizeModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text_Timer/fontSizeModifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get fontSizeModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('fontSizeModifier' == pages.name)) {
          console.info('get fontSizeModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push fontSizeModifierUndefinedTest page error:' + err);
      }
      console.info('fontSizeModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    fontSizeModifierUndefinedTest_static_0100
     * @tc.name      fontSizeModifierUndefinedTest_static_0100
     * @tc.desc      fontSizeModifierUndefinedTest_static_0100
     * @tc.level     0
     */
    it('fontSizeModifierUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('fontSizeModifierUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TestText_timerFontSizeModifier');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('TestText_timer component obj is: ' + obj.getElement('$attrs'));
      console.info('TestText_timer component obj.fontSize is: ' + obj.getElement('$attrs').getString('fontSize'));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('50.00fp');

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('TestText_timerFontSizeModifier');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info('TestText_timer component obj is: ' + obj1.getElement('$attrs'));
      console.info('TestText_timer component obj.fontSize is: ' + obj1.getElement('$attrs').getString('fontSize'));
      expect(obj1.getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      done();
    });
  })
}
