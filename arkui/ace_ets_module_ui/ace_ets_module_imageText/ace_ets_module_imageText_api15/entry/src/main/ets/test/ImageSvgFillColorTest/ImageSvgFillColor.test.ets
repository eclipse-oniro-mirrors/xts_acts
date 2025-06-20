/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageSvgFillColorTest() {
  describe('ImageSvgFillColorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageSvgFillColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSvgFillColor/ImageSvgFillColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageSvgFillColorTest state success " + JSON.stringify(pages));
        if (!("ImageSvgFillColor" == pages.name)) {
          console.info("get ImageSvgFillColorTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ImageSvgFillColorTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageSvgFillColorTest page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("ImageSvgFillColorTest beforeEach start");
      done();
    })
    /**
     * @tc.number    ImageSVGFillColorTest_001
     * @tc.name      ImageSVGFillColorTest_001
     * @tc.desc      set Image FillColor: #FFFF0000 #FF008000 #FF000000
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ImageSVGFillColorTest_001', 0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton1';
      let imageKey = 'svgFillColorImageKey1';
      let changeButton = await driver.findComponent(ON.id(buttonID));
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_001 fillColor1 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FFFF0000');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_001 fillColor2 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF008000');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_001 fillColor3 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
      }
      done();
    });

    /**
     * @tc.number    ImageSVGFillColorTest_002
     * @tc.name      ImageSVGFillColorTest_002
     * @tc.desc      set Image FillColor: #FFFFFFFF #FFFF0000 #FF000000
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ImageSVGFillColorTest_002', 0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton2';
      let imageKey = 'svgFillColorImageKey2';
      let changeButton = await driver.findComponent(ON.id(buttonID));
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_002 fillColor1 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FFFFFFFF');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_002 fillColor2 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FFFF0000');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_002 fillColor3 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
      }
      done();
    });
    /**
     * @tc.number    ImageSVGFillColorTest_003
     * @tc.name      ImageSVGFillColorTest_003
     * @tc.desc      set Image FillColor: #FFFFFFFF #FF000000 #80FF64FF #FF000000
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ImageSVGFillColorTest_003', 0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton3';
      let imageKey = 'svgFillColorImageKey3';
      let changeButton = await driver.findComponent(ON.id(buttonID));
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_003 fillColor1 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FFFFFFFF');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_003 fillColor2 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_003 fillColor3 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#80FF64FF');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_003 fillColor4 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
      }
      done();
    });

    /**
     * @tc.number    ImageSVGFillColorTest_004
     * @tc.name      ImageSVGFillColorTest_004
     * @tc.desc      set Image FillColor: #FFFFFFFF #FF000000 #80FF64FF #FF000000
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ImageSVGFillColorTest_004', 0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton4';
      let imageKey = 'svgFillColorImageKey4';
      let changeButton = await driver.findComponent(ON.id(buttonID));
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_004 fillColor1 is: ' + obj.$attrs.fillColor);
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_004 fillColor2 is: ' + obj.$attrs.fillColor);
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_004 fillColor3 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
      }
      done();
    });

    /**
     * @tc.number    ImageSVGFillColorTest_005
     * @tc.name      ImageSVGFillColorTest_005
     * @tc.desc      set Image FillColor: #FFFFFFFF #FF000000 #80FF64FF #FF000000
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ImageSVGFillColorTest_005', 0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton5';
      let imageKey = 'svgFillColorImageKey5';
      let changeButton = await driver.findComponent(ON.id(buttonID));
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_005 fillColor1 is: ' + obj.$attrs.fillColor);
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_005 fillColor2 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
      }
      done();
    });

    /**
     * @tc.number    ImageSVGFillColorTest_006
     * @tc.name      ImageSVGFillColorTest_006
     * @tc.desc      set Image FillColor: #FFFFFFFF #FF000000
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ImageSVGFillColorTest_006', 0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton6';
      let imageKey = 'svgFillColorImageKey6';
      let changeButton = await driver.findComponent(ON.id(buttonID));
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_006 fillColor1 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FFFFFFFF');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_006 fillColor2 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
      }
      done();
    });

    /**
     * @tc.number    ImageSVGFillColorTest_007
     * @tc.name      ImageSVGFillColorTest_007
     * @tc.desc      set Image FillColor: #FFFFFFFF #FF000000
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ImageSVGFillColorTest_007', 0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton7';
      let imageKey = 'svgFillColorImageKey7';
      let changeButton = await driver.findComponent(ON.id(buttonID));
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_007 fillColor1 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FFFFFFFF');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_007 fillColor2 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
      }
      done();
    });

    /**
     * @tc.number    ImageSVGFillColorTest_008
     * @tc.name      ImageSVGFillColorTest_008
     * @tc.desc      set Image FillColor: #FFFFFFFF #FF000000
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ImageSVGFillColorTest_008', 0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton8';
      let imageKey = 'svgFillColorImageKey8';
      let changeButton = await driver.findComponent(ON.id(buttonID));
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_008 fillColor1 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FFFFFFFF');
        await changeButton?.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = getInspectorByKey(imageKey);
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTest_008 fillColor2 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
      }
      done();
    });

    /**
     * @tc.number    ImageSVGFillColorTestModifier_001
     * @tc.name      ImageSVGFillColorTestModifier_001
     * @tc.desc      set Image FillColor: #FFFF0000 #FF000000
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ImageSVGFillColorTestModifier_001', 0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('modifierImage');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSVGFillColorTestModifier fillColor1 is: ' + obj.$attrs.fillColor);
      expect(obj.$attrs.fillColor).assertEqual('#FFFF0000');
      {
        let changeButton = await driver.findComponent(ON.id('modifierButton'));
        await changeButton?.click();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('modifierImage');
        let obj: ESObject = JSON.parse(strJson);
        console.info('ImageSVGFillColorTestModifier fillColor2 is: ' + obj.$attrs.fillColor);
        expect(obj.$attrs.fillColor).assertEqual('#FF000000');
      }
      done();
    });
  })
}
