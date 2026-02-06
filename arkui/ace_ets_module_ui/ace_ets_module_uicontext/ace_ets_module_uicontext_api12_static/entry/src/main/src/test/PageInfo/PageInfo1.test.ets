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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'

export default function PageInfo1() {
  describe('PageInfo1', () => {
    beforeAll(() => {
      console.info("PageInfo1 beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("PageInfo1 beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/PageInfo/PageInfo1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get PageInfo1 state pages:" + JSON.stringify(pages));
        if (!("PageInfo1" == pages.name)) {
          console.info("get PageInfo1 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PageInfo1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PageInfo1 page error:" + err);
      }
      console.info("PageInfo1 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PageInfo1 after each called");
    });
    
    
/**
     * @tc.number   PageInfo1_static_0100
     * @tc.name     PageInfo1_static_0100
     * @tc.desc     PageInfo1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PageInfo1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[PageInfo1_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('PageInfo1_pageOne'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[PageInfo1_static_0100] btn1 click');
      let btn2 = await driver.findComponent(ON.id('PageInfo1_get'));
      await (btn2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[PageInfo1_static_0100] btn2 click');
      let strJson1 = inspector.getInspectorByKey('PageInfo1_text1');
      await CommonFunc.sleep(1000);
      console.info("[PageInfo1_static_0100] obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('MainAbility/pages/PageInfo/PageInfo1');
      let strJson2 = inspector.getInspectorByKey('PageInfo1_text2');
      await CommonFunc.sleep(1000);
      console.info("[PageInfo1_static_0100] obj2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('pageOne');
      console.info('[PageInfo1_static_0100] END');
      done();
    });
  })
}