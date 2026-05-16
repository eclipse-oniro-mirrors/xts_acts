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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  Component,
  Driver,
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
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { UtilsTest, startAbility } from '../../Util.test';

export default function relativeCTest() {
  describe('relativeCTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("relativeCTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get relativeCTest state pages:" + JSON.stringify(pages));
        if (!("relative" == pages.name)) {
          console.info("get relativeCTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl({url:"MainAbility/pages/RelativeContainer/relativecommon/relative"});
          await CommonFunc.sleep(2000);
          // console.info("push relativeCTest page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push relativeCTest page error:" + err);
      }
      console.info("relativeCTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("relativeCTest after each called");
    });

    
    
/**
     * @tc.number   relativeCTest_static_0100
     * @tc.name     relativeCTest_static_0100
     * @tc.desc     relativeCTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('relativeCTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[relativeCTest_0100] START');
      await CommonFunc.sleep(2000);
      let json = inspector.getInspectorByKey('row2common');
      console.info("relativeCTest_0100 json info " + JSON.stringify(json));
      let btRight = CommonFunc.getComponentRect('row1common');
      let right = btRight.right
      let btleft1 = CommonFunc.getComponentRect('row2common');
      let left1 = btleft1.left
      let diff = Math.round(left1 - right)
      expect(Math.abs((diff + Number("")) - (UIContext.resolveUIContext()!.vp2px(100) + Number(""))) <= 1).assertTrue();
      done();
    });

  })
}
