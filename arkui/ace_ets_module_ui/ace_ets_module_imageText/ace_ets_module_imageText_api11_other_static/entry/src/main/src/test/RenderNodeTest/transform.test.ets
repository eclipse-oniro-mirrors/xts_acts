'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;



export default function transformTest() {
  describe('transformTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("transformTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/transform',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get transformTest state pages:" + JSON.stringify(pages));
        if (!("transform" == pages.name)) {
          console.info("get transformTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push transformTest page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push transformTest page error: " + err);
        expect().assertFail();
      }

    });

    
    
/**
     * @tc.number   transformTest_static_0100
     * @tc.name     transformTest_static_0100
     * @tc.desc     transformTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('transformTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('transformTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('transform');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[transformTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[transformTest_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('transform is 1,0,45,0,0,1,0,0,0,0,1,0,0,0,0,1');
      console.info('[transformTest_0100] END');
      done();
    });
  })
}

