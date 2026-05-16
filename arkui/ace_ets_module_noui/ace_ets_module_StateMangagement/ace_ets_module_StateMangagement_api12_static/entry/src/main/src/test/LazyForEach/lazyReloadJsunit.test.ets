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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,TestType,Size,Level} from "../../../../hypium/index"
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
export default function lazyReloadJsunit() {
  describe('lazyReloadJsunit', () => {
    beforeAll(() => {
      console.info("lazyReloadJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("lazyReloadJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/LazyForEach/lazyReload",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get lazyReloadJsunit state pages:" + JSON.stringify(pages));
        if (!("lazyReloadJsunit" == pages.name)) {
          console.info("get lazyReloadJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push lazyReloadJsunit page error:" + err);
      }
      console.info("lazyReloadJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("lazyReloadJsunit after each called");
    });

    
    
    /**
     * @tc.number   lazyReloadJsunit_static_0100
     * @tc.name     lazyReloadJsunit_static_0100
     * @tc.desc     lazyReloadJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('lazyReloadJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lazyReloadJsunit_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('reload_Type'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[RepeatEachJsunit_0100] lazyReload success");

      let strJson = inspector.getInspectorByKey('reload_Data');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[lazyReloadJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('reload: Hello 10');
      console.info('[lazyReloadJsunit_static_0100] END');
      done();
    });

  })
}

