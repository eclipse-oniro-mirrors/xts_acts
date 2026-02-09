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

export default function polylineJsunit() {
  describe('appInfoTest_four_7', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("polyline beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/polyline/polyline',
      }
      try {
        const polyLine = AppStorage.get<Router>("router") as Router
        polyLine.clear();
        let pages = polyLine.getState();
        console.info("get polyline state pages:" + JSON.stringify(pages));
        if (!("polyline" == pages.name)) {
          console.info("get polyline state pages.name:" + JSON.stringify(pages.name));
          // let result = await polyLine.pushUrl(options);
          polyLine.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push polyline page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push polyline page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("polyline after each called");
    });

    
    /**
     * @tc.number   testPolyline_static_001
     * @tc.name     testPolyline_static_001
     * @tc.desc     testPolyline_static_001
     * @tc.level    Level.LEVEL0
     */
it('testPolyline_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[testPolyline_static_001] START');
        await CommonFunc.sleep(4000);
        let strJson: string = inspector.getInspectorByKey('polyline');
        console.info("[testPolyline_static_001] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
        console.info('[testPolyline_static_001] END');
        done();
      }catch(err) {
        expect().assertFail();
      }
    });
  })
}
