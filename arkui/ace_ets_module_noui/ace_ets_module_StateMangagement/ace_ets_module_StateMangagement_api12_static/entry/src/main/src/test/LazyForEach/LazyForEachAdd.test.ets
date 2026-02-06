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

export default function LazyForEachAdd() {
  describe('LazyForEachAdd', () => {
    beforeAll(() => {
      console.info("LazyForEachAdd beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LazyForEachAdd beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/LazyForEachAdd",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LazyForEachAdd state pages:" + JSON.stringify(pages));
        if (!("LazyForEachAdd" == pages.name)) {
          console.info("get LazyForEachAdd pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LazyForEachAdd page error:" + err);
      }
      console.info("LazyForEachAdd beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachAdd after each called");
    });

    
    
    /**
     * @tc.number   LazyForEachAdd_static_001
     * @tc.name     LazyForEachAdd_static_001
     * @tc.desc     LazyForEachAdd_static_001
     * @tc.level    Level.LEVEL0
     */
it('LazyForEachAdd_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LazyForEachAdd_static_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await (driver.findComponent(ON.id('addButton')) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(4000);

      let strJson = inspector.getInspectorByKey('repeat_add10');
      console.log("[LazyForEachAdd_static_001] strJson " +  strJson);
      let obj= JSON.parseJsonElement(strJson);
      console.info("[LazyForEachAdd_static_001] component obj is: " + JSON.stringify(obj));
      const content:string = obj.getElement('$attrs').getString('content')
      console.info("[LazyForEachAdd_static_001]content is: " + content);
      expect(content).assertEqual('Item10');
      console.info('[LazyForEachAdd_static_001] END1');
      await CommonFunc.sleep(4000);
      let strJson1 = inspector.getInspectorByKey('lazyForeach_add10');
      let obj1= JSON.parseJsonElement(strJson1);
      console.info("[LazyForEachAdd_static_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('11add_1add');
      console.info('[LazyForEachAdd_static_001] END2');
      done();
    });
  })
}
