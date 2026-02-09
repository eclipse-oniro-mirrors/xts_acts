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
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SXrenderingStrategyJsunit() {
  describe('SXrenderingStrategyJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SXrenderingStrategyJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/SXrenderingStrategy",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SXrenderingStrategyJsunit state pages:" + JSON.stringify(pages));
        if (!("SXrenderingStrategy" == pages.name)) {
          console.info("get SXrenderingStrategyJsunit pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SXrenderingStrategyJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SXrenderingStrategyJsunit page error:" + err);
      }
      console.info("SXrenderingStrategyJsunit beforeEach end");
    });
    beforeAll(() => {
      console.info("SXrenderingStrategyJsunit beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SXrenderingStrategyJsunit after each called");
    });

    afterEach(async  () => {
      await CommonFunc.sleep(100)
      console.info("RichEditor after each called");
    })
    
    /**
     * @tc.number   SXrenderingStrategyJsunit_static__0100
     * @tc.name     SXrenderingStrategyJsunit_static__0100
     * @tc.desc     SXrenderingStrategyJsunit_static__0100
     * @tc.level    Level.LEVEL1
     */
    it('SXrenderingStrategyJsunit_static__0100', Level.LEVEL1, async (done: ()=>void) => {
      await CommonFunc.sleep(1000);
      console.info('SXrenderingStrategyJsunit_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('SXrenderingStrategyButton'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strcontent = inspector.getInspectorByKey('SXrenderingStrategyText');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('SXrenderingStrategyJsunit_0100 END')
      done();
    });

  })
}