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
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
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
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function responseTypeJsunit() {
  describe('responseTypeTest', () => {
    beforeAll(() => {
      console.info("responseTypeTest beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("responseTypeTest  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/responseType',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get responseType state pages: " + JSON.stringify(pages));
        if (!("responseType" == pages.name)) {
          console.info("get responseType state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push responseType success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push responseType page error: " + err);
      }

    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("responseType after each called");
    });


    
    
/**
     * @tc.number   testresponseType0002_static
     * @tc.name     testresponseType0002_static
     * @tc.desc     testresponseType0002_static
     * @tc.level    Level.LEVEL2
     */
it('testresponseType0002_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('responseType testresponseType0002_static START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('RightClickText');
      console.info("[testresponseType0002_static] component bindContextMenu strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('bindContextMenu')).assertEqual(undefined);
      console.info("[testresponseType0002_static] bindContextMenu value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('bindContextMenu'));
      done();
    });


    
    
/**
     * @tc.number   testresponseType0003_static
     * @tc.name     testresponseType0003_static
     * @tc.desc     testresponseType0003_static
     * @tc.level    Level.LEVEL2
     */
it('testresponseType0003_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('responseType testresponseType0003_static START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('LongPressText');
      console.info("[testresponseType0003_static] component bindContextMenu strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('bindContextMenu')).assertEqual(undefined);
      console.info("[testresponseType0003_static] bindContextMenu value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('bindContextMenu'));
      done();
    });
  })
}