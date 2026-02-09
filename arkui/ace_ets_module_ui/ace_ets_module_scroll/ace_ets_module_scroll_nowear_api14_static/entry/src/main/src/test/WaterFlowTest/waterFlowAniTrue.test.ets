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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility } from '../Util.test.ets';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function waterFlowAniTrue() {
  describe('waterFlowAniTrue', () => {
    beforeAll(() => {
      console.info("waterFlowAniTrue beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("waterFlowAniTrue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowAniTrue",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get waterFlowAniTrue state pages:" + JSON.stringify(pages));
        if (!("waterFlowAniTrue" == pages.name)) {
          console.info("get waterFlowAniTrue pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterFlowAniTrue page error:" + err);
      }
      console.info("waterFlowAniTrue beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("waterFlowAniTrue after each called");
    });

    
    
/**
     * @tc.number   waterFlowAniTrue_static_0100
     * @tc.name     waterFlowAniTrue_static_0100
     * @tc.desc     waterFlowAniTrue_static_0100
     * @tc.level    Level.LEVEL1
     */
it('waterFlowAniTrue_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlowAniTrue_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component | null = await driver.findComponent(ON.id('waterFlow_animation_true'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('waterFlow_true_onText');
      console.info("[waterFlowAniTrue_static_0100] component obj is: " + strJson);
      console.info("[waterFlowAniTrue_static_0100] content: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('WaterFlow: onReachStart-onScrollStart-onDidScroll-onScrollStop');
      console.info('[waterFlowAniTrue_static_0100] END');
      done();
    });
  })
}
