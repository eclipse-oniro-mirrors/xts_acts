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
import {  Component,  Driver,   ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function widthUndefinedTest() {
  describe('widthUndefinedTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('widthUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/width',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get widthUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('width' == pages.name)) {
          console.info('get widthUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push widthUndefinedTest page error:' + err);
      }
      console.info('widthUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    widthUndefinedTest_0100
     * @tc.name      widthUndefinedTest_0100
     * @tc.desc      widthUndefinedTest_0100
     * @tc.level     0
     */
    it('widthUndefinedTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('widthUndefinedTest_0100 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('Common_width');

      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(500);
      console.info('Test component obj.width is: ' + obj.getElement('$attrs').getString('width'));
      expect(obj.getElement('$attrs').getString('width')).assertEqual('100.00vp');

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await (btn_true?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('Common_width');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(500);
      console.info('Test component obj.width is: ' + obj1.getElement('$attrs').getString('width'));

      let strJsonBase = inspector.getInspectorByKey('Common_width_base');
      let objBase = JSON.parseJsonElement(strJsonBase);
      await CommonFunc.sleep(500);
      console.info('Test component obj.width is: ' + objBase.getElement('$attrs').getString('width'));

      expect(obj1.getElement('$attrs').getString('width')).assertEqual(objBase.getElement('$attrs').getString('width'));

      console.info('[widthUndefinedTest_0100] END');
      done();
    });
  })
}
