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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function onTerminatedJsunit() {
  describe('onTerminatedJsunit', function () {
    beforeEach(async function (done) {
      console.info("onTerminated beforeEach start");
      let options = {
        url: "MainAbility/pages/EmbeddedComponent/onTerminated",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onTerminated state pages: " + JSON.stringify(pages));
        if (!("onTerminated" == pages.name)) {
          console.info("get onTerminated state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onTerminated success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onTerminated page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    onTerminatedTest_0010
     * @tc.name      onTerminatedTest_0010
     * @tc.desc      EmbeddedComponent: get the api of onTerminated
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onTerminatedTest_0010', 0, async function (done) {
      console.info('onTerminatedTest_0010 START');
      let strJson = getInspectorByKey('onTerminated_text');
      let obj = JSON.parse(strJson);
      console.info("[onTerminatedTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onTerminated succ');
      console.info('[onTerminatedTest_0010] END');
      done();
    });
  })
}

