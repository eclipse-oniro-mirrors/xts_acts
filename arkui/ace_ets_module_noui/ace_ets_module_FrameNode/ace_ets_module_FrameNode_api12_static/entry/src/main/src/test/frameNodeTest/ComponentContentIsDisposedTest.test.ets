'use static';
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

import inspector from '@ohos.arkui.inspector'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import pasteboard from '@ohos.pasteboard'
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test'
import { FrameNode } from "@ohos.arkui.node"

export default function ComponentContentIsDisposedTest() {
  describe('ComponentContentIsDisposedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ComponentContentIsDisposedTest beforeEach start");
      await startAbility("com.arkui.ace.FrameNode.api12.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("ComponentContentIsDisposedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/ComponentContentIsDisposed",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ComponentContentIsDisposedTest state pages: " + JSON.stringify(pages));
        if (!("ComponentContentIsDisposed" == pages.name)) {
          console.info("get ComponentContentIsDisposedTest state pages.name: " + JSON.stringify(pages.name));
          
          router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push ComponentContentIsDisposedTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   ComponentContentIsDisposedTest_0100
     * @tc.number SUB_ARKUI_FRAMENODE_COMPONENTCONTENTISDISPOSED_0100
     * @tc.desc   Test ComponentContent.isDisposed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ComponentContentIsDisposedTest_0100', Level.LEVEL0, async (done: ()=>void) => {
      console.info('ComponentContentIsDisposedTest_0100 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('btn_componentContent_isDisposed'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let button2 = await driver.findComponent(ON.id('btn_reactiveComponentContent_isDisposed'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      expect(AppStorage.get<boolean>('componentContentIsDisposed1')).assertEqual(false);
      expect(AppStorage.get<boolean>('componentContentIsDisposed2')).assertEqual(true);
      expect(AppStorage.get<boolean>('reactiveComponentContentIsDisposed1')).assertEqual(false);
      expect(AppStorage.get<boolean>('reactiveComponentContentIsDisposed2')).assertEqual(true);
      AppStorage.delete('componentContentIsDisposed1');
      AppStorage.delete('componentContentIsDisposed2');
      AppStorage.delete('reactiveComponentContentIsDisposed1');
      AppStorage.delete('reactiveComponentContentIsDisposed2');
      console.info('[ComponentContentIsDisposedTest_0100] END');
      done();
    })
  })
}
