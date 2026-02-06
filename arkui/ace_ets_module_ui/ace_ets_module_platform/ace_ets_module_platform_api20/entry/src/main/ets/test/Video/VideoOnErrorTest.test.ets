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

 import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function VideoOnErrorTest() {
  describe('VideoOnErrorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoOnErrorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoOnErrorPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoOnErrorTest state pages:" + JSON.stringify(pages));
        if (!("VideoOnErrorPage" == pages.name)) {
          console.info("get VideoOnErrorTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoOnErrorTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoOnErrorTest page error:" + err);
      }
      console.info("VideoOnErrorTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoOnErrorTest after each called");
    });
    /**
     * @tc.name   VideoOnErrorTest_0100
     * @tc.number VideoOnErrorTest_0100
     * @tc.desc   Test VideoOnErrorTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoOnErrorTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[VideoOnErrorTest_0100] START');

      let strJson = getInspectorByKey('VideoErrorCodeContent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[VideoOnErrorTest_0100] VideoErrorCode is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('103602');

      console.info('[VideoOnErrorTest_0100] END');
      done();
    });
  })
}