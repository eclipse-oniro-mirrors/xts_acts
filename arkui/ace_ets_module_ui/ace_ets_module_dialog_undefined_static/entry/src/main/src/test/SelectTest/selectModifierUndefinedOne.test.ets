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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, ON, } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function selectModifierUndefinedOne() {
  describe('selectModifierUndefinedOne', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("selectUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Select/selectModifierUndefinedOne",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get selectModifierUndefinedOne state pages:" + JSON.stringify(pages));
        if (!("selectModifierUndefinedOne" == pages.name)) {
          console.info("get selectModifierUndefinedOne pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectModifierUndefinedOne page error:" + err);
      }
      console.info("selectModifierUndefinedOne beforeEach end");
    });

    /**
     * @tc.number    menuAlignModifier_static_0100
     * @tc.name      menuAlignModifier_static_0100
     * @tc.desc      menuAlignModifier_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('menuAlignModifier_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuAlignModifier_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier');
      let obj = JSON.parseJsonElement(strJson);

      console.info("menuAlignModifier_static_0100 menuAlign is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuAlign')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuAlign'))).assertContain('MenuAlignType.Center');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("menuAlignModifier_static_0100 click menuAlign is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuAlign')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuAlign'))).assertContain('MenuAlignType.Start');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("menuAlignModifier_static_0100 click after menuAlign is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuAlign')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuAlign'))).assertContain('MenuAlignType.Center');

      console.info('[menuAlignModifier_static_0100] END');
      done();
    });

    /**
     * @tc.number    menuBackgroundBlurStyleModifier_static_0200
     * @tc.name      menuBackgroundBlurStyleModifier_static_0200
     * @tc.desc      menuBackgroundBlurStyleModifier_static_0200
     * @tc.level     Level.LEVEL0
     */
    it('menuBackgroundBlurStyleModifier_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuBackgroundBlurStyleModifier_static_0200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier');
      let obj = JSON.parseJsonElement(strJson);

      console.info("menuBackgroundBlurStyleModifier_static_0200 menuBackgroundBlurStyle is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundBlurStyle')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundBlurStyle'))).assertContain('BlurStyle.Thin');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("menuBackgroundBlurStyleModifier_static_0200 click menuBackgroundBlurStyle is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundBlurStyle')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundBlurStyle'))).assertContain('BlurStyle.COMPONENT_ULTRA_THIN');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("menuBackgroundBlurStyleModifier_static_0200 click after menuBackgroundBlurStyle is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundBlurStyle')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundBlurStyle'))).assertContain('BlurStyle.Thin');

      console.info('[menuBackgroundBlurStyleModifier_static_0200] END');
      done();
    });

    /**
     * @tc.number    optionHeightModifier_static_0300
     * @tc.name      optionHeightModifier_static_0300
     * @tc.desc      optionHeightModifier_static_0300
     * @tc.level     Level.LEVEL0
     */
    it('optionHeightModifier_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[optionHeightModifier_static_0300] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier');
      let obj = JSON.parseJsonElement(strJson);
      let optionHeight = JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionHeight'));
      console.info("optionHeightModifier_static_0300 optionHeight is: " + optionHeight);

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("optionHeightModifier_static_0300 click optionHeight is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionHeight')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionHeight'))).assertContain('100');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("optionHeightModifier_static_0300 click after optionHeight is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionHeight')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionHeight'))).assertContain(optionHeight);

      console.info('[optionHeightModifier_static_0300] END');
      done();
    });

    /**
     * @tc.number    menuBackgroundColorModifier_static_0400
     * @tc.name      menuBackgroundColorModifier_static_0400
     * @tc.desc      menuBackgroundColorModifier_static_0400
     * @tc.level     Level.LEVEL0
     */
    it('menuBackgroundColorModifier_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuBackgroundColorModifier_static_0400] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier');
      let obj = JSON.parseJsonElement(strJson);

      console.info("menuBackgroundColorModifier_static_0400 menuBackgroundColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundColor'))).assertContain('#FFFF0000');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("menuBackgroundColorModifier_static_0400 click menuBackgroundColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundColor'))).assertContain('#00000000');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("menuBackgroundColorModifier_static_0400 click after menuBackgroundColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('menuBackgroundColor'))).assertContain('#FFFF0000');

      console.info('[menuBackgroundColorModifier_static_0400] END');
      done();
    });

    /**
     * @tc.number    optionBgColorModifier_static_0500
     * @tc.name      optionBgColorModifier_static_0500
     * @tc.desc      optionBgColorModifier_static_0500
     * @tc.level     Level.LEVEL0
     */
    it('optionBgColorModifier_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[optionBgColorModifier_static_0500] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier');
      let obj = JSON.parseJsonElement(strJson);

      console.info("optionBgColorModifier_static_0500 optionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor'))).assertContain('#FFFF0000');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("optionBgColorModifier_static_0500 click optionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor'))).assertContain('#FFFFFFFF');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier');
      obj = JSON.parseJsonElement(strJson);

      console.info("optionBgColorModifier_static_0500 click after optionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor'))).assertContain('#FFFF0000');

      console.info('[optionBgColorModifier_static_0500] END');
      done();
    });

  })
}