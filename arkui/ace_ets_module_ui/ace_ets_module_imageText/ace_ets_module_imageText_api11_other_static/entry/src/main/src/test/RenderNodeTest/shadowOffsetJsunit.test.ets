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

import router from '@ohos.router';
import {
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
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function shadowOffsetJsunit() {
  describe('shadowOffsetJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("shadowOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/shadowOffset',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get shadowOffsetJsunit state pages:" + JSON.stringify(pages));
        if (!("shadowOffset" == pages.name)) {
          console.info("get shadowOffsetJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push shadowOffsetJsunit page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push shadowOffsetJsunit page error:" + err);
      }

    });

    // afterAll(async (): Promise<void> => {
    //   await UtilsTest.msSleep(1000)
    //   stopApplication("com.arkui.ace.imageText.api11.other.static")
    //   await UtilsTest.msSleep(1000)
    // })

    

    
/**
     * @tc.number   shadowOffsetJsunit_static_0100
     * @tc.name     shadowOffsetJsunit_static_0100
     * @tc.desc     shadowOffsetJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('shadowOffsetJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[shadowOffsetJsunit_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('get_shadowOffset'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('getX');
      let strJson2 = inspector.getInspectorByKey('getY');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[shadowOffsetJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[shadowOffsetJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[shadowOffsetJsunit_0100] component content1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[shadowOffsetJsunit_0100] component content2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("getOffset_X:10");
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("getOffset_Y:10");
      console.info('[shadowOffsetJsunit_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}