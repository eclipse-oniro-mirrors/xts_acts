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

export default function ImmersiveStyleTest() {
  describe('ImmersiveStyleTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/ImmersiveStyleTest',
      }
      router.clear();
      let pages = router.getState();
      console.info('get ImmersiveStyleTest state success ' + JSON.stringify(pages));
      if (!('ImmersiveStyleTest' == pages.name)) {
        let result = await router.pushUrl(options)
        await CommonFunc.sleep(2000);
        console.info('push ImmersiveStyleTest page success ' + JSON.stringify(result));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("ImmersiveStyleTest after each called");
    });

    /**
     * @tc.name   ImmersiveStyleTest_0100
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0100
     * @tc.desc   To test uiMaterial.ImmersiveStyle.ULTRA_THIN enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveStyleTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveStyleTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
      console.info('ImmersiveStyleTest_0100 ULTRA_THIN = ' + uiMaterial.ImmersiveStyle.ULTRA_THIN);

      let component = await driver.findComponent(ON.id('ultra_thin'));
      expect(component).not().assertUndefined();
      console.info('ImmersiveStyleTest_0100 component found');

      let strJson = getInspectorByKey('ultra_thin');
      console.info('ImmersiveStyleTest_0100 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveStyleTest_0100 END');
      done();
    });

    /**
     * @tc.name   ImmersiveStyleTest_0200
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0200
     * @tc.desc   To test uiMaterial.ImmersiveStyle.THIN enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveStyleTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveStyleTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
      console.info('ImmersiveStyleTest_0200 THIN = ' + uiMaterial.ImmersiveStyle.THIN);

      let component = await driver.findComponent(ON.id('thin'));
      expect(component).not().assertUndefined();
      console.info('ImmersiveStyleTest_0200 component found');

      let strJson = getInspectorByKey('thin');
      console.info('ImmersiveStyleTest_0200 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveStyleTest_0200 END');
      done();
    });

    /**
     * @tc.name   ImmersiveStyleTest_0300
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0300
     * @tc.desc   To test uiMaterial.ImmersiveStyle.REGULAR enum value equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveStyleTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveStyleTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
      console.info('ImmersiveStyleTest_0300 REGULAR = ' + uiMaterial.ImmersiveStyle.REGULAR);

      let component = await driver.findComponent(ON.id('regular'));
      expect(component).not().assertUndefined();
      console.info('ImmersiveStyleTest_0300 component found');

      let strJson = getInspectorByKey('regular');
      console.info('ImmersiveStyleTest_0300 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveStyleTest_0300 END');
      done();
    });

    /**
     * @tc.name   ImmersiveStyleTest_0400
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0400
     * @tc.desc   To test uiMaterial.ImmersiveStyle.THICK enum value equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveStyleTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveStyleTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
      console.info('ImmersiveStyleTest_0400 THICK = ' + uiMaterial.ImmersiveStyle.THICK);

      let component = await driver.findComponent(ON.id('thick'));
      expect(component).not().assertUndefined();
      console.info('ImmersiveStyleTest_0400 component found');

      let strJson = getInspectorByKey('thick');
      console.info('ImmersiveStyleTest_0400 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveStyleTest_0400 END');
      done();
    });

    /**
     * @tc.name   ImmersiveStyleTest_0500
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0500
     * @tc.desc   To test uiMaterial.ImmersiveStyle.ULTRA_THICK enum value equals 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveStyleTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveStyleTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      console.info('ImmersiveStyleTest_0500 ULTRA_THICK = ' + uiMaterial.ImmersiveStyle.ULTRA_THICK);

      let component = await driver.findComponent(ON.id('ultra_thick'));
      expect(component).not().assertUndefined();
      console.info('ImmersiveStyleTest_0500 component found');

      let strJson = getInspectorByKey('ultra_thick');
      console.info('ImmersiveStyleTest_0500 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveStyleTest_0500 END');
      done();
    });

    /**
     * @tc.name   ImmersiveStyleTest_0600
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0600
     * @tc.desc   To test ImmersiveMaterial constructor with different styles returns instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveStyleTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveStyleTest_0600 START');

      let material1 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN });
      expect(material1 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with ULTRA_THIN created');

      let material2 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THIN });
      expect(material2 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with THIN created');

      let material3 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.REGULAR });
      expect(material3 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with REGULAR created');

      let material4 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK });
      expect(material4 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with THICK created');

      let material5 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THICK });
      expect(material5 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with ULTRA_THICK created');

      console.info('ImmersiveStyleTest_0600 END');
      done();
    });

    /**
     * @tc.name   ImmersiveStyleTest_0700
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0700
     * @tc.desc   To test ImmersiveMaterial constructor without style parameter returns instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveStyleTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveStyleTest_0700 START');

      let material = new uiMaterial.ImmersiveMaterial();
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0700 ImmersiveMaterial without style created');

      let materialWithOptions = new uiMaterial.ImmersiveMaterial({});
      expect(materialWithOptions instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0700 ImmersiveMaterial with empty options created');

      console.info('ImmersiveStyleTest_0700 END');
      done();
    });
  })
}