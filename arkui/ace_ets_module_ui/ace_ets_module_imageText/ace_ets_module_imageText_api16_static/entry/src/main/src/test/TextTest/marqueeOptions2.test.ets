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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function marqueeOptionsTest2() {
  describe('marqueeOptionsTest2', () => {
    beforeAll(() => {
      console.info("marqueeOptionsTest2 beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("marqueeOptionsTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/marqueeOptions2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get marqueeOptionsTest2 state pages:" + "");
        if (!("marqueeOptionsTest2" == pages.name)) {
          console.info("get marqueeOptionsTest2 pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push marqueeOptionsTest2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push marqueeOptionsTest2 page error:" + err);
      }
      console.info("marqueeOptionsTest2 beforeEach end");
    });

    
    

    /**
     * @tc.number   marqueeOptionsTest2_static_0100
     * @tc.name     marqueeOptionsTest2_static_0100
     * @tc.desc     marqueeOptionsTest2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('marqueeOptionsTest2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('marqueeOptionsTest2_static_0100 START');
      await CommonFunc.sleep(5000);

      let text1 = inspector.getInspectorByKey('marqueeOptionsTest2_text1');
      console.info("marqueeOptionsTest2_static_01001 " + JSON.stringifyJsonElement(JSON.parseJsonElement(text1).getElement('$attrs')))
      expect(JSON.parseJsonElement(text1).getElement('$attrs').getString('content')).assertEqual('MarqueeState.BOUNCE');

      let text2 = inspector.getInspectorByKey('marqueeOptionsTest2_text2');
      console.info("marqueeOptionsTest2_static_01002 " + JSON.stringifyJsonElement(JSON.parseJsonElement(text2).getElement('$attrs')))
      expect(JSON.parseJsonElement(text2).getElement('$attrs').getString('content')).assertEqual('MarqueeState.FINISH');
      await CommonFunc.sleep(1000);

      console.info('marqueeOptionsTest2_0100 END');
      done();
    });
  })
}