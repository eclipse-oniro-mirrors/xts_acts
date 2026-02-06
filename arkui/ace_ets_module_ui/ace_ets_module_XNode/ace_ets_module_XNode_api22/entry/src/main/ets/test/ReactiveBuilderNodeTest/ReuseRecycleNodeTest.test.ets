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

export default function ReuseRecycleNodeTest() {
  describe('ReuseRecycleNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ReuseRecycleNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveBuilderNode/ReuseRecycleNodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ReuseRecycleNodeTest state pages:' + JSON.stringify(pages));
        if (!('gestureEventTest' == pages.name)) {
          console.info('get ReuseRecycleNodeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ReuseRecycleNodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ReuseRecycleNodeTest page error:' + err);
      }
      console.info('ReuseRecycleNodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ReuseRecycleNodeTest after each called');
    });

    /**
     * @tc.name   ReuseRecycleNodeTest_0100
     * @tc.number ReuseRecycleNodeTest_0100
     * @tc.desc   ReuseRecycleNodeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ReuseRecycleNodeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ReuseRecycleNodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('switchButton'));
      await button1.click();
      await CommonFunc.sleep(1000);
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('textReuseRecycle');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[ReuseRecycleNodeTest_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[ReuseRecycleNodeTest_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('ReusableChildComponent reuseRecycle');
      console.info('[ReuseRecycleNodeTest_0100] END');
      done();
    });
  })
}

