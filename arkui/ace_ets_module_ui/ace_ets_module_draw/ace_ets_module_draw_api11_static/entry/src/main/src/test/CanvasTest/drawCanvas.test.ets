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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
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
import drawing from "@ohos.graphics.drawing"
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

export default function drawCanvas() {
  describe('drawCanvas', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("drawCanvas beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Canvas/drawCanvas',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get drawCanvas state pages:" + JSON.stringify(pages));
        if (!("drawCanvas" == pages.name)) {
          console.info("get drawCanvas pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push drawCanvas page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push drawCanvas page error: " + err);
        expect().assertFail();
      }
      // done();
    });


    
    /**
     * @tc.number   drawCanvas_static_0100
     * @tc.name     drawCanvas_static_0100
     * @tc.desc     drawCanvas_static_0100
     * @tc.level    Level.LEVEL0
     */
it('drawCanvas_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('drawCanvas_static_0100 START');
        await CommonFunc.sleep(1000);
        try {
          let value: drawing.Canvas | undefined =
            AppStorage.get<drawing.Canvas | undefined>("canvas");
          // expect(value).assertNotEqual(undefined)
          expect(value !== undefined).assertEqual(true);
        } catch (err) {
          console.error("push drawCanvas page error" + JSON.stringify(err));
        }

        console.info('[drawCanvas_static_0100] END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });


  })
}

