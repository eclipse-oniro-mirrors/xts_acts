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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'
import { uiMaterial } from '@kit.ArkUI';

export default function ImmersiveOptionsMaterialColorTest() {
  describe('ImmersiveOptionsMaterialColorTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/ImmersiveOptionsMaterialColor',
      }
      router.clear();
      let pages = router.getState();
      console.info('get ImmersiveOptionsMaterialColor state success ' + JSON.stringify(pages));
      if (!('ImmersiveOptionsMaterialColor' == pages.name)) {
        let result = await router.pushUrl(options)
        await CommonFunc.sleep(2000);
        console.info('push ImmersiveOptionsMaterialColor page success ' + JSON.stringify(result));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("ImmersiveOptionsMaterialColorTest after each called");
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0100
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0100
     * @tc.desc   To test ImmersiveOptions.materialColor with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        materialColor: undefined
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0100 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('undefined'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('undefined');
      console.info('ImmersiveOptionsMaterialColorTest_0100 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0100 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0200
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0200
     * @tc.desc   To test ImmersiveOptions.materialColor with Color.Transparent parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        materialColor: Color.Transparent
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0200 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('transparent'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('transparent');
      console.info('ImmersiveOptionsMaterialColorTest_0200 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0200 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0300
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0300
     * @tc.desc   To test ImmersiveOptions.materialColor with string '#80FF0000' parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        materialColor: '#80FF0000'
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0300 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('string_red'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('string_red');
      console.info('ImmersiveOptionsMaterialColorTest_0300 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0300 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0400
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0400
     * @tc.desc   To test ImmersiveOptions.materialColor with string 'rgba(0,255,0,0.5)' parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        materialColor: 'rgba(0,255,0,0.5)'
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0400 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('string_rgba'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('string_rgba');
      console.info('ImmersiveOptionsMaterialColorTest_0400 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0400 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0500
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0500
     * @tc.desc   To test ImmersiveOptions.materialColor with number 0x800000FF parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        materialColor: 0x800000FF
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0500 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('number_color'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('number_color');
      console.info('ImmersiveOptionsMaterialColorTest_0500 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0500 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0600
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0600
     * @tc.desc   To test ImmersiveOptions.materialColor with Color.Blue parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0600 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        materialColor: Color.Blue
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0600 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('color_enum'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('color_enum');
      console.info('ImmersiveOptionsMaterialColorTest_0600 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0600 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0700
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0700
     * @tc.desc   To test ImmersiveOptions.materialColor with string '#80FFFFFF' parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0700 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        materialColor: '#80FFFFFF'
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0700 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('color_white'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('color_white');
      console.info('ImmersiveOptionsMaterialColorTest_0700 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0700 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0800
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0800
     * @tc.desc   To test ImmersiveMaterial without materialColor parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0800 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material1 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THIN });
      expect(material1 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0800 ImmersiveMaterial created without materialColor');

      let material2 = new uiMaterial.ImmersiveMaterial();
      expect(material2 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0800 ImmersiveMaterial created without options');

      let material3 = new uiMaterial.ImmersiveMaterial({});
      expect(material3 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsMaterialColorTest_0800 ImmersiveMaterial created with empty options');

      let component = await driver.findComponent(ON.id('default_info'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('default_info');
      console.info('ImmersiveOptionsMaterialColorTest_0800 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0800 END');
      done();
    });
  })
}