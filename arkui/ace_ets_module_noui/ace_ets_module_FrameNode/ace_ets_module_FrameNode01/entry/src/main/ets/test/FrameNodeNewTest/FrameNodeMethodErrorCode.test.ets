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

export default function FrameNodeMethodErrorCodeTest() {
  describe('FrameNodeMethodErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('FrameNodeMethodErrorCodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeNew/FrameNodeMethodErrorCodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get FrameNodeMethodErrorCodeTest state pages:' + JSON.stringify(pages));
        if (!('gestureEventTest' == pages.name)) {
          console.info('get FrameNodeMethodErrorCodeTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push FrameNodeMethodErrorCodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push FrameNodeMethodErrorCodeTest page error:' + err);
      }
      console.info('FrameNodeMethodErrorCodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('FrameNodeMethodErrorCodeTest after each called');
    });

    /**
     * @tc.name   FrameNodeMethodErrorCodeTest_0100
     * @tc.number FrameNodeMethodErrorCodeTest_0100
     * @tc.desc   frameNode: FrameNode Method ErrorCode Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrameNodeMethodErrorCodeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('FrameNodeMethodErrorCodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('check_error_appendChild'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('check_error_insertChildAfter'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('check_error_removeChild'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('check_error_clearChildren'));
      await button4.click();
      await CommonFunc.sleep(1000);
      let strJson1: string = getInspectorByKey('error_str_appendChild');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info('[FrameNodeMethodErrorCodeTest_0100] content obj1 is:' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('100021:The FrameNode is not modifiable.');
      let strJson2: string = getInspectorByKey('error_str_insertChildAfter');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info('[FrameNodeMethodErrorCodeTest_0100] content obj2 is:' + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('100021:The FrameNode is not modifiable.');
      let strJson3: string = getInspectorByKey('error_str_removeChild');
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info('[FrameNodeMethodErrorCodeTest_0100] content obj3 is:' + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('100021:The FrameNode is not modifiable.');
      let strJson4: string = getInspectorByKey('error_str_clearChildren');
      let obj4: Record<string, ESObject> = JSON.parse(strJson4);
      console.info('[FrameNodeMethodErrorCodeTest_0100] content obj4 is:' + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual('100021:The FrameNode is not modifiable.');
      console.info('[FrameNodeMethodErrorCodeTest_0100] END');
      done();
    });
  })
}