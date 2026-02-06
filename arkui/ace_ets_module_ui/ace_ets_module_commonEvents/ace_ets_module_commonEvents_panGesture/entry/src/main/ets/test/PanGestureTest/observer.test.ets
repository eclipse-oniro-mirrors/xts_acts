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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function PanGestureTest() {
  describe('PanGestureTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/observer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PanGestureTest state pages: ' + JSON.stringify(pages));
        if (!('observer' == pages.name)) {
          console.info('get PanGestureTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push PanGestureTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PanGestureTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('observer after each called');
    });

    /**
     * @tc.name   observerTest_0010
     * @tc.number observerTest_0010
     * @tc.desc   observer.on test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('observerTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('observerTest_0010 START');
      let driver = await Driver.create();

      let text = await driver.findComponent(ON.id('panGesture'));
      let button = await driver.findComponent(ON.id('button'));
      await text.dragTo(button);

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onContent');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[observerTest_0010] observer: ' + JSON.stringify(obj.$attrs.content));
      expect(JSON.stringify(obj.$attrs.content) == '').assertFalse();
      console.info('[observerTest_0010] END');
      done();
    });

    /**
     * @tc.name   observerTest_0020
     * @tc.number observerTest_0020
     * @tc.desc   observer.off test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('observerTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('observerTest_0020 START');
      let driver = await Driver.create();

      let text1 = await driver.findComponent(ON.id('panGesture'));
      let button1 = await driver.findComponent(ON.id('button'));
      await text1.dragTo(button1);

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('offContent');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[observerTest_0020] observer: ' + JSON.stringify(obj.$attrs.content));
      expect(JSON.stringify(obj.$attrs.content) == 'off').assertFalse();
      console.info('[observerTest_0020] END');
      done();
    });
  })
}