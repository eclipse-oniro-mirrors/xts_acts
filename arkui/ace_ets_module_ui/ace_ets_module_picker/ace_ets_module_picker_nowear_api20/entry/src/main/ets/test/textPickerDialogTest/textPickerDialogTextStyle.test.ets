/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'


export default function textPickerDialogTextStyleTest() {
  describe('textPickerDialogTextStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info('textPickerDialogTextStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialogTextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get textPickerDialogTextStyleTest state pages:' + JSON.stringify(pages));
        if (!('textPickerDialogTextStyle' === pages.name)) {
          console.info('get textPickerDialogTextStyleTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push textPickerDialogTextStyleTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textPickerDialogTextStyleTest page error:' + err);
      }
      console.info('textPickerDialogTextStyleTest beforeEach end');
      done();
    });

    /**
     * @tc.number: textPickerDialogTextStyleTest_0100
     * @tc.name  : textPickerDialogTextStyleTest_0100
     * @tc.desc  : To test the textStyle minFontSize:18 maxFontSize:28 TextOverflow.MARQUEE
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
     */
    it('textPickerDialogTextStyleTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogTextStyleTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn1'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogTextStyleTest_0100] obj is: ' + textPicker);
      console.info('[textPickerDialogTextStyleTest_0100] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.textStyle));
      console.info('[textPickerDialogTextStyleTest_0100] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.textStyle.minFontSize));
      console.info('[textPickerDialogTextStyleTest_0100] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.textStyle.maxFontSize));
      console.info('[textPickerDialogTextStyleTest_0100] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.textStyle.overflow));
      expect(JSON.parse(textPicker).$attrs.textStyle.minFontSize).assertEqual('18.00fp');
      expect(JSON.parse(textPicker).$attrs.textStyle.maxFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.textStyle.overflow).assertEqual('TextOverflow.Marquee');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogTextStyleTest_0100] END');
      done();
    });

    /**
     * @tc.number: textPickerDialogTextStyleTest_0200
     * @tc.name  : textPickerDialogTextStyleTest_0200
     * @tc.desc  : To test the textStyle minFontSize:28 maxFontSize:18 TextOverflow.MARQUEE
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
     */
    it('textPickerDialogTextStyleTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogTextStyleTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn2'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogTextStyleTest_0200] obj is: ' + textPicker);
      console.info('[textPickerDialogTextStyleTest_0200] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.textStyle));
      expect(JSON.parse(textPicker).$attrs.textStyle.minFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.textStyle.maxFontSize).assertEqual('18.00fp');
      expect(JSON.parse(textPicker).$attrs.textStyle.overflow).assertEqual('TextOverflow.Marquee');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogTextStyleTest_0200] END');
      done();
    });

    /**
     * @tc.number: textPickerDialogTextStyleTest_0300
     * @tc.name  : textPickerDialogTextStyleTest_0300
     * @tc.desc  : To test the textStyle minFontSize:28 maxFontSize:28 TextOverflow.MARQUEE
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
     */
    it('textPickerDialogTextStyleTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogTextStyleTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn3'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogTextStyleTest_0300] obj is: ' + textPicker);
      console.info('[textPickerDialogTextStyleTest_0300] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.textStyle));
      expect(JSON.parse(textPicker).$attrs.textStyle.minFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.textStyle.maxFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.textStyle.overflow).assertEqual('TextOverflow.Marquee');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogTextStyleTest_0300] END');
      done();
    });

    /**
     * @tc.number: textPickerDialogTextStyleTest_0400
     * @tc.name  : textPickerDialogTextStyleTest_0400
     * @tc.desc  : To test the textStyle minFontSize:undefined maxFontSize:undefined TextOverflow.MARQUEE
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
     */
    it('textPickerDialogTextStyleTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogTextStyleTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn4'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogTextStyleTest_0400] obj is: ' + textPicker);
      console.info('[textPickerDialogTextStyleTest_0400] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.textStyle));
      expect(JSON.parse(textPicker).$attrs.textStyle.minFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.textStyle.maxFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.textStyle.overflow).assertEqual('TextOverflow.Marquee');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogTextStyleTest_0400] END');
      done();
    });

    /**
     * @tc.number: textPickerDialogTextStyleTest_0500
     * @tc.name  : textPickerDialogTextStyleTest_0500
     * @tc.desc  : To test the textStyle minFontSize:null maxFontSize:null TextOverflow.MARQUEE
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
     */
    it('textPickerDialogTextStyleTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogTextStyleTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn5'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogTextStyleTest_0500] obj is: ' + textPicker);
      console.info('[textPickerDialogTextStyleTest_0500] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.textStyle));
      expect(JSON.parse(textPicker).$attrs.textStyle.minFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.textStyle.maxFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.textStyle.overflow).assertEqual('TextOverflow.Marquee');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogTextStyleTest_0500] END');
      done();
    });
  })
}