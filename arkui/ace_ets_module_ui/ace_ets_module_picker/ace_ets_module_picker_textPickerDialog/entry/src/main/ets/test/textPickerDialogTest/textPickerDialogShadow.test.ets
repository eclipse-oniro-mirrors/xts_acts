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

export default function TextPickerDialogShadowTest() {
  describe('TextPickerDialogShadowTest', () => {

    beforeAll(async () => {
      console.info('TextPickerDialogShadowTest beforeEach start');
      let options: router.RouterOptions = {
        url:'MainAbility/pages/textPickerDialog/textPickerDialogShadow',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('textPickerDialogShadow' == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TextPickerDialogShadow page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TextPickerDialogShadow after each called');
    });
    /**
     * @tc.name   TextPickerDialogShadowTest_001
     * @tc.number TextPickerDialogShadowTest_001
     * @tc.desc   To test the TextPickerDialog shadow color: Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogShadowTest_001',Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   TextPickerDialogShadowTest_002
     * @tc.number TextPickerDialogShadowTest_002
     * @tc.desc   To test the TextPickerDialog shadow OuterDefaultXS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogShadowTest_002',Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   TextPickerDialogShadowTest_003
     * @tc.number TextPickerDialogShadowTest_003
     * @tc.desc   To test the TextPickerDialog shadow OuterDefaultSM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogShadowTest_003',Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   TextPickerDialogShadowTest_004
     * @tc.number TextPickerDialogShadowTest_004
     * @tc.desc   To test the TextPickerDialog shadow OuterDefaultMD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogShadowTest_004',Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   TextPickerDialogShadowTest_005
     * @tc.number TextPickerDialogShadowTest_005
     * @tc.desc   To test the TextPickerDialog shadow OuterDefaultLG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogShadowTest_005',Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   TextPickerDialogShadowTest_006
     * @tc.number TextPickerDialogShadowTest_006
     * @tc.desc   To test the TextPickerDialog shadow OuterFloatingSM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogShadowTest_006',Level.LEVEL0, async (done: Function) => {
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
    /**
     * @tc.name   TextPickerDialogShadowTest_007
     * @tc.number TextPickerDialogShadowTest_007
     * @tc.desc   To test the TextPickerDialog shadow OuterFloatingMD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogShadowTest_007',Level.LEVEL0, async (done: Function) => {
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