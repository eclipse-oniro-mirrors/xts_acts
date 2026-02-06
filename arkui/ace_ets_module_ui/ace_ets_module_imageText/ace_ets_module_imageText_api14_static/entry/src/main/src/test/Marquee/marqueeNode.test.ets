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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function MarqueeNodeTest() {
  describe('MarqueeNodeTest', (): void => {
    beforeAll(() => {
      console.info("MarqueeNodeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api14.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("MarqueeNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Marquee/marqueeNode",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get MarqueeNodeTest state pages:" + "");
        if (!("marqueeNode" == pages.name)) {
          console.info("get MarqueeNodeTest pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push MarqueeNodeTest page error:" + err);
      }
      console.info("MarqueeNodeTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("marqueeNode after each called");
    })

    
    

    /**
     * @tc.number   marqueeNode_static_0100
     * @tc.name     marqueeNode_static_0100
     * @tc.desc     marqueeNode_static_0100
     * @tc.level    Level.LEVEL0
     */
it('marqueeNode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('marqueeNode0100: test' + new Date().getTime())
      let tagName = 'marqueeNode0100';
      console.info('[' + tagName + '] START============================');

      let strJson = inspector.getInspectorByKey('key_marquee_Node_001');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('700');
      console.info('[' + tagName + '] END ===========================');
      done()
    });

    
    

    /**
     * @tc.number   marqueeNode_static_0200
     * @tc.name     marqueeNode_static_0200
     * @tc.desc     marqueeNode_static_0200
     * @tc.level    Level.LEVEL0
     */
it('marqueeNode_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'marqueeNode0200';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('key_marquee_Node_001');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('marqueeUpdateStrategy')).assertEqual('MarqueeUpdateStrategy.DEFAULT');
      console.info('[' + tagName + '] END ===========================');
      done()
    });
  })
}

