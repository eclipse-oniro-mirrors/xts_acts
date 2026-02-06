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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest,startAbility} from '../Util.test';

export default function waterFlowFad() {
  describe('waterFlowFad', () => {

    beforeAll(() => {
      console.info("waterFlowFad beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.scroll.nowear.api13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("waterFlowFad beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/WaterFlow_attribute/waterFlowFad",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get MarqueeDynamicSyncSceneTest state pages:" + JSON.stringify(pages));
        if (!("waterFlowFad" == pages.name)) {
          console.info("get MarqueeDynamicSyncSceneTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push MarqueeDynamicSyncSceneTest page error:" + err);
      }
      console.info("MarqueeDynamicSyncSceneTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlowFad after each called");
    });

    
    
/**
     * @tc.number   waterFlowFad_static_0100
     * @tc.name     waterFlowFad_static_0100
     * @tc.desc     waterFlowFad_static_0100
     * @tc.level    Level.LEVEL1
     */
it('waterFlowFad_static_0100', Level.LEVEL1, async (done:()=>void):Promise<void> => {
      console.info('[waterFlowFad_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('flow_fadingEdge');
      console.info("[waterFlowFad_static_0100] component obj is: " + strJson);
      console.info("[waterFlowFad_static_0100] fadingEdge: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('fadingEdge')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('WaterFlow');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('fadingEdge')).assertEqual(true);
      console.info('[waterFlowFad_static_0100] END');
      done();
    });
  })
}
