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

export default function FrameNodeTest() {
  describe('FrameNodeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/framenode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get FrameNodeTest state pages: ' + JSON.stringify(pages));
        if (!('framenode' == pages.name)) {
          console.info('get FrameNodeTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push FrameNodeTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push FrameNodeTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('FrameNodeTest after each called');
    });

    /**
     * @tc.number    FrameNodeTest_0010
     * @tc.name      FrameNodeTest_0010
     * @tc.desc      FrameNode addSupportedUIStates NORMAL succ
     * @tc.level:    Level 1
     */
    it('FrameNodeTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeTest_0010 START');
      let driver = await Driver.create();

      let button1 = await driver.findComponent(ON.id('buttonTest'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('buttonTest');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[FrameNodeTest_0010] label: ' + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('NORMAL');
      console.info('[FrameNodeTest_0010] END');
      done();
    });

    /**
     * @tc.number    FrameNodeTest_0020
     * @tc.name      FrameNodeTest_0020
     * @tc.desc      FrameNode addSupportedUIStates PRESSED succ
     * @tc.level:    Level 1
     */
    it('FrameNodeTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeTest_0020 START');
      let driver1 = await Driver.create();

      let button1 = await driver1.findComponent(ON.id('buttonTest'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('buttonTest');
      let obj1: ESObject = JSON.parse(strJson1);

      console.info('[FrameNodeTest_0020] backgroundColor: ' + JSON.stringify(obj1.$attrs.backgroundColor));
      expect(obj1.$attrs.backgroundColor).assertEqual('#FFFF0000');
      console.info('[FrameNodeTest_0020] END');
      done();
    });

    /**
     * @tc.number    FrameNodeTest_0030
     * @tc.name      FrameNodeTest_0030
     * @tc.desc      FrameNode addSupportedUIStates FOCUSED succ
     * @tc.level:    Level 1
     */
    it('FrameNodeTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeTest_0030 START');
      let driver2 = await Driver.create();
      await driver2.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let button1 = await driver2.findComponent(ON.id('buttonTest'));
      let strJson2 = getInspectorByKey('buttonTest');
      let obj2: ESObject = JSON.parse(strJson2);

      console.info('[FrameNodeTest_0030] label: ' + JSON.stringify(obj2.$attrs.label));
      expect(obj2.$attrs.label).assertEqual('FOCUSED');
      console.info('[FrameNodeTest_0030] END');
      done();
    });

    /**
     * @tc.number    FrameNodeTest_0040
     * @tc.name      FrameNodeTest_0040
     * @tc.desc      FrameNode addSupportedUIStates DISABLED succ
     * @tc.level:    Level 1
     */
    it('FrameNodeTest_0040', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeTest_0040 START');
      let driver3 = await Driver.create();

      let button2 = await driver3.findComponent(ON.id('buttonDis'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let button1 = await driver3.findComponent(ON.id('buttonTest'));
      let strJson3 = getInspectorByKey('buttonTest');
      let obj3: ESObject = JSON.parse(strJson3);

      console.info('[FrameNodeTest_0040] label: ' + JSON.stringify(obj3.$attrs.label));
      expect(obj3.$attrs.label).assertEqual('DISABLED');
      console.info('[FrameNodeTest_0040] END');
      done();
    });

    /**
     * @tc.number    FrameNodeTest_0050
     * @tc.name      FrameNodeTest_0050
     * @tc.desc      FrameNode removeSupportedUIStates succ
     * @tc.level:    Level 1
     */
    it('FrameNodeTest_0050', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeTest_0050 START');
      let driver4 = await Driver.create();
      
      let button2 = await driver4.findComponent(ON.id('buttonDis'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let button3 = await driver4.findComponent(ON.id('remove'));
      await button3.click();
      await CommonFunc.sleep(1000);

      let button1 = await driver4.findComponent(ON.id('buttonTest'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson4 = getInspectorByKey('buttonTest');
      let obj4: ESObject = JSON.parse(strJson4);

      console.info('[FrameNodeTest_0050] label: ' + JSON.stringify(obj4.$attrs.label));
      expect(obj4.$attrs.label).assertEqual('NORMAL');
      console.info('[FrameNodeTest_0050] END');
      done();
    });
  })
}