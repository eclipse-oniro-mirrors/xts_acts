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

export default function TextPickerDialogBGBlurStyleTest() {
  describe('TextPickerDialogBGBlurStyleTest', () => {

    beforeAll(async () => {
      console.info("TextPickerDialogBGBlurStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/textPickerDialog/textPickerDialogBGBlurStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!("textPickerDialogBGBlurStyle" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPickerDialogBGBlurStyle page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textPickerDialogBGBlurStyle after each called");
    });
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_001
     * @tc.name      TextPickerDialogBGBlurStyleTest_001
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.Thin
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_001',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThinID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_002
     * @tc.name      TextPickerDialogBGBlurStyleTest_002
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.Regular
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_002',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('RegularID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_003
     * @tc.name      TextPickerDialogBGBlurStyleTest_003
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.Thick
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_003',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThickID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_004
     * @tc.name      TextPickerDialogBGBlurStyleTest_004
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_THIN
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_004',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_005
     * @tc.name      TextPickerDialogBGBlurStyleTest_005
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_REGULAR
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_005',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_REGULAR_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_006
     * @tc.name      TextPickerDialogBGBlurStyleTest_006
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_THICK
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_006',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_007
     * @tc.name      TextPickerDialogBGBlurStyleTest_007
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_ULTRA_THICK
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_007',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_ULTRA_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_008
     * @tc.name      TextPickerDialogBGBlurStyleTest_008
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.NONE
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_008',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('NONE_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_009
     * @tc.name      TextPickerDialogBGBlurStyleTest_009
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_ULTRA_THIN
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_009',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_0010
     * @tc.name      TextPickerDialogBGBlurStyleTest_0010
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_THIN
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_0010',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_0011
     * @tc.name      TextPickerDialogBGBlurStyleTest_0011
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_REGULAR
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_0011',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_REGULAR_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_0012
     * @tc.name      TextPickerDialogBGBlurStyleTest_0012
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_THICK
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_0012',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_0013
     * @tc.name      TextPickerDialogBGBlurStyleTest_0013
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_ULTRA_THICK
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_0013',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_0014
     * @tc.name      TextPickerDialogBGBlurStyleTest_0014
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle null
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_0014',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_0015
     * @tc.name      TextPickerDialogBGBlurStyleTest_0015
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle undefined
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_0015',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_0016
     * @tc.name      TextPickerDialogBGBlurStyleTest_0016
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle 100
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_0016',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('100ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.number    TextPickerDialogBGBlurStyleTest_0017
     * @tc.name      TextPickerDialogBGBlurStyleTest_0017
     * @tc.desc      To test the TextPickerDialog backgroundBlurStyle -100
     * @tc.level:    Level 0
     */
    it('TextPickerDialogBGBlurStyleTest_0017',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
  })
}
