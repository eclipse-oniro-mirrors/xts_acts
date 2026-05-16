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

export default function APIcomponentSnapshotGetSync() {
  describe('APIcomponentSnapshotGetSync', () => {
    beforeAll(() => {
      console.info("APIcomponentSnapshotGetSync beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("APIcomponentSnapshotGetSync beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/componentSnapshot/APIcomponentSnapshotGetSync',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get APIcomponentSnapshotGetSync state pages:" + JSON.stringify(pages));
        if (!("APIcomponentSnapshotGetSync" == pages.name)) {
          console.info("get APIcomponentSnapshotGetSync pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push APIcomponentSnapshotGetSync page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIcomponentSnapshotGetSync page error:" + err);
      }
      console.info("APIcomponentSnapshotGetSync beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIcomponentSnapshotGetSync after each called");
    });
    
    
/**
     * @tc.number   APIcomponentSnapshotGetSync_static_0100
     * @tc.name     APIcomponentSnapshotGetSync_static_0100
     * @tc.desc     APIcomponentSnapshotGetSync_static_0100
     * @tc.level    Level.LEVEL0
     */
it('APIcomponentSnapshotGetSync_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[APIcomponentSnapshotGetSync_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn1 = await (scrollBar?.scrollSearch(ON.id('APIcomponentSnapshotGetSync_button')) as Promise<Component|null>);
      await (btn1!.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      console.info('[APIcomponentSnapshotGetSync_static_0100] btn1 click');
      let strJson1 = inspector.getInspectorByKey('APIcomponentSnapshotGetSync_text');
      await CommonFunc.sleep(1000);
      console.info("[APIcomponentSnapshotGetSync_static_0100] obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[APIcomponentSnapshotGetSync_static_0100] obj2 is: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('end');
      console.info('[APIcomponentSnapshotGetSync_static_0100] END');
      done();
    });
  })
}