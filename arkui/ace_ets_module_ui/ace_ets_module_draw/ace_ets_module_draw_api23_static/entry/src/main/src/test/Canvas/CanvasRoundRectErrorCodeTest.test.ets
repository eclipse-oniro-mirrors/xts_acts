/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
export default function CanvasRoundRectErrorCodeTest() {
  describe('CanvasRoundRectErrorCodeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CanvasRoundRectErrorCodeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.draw.api23.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("CanvasWidthHeightCanvas beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/Canvas/CanvasRoundRectErrorCode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get CanvasRoundRectErrorCode state pages:" + JSON.stringify(pages));
        if (!("CanvasRoundRectErrorCode" == pages.name)) {
          console.info("get CanvasRoundRectErrorCode pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CanvasRoundRectErrorCode page error:" + err);
      }
      console.info("CanvasRoundRectErrorCode beforeEach end");
    }); 

    /**
    * @tc.name   CanvasRoundRectErrorCodeTest_0100
    * @tc.number SUB_ArkUI_Ace_CanvasRoundRectErrorCodeTest_0100
    * @tc.desc   ArkUI Api
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('CanvasRoundRectErrorCodeTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
    console.info('[CanvasRoundRectErrorCodeTest_0100] START');
    await CommonFunc.sleep(1000);

    console.info('[CanvasRoundRectErrorCodeTest_0100] get result:' + AppStorage.get<int>('StaticRoundRectErrorCode'));
    expect(AppStorage.get<int>('StaticRoundRectErrorCode')).assertEqual(103701);

    console.info('[CanvasRoundRectErrorCodeTest_0100] END');
    done();
    });
    
  })
}

