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

export default function GetNodeByIdNullTest() {
  describe('GetNodeByIdNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetNodeByIdNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/GetNodeByIdNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetNodeByIdNullTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetNodeByIdNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GetNodeByIdNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetNodeByIdNullTest page error:" + err);
      }
      console.info("GetNodeByIdNullTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetNodeByIdNullTest after each called");
    });

    /**
     * @tc.name   GetNodeByIdNullTest_0100
     * @tc.number GetNodeByIdNullTest_0100
     * @tc.desc   getNodeById null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetNodeByIdNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GetNodeByIdNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_click_null'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getFrameNodeByIdNullValue')).assertEqual(null);
      expect(AppStorage.get('getAttachedFrameNodeByIdNullValue')).assertEqual(null);
      expect(AppStorage.get('getFrameNodeByUniqueIdNullValue')).assertEqual(null);
      expect(AppStorage.get('getNavigationInfoByUniqueIdUndefined')).assertEqual(undefined);
      AppStorage.delete('getFrameNodeByIdNullValue')
      AppStorage.delete('getAttachedFrameNodeByIdNullValue')
      AppStorage.delete('getFrameNodeByUniqueIdNullValue')
      AppStorage.delete('getNavigationInfoByUniqueIdUndefined')
      console.info('[GetNodeByIdNullTest_0100] END');
      done();
    });

  })
}