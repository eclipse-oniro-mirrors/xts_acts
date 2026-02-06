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
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
// import config from '@ohos.accessibility.config'
import accessibility from '@ohos.accessibility';
import {UtilsTest} from '../Util.test'
//const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api12/EntryAbility';

export default function onKeyPreImeTest() {
  describe('onKeyPreImeTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12None.static", "EntryAbility")

    });
    beforeEach(async ():Promise<void> => {
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      // console.info('enable success');
      // }).catch((err: object) => {
      //   console.error('failed to enable, ${err}');
      // })
      console.info("onKeyPreImeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/onKeyEvent/OnKeyPreIme",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onKeyPreImeTest state pages: " + JSON.stringify(pages));
        if (!("OnKeyPreIme" == pages.name)) {
          console.info("get onKeyPreImeTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push onKeyPreImeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onKeyPreImeTest page error: " + err);
        expect().assertFail();
      }
      //done();
    });

    
    

/**
     * @tc.number   onKeyPreImeTest_static_0010
     * @tc.name     onKeyPreImeTest_static_0010
     * @tc.desc     onKeyPreImeTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('onKeyPreImeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('onKeyPreImeTest_static_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('onKeyPreIme_id'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onKeyPreIme_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[onKeyPreImeTest_static_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('height')).assertEqual('40.00vp');
      console.info('[onKeyPreImeTest_static_0010] END');
      done();
    });

    
    

/**
     * @tc.number   onKeyPreImeTest_static_0020
     * @tc.name     onKeyPreImeTest_static_0020
     * @tc.desc     onKeyPreImeTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('onKeyPreImeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('onKeyPreImeTest_static_0020 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('onKeyPreIme_id'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('state_button');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[onKeyPreImeTest_static_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('true');
      console.info('[onKeyPreImeTest_static_0020] END');
      done();
    });
  })
}

