/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON, BY } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function TipsOptionsSystemMaterial() {
  describe('TipsOptionsSystemMaterial', () => {
    beforeEach(async (done: Function) => {
      console.info("TipsOptionsSystemMaterial beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupSystemMaterial/TipsOptionsSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TipsOptionsSystemMaterial state pages: " + JSON.stringify(pages));
        if (!("TipsOptionsSystemMaterial" == pages.name)) {
          console.info("get TipsOptionsSystemMaterial state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TipsOptionsSystemMaterial success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TipsOptionsSystemMaterial page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TipsOptionsSystemMaterial after each called");
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0100
     * @tc.number SUB_ARKUI_API_TipsOptionsSystemMaterial_0100
     * @tc.desc   To test TipsOptions systemMaterial property with undefined parameter
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2
     */
    it('TipsOptionsSystemMaterial_0100', Level.LEVEL2, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('undefined'));

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let bounds = await button.getBounds();
      let centerX = Math.floor((bounds.left + bounds.right) / 2);
      let centerY = Math.floor((bounds.top + bounds.bottom) / 2);
      await driver.mouseMoveTo({ x: centerX, y: centerY });
      
      console.info('TipsOptionsSystemMaterial_0100 Button with undefined systemMaterial exists');
      
      let popupText = await driver.findComponent(ON.text('TipsOptions Undefined Test'));
      let popupObj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let popup: ESObject = popupObj.$children[1];
      let date = JSON.stringify(popupObj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');
      
      console.info('popupObj' + JSON.stringify(JSON.parse(date)));

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0200
     * @tc.number SUB_ARKUI_API_TipsOptionsSystemMaterial_0200
     * @tc.desc   To test TipsOptions systemMaterial property with hdsMaterial.Material THICK
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2
     */
    it('TipsOptionsSystemMaterial_0200', Level.LEVEL2, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('hds_thick'));
      
      let bounds = await button.getBounds();
      let centerX = Math.floor((bounds.left + bounds.right) / 2);
      let centerY = Math.floor((bounds.top + bounds.bottom) / 2);
      await driver.mouseMoveTo({ x: centerX, y: centerY });
      console.info('TipsOptionsSystemMaterial_0200 Button with hdsMaterial THICK systemMaterial exists');
      
      let popupText = await driver.findComponent(ON.text('TipsOptions HDS THICK Test'));
      let popupObj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let popup: ESObject = popupObj.$children[1];
      let date = JSON.stringify(popupObj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');
      
      console.info('popupObj' + JSON.stringify(JSON.parse(date)));
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x: 1, y: 1 });

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0200 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0300
     * @tc.number SUB_ARKUI_API_TipsOptionsSystemMaterial_0300
     * @tc.desc   To test TipsOptions systemMaterial property with uiMaterial.Material SEMI_TRANSPARENT
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2
     */
    it('TipsOptionsSystemMaterial_0300', Level.LEVEL2, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('semi_transparent'));
      
      let bounds = await button.getBounds();
      let centerX = Math.floor((bounds.left + bounds.right) / 2);
      let centerY = Math.floor((bounds.top + bounds.bottom) / 2);
      await driver.mouseMoveTo({ x: centerX, y: centerY });
      console.info('TipsOptionsSystemMaterial_0300 Button with SEMI_TRANSPARENT systemMaterial exists');
      let popupText = await driver.findComponent(ON.text('TipsOptions SEMI_TRANSPARENT Test'));
      let popupObj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let popup: ESObject = popupObj.$children[1];
      let date = JSON.stringify(popupObj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.SEMI_TRANSPARENT');
      
      console.info('popupObj' + JSON.stringify(JSON.parse(date)));

      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x: 1, y: 1 });

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0300 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0400
     * @tc.number SUB_ARKUI_API_TipsOptionsSystemMaterial_0400
     * @tc.desc   To test TipsOptions systemMaterial property with uiMaterial.ImmersiveMaterial THICK
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2
     */
    it('TipsOptionsSystemMaterial_0400', Level.LEVEL2, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('immersive_thick'));
      
      let bounds = await button.getBounds();
      let centerX = Math.floor((bounds.left + bounds.right) / 2);
      let centerY = Math.floor((bounds.top + bounds.bottom) / 2);
      await driver.mouseMoveTo({ x: centerX, y: centerY });
      console.info('TipsOptionsSystemMaterial_0400 Button with Immersive THICK systemMaterial exists');
      let popupText = await driver.findComponent(ON.text('TipsOptions Immersive THICK Test'));
      let popupObj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let popup: ESObject = popupObj.$children[1];
      let date = JSON.stringify(popupObj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');
      
      console.info('popupObj' + JSON.stringify(JSON.parse(date)));
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x: 1, y: 1 });

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0400 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0500
     * @tc.number SUB_ARKUI_API_TipsOptionsSystemMaterial_0500
     * @tc.desc   To test TipsOptions systemMaterial property with uiMaterial.ImmersiveMaterial ULTRA_THIN
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2
     */
    it('TipsOptionsSystemMaterial_0500', Level.LEVEL2, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
      
      let bounds = await button.getBounds();
      let centerX = Math.floor((bounds.left + bounds.right) / 2);
      let centerY = Math.floor((bounds.top + bounds.bottom) / 2);
      await driver.mouseMoveTo({ x: centerX, y: centerY });
      console.info('TipsOptionsSystemMaterial_0500 Button with Immersive ULTRA_THIN systemMaterial exists');
      let popupText = await driver.findComponent(ON.text('TipsOptions Immersive ULTRA_THIN Test'));
      let popupObj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let popup: ESObject = popupObj.$children[1];
      let date = JSON.stringify(popupObj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');
      
      console.info('popupObj' + JSON.stringify(JSON.parse(date)));
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x: 1, y: 1 });

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0500 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0600
     * @tc.number SUB_ARKUI_API_TipsOptionsSystemMaterial_0600
     * @tc.desc   To test TipsOptions systemMaterial property with uiMaterial.Material NONE
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2
     */
    it('TipsOptionsSystemMaterial_0600', Level.LEVEL2, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('none'));
      
      let bounds = await button.getBounds();
      let centerX = Math.floor((bounds.left + bounds.right) / 2);
      let centerY = Math.floor((bounds.top + bounds.bottom) / 2);
      await driver.mouseMoveTo({ x: centerX, y: centerY });
      console.info('TipsOptionsSystemMaterial_0600 Button with NONE systemMaterial exists');
      let popupText = await driver.findComponent(ON.text('TipsOptions NONE Test'));
      let popupObj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let popup: ESObject = popupObj.$children[1];
      let date = JSON.stringify(popupObj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');
      
      console.info('popupObj' + JSON.stringify(JSON.parse(date)));

      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x: 1, y: 1 });

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0600 END');
      done();
    });

  })
}