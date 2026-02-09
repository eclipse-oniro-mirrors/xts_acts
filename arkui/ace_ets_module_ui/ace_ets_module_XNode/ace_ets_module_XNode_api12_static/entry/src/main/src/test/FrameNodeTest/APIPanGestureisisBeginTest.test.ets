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
export default function APIPanGestureisisBeginTest() {
  describe('APIPanGestureisisBeginTest', () => {
    beforeAll(() => {
      console.info("APIPanGestureisisBeginTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("APIPanGestureisisBeginTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/APIPanGestureisisBegin",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get APIPanGestureisisBeginTest state pages: " + JSON.stringify(pages));
        if (!("APIPanGestureisisBegin" == pages.name)) {
          console.info("get APIPanGestureisisBeginTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push APIPanGestureisisBeginTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIPanGestureisisBeginTest page error: " + err);
           expect().assertFail();
      }
      //done();
    });
    
    



    /**
     * @tc.number   APIPanGestureisisBeginTest_static_0100
     * @tc.name     APIPanGestureisisBeginTest_static_0100
     * @tc.desc     APIPanGestureisisBeginTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('APIPanGestureisisBeginTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIPanGestureisisBeginTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('APIPanGestureisisBegin_Text01');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIPanGestureisisBeginTest_0100] component obj is: ",obj, obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIPanGestureisisBeginTest_0100] END');
      done();
    });
    
    



    /**
     * @tc.number   APIPanGestureisisBeginTest_static_0200
     * @tc.name     APIPanGestureisisBeginTest_static_0200
     * @tc.desc     APIPanGestureisisBeginTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('APIPanGestureisisBeginTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIPanGestureisisBeginTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('APIPanGestureisisBegin_Text02');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIPanGestureisisBeginTest_0200] component obj is: ",obj, obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIPanGestureisisBeginTest_0200] END');
      done();
    });
  })
}