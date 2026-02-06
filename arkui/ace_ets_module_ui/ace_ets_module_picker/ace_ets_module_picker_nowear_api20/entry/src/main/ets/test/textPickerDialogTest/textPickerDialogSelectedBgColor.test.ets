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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';
import { resourceManager } from '@kit.LocalizationKit';

function spliceColor(sysColor: Resource) {
  let resourceColor = getContext().resourceManager.getColorSync(sysColor.id)
  let newArgb: string = '#0' + resourceColor.toString(16).toUpperCase()
  return newArgb;
}

export default function TextPickerDialogSelectedBgColorTest() {
  describe('TextPickerDialogSelectedBgColorTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/textPickerDialog/textPickerDialogSelectedBgColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!("textPickerDialogSelectedBgColor" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textPickerDialogSelectedBgColor page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textPickerDialogSelectedBgColor after each called");
    });

    /* *
     * @tc.number: TextPickerDialogSelectedBgColorTest_001
     * @tc.name  : TextPickerDialogSelectedBgColorTest_001
     * @tc.desc  : To test the TextPickerDialog BackgroundColor Color.White
     * @tc.level : Level 0
     */
    it('TextPickerDialogSelectedBgColorTest_001',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ColorWhiteID'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialogSelectedBgColorTest_001] obj is: ' + textPicker);
      console.info('[TextPickerDialogSelectedBgColorTest_001] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle));
      console.info('[TextPickerDialogSelectedBgColorTest_001] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color));
      expect(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color).assertEqual('#FFFFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogSelectedBgColorTest_001] END');
      done();
    })

    /* *
     * @tc.number: TextPickerDialogSelectedBgColorTest_002
     * @tc.name  : TextPickerDialogSelectedBgColorTest_002
     * @tc.desc  : To test the TextPickerDialog BackgroundColor rgb(255, 100, 255)
     * @tc.level : Level 0
     */
    it('TextPickerDialogSelectedBgColorTest_002',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('rgb(255, 100, 255)ID'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialogSelectedBgColorTest_002] obj is: ' + textPicker);
      console.info('[TextPickerDialogSelectedBgColorTest_002] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle));
      console.info('[TextPickerDialogSelectedBgColorTest_002] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color));
      expect(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color).assertEqual('#FFFF64FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogSelectedBgColorTest_002] END');
      done();
    })

    /* *
     * @tc.number: TextPickerDialogSelectedBgColorTest_003
     * @tc.name  : TextPickerDialogSelectedBgColorTest_003
     * @tc.desc  : To test the TextPickerDialog BackgroundColor 0x008080
     * @tc.level : Level 0
     */
    it('TextPickerDialogSelectedBgColorTest_003',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('0x008080ID'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialogSelectedBgColorTest_003] obj is: ' + textPicker);
      console.info('[TextPickerDialogSelectedBgColorTest_003] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle));
      console.info('[TextPickerDialogSelectedBgColorTest_003] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color));
      expect(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color).assertEqual('#FF008080');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogSelectedBgColorTest_003] END');
      done();
    })

    /* *
     * @tc.number: TextPickerDialogSelectedBgColorTest_004
     * @tc.name  : TextPickerDialogSelectedBgColorTest_004
     * @tc.desc  : To test the TextPickerDialog BackgroundColor #00FFFF
     * @tc.level : Level 0
     */
    it('TextPickerDialogSelectedBgColorTest_004',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('00FFFFID'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialogSelectedBgColorTest_004] obj is: ' + textPicker);
      console.info('[TextPickerDialogSelectedBgColorTest_004] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle));
      console.info('[TextPickerDialogSelectedBgColorTest_004] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color));
      expect(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color).assertEqual('#FF00FFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogSelectedBgColorTest_004] END');
      done();
    })

    /* *
     * @tc.number: TextPickerDialogSelectedBgColorTest_005
     * @tc.name  : TextPickerDialogSelectedBgColorTest_005
     * @tc.desc  : To test the TextPickerDialog BackgroundColor $r(app.color.blue)
     * @tc.level : Level 0
     */
    it('TextPickerDialogSelectedBgColorTest_005',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('colorBlueID'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialogSelectedBgColorTest_005] obj is: ' + textPicker);
      console.info('[TextPickerDialogSelectedBgColorTest_005] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle));
      console.info('[TextPickerDialogSelectedBgColorTest_005] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color));
      expect(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color).assertEqual('#FF0000FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogSelectedBgColorTest_005] END');
      done();
    })

    /* *
     * @tc.number: TextPickerDialogSelectedBgColorTest_006
     * @tc.name  : TextPickerDialogSelectedBgColorTest_006
     * @tc.desc  : To test the TextPickerDialog BackgroundColor null
     * @tc.level : Level 0
     */
    it('TextPickerDialogSelectedBgColorTest_006',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialogSelectedBgColorTest_006] obj is: ' + textPicker);
      console.info('[TextPickerDialogSelectedBgColorTest_006] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle));
      console.info('[TextPickerDialogSelectedBgColorTest_006] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color));
      expect(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogSelectedBgColorTest_006] END');
      done();
    })

    /* *
     * @tc.number: TextPickerDialogSelectedBgColorTest_007
     * @tc.name  : TextPickerDialogSelectedBgColorTest_007
     * @tc.desc  : To test the TextPickerDialog BackgroundColor undefined
     * @tc.level : Level 0
     */
    it('TextPickerDialogSelectedBgColorTest_007',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialogSelectedBgColorTest_007] obj is: ' + textPicker);
      console.info('[TextPickerDialogSelectedBgColorTest_007] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle));
      console.info('[TextPickerDialogSelectedBgColorTest_007] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color));
      expect(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogSelectedBgColorTest_007] END');
      done();
    })

    /* *
     * @tc.number: TextPickerDialogSelectedBgColorTest_008
     * @tc.name  : TextPickerDialogSelectedBgColorTest_008
     * @tc.desc  : To test the TextPickerDialog BackgroundColor 'XXX'
     * @tc.level : Level 0
     */
    it('TextPickerDialogSelectedBgColorTest_008',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('xxxID'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialogSelectedBgColorTest_008] obj is: ' + textPicker);
      console.info('[TextPickerDialogSelectedBgColorTest_008] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle));
      console.info('[TextPickerDialogSelectedBgColorTest_008] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color));
      expect(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogSelectedBgColorTest_008] END');
      done();
    })

    /* *
     * @tc.number: TextPickerDialogSelectedBgColorTest_009
     * @tc.name  : TextPickerDialogSelectedBgColorTest_009
     * @tc.desc  : To test the TextPickerDialog BackgroundColor -100
     * @tc.level : Level 0
     */
    it('TextPickerDialogSelectedBgColorTest_009',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let textPicker = JSON.stringify(obj.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialogSelectedBgColorTest_009] obj is: ' + textPicker);
      console.info('[TextPickerDialogSelectedBgColorTest_009] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle));
      console.info('[TextPickerDialogSelectedBgColorTest_009] obj is: ' + JSON.stringify(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color));
      expect(JSON.parse(textPicker).$attrs.selectedBackgroundStyle.color).assertEqual('#FFFFFF9C');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogSelectedBgColorTest_009] END');
      done();
    })
  })
}