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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {  Driver,  ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function CommonUndefinedOneTest() {
  describe('CommonUndefinedOneTest', () => {
    beforeAll(async () => {
      console.info('CommonUndefinedOneTest beforeAll start');

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('CommonUndefinedOneTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/commonUndefinedOne',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get CommonUndefinedOneTest state pages:' + JSON.stringify(pages));
        if (!('commonUndefinedOne' == pages.name)) {
          console.info('get CommonUndefinedOneTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CommonUndefinedOneTest page error:' + err);
      }
      console.info('CommonUndefinedOneTest beforeEach end');

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   CommonUndefinedOneTest_static_0100
     * @tc.name     CommonUndefinedOneTest_static_0100
     * @tc.desc     CommonUndefinedOneTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('CommonUndefinedOneTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonUndefinedOneTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyText1');
      await CommonFunc.sleep(1000);

      console.info('[CommonUndefinedOneTest_static_0100] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[CommonUndefinedOneTest_static_0100] offset: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('offset')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('offset')))
        .assertEqual('{"x":"15.00vp","y":"30.00vp"}');

      let changeBtn = await driver.findComponent(ON.id('Common_Offset'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[CommonUndefinedOneTest_static_0100] click Common_Offset');
      strJson = inspector.getInspectorByKey('MyText1');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('offset')))
        .assertEqual('{"x":"0.00px","y":"0.00px"}');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[CommonUndefinedOneTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   CommonUndefinedOneTest_static_0200
     * @tc.name     CommonUndefinedOneTest_static_0200
     * @tc.desc     CommonUndefinedOneTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('CommonUndefinedOneTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonUndefinedOneTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyRow1');
      await CommonFunc.sleep(1000);

      console.info('[CommonUndefinedOneTest_static_0200] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[CommonUndefinedOneTest_static_0200] padding: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('padding')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('padding')))
        .assertEqual('\"{\\"top\\":\\"5.00vp\\",\\"right\\":\\"20.00vp\\",\\"bottom\\":\\"15.00vp\\",\\"left\\":\\"10.00vp\\"}\"');

      let changeBtn = await driver.findComponent(ON.id('Common_Padding'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      strJson = inspector.getInspectorByKey('MyRow1');
      await CommonFunc.sleep(2000);
      console.info('[CommonUndefinedOneTest_static_0200] padding: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('padding')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('padding')))
        .assertEqual('\"0.00px\"');
      await CommonFunc.sleep(1000);
      console.info('[CommonUndefinedOneTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   CommonUndefinedOneTest_static_0300
     * @tc.name     CommonUndefinedOneTest_static_0300
     * @tc.desc     CommonUndefinedOneTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('CommonUndefinedOneTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonUndefinedOneTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyText2');
      await CommonFunc.sleep(1000);

      console.info('[CommonUndefinedOneTest_static_0300] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[CommonUndefinedOneTest_static_0300] position: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('position')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('position')))
        .assertEqual('{"x":"30.00vp","y":"10.00vp"}');

      let changeBtn = await driver.findComponent(ON.id('Common_Position'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[CommonUndefinedOneTest_static_0300] click Common_Position');
      strJson = inspector.getInspectorByKey('MyText2');
      await CommonFunc.sleep(2000);
      console.info('[CommonUndefinedOneTest_static_0300] position: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('position')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('position')))
        .assertEqual('{"x":"0.00px","y":"0.00px"}');
      await CommonFunc.sleep(1000);
      console.info('[CommonUndefinedOneTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   CommonUndefinedOneTest_static_0400
     * @tc.name     CommonUndefinedOneTest_static_0400
     * @tc.desc     CommonUndefinedOneTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('CommonUndefinedOneTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonUndefinedOneTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyRow2');
      await CommonFunc.sleep(1000);

      console.info('[CommonUndefinedOneTest_static_0400] $attrs: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info('[CommonUndefinedOneTest_static_0400] pixelRound: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pixelRound')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('pixelRound')))
        .assertEqual('\"{\\"start\\":\\"PixelRoundCalcPolicy.FORCE_CEIL\\",\\"top\\":\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\",\\"end\\":\\"PixelRoundCalcPolicy.FORCE_CEIL\\",\\"bottom\\":\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\"}\"');

      let changeBtn = await driver.findComponent(ON.id('Common_PixelRound'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[CommonUndefinedOneTest_static_0400] click Common_PixelRound');
      strJson = inspector.getInspectorByKey('MyRow2');
      await CommonFunc.sleep(2000);
      console.info('[CommonUndefinedOneTest_static_0400] pixelRound: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pixelRound')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('pixelRound')))
        .assertEqual('\"{\\"start\\":\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\",\\"top\\":\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\",\\"end\\":\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\",\\"bottom\\":\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\"}\"');
      await CommonFunc.sleep(1000);
      console.info('[CommonUndefinedOneTest_static_0400] END');
      done();
    });

  })
}