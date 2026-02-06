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
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'

export default function StartImageAnalyzerErrorCodeTest() {
  describe('StartImageAnalyzerErrorCodeTest', () => {
    beforeAll(() => {
      console.info("StartImageAnalyzerErrorCodeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("StartImageAnalyzerErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/CanvasRenderingContext2D/StartImageAnalyzerErrorCode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get StartImageAnalyzerErrorCodeTest state pages:" + JSON.stringify(pages));
        if (!("StartImageAnalyzerErrorCode" == pages.name)) {
          console.info("get StartImageAnalyzerErrorCodeTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StartImageAnalyzerErrorCodeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StartImageAnalyzerErrorCodeTest page error:" + err);
      }
      console.info("StartImageAnalyzerErrorCodeTest beforeEach end");
    });

    
    


/**
     * @tc.number   StartImageAnalyzerErrorCodeTest_static_0100
     * @tc.name     StartImageAnalyzerErrorCodeTest_static_0100
     * @tc.desc     StartImageAnalyzerErrorCodeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('StartImageAnalyzerErrorCodeTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[StartImageAnalyzerErrorCodeTest_static_0100] START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('EnableButton1'));
      await (button1?.click() as Promise<void>);
      await Utils.sleep(2000)
      let button2 = await driver.findComponent(ON.id('StartButton1'));
      await (button2?.click() as Promise<void>);
      await Utils.sleep(2000)

      let strJson1 = inspector.getInspectorByKey('TextErrorCode1');
      console.info("[StartImageAnalyzerErrorCodeTest_static_0100] StartImageAnalyzerErrorCode1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));


      let button3 = await driver.findComponent(ON.id('FlagButton1'));
      await (button3?.click() as Promise<void>);
      await Utils.sleep(2000)
      let button4 = await driver.findComponent(ON.id('StartButton1'));
      await (button4?.click() as Promise<void>);
      await Utils.sleep(2000)
      let button5 = await driver.findComponent(ON.id('StartButton1'));
      await (button5?.click() as Promise<void>);
      await Utils.sleep(2000)

      let strJson2 = inspector.getInspectorByKey('TextErrorCode1');
      await Utils.sleep(4000)
      console.info("[StartImageAnalyzerErrorCodeTest_static_0100] StartImageAnalyzerErrorCode2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('110001');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('110002');


      console.info('[StartImageAnalyzerErrorCodeTest_static_0100] END');
      done();
    });
  })
}

