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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
export default function SurfaceRotationOptionsLockTest() {
  describe('SurfaceRotationOptionsLockTest', () => {
    beforeAll(() => {
      
      
      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SurfaceRotationOptionsLock beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/XComponent/surfaceRotationOptionsLock",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SurfaceRotationOptionsLock state pages: " + JSON.stringify(pages));
        if (!("surfaceRotationOptionsLock" == pages.name)) {
          console.info("get SurfaceRotationOptionsLock state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SurfaceRotationOptionsLock page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SurfaceRotationOptionsLockTest_static_0010
     * @tc.name     SurfaceRotationOptionsLockTest_static_0010
     * @tc.desc     SurfaceRotationOptionsLockTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('SurfaceRotationOptionsLockTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SurfaceRotationOptionsLockTest_static_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SurfaceRotationOptionsLock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SurfaceRotationOptionsLockTest_static_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('Lock:true');
      console.info('[SurfaceRotationOptionsLockTest_static_0010] END');
      done();
    });
  })
}

