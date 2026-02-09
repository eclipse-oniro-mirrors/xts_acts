'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../ets/MainAbility/common/Utils';
import bundle from '@ohos.bundle.bundleManager';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function qrCodeJsunit() {
  describe('qrCodeTest', () => {
    beforeAll(() => {
        console.info("qrCodeTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
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
          await Utils.sleep(2000);
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
      expect(Math.abs(obj.getElement('$attrs').getDouble('opacity') - 0.1) < 0.000001).assertTrue();
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
      
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#FF008000");
      console.info('[test_qrCode_static_003] END');
      done();
    });
  })
}
