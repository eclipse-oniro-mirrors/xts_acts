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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function lazyChangeJsunit() {
  describe('lazyChangeJsunit', () => {
    beforeAll(() => {
      console.info("lazyChangeJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("lazyChangeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/lazyChange",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get lazyChangeJsunit state pages:" + JSON.stringify(pages));
        if (!("lazyChangeJsunit" == pages.name)) {
          console.info("get lazyChangeJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push lazyChangeJsunit page error:" + err);
      }
      console.info("lazyChangeJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("lazyChangeJsunit after each called");
    });

    
    
    /**
     * @tc.number   lazyChangeJsunit_static_0100
     * @tc.name     lazyChangeJsunit_static_0100
     * @tc.desc     lazyChangeJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('lazyChangeJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lazyChangeJsunit_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('changeType_1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[RepeatEachJsunit_0100] lazyChange success");
      let strJson: string = inspector.getInspectorByKey('change_DataType');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[lazyChangeJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('change: data 11');
      console.info('[lazyChangeJsunit_static_0100] END');
      done();
    });

  })
}

