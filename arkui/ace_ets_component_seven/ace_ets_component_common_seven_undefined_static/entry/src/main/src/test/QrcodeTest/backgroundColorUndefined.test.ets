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

export default function backgroundColorUndefinedTest() {
  describe('backgroundColorUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.acts.arkui.component.common.attrs.test.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('backgroundColorUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Qrcode/backgroundColor',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get backgroundColorUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('backgroundColorUndefinedTest' == pages.name)) {
          console.info('get backgroundColorUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push backgroundColorUndefinedTest page error:' + err);
      }
      console.info('backgroundColorUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    backgroundColorUndefinedTest_static_0100
     * @tc.name      backgroundColorUndefinedTest_static_0100
     * @tc.desc      backgroundColorUndefinedTest_static_0100
     * @tc.level     0
     */
    it('backgroundColorUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('backgroundColorUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TestQrcodebackgroundColor');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('TestQrcode component obj is: ' + obj.getElement('$attrs'));
      console.info('TestQrcode component obj.backgroundColor is: ' + obj.getElement('$attrs').getString('backgroundColor'));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF');

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('TestQrcodebackgroundColor');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info('TestQrcode component obj is: ' + obj1.getElement('$attrs'));
      console.info('TestQrcode component obj.backgroundColor is: ' + obj1.getElement('$attrs').getString('backgroundColor'));
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFFFF');
      done();
    });
  })
}
