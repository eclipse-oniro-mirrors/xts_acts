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

export default function ReuseRecycleContentTest() {
  describe('ReuseRecycleContentTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ReuseRecycleContentTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveComponentContent/ReuseRecycleContentTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ReuseRecycleContentTest state pages:' + JSON.stringify(pages));
        if (!('gestureEventTest' == pages.name)) {
          console.info('get ReuseRecycleContentTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ReuseRecycleContentTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ReuseRecycleContentTest page error:' + err);
      }
      console.info('ReuseRecycleContentTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ReuseRecycleContentTest after each called');
    });

    /**
     * @tc.name   ReuseRecycleContentTest_0100
     * @tc.number ReuseRecycleContentTest_0100
     * @tc.desc   ReuseRecycleContentTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ReuseRecycleContentTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ReuseRecycleContentTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('switch'));
      await button1.click();
      await CommonFunc.sleep(1000);
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('text2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[ReuseRecycleContentTest_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[ReuseRecycleContentTest_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('ReusableChildComponent reuseRecycle');
      console.info('[ReuseRecycleContentTest_0100] END');
      done();
    });
  })
}