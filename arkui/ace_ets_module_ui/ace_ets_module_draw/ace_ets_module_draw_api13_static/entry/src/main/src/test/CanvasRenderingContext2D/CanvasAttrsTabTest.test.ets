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
export default function CanvasAttrsTabTest() {
  describe('CanvasAttrsTabTest', () => {
    beforeAll(() => {
      console.info("CanvasAttrsTabTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.drawAPI13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("CanvasAttrsTabTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CanvasRenderingContext2D/CanvasAttrsTabTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CanvasAttrsTabTest state pages:" + JSON.stringify(pages));
        if (!("CanvasAttrsTabTest" == pages.name)) {
          console.info("get CanvasAttrsTabTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CanvasAttrsTabTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasAttrsTabTest page error:" + err);
      }
      console.info("CanvasAttrsTabTest beforeEach end");
    }); 

    
    



    /**
     * @tc.number   CanvasAttrsTabTest_static_0100
     * @tc.name     CanvasAttrsTabTest_static_0100
     * @tc.desc     CanvasAttrsTabTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('CanvasAttrsTabTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('CanvasAttrsTabTest_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);

      // 页面加载
      let strJson1 = inspector.getInspectorByKey('visible_content');
      let strJson2 = inspector.getInspectorByKey('invisible_content');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[CanvasAttrsTabTest_0100] visible_content is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[CanvasAttrsTabTest_0100] invisible_content is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Canvas 1 is fully visible.');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('');

      // 切换至tab two页面
      let button = await driver.findComponent(ON.text('Tab two'));     // driver.findComponent(ON.text('Tab two')) 获取不到button
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      // OHOS_REPORT_STATUS: stack=	at std.core.ClassCastError.<ctor> (Errors.ets:187:0)
      //  at entry.src.main.src.test.CanvasRenderingContext2D.CanvasAttrsTabTest.test.ETSGLOBAL.%%async-lambda_invoke-74 (CanvasAttrsTabTest.test.ets:83:0)
      await CommonFunc.sleep(1000);

      strJson1 = inspector.getInspectorByKey('visible_content');
      strJson2 = inspector.getInspectorByKey('invisible_content');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      console.info("[CanvasAttrsTabTest_0100] visible_content is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[CanvasAttrsTabTest_0100] invisible_content is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Canvas 2 is fully visible.');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Canvas 1 is completely invisible.');

      // 切换至tab three页面
      button = await driver.findComponent(ON.text('Tab three'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson1 = inspector.getInspectorByKey('visible_content');
      strJson2 = inspector.getInspectorByKey('invisible_content');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      console.info("[CanvasAttrsTabTest_0100] visible_content is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[CanvasAttrsTabTest_0100] invisible_content is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Canvas 3 is fully visible.');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Canvas 2 is completely invisible.');

      // 切换至tab one页面
      button = await driver.findComponent(ON.text('Tab one'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson1 = inspector.getInspectorByKey('visible_content');
      strJson2 = inspector.getInspectorByKey('invisible_content');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      console.info("[CanvasAttrsTabTest_0100] visible_content is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[CanvasAttrsTabTest_0100] invisible_content is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Canvas 1 is fully visible.');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Canvas 3 is completely invisible.');

      console.info('[CanvasAttrsTabTest_0100] END');
      done();
    });
  })
}

