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

export default function selectModifierUndefinedTwo() {
  describe('selectModifierUndefinedTwo', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("selectModifierUndefinedTwo beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Select/selectModifierUndefinedTwo",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get selectModifierUndefinedTwo state pages:" + JSON.stringify(pages));
        if (!("selectModifierUndefinedTwo" == pages.name)) {
          console.info("get selectModifierUndefinedTwo pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectModifierUndefinedTwo page error:" + err);
      }
      console.info("selectModifierUndefinedTwo beforeEach end");
    });

    /**
     * @tc.number    fontModifier_static_0100
     * @tc.name      fontModifier_static_0100
     * @tc.desc      fontModifier_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('fontModifier_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[fontModifier_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("fontModifier_static_0100 font is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font'))).assertContain('FontStyle.Italic');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("fontModifier_static_0100 font is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font'))).assertContain('FontStyle.Normal');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("fontModifier_static_0100 font is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font'))).assertContain('FontStyle.Italic');

      console.info('[fontModifier_static_0100] END');
      done();
    });

    /**
     * @tc.number    fontColorModifier_static_0200
     * @tc.name      fontColorModifier_static_0200
     * @tc.desc      fontColorModifier_static_0200
     * @tc.level     Level.LEVEL0
     */
    it('fontColorModifier_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[fontColorModifier_static_0200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("fontColorModifier_static_0200 fontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor'))).assertContain('#FFFF0000');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      let originJson = inspector.getInspectorByKey('Select_ModifierOrigin');
      let origin = JSON.parseJsonElement(originJson);
      let originFontColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('fontColor'));

      console.info("fontColorModifier_static_0200 fontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor'))).assertEqual(originFontColor);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("fontColorModifier_static_0200 fontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor'))).assertContain('#FFFF0000');

      console.info('[fontColorModifier_static_0200] END');
      done();
    });

    /**
     * @tc.number    valueModifier_static_0300
     * @tc.name      valueModifier_static_0300
     * @tc.desc      valueModifier_static_0300
     * @tc.level     Level.LEVEL0
     */
    it('valueModifier_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[valueModifier_static_0300] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("valueModifier_static_0300 value is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value'))).assertContain('hello');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("valueModifier_static_0300 value is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value'))).assertContain('');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("valueModifier_static_0300 value is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value'))).assertContain('hello');

      console.info('[valueModifier_static_0300] END');
      done();
    });

    /**
     * @tc.number    spaceModifier_static_0400
     * @tc.name      spaceModifier_static_0400
     * @tc.desc      spaceModifier_static_0400
     * @tc.level     Level.LEVEL0
     */
    it('spaceModifier_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[spaceModifier_static_0400] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier002');
      let obj = JSON.parseJsonElement(strJson);

      console.info("spaceModifier_static_0400 space is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space'))).assertContain('100.00vp');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier002');
      obj = JSON.parseJsonElement(strJson);

      console.info("spaceModifier_static_0400 space is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space'))).assertContain('8.00vp');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier002');
      obj = JSON.parseJsonElement(strJson);

      console.info("spaceModifier_static_0400 space is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space'))).assertContain('100.00vp');

      console.info('[spaceModifier_static_0400] END');
      done();
    });

    /**
     * @tc.number    dividerModifier_static_0500
     * @tc.name      dividerModifier_static_0500
     * @tc.desc      dividerModifier_static_0500
     * @tc.level     Level.LEVEL0
     */
    it('dividerModifier_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[dividerModifier_static_0500] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("dividerModifier_static_0500 divider is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider'))).assertContain('2.00px');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("dividerModifier_static_0500 divider is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider'))).assertContain('1.00px');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("dividerModifier_static_0500 divider is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider'))).assertContain('2.00px');

      console.info('[dividerModifier_static_0500] END');
      done();
    });

    /**
     * @tc.number    optionBgColorModifier_static_0600
     * @tc.name      optionBgColorModifier_static_0600
     * @tc.desc      optionBgColorModifier_static_0600
     * @tc.level     Level.LEVEL0
     */
    it('optionBgColorModifier_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[optionBgColorModifier_static_0600] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("optionBgColorModifier_static_0600 optionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor'))).assertContain('#FFFFFF00');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      let originJson = inspector.getInspectorByKey('Select_ModifierOrigin');
      let origin = JSON.parseJsonElement(originJson);
      let originOptionBgColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('optionBgColor'));

      console.info("optionBgColorModifier_static_0600 optionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor'))).assertEqual(originOptionBgColor);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("optionBgColorModifier_static_0600 optionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor'))).assertContain('#FFFFFF00');

      console.info('[optionBgColorModifier_static_0600] END');
      done();
    });

    /**
     * @tc.number    arrowPositionModifier_static_0700
     * @tc.name      arrowPositionModifier_static_0700
     * @tc.desc      arrowPositionModifier_static_0700
     * @tc.level     Level.LEVEL0
     */
    it('arrowPositionModifier_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arrowPositionModifier_static_0700] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("arrowPositionModifier_static_0700 arrowPosition is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition'))).assertContain('ArrowPosition.START');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("arrowPositionModifier_static_0700 arrowPosition is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition'))).assertContain('ArrowPosition.END');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("arrowPositionModifier_static_0700 arrowPosition is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition'))).assertContain('ArrowPosition.START');

      console.info('[arrowPositionModifier_static_0700] END');
      done();
    });

    /**
     * @tc.number    selectedOptionBgColorModifier_static_0800
     * @tc.name      selectedOptionBgColorModifier_static_0800
     * @tc.desc      selectedOptionBgColorModifier_static_0800
     * @tc.level     Level.LEVEL0
     */
    it('selectedOptionBgColorModifier_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectedOptionBgColorModifier_static_0800] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionBgColorModifier_static_0800 selectedOptionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor'))).assertContain('#FF008000');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      let originJson = inspector.getInspectorByKey('Select_ModifierOrigin');
      let origin = JSON.parseJsonElement(originJson);
      let originSelectedOptionBgColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('selectedOptionBgColor'));

      console.info("selectedOptionBgColorModifier_static_0800 selectedOptionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor'))).assertEqual(originSelectedOptionBgColor);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionBgColorModifier_static_0800 selectedOptionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor'))).assertContain('#FF008000');

      console.info('[selectedOptionBgColorModifier_static_0800] END');
      done();
    });

    /**
     * @tc.number    selectedOptionFontModifier_static_0900
     * @tc.name      selectedOptionFontModifier_static_0900
     * @tc.desc      selectedOptionFontModifier_static_0900
     * @tc.level     Level.LEVEL0
     */
    it('selectedOptionFontModifier_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectedOptionFontModifier_static_0900] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFontModifier_static_0900 selectedOptionFont is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont'))).assertContain('FontStyle.Italic');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFontModifier_static_0900 selectedOptionFont is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont'))).assertContain('FontStyle.Normal');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFontModifier_static_0900 selectedOptionFont is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont'))).assertContain('FontStyle.Italic');

      console.info('[selectedOptionFontModifier_static_0900] END');
      done();
    });

    /**
     * @tc.number    selectedOptionFontColorModifier_static_1000
     * @tc.name      selectedOptionFontColorModifier_static_1000
     * @tc.desc      selectedOptionFontColorModifier_static_1000
     * @tc.level     Level.LEVEL0
     */
    it('selectedOptionFontColorModifier_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectedOptionFontColorModifier_static_1000] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFontColorModifier_static_1000 selectedOptionFontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor'))).assertContain('#FF0000FF');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      let originJson = inspector.getInspectorByKey('Select_ModifierOrigin');
      let origin = JSON.parseJsonElement(originJson);
      let originSelectedOptionFontColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('selectedOptionFontColor'));

      console.info("selectedOptionFontColorModifier_static_1000 selectedOptionFontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor'))).assertEqual(originSelectedOptionFontColor);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFontColorModifier_static_1000 controlSize is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor'))).assertContain('#FF0000FF');

      console.info('[selectedOptionFontColorModifier_static_1000] END');
      done();
    });

    /**
     * @tc.number    controlSizeModifier_static_1100
     * @tc.name      controlSizeModifier_static_1100
     * @tc.desc      controlSizeModifier_static_1100
     * @tc.level     Level.LEVEL0
     */
    it('controlSizeModifier_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[controlSizeModifier_static_1100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("controlSizeModifier_static_1100 controlSize is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize'))).assertContain('ControlSize.SMALL');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("controlSizeModifier_static_1100 controlSize is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize'))).assertContain('ControlSize.NORMAL');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier02');
      obj = JSON.parseJsonElement(strJson);

      console.info("controlSizeModifier_static_1100 controlSize is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize'))).assertContain('ControlSize.SMALL');

      console.info('[controlSizeModifier_static_1100] END');
      done();
    });

    /**
     * @tc.number    dividerStyleModifier_static_1200
     * @tc.name      dividerStyleModifier_static_1200
     * @tc.desc      dividerStyleModifier_static_1200
     * @tc.level     Level.LEVEL0
     */
    it('dividerStyleModifier_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[dividerStyleModifier_static_1200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('selectModifier002');
      let obj = JSON.parseJsonElement(strJson);

      console.info("dividerStyleModifier_static_1200 controlSize is: " + JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode'));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode')).assertContain('FLOATING_ABOVE_MENU');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('selectModifierChange02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier002');
      obj = JSON.parseJsonElement(strJson);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('selectModifier002');
      obj = JSON.parseJsonElement(strJson);

      console.info("dividerStyleModifier_static_1200 controlSize is: " + JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode'));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode')).assertContain('FLOATING_ABOVE_MENU');

      console.info('[dividerStyleModifier_static_1200] END');
      done();
    });

  })
}