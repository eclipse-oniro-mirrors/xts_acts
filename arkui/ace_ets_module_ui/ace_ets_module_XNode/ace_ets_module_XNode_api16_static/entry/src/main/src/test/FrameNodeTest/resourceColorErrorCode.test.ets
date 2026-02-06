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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium"
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
export default function resourceColorErrorCodeTest() {
  describe('resourceColorErrorCodeTest', () => {
    beforeAll(() => {
      console.info("resourceColorErrorCodeTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("resourceColorErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/resourceColorErrorCodeTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get resourceColorErrorCodeTest state pages:" + JSON.stringify(pages));
        if (!("resourceColorErrorCodeTest" == pages.name)) {
          console.info("get resourceColorErrorCodeTest pages.name:" + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push resourceColorErrorCodeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push resourceColorErrorCodeTest page error:" + err);
      }
      console.info("resourceColorErrorCodeTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("resourceColorErrorCodeTest after each called");
    });

    
    



    /**
     * @tc.number   resourceColorErrorCodeTest_static_0100
     * @tc.name     resourceColorErrorCodeTest_static_0100
     * @tc.desc     resourceColorErrorCodeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('resourceColorErrorCodeTest_static_0100', Level.LEVEL0, async (done: () => void) => {

      console.info('resourceColorErrorCodeTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('error_bnt401_id'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('error_bnt180003_id'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1: string = inspector.getInspectorByKey('error_str401_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2: string = inspector.getInspectorByKey('error_str180003_id');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[resourceColorErrorCodeTest_0100] component obj is: " + JSON.stringify(obj1));
      console.info("[resourceColorErrorCodeTest_0100] content obj is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[resourceColorErrorCodeTest_0100] component obj is: " + JSON.stringify(obj2));
      console.info("[resourceColorErrorCodeTest_0100] content obj is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('401');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('180003');
      console.info('[resourceColorErrorCodeTest_0100] END');
      done();
    });

  })
}