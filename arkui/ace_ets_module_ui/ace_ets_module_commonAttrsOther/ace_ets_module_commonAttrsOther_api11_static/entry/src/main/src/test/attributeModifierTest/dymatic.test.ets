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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: String = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function dymaticTest() {
  describe('dymaticTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("dymaticTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("dymaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/attributeModifier/attribute',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dymaticTest state pages:" + JSON.stringify(pages));
        if (!("attribute" == pages.name)) {
          console.info("get dymaticTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push dymaticTest page error:" + err);
      }
      console.info("dymaticTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("dymaticTest after each called");
    });

    

    
/**
     * @tc.number   dymaticTest_static_0100
     * @tc.name     dymaticTest_static_0100
     * @tc.desc     dymaticTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('dymaticTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[dymaticTest_0100] START');
      await CommonFunc.sleep(2000);
      let btTop = CommonFunc.getComponentRect('pressedBt');
      let top = btTop.top
      let btBottom = CommonFunc.getComponentRect('pressedBt');
      let bottom = btBottom.bottom
      let btRight = CommonFunc.getComponentRect('pressedBt');
      let right = btRight.right
      let btLeft = CommonFunc.getComponentRect('pressedBt');
      let left = btLeft.left
      let xmiddle = Math.round(left + (right - left) / 2) as int
      let ymiddle = Math.round(top + (bottom - top) / 2) as int
      console.log('test result is: ' + btTop + btBottom + btRight + btLeft)

      let driver = Driver.create()
      driver.longClick(xmiddle, ymiddle);
      await CommonFunc.sleep(2000);
      let json = inspector.getInspectorByKey('pressedBt');
      await CommonFunc.sleep(1000);
      let Obj1 = JSON.parseJsonElement(json);
      console.info("dymaticTest_0100 json info " + JSON.stringify(json));

      expect(Obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF000000');
      console.info('[dymaticTest_0100] END');
      done();
    });

  })
}
