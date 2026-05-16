'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import bundle from '@ohos.bundle.bundleManager';
import { Color,ResourceColor } from '@ohos.arkui.component'

import accessibility from '@ohos.accessibility';
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function QRCodeUIJsunit() {
  describe('QRCodeUIJsunit', () => {
    beforeAll(() => {
      console.info("QRCodeUIJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("QRCodeUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Qrcode/QRCodePage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get QRCodeUIJsunit state pages: " + JSON.stringify(pages));
        if (!("QRCodePage" == pages.name)) {
          console.info("get QRCodeUIJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push QRCodeUIJsunit page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number   QRCodeUIJsunit_static_0100
     * @tc.name     QRCodeUIJsunit_static_0100
     * @tc.desc     QRCodeUIJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('QRCodeUIJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the QRCode component
      console.info('[QRCodeUIJsunit_0100] START');
      let strJson = inspector.getInspectorByKey('qr');
      let strJsonDefault = inspector.getInspectorByKey('qrDefault');
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[QRCodeUIJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[QRCodeUIJsunit_0100] component objDefault is: " + JSON.stringify(objDefault));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('value')).assertEqual('normal');
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(obj.getElement('$attrs').getString('color')).assertEqual('#FF000000');
        expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFFFF');
      } else {
        expect(obj.getElement('$attrs').getString('color')).assertEqual(objDefault.getElement('$attrs').getString('color'));
        expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual(objDefault.getElement('$attrs').getString('backgroundColor'));
      }
      console.info('[QRCodeUIJsunit_0100] END');
      done();
    });

    /**
     * @tc.number   QRCodeUIJsunit_static_0200
     * @tc.name     QRCodeUIJsunit_static_0200
     * @tc.desc     QRCodeUIJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('QRCodeUIJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the color of the QRCode component
      console.info('[QRCodeUIJsunit_0200] START');
  AppStorage.setOrCreate<Color>('QRCodeColor',Color.Yellow)
      await CommonFunc.sleep(2000);
      // Get the color of the QRCode component
      let strJson = inspector.getInspectorByKey('qr1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[QRCodeUIJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFFFFF00');
      console.info('[QRCodeUIJsunit_0200] END');
      done();
    });

    /**
     * @tc.number   QRCodeUIJsunit_static_0300
     * @tc.name     QRCodeUIJsunit_static_0300
     * @tc.desc     QRCodeUIJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('QRCodeUIJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the backgroundColor of the QRCode component
      console.info('[QRCodeUIJsunit_0300] START');
  AppStorage.setOrCreate<Color>('backColor',Color.Green)
      await CommonFunc.sleep(1000);
      // Get the backgroundColor of the QRCode component
      let strJson = inspector.getInspectorByKey('qr2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[QRCodeUIJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF008000');
      console.info('[QRCodeUIJsunit_0300] END');
      done();
    });

    /**
     * @tc.number   QRCodeUIJsunit_static_0400
     * @tc.name     QRCodeUIJsunit_static_0400
     * @tc.desc     QRCodeUIJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('QRCodeUIJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify the value of the QRCode component
      console.info('[QRCodeUIJsunit_0400] START');
  AppStorage.setOrCreate<string>('QRvalue','myTest')
      await CommonFunc.sleep(2000);
      // Get the value of the QRCode component
      let strJson = inspector.getInspectorByKey('qr1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[QRCodeUIJsunit_0400] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('value')).assertEqual('myTest');
      console.info('[QRCodeUIJsunit_0400] END');
      done();
    });

    /**
     * @tc.number   QRCodeUIJsunit_static_0600
     * @tc.name     QRCodeUIJsunit_static_0600
     * @tc.desc     QRCodeUIJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('QRCodeUIJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
  await CommonFunc.sleep(2000);
      // Verify that component QRCode only supports click events
      console.info('[QRCodeUIJsunit_0600] START');
      let driver = Driver.create()
      let qrComponent = await driver.findComponent(ON.id('qr'));
      await CommonFunc.sleep(1000);
      await (qrComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

  let strJson = inspector.getInspectorByKey('text');
  await CommonFunc.sleep(1000);
  let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('click succ');
      console.info('[QRCodeUIJsunit_0600] END');
      done();
    });
    /**
        * @tc.number   QRCodeUIJsunit_static_0500
        * @tc.name     QRCodeUIJsunit_static_0500
        * @tc.desc     QRCodeUIJsunit_static_0500
        * @tc.level    Level.LEVEL0
        */
    it('QRCodeUIJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(2000);
      // Illegal modification of the QRCode component value
      console.info('[QRCodeUIJsunit_0500] START');
      AppStorage.setOrCreate<int>('QRCodeColor',1)

      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<string>('QRvalue','-10')

      await CommonFunc.sleep(1000);
      // Get the color and value of the QRCode component
      let strJson = inspector.getInspectorByKey('qr1');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[QRCodeUIJsunit_0500] component obj is: " + strJson);
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FF000001');
      expect(obj.getElement('$attrs').getString('value')).assertEqual('-10');

      // Get the backgroundColor of the QRCode component
      AppStorage.setOrCreate<string>('backColor','test')
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('qr2');
      let strJsonDefault = inspector.getInspectorByKey('qrDefault');
      let obj1 = JSON.parseJsonElement(strJson1);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[QRCodeUIJsunit_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[QRCodeUIJsunit_0500] component objDefault is: " + JSON.stringify(objDefault));
      let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
      if (targetVersion < 11) {
        expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFFFF');
      } else {
        expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual(objDefault.getElement('$attrs').getString('backgroundColor'));
      }
      console.info('[QRCodeUIJsunit_0500] END');
      done();
    });
  })
}
