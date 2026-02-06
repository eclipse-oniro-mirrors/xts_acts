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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect} from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function postFrameCallbackTest() {
  describe('postFrameCallbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info('postFrameCallbackTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PostFrame/postFrameCallbackTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get postFrameCallbackTest state pages:' + JSON.stringify(pages));
        if (!('gestureEventTest' == pages.name)) {
          console.info('get postFrameCallbackTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push postFrameCallbackTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push postFrameCallbackTest page error:' + err);
      }
      console.info('postFrameCallbackTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('postFrameCallbackTest after each called');
    });

    /**
     * @tc.number    postFrameCallbackTest_0100
     * @tc.name      postFrameCallbackTest_0100
     * @tc.desc      post FrameCallback Test
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('postFrameCallbackTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('postFrameCallbackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('postFrameCallback_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('postDelayedFrameCallback_id'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('postDelayedFrameCallback_null_id'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('postFrameCallback_value_id'));
      await button4.click();
      await CommonFunc.sleep(1000);
      let button5 = await driver.findComponent(ON.id('postDelayedFrameCallback_value_id'));
      await button5.click();
      await CommonFunc.sleep(1000);
      let button6 = await driver.findComponent(ON.id('postDelayedFrameCallback_null_value_id'));
      await button6.click();
      await CommonFunc.sleep(1000);

      let strJson1: string = getInspectorByKey('result1_id');
      let strJson2: string = getInspectorByKey('result2_id');
      let strJson3: string = getInspectorByKey('result3_id');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[postFrameCallbackTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[postFrameCallbackTest_0100] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[postFrameCallbackTest_0100] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('normTask');
      expect(obj2.$attrs.content).assertEqual('delayTask');
      expect(obj3.$attrs.content).assertEqual('delayTask');
      console.info('[postFrameCallbackTest_0100] END');
      done();
    });

  })
}