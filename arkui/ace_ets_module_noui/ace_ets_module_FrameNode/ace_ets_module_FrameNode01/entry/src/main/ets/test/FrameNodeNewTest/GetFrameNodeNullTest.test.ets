/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function GetFrameNodeNullTest() {
  describe('GetFrameNodeNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetFrameNodeNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeNew/GetFrameNodeNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetFrameNodeNullTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetFrameNodeNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GetFrameNodeNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetFrameNodeNullTest page error:" + err);
      }
      console.info("GetFrameNodeNullTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetFrameNodeNullTest after each called");
    });

    /**
     * @tc.name   GetFrameNodeNullTest_0100
     * @tc.number GetFrameNodeNullTest_0100
     * @tc.desc   getFrameNode null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GetFrameNodeNullTest_0100 START');
      expect(AppStorage.get('getFrameNodeNull')).assertEqual(null);
      AppStorage.delete('getFrameNodeNull')
      console.info('[GetFrameNodeNullTest_0100] END');
      done();
    });

  })
}