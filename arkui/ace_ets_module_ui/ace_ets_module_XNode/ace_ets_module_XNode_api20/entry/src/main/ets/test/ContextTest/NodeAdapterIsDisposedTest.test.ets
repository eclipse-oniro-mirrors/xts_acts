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

export default function NodeAdapterIsDisposedTest() {
  describe('NodeAdapterIsDisposedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("NodeAdapterIsDisposedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/NodeAdapterIsDisposedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info("get NodeAdapterIsDisposedTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get NodeAdapterIsDisposedTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push NodeAdapterIsDisposedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NodeAdapterIsDisposedTest page error:" + err);
      }
      console.info("NodeAdapterIsDisposedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NodeAdapterIsDisposedTest after each called");
    });

    /**
     * @tc.name   NodeAdapterIsDisposedTest_0100
     * @tc.number NodeAdapterIsDisposedTest_0100
     * @tc.desc   frameNode: NodeAdapter isDisposed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NodeAdapterIsDisposedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('NodeAdapterIsDisposedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_nodeAdapter_isDisposed'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_nodeAdapter_dispose'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('nodeAdapterIsDisposed1')).assertEqual(false);
      expect(AppStorage.get('nodeAdapterIsDisposed2')).assertEqual(true);
      AppStorage.delete('nodeAdapterIsDisposed1')
      AppStorage.delete('nodeAdapterIsDisposed2')
      console.info('[NodeAdapterIsDisposedTest_0100] END');
      done();
    });
  })
}