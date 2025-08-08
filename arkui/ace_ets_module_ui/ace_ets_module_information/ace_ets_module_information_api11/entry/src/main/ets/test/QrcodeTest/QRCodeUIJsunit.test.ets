/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import bundle from '@ohos.bundle.bundleManager';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function QRCodeUIJsunit() {
  describe('QRCodeUIJsunit', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("QRCodeUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Qrcode/QRCodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get QRCodeUIJsunit state pages: " + JSON.stringify(pages));
        if (!("QRCodePage" == pages.name)) {
          console.info("get QRCodeUIJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push QRCodeUIJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push QRCodeUIJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('QRCodeUIJsunit_0100', 0, async (done: Function) => {
      // Get the information of the QRCode component
      console.info('[QRCodeUIJsunit_0100] START');
      let strJson = getInspectorByKey('qr');
      let strJsonDefault = getInspectorByKey('qrDefault');
      let obj: ESObject = JSON.parse(strJson);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[QRCodeUIJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[QRCodeUIJsunit_0100] component objDefault is: " + JSON.stringify(objDefault));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.value).assertEqual('normal');
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(obj.$attrs.color).assertEqual('#FF000000');
        expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(obj.$attrs.color).assertEqual(objDefault.$attrs.color);
        expect(obj.$attrs.backgroundColor).assertEqual(objDefault.$attrs.backgroundColor);
      }
      console.info('[QRCodeUIJsunit_0100] END');
      done();
    });

    it('QRCodeUIJsunit_0200', 0, async (done: Function) => {
      // Modify the color of the QRCode component
      console.info('[QRCodeUIJsunit_0200] START');
      globalThis.value.message.notify({name:'QRCodeColor',value:Color.Yellow})
      await CommonFunc.sleep(2000);
      // Get the color of the QRCode component
      let strJson = getInspectorByKey('qr1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[QRCodeUIJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.color).assertEqual('#FFFFFF00');
      console.info('[QRCodeUIJsunit_0200] END');
      done();
    });

    it('QRCodeUIJsunit_0300', 0, async (done: Function) => {
      // Modify the backgroundColor of the QRCode component
      console.info('[QRCodeUIJsunit_0300] START');
      globalThis.value.message.notify({name:'backgroundColor',value:Color.Green})
      await CommonFunc.sleep(1000);
      // Get the backgroundColor of the QRCode component
      let strJson = getInspectorByKey('qr2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[QRCodeUIJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF008000');
      console.info('[QRCodeUIJsunit_0300] END');
      done();
    });

    it('QRCodeUIJsunit_0400', 0, async (done: Function) => {
      // Modify the value of the QRCode component
      console.info('[QRCodeUIJsunit_0400] START');
      globalThis.value.message.notify({name:'QRCodeValue',value:'myTest'})
      await CommonFunc.sleep(2000);
      // Get the value of the QRCode component
      let strJson = getInspectorByKey('qr1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[QRCodeUIJsunit_0400] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.value).assertEqual('myTest');
      console.info('[QRCodeUIJsunit_0400] END');
      done();
    });

    it('QRCodeUIJsunit_0500', 0, async (done: Function) => {
      // Illegal modification of the QRCode component value
      console.info('[QRCodeUIJsunit_0500] START');
      globalThis.value.message.notify({name:'QRCodeColor',value:1})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'QRCodeValue',value:-10})
      await CommonFunc.sleep(1000);
      // Get the color and value of the QRCode component
      let strJson = getInspectorByKey('qr1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[QRCodeUIJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.color).assertEqual('#FF000001');
      expect(obj.$attrs.value).assertEqual('-10');

      // Get the backgroundColor of the QRCode component
      globalThis.value.message.notify({name:'backgroundColor',value:'test'})
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('qr2');
      let strJsonDefault = getInspectorByKey('qrDefault');
      let obj1: ESObject = JSON.parse(strJson1);
      let objDefault: ESObject = JSON.parse(strJsonDefault);
      console.info("[QRCodeUIJsunit_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[QRCodeUIJsunit_0500] component objDefault is: " + JSON.stringify(objDefault));
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(obj1.$attrs.backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(obj1.$attrs.backgroundColor).assertEqual(objDefault.$attrs.backgroundColor);
      }
      console.info('[QRCodeUIJsunit_0500] END');
      done();
    });

    it('QRCodeUIJsunit_0600', 0, async (done: Function) => {
      // Verify that component QRCode only supports click events
      console.info('[QRCodeUIJsunit_0600] START');
      let driver = await UiDriver.create()
      let qrComponent = await driver.findComponent(BY.key('qr'));
      await qrComponent.click();
      await CommonFunc.sleep(1000);
      let textComponent = await driver.findComponent(BY.key('text'));
      let text = await textComponent.getText();
      expect(text).assertEqual('click succ');
      console.info('[QRCodeUIJsunit_0600] END');
      done();
    });
  })
}
