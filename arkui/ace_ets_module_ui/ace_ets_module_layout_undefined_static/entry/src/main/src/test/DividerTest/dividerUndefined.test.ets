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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function DividerUndefinedTest() {
  describe('DividerUndefinedTest', () => {
    beforeAll(async () => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('DividerUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/dividerUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get DividerUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('dividerUndefined' == pages.name)) {
          console.info('get DividerUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push DividerUndefinedTest page error:' + err);
      }
      console.info('DividerUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    DividerUndefinedTest_static_0100
     * @tc.name      DividerUndefinedTest_static_0100
     * @tc.desc      DividerUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('DividerUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DividerUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('divider');
      let typeValue = JSON.parseJsonElement(strJson).getString('$type');
      expect(typeValue).assertEqual('Divider');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('divider_color2')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('divider');
      let colorValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('color');
      console.info('$color: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('color')));
      expect(colorValue1.asString()).assertEqual('#FFFF7777');

      console.info('[DividerUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    dividerUndefinedTest_static_0200
     * @tc.name      dividerUndefinedTest_static_0200
     * @tc.desc      dividerUndefinedTest_static_0200
     * @tc.level     Level.LEVEL1
     */
    it('dividerUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[dividerUndefinedTest_static_0200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('divider');
      let strokeWidthValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeWidth');
      console.info('$strokeWidth: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeWidth')));
      expect(strokeWidthValue.asString()).assertEqual('1.00px');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('divider_strokeWidth2')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('divider');
      let strokeWidthValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('strokeWidth');
      console.info('$strokeWidth: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('strokeWidth')));
      expect(strokeWidthValue1.asString()).assertEqual('10.00vp');

      console.info('[dividerUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number    dividerUndefinedTest_static_0300
     * @tc.name      dividerUndefinedTest_static_0300
     * @tc.desc      dividerUndefinedTest_static_0300
     * @tc.level     Level.LEVEL1
     */
    it('dividerUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[dividerUndefinedTest_static_0300] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('divider');
      let lineCapValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('lineCap');
      console.info('$lineCap: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('lineCap')));
      expect(lineCapValue.asString()).assertEqual('BUTT');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('divider_lineCap2')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('divider');
      let lineCapValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('lineCap');
      console.info('$lineCap: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('lineCap')));
      expect(lineCapValue1.asString()).assertEqual('ROUND');

      console.info('[dividerUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number    dividerUndefinedTest_static_0400
     * @tc.name      dividerUndefinedTest_static_0400
     * @tc.desc      dividerUndefinedTest_static_0400
     * @tc.level     Level.LEVEL1
     */
    it('dividerUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[dividerUndefinedTest_static_0400] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('divider');
      let verticalValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('vertical');
      console.info('$vertical: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('vertical')));
      expect(verticalValue.asString()).assertEqual('false');

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('divider_vertical2')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('divider');
      let verticalValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('vertical');
      console.info('$vertical: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('vertical')));
      expect(verticalValue1.asString()).assertEqual('true');

      console.info('[dividerUndefinedTest_static_0400] END');
      done();
    });

  })
}