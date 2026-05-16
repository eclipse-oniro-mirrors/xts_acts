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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';


export default function CommonBorderUndefinedTest() {
  describe('CommonBorderUndefinedTest', () => {
    beforeAll(async () => {
      console.info('CommonBorderUndefinedTest beforeAll start');

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('CommonBorderUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/commonBorderUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get CommonBorderUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('commonBorderUndefined' == pages.name)) {
          console.info("get CommonBorderUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CommonBorderUndefinedTest page error:' + err);
      }
      console.info('CommonBorderUndefinedTest beforeEach end');

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   CommonBorderUndefinedTest_static_0001
     * @tc.name     CommonBorderUndefinedTest_static_0001
     * @tc.desc     CommonBorderUndefinedTest_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('CommonBorderUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonBorderUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Border_1');
      console.info('[CommonBorderUndefinedTest_static_0001] borderWidth: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'))
        .assertContain('0.00');

      let changeBtn = await driver.findComponent(ON.id('Border_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Border_1');
      console.info('[CommonBorderUndefinedTest_static_0001] borderWidth: ' +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'))
        .assertContain('5.00');

      changeBtn = await driver.findComponent(ON.id('Border_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      //
      strJson = inspector.getInspectorByKey('Border_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'))
        .assertContain('0.00');
      console.info('[CommonBorderUndefinedTest_static_0001] END');
      done();
    });

    /**
     * @tc.number   CommonBorderUndefinedTest_static_0002
     * @tc.name     CommonBorderUndefinedTest_static_0002
     * @tc.desc     CommonBorderUndefinedTest_static_0002
     * @tc.level    Level.LEVEL1
     */
    it('CommonBorderUndefinedTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonBorderUndefinedTest_static_0002] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Border_2');
      console.info("[CommonBorderUndefinedTest_static_0002] borderStyle: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderStyle'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderStyle'))
        .assertEqual('BorderStyle.Solid');

      let changeBtn = await driver.findComponent(ON.id('Border_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Border_2');
      console.info("[CommonBorderUndefinedTest_static_0002] borderStyle: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderStyle'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderStyle'))
        .assertEqual('BorderStyle.Dashed');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Border_2');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderStyle'))
        .assertEqual('BorderStyle.Solid');
      console.info('[CommonBorderUndefinedTest_static_0002] END');
      done();
    });

    /**
     * @tc.number   CommonBorderUndefinedTest_static_0003
     * @tc.name     CommonBorderUndefinedTest_static_0003
     * @tc.desc     CommonBorderUndefinedTest_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('CommonBorderUndefinedTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonBorderUndefinedTest_static_0003] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Border_2');
      console.info("[CommonBorderUndefinedTest_static_0003] borderWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'))
        .assertContain('0.00');

      let changeBtn = await driver.findComponent(ON.id('Border_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Border_2');
      console.info("[CommonBorderUndefinedTest_static_0003] borderWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'))
        .assertContain('3.00');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Border_2');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth'))
        .assertContain('0.00');
      console.info('[CommonBorderUndefinedTest_static_0003] END');
      done();
    });

    /**
     * @tc.number   CommonBorderUndefinedTest_static_0004
     * @tc.name     CommonBorderUndefinedTest_static_0004
     * @tc.desc     CommonBorderUndefinedTest_static_0004
     * @tc.level    Level.LEVEL1
     */
    it('CommonBorderUndefinedTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonBorderUndefinedTest_static_0004] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Border_2');
      console.info("[CommonBorderUndefinedTest_static_0004] borderColor: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderColor'))
        .assertEqual('#FF000000');

      let changeBtn = await driver.findComponent(ON.id('Border_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Border_2');
      console.info("[CommonBorderUndefinedTest_static_0004] borderColor: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderColor'))
        .assertEqual('#FFFF0000');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Border_2');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderColor'))
        .assertEqual('#FF000000');
      console.info('[CommonBorderUndefinedTest_static_0004] END');
      done();
    });

    /**
     * @tc.number   CommonBorderUndefinedTest_static_0005
     * @tc.name     CommonBorderUndefinedTest_static_0005
     * @tc.desc     CommonBorderUndefinedTest_static_0005
     * @tc.level    Level.LEVEL1
     */
    it('CommonBorderUndefinedTest_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonBorderUndefinedTest_static_0005] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Border_2');
      console.info("[CommonBorderUndefinedTest_static_0005] borderRadius: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderRadius'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderRadius'))
        .assertContain('0.00');

      let changeBtn = await driver.findComponent(ON.id('Border_btn5'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Border_2');
      console.info("[CommonBorderUndefinedTest_static_0005] borderRadius: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderRadius'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderRadius'))
        .assertContain('5.00');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Border_2');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderRadius'))
        .assertContain('0.00');
      console.info('[CommonBorderUndefinedTest_static_0005] END');
      done();
    });

    /**
     * @tc.number   CommonBorderUndefinedTest_static_0006
     * @tc.name     CommonBorderUndefinedTest_static_0006
     * @tc.desc     CommonBorderUndefinedTest_static_0006
     * @tc.level    Level.LEVEL1
     */
    it('CommonBorderUndefinedTest_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonBorderUndefinedTest_static_0006] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Border_3');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj.getElement('$attrs'));
      console.info('Test component obj.borderImage is: ' + obj.getElement('$attrs').getString('borderImage'));
      expect(obj.getElement('$attrs').getString('borderImage'))
        .assertEqual('{\"source\":\"\",\"slice\":\"0.00px\",\"width\":\"0.00px\",\"outset\":\"0.00px\",' +
          '\"repeat\":\"RepeatMode.Stretch\",\"fill\":\"false\"}');

      let changeBtn = await driver.findComponent(ON.id('Border_btn6'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Border_3');
      obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj.getElement('$attrs'));
      console.info('Test component obj.borderImage is: ' + obj.getElement('$attrs').getString('borderImage'));
      expect(obj.getElement('$attrs').getString('borderImage'))
        .assertEqual('{\"source\":\"\",\"slice\":\"10.00px\",\"width\":\"10.00px\",\"outset\":\"0.00px\",' +
          '\"repeat\":\"RepeatMode.Stretch\",\"fill\":\"false\"}');
      done();
    });
  })
}