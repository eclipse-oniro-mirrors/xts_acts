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

export default function DialogTest() {
  describe('DialogTest', () => {
    beforeAll(() => {
      console.info("DialogTest beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("DialogTest beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/Index',
      };
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get Index state pages: " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Index success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }

    });


    
    
/**
     * @tc.number   ArkUX_Dialog_Visual_static_0060
     * @tc.name     ArkUX_Dialog_Visual_static_0060
     * @tc.desc     ArkUX_Dialog_Visual_static_0060
     * @tc.level    Level.LEVEL2
     */
    it('ArkUX_Dialog_Visual_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Dialog_Visual_static_0060 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('ArkUX_Dialog_Visual_0060');
      await CommonFunc.sleep(500);
      console.info('ArkUX_Dialog_Visual_static_0060 START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(500);
      console.info("ArkUX_Dialog_Visual_static_0060 obj is: " + JSON.stringify(obj));
      let fontSize = obj.getElement('$attrs').getString("fontSize");
      await CommonFunc.sleep(500);
      expect(fontSize).assertEqual("20.00fp");
      console.info('ArkUX_Dialog_Visual_static_0060 END ');
      done();
    });
  })
}