/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function SurfaceRotationOptionsLockTest() {
  describe('SurfaceRotationOptionsLockTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SurfaceRotationOptionsLock beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/XComponent/surfaceRotationOptionsLock",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SurfaceRotationOptionsLock state pages: " + JSON.stringify(pages));
        if (!("surfaceRotationOptionsLock" == pages.name)) {
          console.info("get SurfaceRotationOptionsLock state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SurfaceRotationOptionsLock success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SurfaceRotationOptionsLock page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SurfaceRotationOptionsLockTest_0010
     * @tc.name      SurfaceRotationOptionsLockTest_0010
     * @tc.desc      Xcomponent: get the api of SurfaceRotationOptions.Lock
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SurfaceRotationOptionsLockTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('SurfaceRotationOptionsLockTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SurfaceRotationOptionsLock');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[SurfaceRotationOptionsLockTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('Lock:true');
      console.info('[SurfaceRotationOptionsLockTest_0010] END');
      done();
    }); 
  })
}

