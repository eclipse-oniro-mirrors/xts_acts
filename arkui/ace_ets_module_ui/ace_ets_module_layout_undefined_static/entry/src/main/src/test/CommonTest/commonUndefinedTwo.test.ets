/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the ;License");
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
import {  Driver,  ON,  Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function CommonUndefinedTwoTest() {
  describe('CommonUndefinedTwoTest', () => {
    beforeAll(async () => {
      console.info('CommonUndefinedTwoTest beforeAll start');
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('CommonUndefinedTwoTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/commonUndefinedTwo',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get CommonUndefinedTwoTest state pages:' + JSON.stringify(pages));
        if (!('commonUndefinedTwo' == pages.name)) {
          console.info('get CommonUndefinedTwoTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CommonUndefinedTwoTest page error:' + err);
      }
      console.info('CommonUndefinedTwoTest beforeEach end');

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   CommonUndefinedTwoTest_static_0100
     * @tc.name     CommonUndefinedTwoTest_static_0100
     * @tc.desc     CommonUndefinedTwoTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('CommonUndefinedTwoTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonUndefinedTwoTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyStack');
      await CommonFunc.sleep(1000);

      console.info('[CommonUndefinedTwoTest_static_0100] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[CommonUndefinedTwoTest_static_0100] align: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('align')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('align')))
        .assertEqual('\"Alignment.BottomEnd\"');

      let changeBtn = await driver.findComponent(ON.id('Common_Align'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[CommonUndefinedTwoTest_static_0100] click Common_Align');
      strJson = inspector.getInspectorByKey('MyStack');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('align')))
        .assertEqual('\"Alignment.Center\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[CommonUndefinedTwoTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   CommonUndefinedTwoTest_static_0200
     * @tc.name     CommonUndefinedTwoTest_static_0200
     * @tc.desc     CommonUndefinedTwoTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('CommonUndefinedTwoTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonUndefinedTwoTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      let row1 = await driver.findComponent(ON.id('MyRow1'));
      await CommonFunc.sleep(500);
      let point1: Point = await (row1?.getBoundsCenter() as Promise<Point>);
      console.log(`[CommonUndefinedTwoTest_static_0200] point1{x:${point1.x}, y:${point1.y}}`);
      let row2 = await driver.findComponent(ON.id('MyRow2'));
      await CommonFunc.sleep(500);
      let point2: Point = await (row2?.getBoundsCenter() as Promise<Point>);
      console.log(`[CommonUndefinedTwoTest_static_0200] point2{x:${point2.x}, y:${point2.y}}`);
      expect(point1.x !== point2.x).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('Common_AlignRules'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[CommonUndefinedTwoTest_static_0200] click Common_AlignRules');
      let row3 = await driver.findComponent(ON.id('MyRow1'));
      await CommonFunc.sleep(500);
      let point3: Point = await (row3?.getBoundsCenter() as Promise<Point>);
      console.log(`[CommonUndefinedTwoTest_static_0200] point3{x:${point3.x}, y:${point3.y}}`);
      let row4 = await driver.findComponent(ON.id('MyRow2'));
      await CommonFunc.sleep(500);
      let point4: Point = await (row4?.getBoundsCenter() as Promise<Point>);
      console.log(`[CommonUndefinedTwoTest_static_0200] point4{x:${point4.x}, y:${point4.y}}`);
      expect(point3.x === point4.x).assertTrue();
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[CommonUndefinedTwoTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   CommonUndefinedTwoTest_static_0300
     * @tc.name     CommonUndefinedTwoTest_static_0300
     * @tc.desc     CommonUndefinedTwoTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('CommonUndefinedTwoTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonUndefinedTwoTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyText');
      await CommonFunc.sleep(1000);

      console.info('[CommonUndefinedTwoTest_static_0300] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[CommonUndefinedTwoTest_static_0300] alignSelf: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('alignSelf')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('alignSelf')))
        .assertEqual('\"ItemAlign.Baseline\"');

      let changeBtn = await driver.findComponent(ON.id('Common_AlignSelf'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[CommonUndefinedTwoTest_static_0300] click Common_AlignSelf');
      strJson = inspector.getInspectorByKey('MyText');
      await CommonFunc.sleep(2000);
      console.info('[CommonUndefinedTwoTest_static_0300] alignSelf: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('alignSelf')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('alignSelf')))
        .assertEqual('\"ItemAlign.Auto\"');
      await CommonFunc.sleep(1000);
      console.info('[CommonUndefinedTwoTest_static_0300] END');
      done();
    });
  })
}