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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function textPickerDialogDefaultTextStyleTest() {
  describe('textPickerDialogDefaultTextStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info('textPickerDialogDefaultTextStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialogDefaultTextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get textPickerDialogDefaultTextStyleTest state pages:' + JSON.stringify(pages));
        if (!('textPickerDialogDefaultTextStyle' == pages.name)) {
          console.info('get textPickerDialogDefaultTextStyleTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push textPickerDialogDefaultTextStyleTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textPickerDialogDefaultTextStyleTest page error:' + err);
      }
      console.info('textPickerDialogDefaultTextStyleTest beforeEach end');
      done();
    });
    /* *
    * @tc.number: textPickerDialogDefaultTextStyleTest_001
    * @tc.name  : textPickerDialogDefaultTextStyleTest_001
    * @tc.desc  : To test the defaultTextStyle minFontSize:18 maxFontSize:28 TextOverflow.Ellipsis
    * @tc.level : Level 0
    */
    it('textPickerDialogDefaultTextStyleTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogDefaultTextStyleTest_001 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn1'));
      await btn.click()
      await Utils.sleep(2000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_001] obj is: ' + JSON.stringify(obj));

      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogDefaultTextStyleTest_001] obj is: ' + textPicker);
      console.info('[textPickerDialogDefaultTextStyleTest_001] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.defaultTextStyle));
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.minFontSize).assertEqual('18.00fp');
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.maxFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_001] END');
      done();
    });

    /* *
    * @tc.number: textPickerDialogDefaultTextStyleTest_002
    * @tc.name  : textPickerDialogDefaultTextStyleTest_002
    * @tc.desc  : To test the defaultTextStyle minFontSize:28 maxFontSize:18 TextOverflow.Ellipsis
    * @tc.level : Level 0
    */
    it('textPickerDialogDefaultTextStyleTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogDefaultTextStyleTest_001 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn2'));
      await btn.click()
      await Utils.sleep(2000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_002] obj is: ' + JSON.stringify(obj));

      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogDefaultTextStyleTest_002] obj is: ' + textPicker);
      console.info('[textPickerDialogDefaultTextStyleTest_002] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.defaultTextStyle));
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.minFontSize).assertEqual('28.00fp');
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.maxFontSize).assertEqual('18.00fp');
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_002] END');
      done();
    });

    /* *
    * @tc.number: textPickerDialogDefaultTextStyleTest_003
    * @tc.name  : textPickerDialogDefaultTextStyleTest_003
    * @tc.desc  : To test the defaultTextStyle undefined
    * @tc.level : Level 0
    */
    it('textPickerDialogDefaultTextStyleTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogDefaultTextStyleTest_003 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn3'));
      await btn.click()
      await Utils.sleep(2000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_003] obj is: ' + JSON.stringify(obj));

      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogDefaultTextStyleTest_003] obj is: ' + textPicker);
      console.info('[textPickerDialogDefaultTextStyleTest_003] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.defaultTextStyle));
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.minFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.maxFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Clip');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_003] END');
      done();
    });

    /* *
    * @tc.number: textPickerDialogDefaultTextStyleTest_004
    * @tc.name  : textPickerDialogDefaultTextStyleTest_004
    * @tc.desc  : To test the defaultTextStyle null
    * @tc.level : Level 0
    */
    it('textPickerDialogDefaultTextStyleTest_004', Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogDefaultTextStyleTest_004 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn4'));
      await btn.click()
      await Utils.sleep(2000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_004] obj is: ' + JSON.stringify(obj));

      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[textPickerDialogDefaultTextStyleTest_004] obj is: ' + textPicker);
      console.info('[textPickerDialogDefaultTextStyleTest_004] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.defaultTextStyle));
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.minFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.maxFontSize).assertEqual('0.00px');
      expect(JSON.parse(textPicker).$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Clip');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      console.info('[textPickerDialogDefaultTextStyleTest_004] END');
      done();
    });
  })
}