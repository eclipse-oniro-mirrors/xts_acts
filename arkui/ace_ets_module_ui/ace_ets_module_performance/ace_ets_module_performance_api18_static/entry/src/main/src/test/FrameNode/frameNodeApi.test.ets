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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function frameNodeApi() {
  describe('frameNodeApi', () => {
   beforeAll(() => {
      console.info("frameNodeApi beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.performance.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("frameNodeApi beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/FrameNode/frameNodeApi',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get frameNodeApi state pages:" + JSON.stringify(pages));
        if (!("checkboxGroupOnChangeModifier" == pages.name)) {
          console.info("get frameNodeApi pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push frameNodeApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeApi page error:" + err);
      }
      console.info("frameNodeApi beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("frameNodeApi after each called");
    });

    
    


/**
     * @tc.number   frameNodeApi_static_0100
     * @tc.name     frameNodeApi_static_0100
     * @tc.desc     frameNodeApi_static_0100
     * @tc.level    Level.LEVEL3
     */
it('frameNodeApi_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {

      console.info('frameNodeApi_static_0100 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('frameNodeApi_Bind'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(4000);
      let button2 = await driver.findComponent(ON.id('frameNodeApi_Bind'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(4000);
      expect(AppStorage.get<Int>('reuse')!).assertEqual(1);
      expect(AppStorage.get<Int>('recycle')!).assertEqual(1);
      done();
    });
  })
}
