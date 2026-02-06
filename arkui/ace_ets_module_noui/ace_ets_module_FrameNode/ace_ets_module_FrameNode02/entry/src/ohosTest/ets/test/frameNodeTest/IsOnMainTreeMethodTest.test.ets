/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function IsOnMainTreeMethodTest() {
  describe('IsOnMainTreeMethodTest', () => {
    
    beforeEach(async (done: Function) => {
      console.info('IsOnMainTreeMethodTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/IsOnMainTreeMethodPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get IsOnMainTreeMethodTest state pages:' + JSON.stringify(pages));
        if (!('IsOnMainTreeMethodPage' == pages.name)) {
          console.info('get IsOnMainTreeMethodTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(1000);
          console.info('push IsOnMainTreeMethodTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push IsOnMainTreeMethodTest page error:' + err);
      }
      console.info('IsOnMainTreeMethodTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('IsOnMainTreeMethodTest after each called');
    });

    /**
     * @tc.name   IsOnMainTreeMethodTest_0100
     * @tc.number SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_ISONMAINTREE_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IsOnMainTreeMethodTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('IsOnMainTreeMethodTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0100 Check FrameNodeTest_1');
      let button1 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest1')).assertTrue();
      AppStorage.delete('testFrameNodeTest1')

      console.info('IsOnMainTreeMethodTest_0100 Check FrameNodeTest_2');
      let button2 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_2'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest2')).assertFalse();
      AppStorage.delete('testFrameNodeTest2')

      console.info('IsOnMainTreeMethodTest_0100 Check FrameNodeTest_3');
      let button3 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_3'));
      await button3.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest3')).assertTrue();
      AppStorage.delete('testFrameNodeTest3')

      console.info('IsOnMainTreeMethodTest_0100 Check FrameNodeTest_4');
      let button4 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_4'));
      await button4.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest4')).assertTrue();
      AppStorage.delete('testFrameNodeTest4')

      console.info('IsOnMainTreeMethodTest_0100 Check rootNode');
      let button5 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_5'));
      await button5.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testrootNodeTest')).assertTrue();
      AppStorage.delete('testrootNodeTest')

      console.info('[IsOnMainTreeMethodTest_0100] END');
      done();
    });

    /**
     * @tc.name   IsOnMainTreeMethodTest_0200
     * @tc.number SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_ISONMAINTREE_0070
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IsOnMainTreeMethodTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('IsOnMainTreeMethodTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0200 Click DisposeTree');
      let button = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_10'));
      await button.click();
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0200 Check FrameNodeTest_1');
      let button1 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest1')).assertEqual(100026);
      AppStorage.delete('testFrameNodeTest1')

      console.info('IsOnMainTreeMethodTest_0200 Check FrameNodeTest_2');
      let button2 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_2'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest2')).assertFalse();
      AppStorage.delete('testFrameNodeTest2')

      console.info('IsOnMainTreeMethodTest_0200 Check FrameNodeTest_3');
      let button3 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_3'));
      await button3.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest3')).assertEqual(100026);
      AppStorage.delete('testFrameNodeTest3')

      console.info('IsOnMainTreeMethodTest_0200 Check FrameNodeTest_4');
      let button4 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_4'));
      await button4.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest4')).assertEqual(100026);
      AppStorage.delete('testFrameNodeTest4')

      console.info('IsOnMainTreeMethodTest_0200 Check rootNode');
      let button5 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_5'));
      await button5.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testrootNodeTest')).assertEqual(100026);
      AppStorage.delete('testrootNodeTest')

      console.info('[IsOnMainTreeMethodTest_0200] END');
      done();
    });

    /**
     * @tc.name   IsOnMainTreeMethodTest_0300
     * @tc.number SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_ISONMAINTREE_0090
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IsOnMainTreeMethodTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('IsOnMainTreeMethodTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0300 Click clearChildren');
      let button = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_8'));
      await button.click();
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0300 Check FrameNodeTest_1');
      let button1 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest1')).assertFalse();
      AppStorage.delete('testFrameNodeTest1')

      console.info('IsOnMainTreeMethodTest_0300 Check FrameNodeTest_2');
      let button2 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_2'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest2')).assertFalse();
      AppStorage.delete('testFrameNodeTest2')

      console.info('IsOnMainTreeMethodTest_0300 Check FrameNodeTest_3');
      let button3 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_3'));
      await button3.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest3')).assertFalse();
      AppStorage.delete('testFrameNodeTest3')

      console.info('IsOnMainTreeMethodTest_0300 Check FrameNodeTest_4');
      let button4 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_4'));
      await button4.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest4')).assertFalse();
      AppStorage.delete('testFrameNodeTest4')

      console.info('IsOnMainTreeMethodTest_0300 Check rootNode');
      let button5 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_5'));
      await button5.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testrootNodeTest')).assertTrue();
      AppStorage.delete('testrootNodeTest')

      console.info('[IsOnMainTreeMethodTest_0300] END');
      done();
    });

    /**
     * @tc.name   IsOnMainTreeMethodTest_0400
     * @tc.number SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_ISONMAINTREE_0110
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IsOnMainTreeMethodTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('IsOnMainTreeMethodTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0400 Click Show/Hide');
      let button = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_7'));
      await button.click();
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0400 Check FrameNodeTest_1');
      let button1 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest1')).assertFalse();
      AppStorage.delete('testFrameNodeTest1')

      console.info('IsOnMainTreeMethodTest_0400 Check FrameNodeTest_2');
      let button2 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_2'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest2')).assertFalse();
      AppStorage.delete('testFrameNodeTest2')

      console.info('IsOnMainTreeMethodTest_0400 Check FrameNodeTest_3');
      let button3 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_3'));
      await button3.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest3')).assertFalse();
      AppStorage.delete('testFrameNodeTest3')

      console.info('IsOnMainTreeMethodTest_0400 Check FrameNodeTest_4');
      let button4 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_4'));
      await button4.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest4')).assertFalse();
      AppStorage.delete('testFrameNodeTest4')

      console.info('IsOnMainTreeMethodTest_0400 Check rootNode');
      let button5 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_5'));
      await button5.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testrootNodeTest')).assertFalse();
      AppStorage.delete('testrootNodeTest')

      // reset
      console.info('IsOnMainTreeMethodTest_0400 Click Show/Hide');
      button = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_7'));
      await button.click();
      await CommonFunc.sleep(1000);

      console.info('[IsOnMainTreeMethodTest_0400] END');
      done();
    });

    /**
     * @tc.name   IsOnMainTreeMethodTest_0500
     * @tc.number SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_ISONMAINTREE_0140
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IsOnMainTreeMethodTest_0500', Level.LEVEL2, async (done: Function) => {
      console.info('IsOnMainTreeMethodTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0500 Click Dispose');
      let button = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_9'));
      await button.click();
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0500 Check FrameNodeTest_1');
      let button1 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest1')).assertTrue();
      AppStorage.delete('testFrameNodeTest1')

      console.info('IsOnMainTreeMethodTest_0500 Check FrameNodeTest_2');
      let button2 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_2'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest2')).assertFalse();
      AppStorage.delete('testFrameNodeTest2')

      console.info('IsOnMainTreeMethodTest_0500 Check FrameNodeTest_3');
      let button3 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_3'));
      await button3.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest3')).assertTrue();
      AppStorage.delete('testFrameNodeTest3')

      console.info('IsOnMainTreeMethodTest_0500 Check FrameNodeTest_4');
      let button4 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_4'));
      await button4.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testFrameNodeTest4')).assertTrue();
      AppStorage.delete('testFrameNodeTest4')

      console.info('IsOnMainTreeMethodTest_0500 Check rootNode');
      let button5 = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_5'));
      await button5.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('testrootNodeTest')).assertEqual(100026);
      AppStorage.delete('testrootNodeTest')

      console.info('[IsOnMainTreeMethodTest_0500] END');
      done();
    });

    /**
     * @tc.name   IsOnMainTreeMethodTest_0600
     * @tc.number SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_ISONMAINTREE_0130
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IsOnMainTreeMethodTest_0600', Level.LEVEL2, async (done: Function) => {
      console.info('IsOnMainTreeMethodTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('IsOnMainTreeMethodTest_0600 Click NullTest');
      let button = await driver.findComponent(ON.id('IsOnMainTreeMethodPage_btn_6'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('IsOnMainTreeMethodPage_nullTest')).assertEqual('TypeError: Cannot read property isOnMainTree of null');
      AppStorage.delete('IsOnMainTreeMethodPage_nullTest')

      console.info('[IsOnMainTreeMethodTest_0600] END');
      done();
    });

  })
}