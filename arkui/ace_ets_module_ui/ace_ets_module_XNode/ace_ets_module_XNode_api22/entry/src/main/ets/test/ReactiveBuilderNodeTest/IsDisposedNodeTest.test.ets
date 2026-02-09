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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function IsDisposedNodeTest() {
  describe('IsDisposedNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('IsDisposedNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveBuilderNode/IsDisposedNodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get IsDisposedNodeTest state pages:' + JSON.stringify(pages));
        if (!('IsDisposedNodeTest' == pages.name)) {
          console.info('get IsDisposedNodeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push IsDisposedNodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push IsDisposedNodeTest page error:' + err);
      }
      console.info('IsDisposedNodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('IsDisposedNodeTest after each called');
    });

    /**
     * @tc.name   IsDisposedNodeTest_0100
     * @tc.number IsDisposedNodeTest_0100
     * @tc.desc   ReactiveBuilderNode IsDisposedNodeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IsDisposedNodeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('IsDisposedNodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_BuilderNode_isDisposed'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_BuilderNode_dispose'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('builderNodeIsDisposed1')).assertEqual(false);
      expect(AppStorage.get('builderNodeIsDisposed2')).assertEqual(true);
      AppStorage.delete('builderNodeIsDisposed1')
      AppStorage.delete('builderNodeIsDisposed2')
      console.info('[BuilderNodeIsDisposedTest_0100] END');
      done();
    });
  })
}