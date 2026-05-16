'use static';
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
import bundle from '@ohos.bundle.bundleManager';

export default function qrCodeJsunit() {
  describe('qrCodeTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/qrCode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get QrCode state success " + JSON.stringify(pages));
        if (!("qrCode" == pages.name)) {
          console.info("get QrCode pages success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push QrCode page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   test_qrCode_static_001
     * @tc.name     test_qrCode_static_001
     * @tc.desc     test_qrCode_static_001
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_001] START');
      let strJson = inspector.getInspectorByKey('QrCodeColorKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_qrCode_static_001] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info('[test_qrCode_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   test_qrCode_static_002
     * @tc.name     test_qrCode_static_002
     * @tc.desc     test_qrCode_static_002
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_002] START');
      let strJson = inspector.getInspectorByKey('QrCodeColorKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_qrCode_static_002] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FF0011FF");

      console.info('[test_qrCode_static_002] END');
      done();
    });

    
    
    /**
     * @tc.number   test_qrCode_static_003
     * @tc.name     test_qrCode_static_003
     * @tc.desc     test_qrCode_static_003
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_003] START');
      let strJson = inspector.getInspectorByKey('QrCodeColorKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_qrCode_static_003] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').tryGetElement('contentOpacity')).assertEqual(undefined); //not support
      console.info('[test_qrCode_static_003] END');
      done();
    });
    
    
    /**
     * @tc.number   test_qrCode_static_004
     * @tc.name     test_qrCode_static_004
     * @tc.desc     test_qrCode_static_004
     * @tc.level    Level.LEVEL0
     */
it('test_qrCode_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('test_qrCode_static_004 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('QrCodeColorKey1'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("test_qrCode_static_004 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('backgroundColor')).assertEqual("#FF008001"); //
      console.info('test_qrCode_static_004 END');
      done();
    });
  })
}
