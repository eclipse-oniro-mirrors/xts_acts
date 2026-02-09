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
import CommonFunc from '../../MainAbility/common/Common';

export default function CalendarPickerDialogBGColorTest() {
  describe('CalendarPickerDialogBGColorTest', () => {
    beforeAll(async () => {
      console.info('CalendarPickerDialogBGColorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendarPickerDialogBGColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('calendarPickerDialogBGColor' == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CalendarPickerDialogBGColorTest page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CalendarPickerDialogBGColorTest after each called');
    });

    /**
     * @tc.name   CalendarPickerDialogBGColorTest_001
     * @tc.number CalendarPickerDialogBGColorTest_001
     * @tc.desc   To test the CalendarPickerDialog BackgroundColor Color.White
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CalendarPickerDialogBGColorTest_001',Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   CalendarPickerDialogBGColorTest_002
     * @tc.number CalendarPickerDialogBGColorTest_002
     * @tc.desc   To test the CalendarPickerDialog BackgroundColor 'rgb(255, 100, 255)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CalendarPickerDialogBGColorTest_002',Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   CalendarPickerDialogBGColorTest_003
     * @tc.number CalendarPickerDialogBGColorTest_003
     * @tc.desc   To test the CalendarPickerDialog BackgroundColor 0x008080
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CalendarPickerDialogBGColorTest_003',Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   CalendarPickerDialogBGColorTest_004
     * @tc.number CalendarPickerDialogBGColorTest_004
     * @tc.desc   To test the CalendarPickerDialog BackgroundColor '#00FFFF'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CalendarPickerDialogBGColorTest_004',Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   CalendarPickerDialogBGColorTest_005
     * @tc.number CalendarPickerDialogBGColorTest_005
     * @tc.desc   To test the CalendarPickerDialog BackgroundColor $r('app.color.blue')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CalendarPickerDialogBGColorTest_005',Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   CalendarPickerDialogBGColorTest_006
     * @tc.number CalendarPickerDialogBGColorTest_006
     * @tc.desc   To test the CalendarPickerDialog BackgroundColor null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CalendarPickerDialogBGColorTest_006',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00000000');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   CalendarPickerDialogBGColorTest_007
     * @tc.number CalendarPickerDialogBGColorTest_007
     * @tc.desc   To test the CalendarPickerDialog BackgroundColor undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CalendarPickerDialogBGColorTest_007',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00000000');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   CalendarPickerDialogBGColorTest_008
     * @tc.number CalendarPickerDialogBGColorTest_008
     * @tc.desc   To test the CalendarPickerDialog BackgroundColor 'XXX'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CalendarPickerDialogBGColorTest_008',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('xxxID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00000000');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   CalendarPickerDialogBGColorTest_009
     * @tc.number CalendarPickerDialogBGColorTest_009
     * @tc.desc   To test the CalendarPickerDialog BackgroundColor -5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CalendarPickerDialogBGColorTest_009',Level.LEVEL0, async (done: Function) => {
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
