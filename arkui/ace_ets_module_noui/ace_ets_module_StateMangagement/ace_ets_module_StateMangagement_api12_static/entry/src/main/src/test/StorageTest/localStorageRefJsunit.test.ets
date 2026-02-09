'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export default function localStorageRefJsunit() {
  describe('localStorageRefJsunit', () => {
    beforeAll(() => {
      console.info("localStorageRefJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("localStorageRefJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Storage/localStorageRef',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get localStorageRefJsunit state pages:" + JSON.stringify(pages));
        if (!("localStorageRefJsunit" == pages.name)) {
          console.info("get localStorageRefJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push localStorageRefJsunit page error:" + err);
      }
      console.info("localStorageRefJsunit beforeEach end");
    });


    
    
    /**
     * @tc.number   localStorageRefJsunit_static_0100
     * @tc.name     localStorageRefJsunit_static_0100
     * @tc.desc     localStorageRefJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('localStorageRefJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('localStorageRefJsunit001 START');
      let strJson = inspector.getInspectorByKey('local_ref_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[localStorageRefJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[localStorageRefJsunit_static_0100] ref: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("ref:47");

      let strJson2 = inspector.getInspectorByKey('local_ref_2');
      let obj2= JSON.parseJsonElement(strJson2);
      console.info("[localStorageRefJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[localStorageRefJsunit_static_0100] setAndRef: " + JSON.stringify(obj2.getElement('$attrs').getString('label')));
      expect(obj2.getElement('$attrs').getString('label')).assertEqual("setAndRef:30");
      console.info('localStorageRefJsunit_static_0100 END');
      done();
    });
  })
}