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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  MouseButton,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { startAbility, UtilsTest } from '../Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function AnimatorResultTest() {
  describe('AnimatorResultTest', () => {
    beforeAll(() => {
      console.info("AnimatorResultTest beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.animation12.static", "EntryAbility")
      

    });

    beforeEach(async (): Promise<void> => {
      console.info("AnimatorResultTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AnimatorResult/AnimatorResult",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AnimatorResultTest state pages:" + JSON.stringify(pages));
        if (!("AnimatorResult" == pages.name)) {
          console.info("get AnimatorResultTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AnimatorResultTest page error:" + err);
      }
      console.info("AnimatorResultTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("AnimatorResultTest after each called");
    });
    
    
/**
     * @tc.number   AnimatorResultTest_static_001
     * @tc.name     AnimatorResultTest_static_001
     * @tc.desc     AnimatorResultTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('AnimatorResultTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[AnimatorResultTest_static_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let create = await driver.findComponent(ON.id('create'));
      await CommonFunc.sleep(2000);
      await (create?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let play = await driver.findComponent(ON.id('play'));
      await CommonFunc.sleep(2000);
      await (play?.click() as Promise<void>);
      await CommonFunc.sleep(3500);
      let onFrame = inspector.getInspectorByKey('onFrame');
      console.info('onFrame: ' + JSON.parseJsonElement(onFrame).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(onFrame).getElement('$attrs').getString('content')).assertEqual('onFrame');
      console.info('[AnimatorResultTest_static_001] END');
      done();
    });
    
/**
     * @tc.number   AnimatorResultTest_static_002
     * @tc.name     AnimatorResultTest_static_002
     * @tc.desc     AnimatorResultTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('AnimatorResultTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[AnimatorResultTest_static_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let create = await driver.findComponent(ON.id('create'));
      await CommonFunc.sleep(2000);
      await (create?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let play = await driver.findComponent(ON.id('play'));
      await CommonFunc.sleep(2000);
      await (play?.click() as Promise<void>);
      await CommonFunc.sleep(3500);
      let onRepeat = inspector.getInspectorByKey('onRepeat');
      console.info('onRepeat: ' + JSON.parseJsonElement(onRepeat).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(onRepeat).getElement('$attrs').getString('content')).assertEqual('onRepeat');
      console.info('[AnimatorResultTest_static_002] END');
      done();
    });
  })
}