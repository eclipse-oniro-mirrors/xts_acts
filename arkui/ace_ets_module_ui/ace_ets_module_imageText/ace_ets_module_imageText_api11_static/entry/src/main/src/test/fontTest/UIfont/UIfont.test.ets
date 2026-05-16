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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
import inspector from '@ohos.arkui.inspector'

export default function UIfont() {
  describe('UIfont', () => {
    beforeAll(() => {
      console.info("UIfont beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("UIfont beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/font/UIfont/UIfont',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get UIfont state pages:" + JSON.stringify(pages));
        if (!("UIfont" == pages.name)) {
          console.info("get UIfont pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push UIfont page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIfont page error:" + err);
      }
      console.info("UIfont beforeEach end");
    });


    
    /**
     * @tc.number   UIfont_static_001
     * @tc.name     UIfont_static_001
     * @tc.desc     UIfont_static_001
     * @tc.level    Level.LEVEL2
     */
    it('UIfont_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('[UIfont_static_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('UIfont_fontDir'));
      await (button?.click() as Promise<void>);
      console.info("click success");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('UIfont_Text');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[UIfont_static_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');

      console.info('[UIfont_static_001] END');
      done();
    });

    
    /**
     * @tc.number   UIfont_static_002
     * @tc.name     UIfont_static_002
     * @tc.desc     UIfont_static_002
     * @tc.level    Level.LEVEL2
     */
    it('UIfont_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('[UIfont_static_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('UIfont_generic'));
      await (button?.click() as Promise<void>);
      console.info("click success");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('UIfont_Text');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[UIfont_static_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3');

      console.info('[UIfont_static_002] END');
      done();
    });

    
    /**
     * @tc.number   UIfont_static_003
     * @tc.name     UIfont_static_003
     * @tc.desc     UIfont_static_003
     * @tc.level    Level.LEVEL2
     */
    it('UIfont_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('[UIfont_static_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('UIfont_fallbackGroups'));
      await (button?.click() as Promise<void>);
      console.info("click success");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('UIfont_Text');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[UIfont_static_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');

      console.info('[UIfont_static_003] END');
      done();
    });

    
    /**
     * @tc.number   UIfont_static_004
     * @tc.name     UIfont_static_004
     * @tc.desc     UIfont_static_004
     * @tc.level    Level.LEVEL2
     */
    it('UIfont_static_004', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('[UIfont_static_004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('UIfont_alias'));
      await (button?.click() as Promise<void>);
      console.info("click success");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('UIfont_Text');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[UIfont_static_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('5');

      console.info('[UIfont_static_004] END');
      done();
    });
  })
}
