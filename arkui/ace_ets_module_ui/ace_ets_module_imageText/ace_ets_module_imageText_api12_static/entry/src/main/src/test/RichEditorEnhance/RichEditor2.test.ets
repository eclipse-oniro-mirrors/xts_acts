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

 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import {MessageManager,Callback,Message} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { UIContext } from '@ohos.arkui.UIContext'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import text from "@ohos.graphics.text";
import {KeyCode} from '@ohos.multimodalInput.keyCode';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditor2() {
  describe('RichEditor2', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditor2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor2',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditor2 state pages:" + JSON.stringify(pages));
        if (!("RichEditor2" == pages.name)) {
          console.info("get RichEditor2 pages.name:" + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor2 page result");
        }
      } catch (err) {
        console.error("push RichEditor2 page error:" + err);
      }
      console.info("RichEditor2 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor2 after each called");
    });
    
    /**
     * @tc.number   RichEditor2_static_0100
     * @tc.name     RichEditor2_static_0100
     * @tc.desc     RichEditor2_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('RichEditor2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor2_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditor_supportAvoidance = await (driver.findComponent(ON.id("RichEditor_supportAvoidance")) as Promise<Component>);
      let point1 = await RichEditor_supportAvoidance.getBoundsCenter();
      await RichEditor_supportAvoidance.click()
      await driver.delayMs(1000)
      let point2 = await RichEditor_supportAvoidance.getBoundsCenter();
      expect(point1.y === point2.y).assertFalse()
      console.info('[RichEditor2_static_0100] END');
      done();
    });

  })
}
