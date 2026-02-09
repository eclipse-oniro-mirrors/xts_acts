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
export default function PolylineResourceTest() {
  describe('PolylineResourceTest', () => {
    beforeAll(() => {
      console.info("PolylineResourceTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("PolylineResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/Polyline/PolylineResource',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get PolylineResourceTest state pages:" + JSON.stringify(pages));
        if (!("PolylineResourceTest" == pages.name)) {
          console.info("get PolylineResourceTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PolylineResourceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PolylineResourceTest page error:" + err);
      }
      console.info("PolylineResourceTest beforeEach end");
    }); 

    
    


/**
     * @tc.number   PolylineResourceTest_0100
     * @tc.name     PolylineResourceTest_0100
     * @tc.desc     PolylineResourceTest_0100
     * @tc.level    Level.LEVEL2
     */
it('PolylineResourceTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[PolylineResourceTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey("PolylineResource1");
  await CommonFunc.sleep(2000);
      console.info("[PolylineResourceTest_0100] width1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('width')));
      console.info("[PolylineResourceTest_0100] height1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('height')));

      let strJson2 = inspector.getInspectorByKey("PolylineResource2");
  await CommonFunc.sleep(2000);
      console.info("[PolylineResourceTest_0100] width2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('width')));
      console.info("[PolylineResourceTest_0100] height2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('height')));

      let strJson3 = inspector.getInspectorByKey("PolylineResource3");
  await CommonFunc.sleep(2000);
      console.info("[PolylineResourceTest_0100] width3 is: " + JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('width')));
      console.info("[PolylineResourceTest_0100] height3 is: " + JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('height')));
      
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('width')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('width'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('height')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('height'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('width')).assertEqual(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('width'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('height')).assertEqual(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('height'));
    
      console.info('[PolylineResourceTest_0100] END');
      done();
    });
  })
}

