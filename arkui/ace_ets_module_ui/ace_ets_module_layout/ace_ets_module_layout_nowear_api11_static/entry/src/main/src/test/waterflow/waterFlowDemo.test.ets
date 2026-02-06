'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function waterFlowDemoJsunit() {
  describe('waterFlowDemoJsunit', () => {
    beforeAll(() => {
      console.info("waterFlowDemoJsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.nowear.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlow beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterflow/WaterflowDemo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get waterflowDemo state pages:" + "");
        if (!("waterflowDemo" == pages.name)) {
          console.info("get waterflowDemo pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterflowDemo page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterflowDemo after each called");
    });


    /**
     * @tc.number   waterflowTest_static_0001
     * @tc.name     waterflowTest_static_0001
     * @tc.desc     waterflowTest_static_0001
     * @tc.level    Level.LEVEL0
     */
    it('waterflowTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('waterflowDemo testalphabetIndexerWidth0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('waterFlow');
      console.info("[waterflowTest_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('WaterFlow');
      done();
    });

  })
}
