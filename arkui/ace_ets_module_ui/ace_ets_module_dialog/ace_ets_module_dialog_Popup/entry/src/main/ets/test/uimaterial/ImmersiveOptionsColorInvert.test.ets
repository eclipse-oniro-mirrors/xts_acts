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

export default function ImmersiveOptionsColorInvertTest() {
  describe('ImmersiveOptionsColorInvertTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/ImmersiveOptionsColorInvert',
      }
      router.clear();
      let pages = router.getState();
      console.info('get ImmersiveOptionsColorInvert state success ' + JSON.stringify(pages));
      if (!('ImmersiveOptionsColorInvert' == pages.name)) {
        let result = await router.pushUrl(options)
        await CommonFunc.sleep(2000);
        console.info('push ImmersiveOptionsColorInvert page success ' + JSON.stringify(result));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("ImmersiveOptionsColorInvertTest after each called");
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0100
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsColorInvertTest_0100
     * @tc.desc   To test ImmersiveOptions.colorInvert with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        colorInvert: undefined
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsColorInvertTest_0100 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('undefined'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('undefined');
      console.info('ImmersiveOptionsColorInvertTest_0100 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0100 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0200
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsColorInvertTest_0200
     * @tc.desc   To test ImmersiveOptions.colorInvert with true parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        colorInvert: true
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsColorInvertTest_0200 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('true'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('true');
      console.info('ImmersiveOptionsColorInvertTest_0200 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0200 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0300
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsColorInvertTest_0300
     * @tc.desc   To test ImmersiveOptions.colorInvert with false parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        colorInvert: false
      });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsColorInvertTest_0300 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('false'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('false');
      console.info('ImmersiveOptionsColorInvertTest_0300 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0300 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0400
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsColorInvertTest_0400
     * @tc.desc   To test ImmersiveMaterial without colorInvert parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THIN });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsColorInvertTest_0400 ImmersiveMaterial created');

      let component = await driver.findComponent(ON.id('default'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('default');
      console.info('ImmersiveOptionsColorInvertTest_0400 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0400 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0500
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsColorInvertTest_0500
     * @tc.desc   To test ImmersiveMaterial with empty options and no options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let material1 = new uiMaterial.ImmersiveMaterial();
      expect(material1 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsColorInvertTest_0500 ImmersiveMaterial created without options');

      let material2 = new uiMaterial.ImmersiveMaterial({});
      expect(material2 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveOptionsColorInvertTest_0500 ImmersiveMaterial created with empty options');

      let component = await driver.findComponent(ON.id('empty'));
      expect(component).not().assertUndefined();

      let strJson = getInspectorByKey('empty');
      console.info('ImmersiveOptionsColorInvertTest_0500 strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0500 END');
      done();
    });
  })
}