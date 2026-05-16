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


import Utils from '../../../ets/MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
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

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function FlexMatchParentTest() {
  describe('FlexMatchParentTest', () => {
    beforeAll(() => {
      console.info("FlexMatchParentTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FlexMatchParentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexMatchParentPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexMatchParentTest state pages:" + JSON.stringify(pages));
        if (!("FlexMatchParentPage" == pages.name)) {
          console.info("get FlexMatchParentTest pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push FlexMatchParentTest page error:" + err);
      }
      console.info("FlexMatchParentTest beforeEach end");
      
    });
    afterEach(async () => {
    });

    
    
/**
     * @tc.number   FlexMatchParentTest_static_0100
     * @tc.name     FlexMatchParentTest_static_0100
     * @tc.desc     FlexMatchParentTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('FlexMatchParentTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[FlexMatchParentTest_static_0100] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('FlexMatchParentTest_static_0100_child');
      let obj = JSON.parseJsonElement(strJson);
      let width = parseFloat(obj.getElement("$attrs").getString('width'))
      let height = parseFloat(obj.getElement("$attrs").getString('height'))
      console.info("[FlexMatchParentTest_static_0100] width is: " + width);
      console.info("[FlexMatchParentTest_static_0100] height is: " + height);

      
      expect(Math.floor(Math.abs(width - 120)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(height - 120)) <= 1).assertTrue();

      console.info('[FlexMatchParentTest_static_0100] END');
      done();
    });
  })
}