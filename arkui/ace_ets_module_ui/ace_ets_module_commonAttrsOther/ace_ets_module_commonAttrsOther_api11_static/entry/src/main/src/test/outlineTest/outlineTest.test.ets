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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: String = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext();

export default function outlineTest() {
  describe('outlineTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("outlineTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("outlineTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/outline/outline',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get outlineTest state pages:" + JSON.stringify(pages));
        if (!("outline" == pages.name)) {
          console.info("get outlineTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push outlineTest page error:" + err);
      }
      console.info("outlineTest beforeEach end");
    });

    
    
/**
     * @tc.number   outlineTest_static_0100
     * @tc.name     outlineTest_static_0100
     * @tc.desc     outlineTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('outlineTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('outlineTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('outline_text');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[outlineTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[outlineTest_0100] component obj.getElement('$attrs') is: " +
      JSON.stringify(obj.getElement('$attrs')));
      let obj1: String =
        JSON.parseJsonElement(obj.getElement('$attrs').getString('outline')).getElement('style').getString('left');
      expect(obj1).assertEqual("OutlineStyle.SOLID");
      console.info('[outlineTest_0100] END');
      done();
    });
    
    
/**
     * @tc.number   outlineTest_static_0200
     * @tc.name     outlineTest_static_0200
     * @tc.desc     outlineTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('outlineTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('outlineTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('outline_text');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[outlineTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[outlineTest_0200] component obj.getElement('$attrs') is: " +
      JSON.stringify(obj.getElement('$attrs')));
      let obj1: String =
        JSON.parseJsonElement(obj.getElement('$attrs').getString('outline')).getElement('style').getString('right');
      expect(obj1).assertEqual("OutlineStyle.DASHED");
      console.info('[outlineTest_0200] END');
      done();
    });
    
    
/**
     * @tc.number   outlineTest_static_0300
     * @tc.name     outlineTest_static_0300
     * @tc.desc     outlineTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('outlineTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('outlineTest_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('outline_text');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[outlineTest_0300] component obj is: " + JSON.stringify(obj));
      console.info("[outlineTest_0300] component obj.getElement('$attrs') is: " +
      JSON.stringify(obj.getElement('$attrs')));
      let obj1: String =
        JSON.parseJsonElement(obj.getElement('$attrs').getString('outline')).getElement('style').getString('top');
      expect(obj1).assertEqual("OutlineStyle.DOTTED");
      console.info('[outlineTest_0300] END');
      done();
    });
  })
}

