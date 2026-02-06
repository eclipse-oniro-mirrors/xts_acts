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
export default function RoundRectTest() {
  describe('RoundRectTest', () => {
    beforeAll(() => {
      console.info("RoundRectTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("RoundRectTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/CanvasRenderingContext2D/RoundRectPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get RoundRectTest state pages:" + JSON.stringify(pages));
        if (!("RoundRectTest" == pages.name)) {
          console.info("get RoundRectTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RoundRectTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RoundRectTest page error:" + err);
      }
      console.info("RoundRectTest beforeEach end");
    }); 

    
    


/**
     * @tc.number   RoundRectTest_0100
     * @tc.name     RoundRectTest_0100
     * @tc.desc     RoundRectTest_0100
     * @tc.level    Level.LEVEL2
     */
it('RoundRectTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RoundRectTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RoundRectPage_Canvas');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RoundRectTest_0100] type is: " + JSON.stringify(obj.getString('$type')));
      expect(obj.getString('$type')).assertEqual('Canvas');

      console.info('[RoundRectTest_0100] END');
      done();
    });
  })
}

