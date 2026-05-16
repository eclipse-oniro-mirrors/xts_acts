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
export default function AttachDetachRebindTest() {
  describe('AttachDetachRebindTest', () => {
    beforeAll(() => {
      console.info("AttachDetachRebindTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.drawAPI13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("AttachDetachRebindTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CanvasRenderingContext2D/AttachDetachRebindTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AttachDetachRebindTest state pages:" + JSON.stringify(pages));
        if (!("AttachDetachRebindTes" == pages.name)) {
          console.info("get AttachDetachRebindTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AttachDetachRebindTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AttachDetachRebindTest page error:" + err);
      }
      console.info("AttachDetachRebindTest beforeEach end");
    });
    
    



    /**
     * @tc.number   AttachDetachRebindTest_static_0100
     * @tc.name     AttachDetachRebindTest_static_0100
     * @tc.desc     AttachDetachRebindTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('AttachDetachRebindTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('AttachDetachRebindTest_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);

      // aboutToAppear中已绑定“onAttach”和“onDetach”
      // 页面加载，触发“onAttach”回调
      let strJson = inspector.getInspectorByKey('attach_detach_content');
      await CommonFunc.sleep(1000);
      console.info('[wll]'+strJson)    //  let strJson = inspector.getInspectorByKey('attach_detach_content');取不到值
      let obj = JSON.parseJsonElement(strJson);
      console.info("页面加载，触发onAttach回调");
      console.info("[AttachDetachRebindTest_0100] content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onAttach');

      // 点击按钮绑定新的canvas，原cavas解绑触发“onDetach”回调，新canvas绑定触发“onAttach”回调
      let button = await driver.findComponent(ON.id('change_canvas'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('attach_detach_content');
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(strJson);
      console.info("点击按钮绑定新的canvas，原cavas解绑触发onDetach回调，新canvas绑定触发onAttach回调");
      console.info("[AttachDetachRebindTest_0100] content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onAttach onDetach onAttach');

      console.info('[AttachDetachRebindTest_0100] END');
      done();
    });
  })
}

