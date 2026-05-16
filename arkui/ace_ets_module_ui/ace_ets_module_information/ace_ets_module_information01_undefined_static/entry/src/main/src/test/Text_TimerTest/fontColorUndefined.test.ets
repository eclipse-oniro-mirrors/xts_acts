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

export default function fontColorUndefinedTest() {
  describe('fontColorUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.information01.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('fontColorUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text_Timer/fontColor',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get fontColorUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('fontColor' == pages.name)) {
          console.info('get fontColorUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push fontColorUndefinedTest page error:' + err);
      }
      console.info('fontColorUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    fontColorUndefinedTest_static_0100
     * @tc.name      fontColorUndefinedTest_static_0100
     * @tc.desc      fontColorUndefinedTest_static_0100
     * @tc.level     0
     */
    it('fontColorUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('fontColorUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TestText_timerFontColor');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('TestText_timer component obj is: ' + obj.getElement('$attrs'));
      console.info('TestText_timer component obj.fontColor is: ' + obj.getElement('$attrs').getString('fontColor'));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFF0000');

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('TestText_timerFontColor');
      let obj1 = JSON.parseJsonElement(strJson1);

      let originJson = inspector.getInspectorByKey('TestText_timerOrigin');
      let origin = JSON.parseJsonElement(originJson);
      let originFontColor = origin.getElement('$attrs').getString('fontColor');

      await CommonFunc.sleep(1000);
      console.info('TestText_timer component obj is: ' + obj1.getElement('$attrs'));
      console.info('TestText_timer component obj.fontColor is: ' + obj1.getElement('$attrs').getString('fontColor'));
      expect(obj1.getElement('$attrs').getString('fontColor')).assertEqual(originFontColor);
      done();
    });
  })
}