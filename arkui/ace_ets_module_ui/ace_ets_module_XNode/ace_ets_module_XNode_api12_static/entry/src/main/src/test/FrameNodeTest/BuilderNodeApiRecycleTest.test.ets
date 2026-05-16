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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function BuilderNodeApiRecycleTest() {
  describe('BuilderNodeApiRecycleTest', () => {
    beforeAll(() => {
      console.info("BuilderNodeApiRecycleTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("BuilderNodeApiRecycleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/BuilderNodeApiRecycle",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get BuilderNodeApiRecycleTest state pages: " + JSON.stringify(pages));
        if (!("BuilderNodeApiRecycle" == pages.name)) {
          console.info("get BuilderNodeApiRecycleTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push BuilderNodeApiRecycleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BuilderNodeApiRecycleTest page error: " + err);
           expect().assertFail();
      }
      //done();
    });
    
    



    /**
     * @tc.number   BuilderNodeApiRecycleTest_static_0100
     * @tc.name     BuilderNodeApiRecycleTest_static_0100
     * @tc.desc     BuilderNodeApiRecycleTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('BuilderNodeApiRecycleTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('BuilderNodeApiRecycleTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('BuilderNodeApiRecycle_item1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[BuilderNodeApiRecycleTest_0100] component obj is: ",obj, obj.getElement('$attrs').getString('fontSize'));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('50.00fp');
      console.info('[BuilderNodeApiRecycleTest_0100] END');
      done();
    });    
  })
}