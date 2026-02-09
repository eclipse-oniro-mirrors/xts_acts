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

export default function ellipseNeJsunit() {
  describe('ellipseNeTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Ellipse/ellipse1',
      }
      try {
        const ellipse1 = AppStorage.get<Router>("router") as Router
        ellipse1.clear();
        let pages = ellipse1.getState();
        console.info("get ellipse state success " + JSON.stringify(pages));
        if (!("ellipse1" == pages.name)) {
          console.info("get ellipse state success " + JSON.stringify(pages.name));
          // let result = await ellipse1.pushUrl(options);
          ellipse1.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ellipse page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ellipse page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ellipseNe after each called");
    });


    
    /**
     * @tc.number   testellipseNe0001
     * @tc.name     testellipseNe0001
     * @tc.desc     testellipseNe0001
     * @tc.level    Level.LEVEL0
     */
it('testellipseNe0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('ellipseNe testellipseNe0001_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ellipse');
      console.info("[testellipseNe0001_static] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Ellipse');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("300.00px");
      console.info("[testellipseNe0001_static] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    
    /**
     * @tc.number   testellipseNe0002
     * @tc.name     testellipseNe0002
     * @tc.desc     testellipseNe0002
     * @tc.level    Level.LEVEL0
     */
it('testellipseNe0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('ellipseNe testellipseNe0002_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ellipse');
      console.info("[testellipseNe0002_static] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Ellipse');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("300.00px");
      console.info("[testellipseNe0002_static] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });
  })
}
