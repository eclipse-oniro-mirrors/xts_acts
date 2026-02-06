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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function postTouchEventTest() {
  describe('postTouchEventTest', () => {
    beforeEach(async (done: Function) => {
      console.info('postTouchEventTest beforeEach start');
      try {
        router.clear();
        let pages = router.getState();
        console.info('get postTouchEventTest state pages:' + JSON.stringify(pages));
        if (!('postTouchEventTest' == pages.name)) {
          console.info('get postTouchEventTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/ReactiveBuilderNode/postTouchEventTest',
          })
          await CommonFunc.sleep(2000);
          console.info('push postTouchEventTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push postTouchEventTest page error:' + err);
      }
      console.info('postTouchEventTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('postTouchEventTest after each called');
    });

    /**
     * @tc.name   postTouchEventTest_0100
     * @tc.number postTouchEventTest_0100
     * @tc.desc   ReactiveBuilderNode set postTouchEventTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('postTouchEventTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[postTouchEventTest_0100] START');
      await CommonFunc.sleep(2000);
      // touch
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('textClick'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      console.info('[postTouchEventTest_0010]' + JSON.stringify(AppStorage.get('lastPostTouchEventResult')));
      expect(AppStorage.get('lastPostTouchEventResult')).assertEqual(false);
      console.info('[postTouchEventTest_0010] END');
      done();

    });

    /**
     * @tc.name   postTouchEventTest_0200
     * @tc.number postTouchEventTest_0200
     * @tc.desc   test postTouchEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('postTouchEventTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[postTouchEventTest_0200] START');
      await CommonFunc.sleep(2000);
      // touch
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('nodeTest'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      console.info('[postTouchEventTest_0200]' + JSON.stringify(AppStorage.get('lastPostTouchEventResult')));
      expect(AppStorage.get('lastPostTouchEventResult')).assertEqual(true);
      console.info('[postTouchEventTest_0200] END');
      done();

    });

  })
}
