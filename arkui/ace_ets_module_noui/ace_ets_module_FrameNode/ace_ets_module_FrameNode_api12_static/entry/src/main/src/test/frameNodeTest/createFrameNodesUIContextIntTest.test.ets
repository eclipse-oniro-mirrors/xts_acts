'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

const uiContext = new UIContext();

export default function createFrameNodesUIContextIntTest() {
  describe('createFrameNodesUIContextIntTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("createFrameNodesUIContextIntTest beforeEach start");
      await startAbility("com.arkui.ace.FrameNode.api12.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("createFrameNodesUIContextInt beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/createFrameNodesUIContextInt",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get createFrameNodesUIContextInt state pages: " + JSON.stringify(pages));
        if (!("createFrameNodesUIContextInt" == pages.name)) {
          console.info("get createFrameNodesUIContextInt state pages.name: " + JSON.stringify(pages.name));
          
          router.pushUrl(options)
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push createFrameNodesUIContextInt page error: " + err);
        expect().assertFail();
      }
    });
    

    /**
     * @tc.name   createFrameNodesUIContextIntTestStatic_0100
     * @tc.number SUB_ArkUI_Ace_createFrameNodesUIContextIntTestStatic_0100
     * @tc.desc   add createFrameNodes static api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('createFrameNodesUIContextIntTestStatic_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('createFrameNodesUIContextIntTestStatic_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
        
      let button1 = await driver.findComponent(ON.id('addFrameNodeByIdStatic'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('createFrameNodesTextStatic');
      console.info("[createFrameNodesUIContextIntTestStatic_0100] textContent : " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'));

      let button2 = await driver.findComponent(ON.id('getFrameNodeByUniqueIdStatic'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('createFrameNodesTextStatic');
      console.info("[createFrameNodesUIContextIntTestStatic_0100] textContent : " + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'));

      let button3 = await driver.findComponent(ON.id('createFrameNodesStatic'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson3 = inspector.getInspectorByKey('createFrameNodesTextStatic');
      console.info("[createFrameNodesUIContextIntTestStatic_0100] textContent : " + JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'));

      let button4 = await driver.findComponent(ON.id('createFrameNodes2Static'));
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson4 = inspector.getInspectorByKey('createFrameNodesTextStatic');
      console.info("[createFrameNodesUIContextIntTestStatic_0100] textContent : " + JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'));

      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('100');
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')).assertEqual('ms');

      console.info('[createFrameNodesUIContextIntTestStatic_0100] END');

      done();
    });
    
  })
}