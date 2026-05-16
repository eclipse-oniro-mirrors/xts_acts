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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium';
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
import inspector from '@ohos.arkui.inspector';
import {UtilsTest,startAbility} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RenderNodeDisposeTest() {
  describe('RenderNodeDisposeTest', () => {
    beforeAll(() => {
      console.info("RenderNodeDisposeTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info('RenderNodeDisposeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/RenderNodeDisposeTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        // let result = await router.replaceUrl(options);
        router.replaceUrl(options);
        console.info('get RenderNodeDisposeTest state pages:' + JSON.stringify(pages));
        if (!('RenderNodeDisposeTest' == pages.name)) {
          console.info('get RenderNodeDisposeTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          //console.info('push RenderNodeDisposeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push RenderNodeDisposeTest page error:' + err);
      }
      console.info('RenderNodeDisposeTest beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('RenderNodeDisposeTest after each called');
    });

    
    



    /**
     * @tc.number   renderNodeDisposeTest_static_0100
     * @tc.name     renderNodeDisposeTest_static_0100
     * @tc.desc     renderNodeDisposeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('renderNodeDisposeTest_static_0100', Level.LEVEL2, async (done: () => void) => {

      console.info('renderNodeDisposeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('dispose_id'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('result_id'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('dispose_result');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[frameNodeIsVisibleTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[frameNodeIsVisibleTest_0100] content obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Init');
      console.info('[renderNodeDisposeTest_0100] END');
      done();
    });

  })
}