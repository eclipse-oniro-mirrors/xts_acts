'use static';
/*
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


export default function ActsgetcomponentTest() {
  describe('ActsgetcomponentTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/getcomponent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getcomponent state pages:" + JSON.stringify(pages));
        if (!("getcomponent" == pages.name)) {
          console.info("get getcomponent pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push getcomponent page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push getcomponent page error: " + err);
      }

    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    
/**
     * @tc.number   ArkUX_Get_component_static_0010
     * @tc.name     ArkUX_Get_component_static_0010
     * @tc.desc     ArkUX_Get_component_static_0010
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Get_component_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_0010 START');
      let strJson = inspector.getInspectorByKey('ArkUX_Get_component_0010');
      console.info('ArkUX_Get_component_0010 width: ' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString("width")));
      console.info('ArkUX_Get_component_0010 height: ' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')));
      console.info('ArkUX_Get_component_0010 localOffsetX: ' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('offset').getString('x')));
      console.info('ArkUX_Get_component_0010 localOffsetY: ' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('offset').getString('y')));
      console.info('ArkUX_Get_component_0010 windowOffsetX: ' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow').getString('offsetX')));
      console.info('ArkUX_Get_component_0010 windowOffsetY: ' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow').getString('offsetY')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("width")).assertEqual("90.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("90.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('offset').getString('x')).assertEqual("");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('offset').getString('y')).assertEqual("");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow').getString('offsetX')).assertEqual("0.000000");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow').getString('offsetY')).assertEqual("0.000000");
      console.info('ArkUX_Get_component_0010 END ');
      done();
    });
  })
}