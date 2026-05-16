'use static';
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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function buttonUndefinedTest() {
  describe('buttonUndefinedTest', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("buttonUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/button/buttonUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get buttonUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("buttonUndefined" == pages.name)) {
          console.info("get buttonUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push buttonUndefinedTest page error:" + err);
      }
      console.info("buttonUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    buttonUndefinedTest_static_0100
     * @tc.name      buttonUndefinedTest_static_0100
     * @tc.desc      buttonUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('buttonUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('button_maxFontScale');
      let maxFontScaleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('maxFontScale');
      console.info('$maxFontScale: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('maxFontScale')));
      expect(maxFontScaleValue.asString()).assertEqual('1.500000');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_maxFontScale2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('button_maxFontScale');
      let maxFontScaleValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('maxFontScale');
      console.info('$maxFontScale: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('maxFontScale')));
      expect(maxFontScaleValue1.asString()).assertEqual('3.200000');

      console.info('[buttonUndefinedTest_static_0100] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_0200
    * @tc.name      buttonUndefinedTest_static_0200
    * @tc.desc      buttonUndefinedTest_static_0200
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_0200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('button_minFontScale');
      let minFontScaleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minFontScale');
      console.info('$minFontScale: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minFontScale')));
      expect(minFontScaleValue.asString()).assertEqual('0.700000');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_minFontScale2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('button_minFontScale');
      let minFontScaleValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('minFontScale');
      console.info('$minFontScale: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('minFontScale')));
      expect(minFontScaleValue1.asString()).assertEqual('0.850000');

      console.info('[buttonUndefinedTest_static_0200] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_0300
    * @tc.name      buttonUndefinedTest_static_0300
    * @tc.desc      buttonUndefinedTest_static_0300
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_0300] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('button_labelStyle');
      let labelStyleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('labelStyle');
      console.info('$labelStyle: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('labelStyle')));
      expect(labelStyleValue.asString()).assertContain('\"maxLines\":\"3\"');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_labelStyle2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('button_labelStyle');
      let labelStyleValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('labelStyle');
      console.info('$labelStyle: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('labelStyle')));
      expect(labelStyleValue1.asString()).assertContain('\"maxLines\":\"1\"');
      await CommonFunc.sleep(2000);

      console.info('[buttonUndefinedTest_static_0300] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_0400
    * @tc.name      buttonUndefinedTest_static_0400
    * @tc.desc      buttonUndefinedTest_static_0400
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_0400] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('button_controlSize');
      let controlSizeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('controlSize');
      console.info('$controlSize: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('controlSize')));
      expect(controlSizeValue.asString()).assertEqual('ControlSize.SMALL');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_controlSize2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('button_controlSize');
      let controlSizeValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('controlSize');
      console.info('$controlSize: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('controlSize')));
      expect(controlSizeValue1.asString()).assertEqual('ControlSize.NORMAL');
      await CommonFunc.sleep(2000);

      console.info('[buttonUndefinedTest_static_0400] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_0500
    * @tc.name      buttonUndefinedTest_static_0500
    * @tc.desc      buttonUndefinedTest_static_0500
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_0500] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('button_buttonStyle');
      let buttonStyleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('buttonStyle');
      console.info('$buttonStyle: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('buttonStyle')));
      expect(buttonStyleValue.asString()).assertEqual('ButtonStyleMode.NORMAL');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_buttonStyle2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('button_controlSize');
      let buttonStyleValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('buttonStyle');
      console.info('$buttonStyle: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('buttonStyle')));
      expect(buttonStyleValue1.asString()).assertEqual('ButtonStyleMode.EMPHASIZED');

      console.info('[buttonUndefinedTest_static_0500] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_0600
    * @tc.name      buttonUndefinedTest_static_0600
    * @tc.desc      buttonUndefinedTest_static_0600
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_0600] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('button_role');
      let roleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('role');
      console.info('$role: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('role')));
      expect(roleValue.asString()).assertEqual('ButtonRole.ERROR');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_role2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('button_role');
      let roleValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('role');
      console.info('$role: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('role')));
      expect(roleValue1.asString()).assertEqual('ButtonRole.NORMAL');
      await CommonFunc.sleep(2000);

      console.info('[buttonUndefinedTest_static_0600] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_0700
    * @tc.name      buttonUndefinedTest_static_0700
    * @tc.desc      buttonUndefinedTest_static_0700
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_0700] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('button_fontFamily');
      let fontFamilyValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontFamily');
      console.info('$fontFamily: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontFamily')));
      expect(fontFamilyValue.asString()).assertEqual('serif');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_fontFamily2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('button_fontFamily');
      let fontFamilyValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontFamily');
      console.info('$fontFamily: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontFamily')));
      expect(fontFamilyValue1.asString()).assertEqual('');

      console.info('[buttonUndefinedTest_static_0700] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_0800
    * @tc.name      buttonUndefinedTest_static_0800
    * @tc.desc      buttonUndefinedTest_static_0800
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_0800] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('button_fontStyle');
      let fontStyleValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontStyle');
      console.info('$fontStyle: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontStyle')));
      expect(fontStyleValue.asString()).assertEqual('FontStyle.Italic');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_fontStyle2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('button_fontStyle');
      let fontStyleValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontStyle');
      console.info('$fontStyle: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontStyle')));
      expect(fontStyleValue1.asString()).assertEqual('FontStyle.Normal');
      await CommonFunc.sleep(2000);

      console.info('[buttonUndefinedTest_static_0800] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_0900
    * @tc.name      buttonUndefinedTest_static_0900
    * @tc.desc      buttonUndefinedTest_static_0900
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_0900] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('button_fontWeight');
      let fontWeightValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontWeight');
      console.info('$fontWeight: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontWeight')));
      expect(fontWeightValue.asString()).assertEqual('100');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_fontWeight2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('button_fontWeight');
      let fontWeightValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontWeight');
      console.info('$fontWeight: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontWeight')));
      expect(fontWeightValue1.asString()).assertEqual('FontWeight.Normal');
      await CommonFunc.sleep(2000);

      console.info('[buttonUndefinedTest_static_0900] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_1000
    * @tc.name      buttonUndefinedTest_static_1000
    * @tc.desc      buttonUndefinedTest_static_1000
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_1000] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('button_fontSize');
      let obj = JSON.parseJsonElement(strJson);
      let fontSizeValue = JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontSize'));
      console.info('$fontSize: ' + fontSizeValue);

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_fontSize2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('button_fontSize');
      obj = JSON.parseJsonElement(strJson);
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontSize'))).assertContain('30');
      await CommonFunc.sleep(2000);

      await btn1.click();
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('button_fontSize2');
      obj = JSON.parseJsonElement(strJson);
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontSize'))).assertContain(fontSizeValue);
      await CommonFunc.sleep(2000);
      console.info('[buttonUndefinedTest_static_1000] END');
      done();
    });

    /**
    * @tc.number    buttonUndefinedTest_static_1100
    * @tc.name      buttonUndefinedTest_static_1100
    * @tc.desc      buttonUndefinedTest_static_1100
    * @tc.level     Level.LEVEL0
    */
    it('buttonUndefinedTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_1100] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('button_fontColor');
      let fontColorValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontColor');
      console.info('$fontColor: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontColor')));
      expect(fontColorValue.asString()).assertEqual('#FFFF00FF');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_fontColor2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('button_fontColor');
      let fontColorValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontColor');
      console.info('$fontColor: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontColor')));
      expect(fontColorValue1.asString()).assertEqual('#FFFFFFFF');
      await CommonFunc.sleep(2000);

      console.info('[buttonUndefinedTest_static_1100] END');
      done();
    });

    /**
     * @tc.number    buttonUndefinedTest_static_1200
     * @tc.name      buttonUndefinedTest_static_1200
     * @tc.desc      buttonUndefinedTest_static_1200
     * @tc.level     Level.LEVEL0
     */
    it('buttonUndefinedTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_1200] START.');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_controlSize2')) as Component;
      await CommonFunc.sleep(500);
      let btn2 = await driver.findComponent(ON.id('button_maxFontScale2')) as Component;
      await (btn1?.dragTo(btn2) as Promise<void>);

      let strJson = inspector.getInspectorByKey('button_stateEffect');
      let stateEffectValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stateEffect');
      console.info('$stateEffect: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stateEffect')));
      expect(stateEffectValue.asString()).assertEqual('false');

      let btn3 = await driver.findComponent(ON.id('button_stateEffect2')) as Component;
      await btn3.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('button_stateEffect');
      let stateEffectValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stateEffect');
      console.info('$stateEffect: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('stateEffect')));
      expect(stateEffectValue1.asString()).assertEqual('true');
      await CommonFunc.sleep(2000);

      console.info('[buttonUndefinedTest_static_1200] END');
      done();
    });

    /**
        * @tc.number    buttonUndefinedTest_static_1300
        * @tc.name      buttonUndefinedTest_static_1300
        * @tc.desc      buttonUndefinedTest_static_1300
        * @tc.level     Level.LEVEL0
        */
    it('buttonUndefinedTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonUndefinedTest_static_1300] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('button_type');
      let typeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('type');
      console.info('$type: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('type')));
      expect(typeValue.asString()).assertEqual('ButtonType.Circle');

      let driver = Driver.create();
      let btn3 = await driver.findComponent(ON.id('button_type2')) as Component;
      await btn3.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('button_type');
      let typeValue1 =
        JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('type');
      console.info('$type: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('type')));
      expect(typeValue1.asString()).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      await CommonFunc.sleep(2000);

      console.info('[buttonUndefinedTest_static_1300] END');
      done();
    });
  })
}