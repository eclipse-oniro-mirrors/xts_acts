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

export default function onDisAppearUndefinedTest() {
  describe('onDisAppearUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.acts.arkui.component.common.attrs.undefined.test.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('onDisAppearUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/onDisAppear',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get onDisAppearUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('onDisAppearUndefinedTest' == pages.name)) {
          console.info('get onDisAppearUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push onDisAppearUndefinedTest page error:' + err);
      }
      console.info('onDisAppearUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    onDisAppearUndefinedTest_static_0100
     * @tc.name      onDisAppearUndefinedTest_static_0100
     * @tc.desc      onDisAppearUndefinedTest_static_0100
     * @tc.level     0
     */
    it('onDisAppearUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('onDisAppearUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeAppear')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('appearText');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('TestCommon component obj is: ' + obj.getElement('$attrs'));
      console.info('TestCommon component obj.dragText is: ' + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('1');

      let btn_true1 = await driver.findComponent(ON.id('changeButton')) as Component;
      await btn_true1.click();
      await CommonFunc.sleep(1000);

      await btn_true.doubleClick();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('appearText');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info('TestCommon component obj is: ' + obj1.getElement('$attrs'));
      console.info('TestCommon component obj.dragText is: ' + obj1.getElement('$attrs').getString('label'));
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('1');
      done();
    });
  })
}
