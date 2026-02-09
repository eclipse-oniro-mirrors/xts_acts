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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RectRadiusTest() {
  describe('RectRadiusTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rect/RectPage',
      }
      try {
        const rectPage = AppStorage.get<Router>("router") as Router
        rectPage.clear();
        let pages = rectPage.getState();
        console.info("get RectPage state success " + JSON.stringify(pages));
        if (!("RectPage" == pages.name)) {
          console.info("get RectPage state success " + JSON.stringify(pages.name));
          rectPage.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RectPage page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("RectRadiusTest after each called");
    });


    
    /**
     * @tc.number   testRectRadiusTest_static_0010
     * @tc.name     testRectRadiusTest_static_0010
     * @tc.desc     testRectRadiusTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testRectRadiusTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRectRadiusTest_static_0010] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RectRadius_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[testRectRadiusTest_static_0010] Rect obj is: ' + obj);
      console.info('[testRectRadiusTest_static_0010] Rect obj.$type is: ' + obj.getString('$type'));
      console.info('[testRectRadiusTest_static_0010] Rect obj.$attrs.radius is: ' +
      obj.getElement('$attrs').getBoolean('radius'));

      expect(obj.getString('$type')).assertEqual('Rect');
      expect(obj.getElement('$attrs').getBoolean('radius')).assertEqual(true);

      console.info('[testRectRadiusTest_static_0010] END');
      done();
    });


    
    /**
     * @tc.number   testRectRadiusTest_static_0020
     * @tc.name     testRectRadiusTest_static_0020
     * @tc.desc     testRectRadiusTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('testRectRadiusTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRectRadiusTest_static_0020] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RectRadius_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[testRectRadiusTest_static_0020] Rect obj is: ' + obj);
      console.info('[testRectRadiusTest_static_0020] Rect obj.$type is: ' + obj.getString('$type'));
      console.info('[testRectRadiusTest_static_0020] Rect obj.$attrs.radius is: ' +
      obj.getElement('$attrs').getBoolean('radius'));

      expect(obj.getString('$type')).assertEqual('Rect');
      expect(obj.getElement('$attrs').getBoolean('radius')).assertEqual(true);

      console.info('[testRectRadiusTest_static_0020] END');
      done();
    });
  })
}
