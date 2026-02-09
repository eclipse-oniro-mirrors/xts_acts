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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  Component,
  Driver,
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
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { UtilsTest, startAbility, stopApplication } from '../../Util.test';

export default function SetClipToFrameJsunit() {
  describe('SetClipToFrameJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("SetClipToFrameJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RenderNode/renderNode001/SetClipToFrame",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SetClipToFrameJsunit state pages:" + JSON.stringify(pages));
        if (!("SetClipToFrame" == pages.name)) {
          console.info("get SetClipToFrameJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SetClipToFrameJsunit page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push SetClipToFrameJsunit page error:" + err);
      }
      console.info("SetClipToFrameJsunit beforeEach end");

    });

    // afterAll(async (): Promise<void> => {
    //   await UtilsTest.msSleep(1000)
    //   stopApplication("com.arkui.ace.imageText.api11.other.static")
    //   await UtilsTest.msSleep(1000)
    // })

    
    
/**
     * @tc.number   SetClipToFrameJsunit_static_001
     * @tc.name     SetClipToFrameJsunit_static_001
     * @tc.desc     SetClipToFrameJsunit_static_001
     * @tc.level    Level.LEVEL2
     */
it('SetClipToFrameJsunit_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SetClipToFrameJsunit_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setClipToFrame'));
      await (set?.click() as Promise<void>)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ClipToFrame_status');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SetClipToFrameJsunit_001] component obj is: " + JSON.stringify(obj));
      console.info("[SetClipToFrameJsunit_001] component content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("SetClipStatus:true");
      console.info('[SetClipToFrameJsunit_001] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
