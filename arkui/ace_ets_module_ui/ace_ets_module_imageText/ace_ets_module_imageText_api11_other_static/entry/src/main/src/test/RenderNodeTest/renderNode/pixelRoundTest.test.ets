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
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';

export default function pixelRoundTest() {
  describe('pixelRoundTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("pixelRoundTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/renderNode/pixelRound',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get pixelRoundTest state pages:" + JSON.stringify(pages));
        if (!("pixelRound" == pages.name)) {
          console.info("get pixelRoundTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push pixelRoundTest page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push pixelRoundTest page error: " + err);
        expect().assertFail();
      }

    });

    
    
/**
     * @tc.number   pixelRoundTest_static_001
     * @tc.name     pixelRoundTest_static_001
     * @tc.desc     pixelRoundTest_static_001
     * @tc.level    Level.LEVEL2
     */
it('pixelRoundTest_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('pixelRoundTest_001 START');
      let strcontent = inspector.getInspectorByKey('pixelRound_1');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('pixelRoundTest_001 component obj is: ' + obj);
      expect(obj.getElement('$attrs').getString('pixelRound'))
        .assertEqual('{"start":"PixelRoundCalcPolicy.NO_FORCE_ROUND","top":"PixelRoundCalcPolicy.FORCE_CEIL","end":"PixelRoundCalcPolicy.NO_FORCE_ROUND","bottom":"PixelRoundCalcPolicy.FORCE_FLOOR"}');
      console.info('pixelRoundTest_001 END')
      done();
    });
  })
}