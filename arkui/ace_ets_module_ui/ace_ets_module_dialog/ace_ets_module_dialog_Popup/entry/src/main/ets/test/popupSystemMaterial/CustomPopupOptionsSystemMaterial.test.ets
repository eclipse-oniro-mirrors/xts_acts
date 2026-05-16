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

export default function CustomPopupOptionsSystemMaterial() {
  describe('CustomPopupOptionsSystemMaterial', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomPopupOptionsSystemMaterial beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupSystemMaterial/CustomPopupOptionsSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomPopupOptionsSystemMaterial state pages: " + JSON.stringify(pages));
        if (!("CustomPopupOptionsSystemMaterial" == pages.name)) {
          console.info("get CustomPopupOptionsSystemMaterial state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomPopupOptionsSystemMaterial success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomPopupOptionsSystemMaterial page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CustomPopupOptionsSystemMaterial after each called");
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0100
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0100
     * @tc.desc   To test CustomPopupOptions systemMaterial property with undefined parameter
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0100', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsSystemMaterial_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemBarEffect).assertEqual('false');
      console.info('CustomPopupOptionsSystemMaterial_0100 Popup Undefined is visible');

      await CommonFunc.sleep(500);

      let closeButton = await driver.findComponent(ON.text('Close'));
 	    await closeButton.click();
      
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0200
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0200
     * @tc.desc   To test CustomPopupOptions systemMaterial property with hdsMaterial.Material THICK
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0200', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsSystemMaterial_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('hds_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemBarEffect).assertEqual('false');
      console.info('CustomPopupOptionsSystemMaterial_0200 Popup HDS THICK is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close'));
 	    await closeButton.click();
      
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0200 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0300
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0300
     * @tc.desc   To test CustomPopupOptions systemMaterial property with uiMaterial.Material SEMI_TRANSPARENT
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0300', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsSystemMaterial_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('semi_transparent'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.SEMI_TRANSPARENT');
      console.info('CustomPopupOptionsSystemMaterial_0300 Popup SEMI_TRANSPARENT is visible');

      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0300 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0400
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0400
     * @tc.desc   To test CustomPopupOptions systemMaterial property with uiMaterial.ImmersiveMaterial THICK
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0400', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsSystemMaterial_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');
      console.info('CustomPopupOptionsSystemMaterial_0400 Popup Immersive THICK is visible');

      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0400 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0500
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0500
     * @tc.desc   To test CustomPopupOptions systemMaterial property with uiMaterial.ImmersiveMaterial ULTRA_THIN
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0500', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsSystemMaterial_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');
      console.info('CustomPopupOptionsSystemMaterial_0500 Popup Immersive ULTRA_THIN is visible');

      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0500 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0600
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0600
     * @tc.desc   To test CustomPopupOptions systemMaterial property with uiMaterial.Material NONE
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0600', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsSystemMaterial_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('materialTypeNone'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');
      console.info('CustomPopupOptionsSystemMaterial_0600 Popup NONE is visible');
      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0600 END');
      done();
    });

  })
}