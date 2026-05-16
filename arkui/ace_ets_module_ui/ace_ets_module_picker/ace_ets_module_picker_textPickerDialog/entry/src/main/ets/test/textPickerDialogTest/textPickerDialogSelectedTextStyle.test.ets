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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'


export default function textPickerDialogSelectedTextStyleTest() {
  describe('textPickerDialogSelectedTextStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info('textPickerDialogSelectedTextStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialogSelectedTextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get textPickerDialogSelectedTextStyleTest state pages:' + JSON.stringify(pages));
        if (!('TextPickerDialogSelectedTextStyle' === pages.name)) {
          console.info('get textPickerDialogSelectedTextStyleTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push textPickerDialogSelectedTextStyleTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textPickerDialogSelectedTextStyleTest page error:' + err);
      }
      console.info('textPickerDialogSelectedTextStyleTest beforeEach end');
      done();
    });

    /**
     * @tc.name   textPickerDialogSelectedTextStyleTest_0100
     * @tc.number textPickerDialogSelectedTextStyleTest_0100
     * @tc.desc   To test the selectedTextStyle minFontSize:18 maxFontSize:28 TextOverflow.Clip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogSelectedTextStyleTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogSelectedTextStyleTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn1'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogSelectedTextStyleTest_0100] obj is: ' + textPicker);
      console.info('[textPickerDialogSelectedTextStyleTest_0100] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedTextStyle));
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.minFontSize).assertEqual('18.00fp');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.maxFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.overflow).assertEqual('TextOverflow.Clip');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogSelectedTextStyleTest_0100] END');
      done();
    });

    /**
     * @tc.name   textPickerDialogSelectedTextStyleTest_0200
     * @tc.number textPickerDialogSelectedTextStyleTest_0200
     * @tc.desc   To test the selectedTextStyle minFontSize:28 maxFontSize:18 TextOverflow.Clip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogSelectedTextStyleTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogSelectedTextStyleTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn2'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogSelectedTextStyleTest_0200] obj is: ' + textPicker);
      console.info('[textPickerDialogSelectedTextStyleTest_0200] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedTextStyle));
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.minFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.maxFontSize).assertEqual('18.00fp');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.overflow).assertEqual('TextOverflow.Clip');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogSelectedTextStyleTest_0200] END');
      done();
    });

    /**
     * @tc.name   textPickerDialogSelectedTextStyleTest_0300
     * @tc.number textPickerDialogSelectedTextStyleTest_0300
     * @tc.desc   To test the selectedTextStyle minFontSize:28 maxFontSize:28 TextOverflow.Clip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogSelectedTextStyleTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogSelectedTextStyleTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn3'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogSelectedTextStyleTest_0300] obj is: ' + textPicker);
      console.info('[textPickerDialogSelectedTextStyleTest_0300] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedTextStyle));
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.minFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.maxFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.overflow).assertEqual('TextOverflow.Clip');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogSelectedTextStyleTest_0300] END');
      done();
    });

    /**
     * @tc.name   textPickerDialogSelectedTextStyleTest_0400
     * @tc.number textPickerDialogSelectedTextStyleTest_0400
     * @tc.desc   To test the selectedTextStyle minFontSize:undefined maxFontSize:undefined TextOverflow.Clip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogSelectedTextStyleTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogSelectedTextStyleTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn4'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogSelectedTextStyleTest_0400] obj is: ' + textPicker);
      console.info('[textPickerDialogSelectedTextStyleTest_0400] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedTextStyle));
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.minFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.maxFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.overflow).assertEqual('TextOverflow.Clip');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogSelectedTextStyleTest_0400] END');
      done();
    });

    /**
     * @tc.name   textPickerDialogSelectedTextStyleTest_0500
     * @tc.number textPickerDialogSelectedTextStyleTest_0500
     * @tc.desc   To test the selectedTextStyle minFontSize:null maxFontSize:null TextOverflow.Clip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerDialogSelectedTextStyleTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogSelectedTextStyleTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('btn5'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogSelectedTextStyleTest_0500] obj is: ' + textPicker);
      console.info('[textPickerDialogSelectedTextStyleTest_0500] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedTextStyle));
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.minFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.maxFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.selectedTextStyle.overflow).assertEqual('TextOverflow.Clip');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[textPickerDialogSelectedTextStyleTest_0500] END');
      done();
    });
  })
}