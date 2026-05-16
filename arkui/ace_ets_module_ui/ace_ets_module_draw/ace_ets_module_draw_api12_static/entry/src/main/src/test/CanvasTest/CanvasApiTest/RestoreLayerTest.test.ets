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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium';
import router from '@ohos.router';
import CommonFunc from "../../../../ets/MainAbility/common/Common";
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../../Util.test';

export default function RestoreLayerTest() {
  describe('RestoreLayerTest', () => {
    beforeAll(() => {
      console.info("RestoreLayerTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.drawAPI12.static", "EntryAbility")


    });

    beforeEach(async (): Promise<void> => {
      console.info("RestoreLayerTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasApiTest/RestoreLayer",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RestoreLayerTest state pages:" + JSON.stringify(pages));
        if (!("RestoreLayer" == pages.name)) {
          console.info("get RestoreLayerTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RestoreLayerTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RestoreLayerTest page error:" + err);
      }
      console.info("RestoreLayerTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RestoreLayerTest after each called");
    });

    
    /**
     * @tc.number   RestoreLayerTest_static_001
     * @tc.name     RestoreLayerTest_static_001
     * @tc.desc     RestoreLayerTest_static_001
     * @tc.level    Level.LEVEL3
     */
it('RestoreLayerTest_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RestoreLayerTest_001] START');
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('text1');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(text1).getElement('$attrs').getString('content')).assertEqual('restoreLayer');
      console.info('[RestoreLayerTest_001] END');
      done();
    });
  })
}
