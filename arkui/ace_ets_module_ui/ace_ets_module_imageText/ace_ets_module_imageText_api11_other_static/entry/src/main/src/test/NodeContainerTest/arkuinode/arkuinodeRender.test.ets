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
import { UtilsTest, startAbility } from '../../Util.test';

export default function arkuiNodeRenderTest() {
  describe('arkuiNodeRenderTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("arkuiNodeRenderTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get arkuiNodeRenderTest state pages:" + JSON.stringify(pages));
        if (!("arkuirendernode" == pages.name)) {
          console.info("get arkuiNodeRenderTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl({url:"MainAbility/pages/NodeContainer/arkuinode/arkuirendernode"});
          await CommonFunc.sleep(2000);
          // console.info("push arkuiNodeRenderTest page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push arkuiNodeRenderTest page error:" + err);
      }
      console.info("arkuiNodeRenderTest beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("arkuiNodeRenderTest after each called");
    });

    
    
/**
     * @tc.number   arkuiNodeRenderTest_static_0100
     * @tc.name     arkuiNodeRenderTest_static_0100
     * @tc.desc     arkuiNodeRenderTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('arkuiNodeRenderTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[arkuiNodeRenderTest_0100] START');
      await CommonFunc.sleep(2000);
      let json = inspector.getInspectorByKey('nodetext');
      let Obj1 = JSON.parseJsonElement(json);
      console.info("arkuiNodeRenderTest_0100 json info " + JSON.stringify(json));
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('hello');
      done();
    });
  })
}
