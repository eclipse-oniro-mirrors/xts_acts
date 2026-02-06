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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textStrategyJsunit() {
  describe('textStrategyJsunit', () => {
    beforeAll(() => {
      console.info("textStrategyJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textStrategyJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/textStrategy",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textStrategyJsunit state pages:" + JSON.stringify(pages));
        if (!("textStrategy" == pages.name)) {
          console.info("get textStrategyJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textStrategyJsunit page error:" + err);
      }
      console.info("textStrategyJsunit beforeEach end");
    });

    /**
     * @tc.number   textStrategyJsunit_static_0100
     * @tc.name     textStrategyJsunit_static_0100
     * @tc.desc     textStrategyJsunit_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textStrategyJsunit_static_0100', Level.LEVEL0, async (done: () => void) : Promise<void> => {
      console.info('textStrategyJsunit_0100 START');

      let strJson = inspector.getInspectorByKey('text_Strategy_1');
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[textStrategyJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('lineBreakStrategy')).assertEqual("greedy");

      let strJson2 = inspector.getInspectorByKey('text_Strategy_2');
      let obj2  = JSON.parseJsonElement(strJson2);
      console.info("[textStrategyJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('lineBreakStrategy')).assertEqual("high-quality");

      let strJson3 = inspector.getInspectorByKey('text_Strategy_3');
      let obj3  = JSON.parseJsonElement(strJson3);
      console.info("[textStrategyJsunit_0100] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('lineBreakStrategy')).assertEqual("balanced");
      console.info('[textStrategyJsunit_0100] END');
      done();
    });
  })
}

