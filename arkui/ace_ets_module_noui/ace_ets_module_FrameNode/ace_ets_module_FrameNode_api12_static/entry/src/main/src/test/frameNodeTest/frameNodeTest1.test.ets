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
import inspector from '@ohos.arkui.inspector'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest,startAbility} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let flexGrow = 3;
let compareFlexGrow = 1;
const uiContext = new UIContext();
export default function frameNodeTest1() {
  describe('frameNodeTest1', () => {
    beforeAll(() => {
      console.info("frameNodeTest1 beforeEach start");
      await startAbility("com.arkui.ace.FrameNode.api12.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("frameNodeTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/frameNode",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeTest1 state pages: " + JSON.stringify(pages));
        if (!("frameNode" == pages.name)) {
          console.info("get frameNodeTest1 state pages.name: " + JSON.stringify(pages.name));
          
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push frameNodeTest1 page error: " + err);
        expect().assertFail();
      }
    });
    


    
/**
     * @tc.number   frameNodeTest1_static_0100
     * @tc.name     frameNodeTest1_static_0100
     * @tc.desc     frameNodeTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('frameNodeTest1_static_0100', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeTest1_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('frameNode_1');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeTest1_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('ChildrenCount:0');
      console.info('[frameNodeTest1_0100] END');
      done();
    });
  })
}