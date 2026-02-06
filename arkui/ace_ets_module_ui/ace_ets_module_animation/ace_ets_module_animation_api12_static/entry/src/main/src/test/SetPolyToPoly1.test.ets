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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium'
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { startAbility, UtilsTest } from './Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function setPolyToPoly() {
  describe('setPolyToPoly', () => {
    beforeAll(() => {
      console.info("setPolyToPoly beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.animation12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("setPolyToPoly beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SetPolyToPoly',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setPolyToPoly state pages:" + JSON.stringify(pages));
        if (!("SetPolyToPoly" == pages.name)) {
          console.info("get setPolyToPoly pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push setPolyToPoly page error:" + err);
      }
      console.info("setPolyToPoly beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setPolyToPoly after each called");
    });
    
    
/**
     * @tc.number   setPolyToPoly_static_0100
     * @tc.name     setPolyToPoly_static_0100
     * @tc.desc     setPolyToPoly_static_0100
     * @tc.level    Level.LEVEL0
     */
it('setPolyToPoly_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('setPolyToPoly_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('ImageSetPoly'));
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSetPoly');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('150.00vp');
      await CommonFunc.sleep(1000);
      console.info('[setPolyToPoly_static_0100] END');
      done();
    });
  })
}