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
export default function ShapeResourceTest() {
  describe('ShapeResourceTest', () => {
    beforeAll(() => {
      console.info("ShapeResourceTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ShapeResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/Shape/ShapeResource',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ShapeResourceTest state pages:" + JSON.stringify(pages));
        if (!("ShapeResourceTest" == pages.name)) {
          console.info("get ShapeResourceTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ShapeResourceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShapeResourceTest page error:" + err);
      }
      console.info("ShapeResourceTest beforeEach end");
    });


    
    


/**
     * @tc.number   ShapeResourceTest_0100
     * @tc.name     ShapeResourceTest_0100
     * @tc.desc     ShapeResourceTest_0100
     * @tc.level    Level.LEVEL2
     */
it('ShapeResourceTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ShapeResourceTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey("ShapeResource1");
  await CommonFunc.sleep(2000);

      // console.info("[ShapeResourceTest_0100] viewPort_x1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('viewPort').getString('x')));
      // console.info("[ShapeResourceTest_0100] viewPort_y1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('viewPort').getString('y')));
      // console.info("[ShapeResourceTest_0100] viewPort_width1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('viewPort').getString('width')));
      // console.info("[ShapeResourceTest_0100] viewPort_height1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('viewPort').getString('height')));
      // console.info("[ShapeResourceTest_0100] fill1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fill')));
      // console.info("[ShapeResourceTest_0100] stroke1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('stroke')));
      // console.info("[ShapeResourceTest_0100] strokeMiterLimit1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('strokeMiterLimit')));
      // console.info("[ShapeResourceTest_0100] strokeWidth1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('strokeWidth')));
      
      let strJson2 = inspector.getInspectorByKey("ShapeResource2");
  await CommonFunc.sleep(2000);

      // console.info("[ShapeResourceTest_0100] viewPort_x2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('viewPort').getString('x')));
      // console.info("[ShapeResourceTest_0100] viewPort_y2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('viewPort').getString('y')));
      // console.info("[ShapeResourceTest_0100] viewPort_width2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('viewPort').getString('width')));
      // console.info("[ShapeResourceTest_0100] viewPort_height2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('viewPort').getString('height')));
      // console.info("[ShapeResourceTest_0100] fill2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('fill')));
      // console.info("[ShapeResourceTest_0100] stroke2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('stroke')));
      // console.info("[ShapeResourceTest_0100] strokeMiterLimit2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('strokeMiterLimit')));
      // console.info("[ShapeResourceTest_0100] strokeWidth2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('strokeWidth')));

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('viewPort').getString('x')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('viewPort').getString('x'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('viewPort').getString('y')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('viewPort').getString('y'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('viewPort').getString('width')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('viewPort').getString('width'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('viewPort').getString('height')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('viewPort').getString('height'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fill')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('fill'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('stroke')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('stroke'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('strokeMiterLimit')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('strokeMiterLimit'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getDouble('strokeWidth')).assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getDouble('strokeWidth'));
    
      console.info('[ShapeResourceTest_0100] END');
      done();
    });
  })
}

