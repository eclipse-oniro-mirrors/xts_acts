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

export default function AttachNodeAdapterBooleanTest() {
  describe('AttachNodeAdapterBooleanTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AttachNodeAdapterBooleanTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/AttachNodeAdapterBooleanTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AttachNodeAdapterBooleanTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get AttachNodeAdapterBooleanTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push AttachNodeAdapterBooleanTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AttachNodeAdapterBooleanTest page error:" + err);
      }
      console.info("AttachNodeAdapterBooleanTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AttachNodeAdapterBooleanTest after each called");
    });

    /**
     * @tc.name   AttachNodeAdapterBooleanTest_0100
     * @tc.number AttachNodeAdapterBooleanTest_0100
     * @tc.desc   attachNodeAdapter return test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AttachNodeAdapterBooleanTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('AttachNodeAdapterBooleanTest_0100 START');
      let driver = await Driver.create()
      expect(AppStorage.get('attachNodeAdapterTrue')).assertEqual(true);
      expect(AppStorage.get('attachNodeAdapterFalse')).assertEqual(false);
      AppStorage.delete('attachNodeAdapterTrue')
      AppStorage.delete('attachNodeAdapterFalse')
      console.info('[NodeAdapterGetAllAvailableItemsTest_0100] END');
      done();
    });

  })
}