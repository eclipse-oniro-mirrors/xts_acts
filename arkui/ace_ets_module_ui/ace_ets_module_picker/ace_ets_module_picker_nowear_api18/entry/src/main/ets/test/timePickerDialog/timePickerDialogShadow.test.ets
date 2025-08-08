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

export default function TimePickerDialogShadowTest() {
  describe('TimePickerDialogShadowTest', () => {
    beforeAll(async () => {
      console.info("TimePickerDialogShadowTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/timePickerDialog/timePickerDialogShadow',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!("TimePickerDialogShadow" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TimePickerDialogShadow page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TimePickerDialogShadow after each called");
    });
    /* *
     * @tc.number: TimePickerDialogShadowTest_001
     * @tc.name  : TimePickerDialogShadowTest_001
     * @tc.desc  : To test the TimePickerDialog shadow color: Color.Red
     * @tc.level : Level 0
     */
    it('TimePickerDialogShadowTest_001',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadowOptionID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow.color;
      expect(shadow).assertEqual('#FFFF0000');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogShadowTest_002
     * @tc.name  : TimePickerDialogShadowTest_002
     * @tc.desc  : To test the TimePickerDialog shadow
     * @tc.level : Level 0
     */
    it('TimePickerDialogShadowTest_002',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_XS_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogShadowTest_003
     * @tc.name  : TimePickerDialogShadowTest_003
     * @tc.desc  : To test the TimePickerDialog shadow
     * @tc.level : Level 0
     */
    it('TimePickerDialogShadowTest_003',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_SM_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogShadowTest_004
     * @tc.name  : TimePickerDialogShadowTest_004
     * @tc.desc  : To test the TimePickerDialog shadow
     * @tc.level : Level 0
     */
    it('TimePickerDialogShadowTest_004',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_MD_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogShadowTest_005
     * @tc.name  : TimePickerDialogShadowTest_005
     * @tc.desc  : To test the TimePickerDialog shadow
     * @tc.level : Level 0
     */
    it('TimePickerDialogShadowTest_005',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_LG_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultLG');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogShadowTest_006
     * @tc.name  : TimePickerDialogShadowTest_006
     * @tc.desc  : To test the TimePickerDialog shadow
     * @tc.level : Level 0
     */
    it('TimePickerDialogShadowTest_006',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_FLOATING_SM_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
     * @tc.number: TimePickerDialogShadowTest_007
     * @tc.name  : TimePickerDialogShadowTest_007
     * @tc.desc  : To test the TimePickerDialog shadow
     * @tc.level : Level 0
     */
    it('TimePickerDialogShadowTest_007',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_FLOATING_MD_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
  })
}