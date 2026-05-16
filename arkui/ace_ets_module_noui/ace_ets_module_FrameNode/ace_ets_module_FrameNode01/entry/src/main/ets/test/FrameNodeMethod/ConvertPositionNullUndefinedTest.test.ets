/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function ConvertPositionNullUndefinedTest() {
  describe('ConvertPositionNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ConvertPositionNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeMethod/ConvertPositionNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ConvertPositionNullUndefinedTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get ConvertPositionNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ConvertPositionNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ConvertPositionNullUndefinedTest page error:" + err);
      }
      console.info("ConvertPositionNullUndefinedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ConvertPositionNullUndefinedTest after each called");
    });

    /**
     * @tc.number    ConvertPositionNullUndefinedTest_0100
     * @tc.name      ConvertPositionNullUndefinedTest_0100
     * @tc.desc      convertPosition null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('ConvertPositionNullUndefinedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ConvertPositionNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('convertPosition_null_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('ConvertPositionPositionNull')).assertEqual(100025);
      AppStorage.delete('ConvertPositionPositionNull')
      expect(AppStorage.get('ConvertPositionPositionUndefined')).assertEqual(100025);
      AppStorage.delete('ConvertPositionPositionUndefined')
      expect(AppStorage.get('ConvertPositionTargetNodeNull')).assertEqual(100025);
      AppStorage.delete('ConvertPositionTargetNodeNull')
      expect(AppStorage.get('ConvertPositionTargetNodeUndefined')).assertEqual(100025);
      AppStorage.delete('ConvertPositionTargetNodeUndefined')
      console.info('[ConvertPositionNullUndefinedTest_0100] END');
      done();
    });

  })
}