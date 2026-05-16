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

export default function selectUndefinedThree() {
  describe('selectUndefinedThree', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("selectUndefinedThree beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Select/selectUndefinedThree",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get selectUndefinedThree state pages:" + JSON.stringify(pages));
        if (!("selectUndefinedThree" == pages.name)) {
          console.info("get selectUndefinedThree pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectUndefinedThree page error:" + err);
      }
      console.info("selectUndefinedThree beforeEach end");
    });

    /**
     * @tc.number    font_static_0100
     * @tc.name      font_static_0100
     * @tc.desc      font_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('font_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[font_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("font_static_0100 font is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font'))).assertContain('FontStyle.Italic');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("font_static_0100 font is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font'))).assertContain('FontStyle.Normal');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("font_static_0100 font is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('font'))).assertContain('FontStyle.Italic');

      console.info('[font_static_0100] END');
      done();
    });

    /**
     * @tc.number    fontColor_static_0200
     * @tc.name      fontColor_static_0200
     * @tc.desc      fontColor_static_0200
     * @tc.level     Level.LEVEL0
     */
    it('fontColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[fontColor_static_0200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("fontColor_static_0200 fontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor'))).assertContain('#FFFF0000');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      let originJson = inspector.getInspectorByKey('Select_Origin');
      let origin = JSON.parseJsonElement(originJson);
      let originFontColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('fontColor'));

      console.info("fontColor_static_0200 fontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor'))).assertEqual(originFontColor);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("fontColor_static_0200 fontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('fontColor'))).assertContain('#FFFF0000');

      console.info('[fontColor_static_0200] END');
      done();
    });

    /**
     * @tc.number    value_static_0300
     * @tc.name      value_static_0300
     * @tc.desc      value_static_0300
     * @tc.level     Level.LEVEL0
     */
    it('value_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[value_static_0300] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("value_static_0300 value is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value'))).assertContain('hello');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("value_static_0300 value is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value'))).assertContain('');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("value_static_0300 value is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('value'))).assertContain('hello');

      console.info('[value_static_0300] END');
      done();
    });

    /**
     * @tc.number    space_static_0400
     * @tc.name      space_static_0400
     * @tc.desc      space_static_0400
     * @tc.level     Level.LEVEL0
     */
    it('space_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[space_static_0400] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("space_static_0400 space is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space'))).assertContain('100.00vp');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("space_static_0400 space is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space'))).assertContain('8.00vp');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("space_static_0400 space is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('space'))).assertContain('100.00vp');

      console.info('[space_static_0400] END');
      done();
    });

    /**
     * @tc.number    divider_static_0500
     * @tc.name      divider_static_0500
     * @tc.desc      divider_static_0500
     * @tc.level     Level.LEVEL0
     */
    it('divider_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[divider_static_0500] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("divider_static_0500 divider is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider'))).assertContain('2.00px');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("divider_static_0500 divider is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider'))).assertContain('1.00px');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("divider_static_0500 divider is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('divider'))).assertContain('2.00px');

      console.info('[divider_static_0500] END');
      done();
    });

    /**
     * @tc.number    optionBgColor_static_0600
     * @tc.name      optionBgColor_static_0600
     * @tc.desc      optionBgColor_static_0600
     * @tc.level     Level.LEVEL0
     */
    it('optionBgColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[optionBgColor_static_0600] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("optionBgColor_static_0600 optionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor'))).assertContain('#FFFFFF00');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      let originJson = inspector.getInspectorByKey('Select_Origin');
      let origin = JSON.parseJsonElement(originJson);
      let originOptionBgColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('optionBgColor'));

      console.info("optionBgColor_static_0600 optionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor'))).assertEqual(originOptionBgColor);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("optionBgColor_static_0600 optionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('optionBgColor'))).assertContain('#FFFFFF00');

      console.info('[optionBgColor_static_0600] END');
      done();
    });

    /**
     * @tc.number    arrowPosition_static_0700
     * @tc.name      arrowPosition_static_0700
     * @tc.desc      arrowPosition_static_0700
     * @tc.level     Level.LEVEL0
     */
    it('arrowPosition_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arrowPosition_static_0700] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("arrowPosition_static_0700 arrowPosition is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition'))).assertContain('ArrowPosition.START');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("arrowPosition_static_0700 arrowPosition is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition'))).assertContain('ArrowPosition.END');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("arrowPosition_static_0700 arrowPosition is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('arrowPosition'))).assertContain('ArrowPosition.START');

      console.info('[arrowPosition_static_0700] END');
      done();
    });

    /**
     * @tc.number    selectedOptionBgColor_static_0800
     * @tc.name      selectedOptionBgColor_static_0800
     * @tc.desc      selectedOptionBgColor_static_0800
     * @tc.level     Level.LEVEL0
     */
    it('selectedOptionBgColor_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectedOptionBgColor_static_0800] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionBgColor_static_0800 selectedOptionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor'))).assertContain('#FF008000');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      let originJson = inspector.getInspectorByKey('Select_Origin');
      let origin = JSON.parseJsonElement(originJson);
      let originSelectedOptionBgColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('selectedOptionBgColor'));

      console.info("selectedOptionBgColor_static_0800 selectedOptionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor'))).assertEqual(originSelectedOptionBgColor);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionBgColor_static_0800 selectedOptionBgColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionBgColor'))).assertContain('#FF008000');

      console.info('[selectedOptionBgColor_static_0800] END');
      done();
    });

    /**
     * @tc.number    selectedOptionFont_static_0900
     * @tc.name      selectedOptionFont_static_0900
     * @tc.desc      selectedOptionFont_static_0900
     * @tc.level     Level.LEVEL0
     */
    it('selectedOptionFont_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectedOptionFont_static_0900] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFont_static_0900 selectedOptionFont is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont'))).assertContain('FontStyle.Italic');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFont_static_0900 selectedOptionFont is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont'))).assertContain('FontStyle.Normal');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFont_static_0900 selectedOptionFont is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFont'))).assertContain('FontStyle.Italic');

      console.info('[selectedOptionFont_static_0900] END');
      done();
    });

    /**
     * @tc.number    selectedOptionFontColor_static_1000
     * @tc.name      selectedOptionFontColor_static_1000
     * @tc.desc      selectedOptionFontColor_static_1000
     * @tc.level     Level.LEVEL0
     */
    it('selectedOptionFontColor_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectedOptionFontColor_static_1000] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFontColor_static_1000 selectedOptionFontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor'))).assertContain('#FF0000FF');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      let originJson = inspector.getInspectorByKey('Select_Origin');
      let origin = JSON.parseJsonElement(originJson);
      let originSelectedOptionFontColor = JSON.stringifyJsonElement(origin.getElement('$attrs').getElement('selectedOptionFontColor'));

      console.info("selectedOptionFontColor_static_1000 selectedOptionFontColor is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor'))).assertEqual(originSelectedOptionFontColor);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("selectedOptionFontColor_static_1000 controlSize is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedOptionFontColor'))).assertContain('#FF0000FF');

      console.info('[selectedOptionFontColor_static_1000] END');
      done();
    });

    /**
     * @tc.number    controlSize_static_1100
     * @tc.name      controlSize_static_1100
     * @tc.desc      controlSize_static_1100
     * @tc.level     Level.LEVEL0
     */
    it('controlSize_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[controlSize_static_1100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test02');
      let obj = JSON.parseJsonElement(strJson);

      console.info("controlSize_static_1100 controlSize is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize'))).assertContain('ControlSize.SMALL');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("controlSize_static_1100 controlSize is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize'))).assertContain('ControlSize.NORMAL');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test02');
      obj = JSON.parseJsonElement(strJson);

      console.info("controlSize_static_1100 controlSize is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('controlSize'))).assertContain('ControlSize.SMALL');

      console.info('[controlSize_static_1100] END');
      done();
    });

    /**
     * @tc.number    dividerStyle_static_1200
     * @tc.name      dividerStyle_static_1200
     * @tc.desc      dividerStyle_static_1200
     * @tc.level     Level.LEVEL0
     */
    it('dividerStyle_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[dividerStyle_static_1200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test03');
      let obj = JSON.parseJsonElement(strJson);

      console.info("dividerStyle_static_1200 controlSize is: " + JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode'));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode')).assertContain('FLOATING_ABOVE_MENU');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test03');
      obj = JSON.parseJsonElement(strJson);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test03');
      obj = JSON.parseJsonElement(strJson);

      console.info("dividerStyle_static_1200 controlSize is: " + JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode'));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode')).assertContain('FLOATING_ABOVE_MENU');

      console.info('[dividerStyle_static_1200] END');
      done();
    });

  })
}