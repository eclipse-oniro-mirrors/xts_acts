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

export default function BuilderNodeIsDisposedTest() {
  describe('BuilderNodeIsDisposedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("BuilderNodeIsDisposedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NodeReturn/BuilderNodeIsDisposedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info("get BuilderNodeIsDisposedTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get BuilderNodeIsDisposedTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push BuilderNodeIsDisposedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BuilderNodeIsDisposedTest page error:" + err);
      }
      console.info("BuilderNodeIsDisposedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("BuilderNodeIsDisposedTest after each called");
    });

    /**
     * @tc.name   BuilderNodeIsDisposedTest_0100
     * @tc.number BuilderNodeIsDisposedTest_0100
     * @tc.desc   frameNode: BuilderNode isDisposed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuilderNodeIsDisposedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('BuilderNodeIsDisposedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_BuilderNode_isDisposed'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_BuilderNode_dispose'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('btn_BuilderNode_isDisposed_build_again'));
      await button3.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('builderNodeIsDisposedBeforeBuild')).assertEqual(false);
      expect(AppStorage.get('builderNodeIsDisposedAfterBuild')).assertEqual(false);
      expect(AppStorage.get('builderNodeIsDisposed1')).assertEqual(false);
      expect(AppStorage.get('builderNodeIsDisposed2')).assertEqual(true);
      await button1.click();
      await CommonFunc.sleep(1000);
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('builderNodeIsDisposed1')).assertEqual(false);
      expect(AppStorage.get('builderNodeIsDisposed2')).assertEqual(true);
      AppStorage.delete('builderNodeIsDisposedBeforeBuild');
      AppStorage.delete('builderNodeIsDisposedAfterBuild');
      AppStorage.delete('builderNodeIsDisposed1');
      AppStorage.delete('builderNodeIsDisposed2');
      console.info('[BuilderNodeIsDisposedTest_0100] END');
      done();
    });

  })
}