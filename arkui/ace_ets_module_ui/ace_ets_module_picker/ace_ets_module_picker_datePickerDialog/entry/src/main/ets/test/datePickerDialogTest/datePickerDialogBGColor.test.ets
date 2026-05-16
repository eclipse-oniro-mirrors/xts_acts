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

export default function DatePickerDialogBGColorTest() {
  describe('DatePickerDialogBGColorTest', () => {

    beforeAll(async () => {
      console.info('DatePickerDialogBGColor beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerDialog/datePickerDialogBGColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('datePickerDialogBGColor' == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push DatePickerDialogBGColor page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('textAreaInputTest after each called');
    });

    /**
     * @tc.name   DatePickerDialogBGColorTest_001
     * @tc.number DatePickerDialogBGColorTest_001
     * @tc.desc   To test the DatePickerDialog BackgroundColor Color.White
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogBGColorTest_001', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ColorWhiteID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FFFFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   DatePickerDialogBGColorTest_002
     * @tc.number DatePickerDialogBGColorTest_002
     * @tc.desc   To test the DatePickerDialog BackgroundColor 'rgb(255, 100, 255)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogBGColorTest_002', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('rgb(255, 100, 255)ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FFFF64FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   DatePickerDialogBGColorTest_003
     * @tc.number DatePickerDialogBGColorTest_003
     * @tc.desc   To test the DatePickerDialog BackgroundColor 0x008080
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogBGColorTest_003', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('0x008080ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FF008080');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   DatePickerDialogBGColorTest_004
     * @tc.number DatePickerDialogBGColorTest_004
     * @tc.desc   To test the DatePickerDialog BackgroundColor '#00FFFF'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogBGColorTest_004', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('00FFFFID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FF00FFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   DatePickerDialogBGColorTest_005
     * @tc.number DatePickerDialogBGColorTest_005
     * @tc.desc   To test the DatePickerDialog BackgroundColor $r('app.color.blue')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogBGColorTest_005', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('colorBlueID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FF0000FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   DatePickerDialogBGColorTest_006
     * @tc.number DatePickerDialogBGColorTest_006
     * @tc.desc   To test the DatePickerDialog BackgroundColor null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogBGColorTest_006', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertContain('#');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   DatePickerDialogBGColorTest_007
     * @tc.number DatePickerDialogBGColorTest_007
     * @tc.desc   To test the DatePickerDialog BackgroundColor undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogBGColorTest_007', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertContain('#');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   DatePickerDialogBGColorTest_008
     * @tc.number DatePickerDialogBGColorTest_008
     * @tc.desc   To test the DatePickerDialog BackgroundColor 'XXX'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogBGColorTest_008', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('xxxID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertContain('#');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   DatePickerDialogBGColorTest_009
     * @tc.number DatePickerDialogBGColorTest_009
     * @tc.desc   To test the DatePickerDialog BackgroundColor -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogBGColorTest_009', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FFFFFF9C');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
  })
}