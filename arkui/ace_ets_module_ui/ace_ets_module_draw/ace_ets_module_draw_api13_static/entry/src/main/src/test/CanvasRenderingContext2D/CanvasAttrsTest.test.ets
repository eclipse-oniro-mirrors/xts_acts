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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage, LocalStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
export default function CanvasAttrsTest() {
  describe('CanvasAttrsTest', () => {
    beforeAll(() => {
      console.info("CanvasAttrsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.drawAPI13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("CanvasAttrsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CanvasRenderingContext2D/CanvasAttrsTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CanvasAttrsTest state pages:" + JSON.stringify(pages));
        if (!("CanvasAttrsTest" == pages.name)) {
          console.info("get CanvasAttrsTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CanvasAttrsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasAttrsTest page error:" + err);
      }
      console.info("CanvasAttrsTest beforeEach end");
    }); 

    
    



    /**
     * @tc.number   CanvasAttrsTest_static_0100
     * @tc.name     CanvasAttrsTest_static_0100
     * @tc.desc     CanvasAttrsTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('CanvasAttrsTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('CanvasAttrsTest_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('show_content');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CanvasAttrsTest_0100] content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Canvas is fully visible.');

      // 
      let button = await driver.findComponent(ON.id('swipe_bottom'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('show_content');
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(strJson);
      console.info("[CanvasAttrsTest_0100] content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Canvas is completely invisible.');

      // 
      button = await driver.findComponent(ON.id('swipe_top'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('show_content');
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(strJson);
      console.info("[CanvasAttrsTest_0100] content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Canvas is fully visible.');   // 断言失败

      console.info('[CanvasAttrsTest_0100] END');
      done();
    });
  })
}

