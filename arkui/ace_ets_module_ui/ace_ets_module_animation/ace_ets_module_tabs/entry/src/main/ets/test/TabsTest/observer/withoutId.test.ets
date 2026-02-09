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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
const SLEEP_TIME = 1000;

export default function withoutIdTest() {
  describe('withoutIdTest', () => {
    beforeEach(async (done: Function) => {
      console.info("withoutIdTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get withoutIdTest state pages:" + JSON.stringify(pages));
        if (!("withoutId" == pages.name)) {
          console.info("withoutIdTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/observer/withoutId"})
          await CommonFunc.sleep(2000);
          console.info("push withoutIdTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push withoutIdTest page error:" + err);
      }
      console.info("withoutIdTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("withoutIdTest after each called");
    });

/**
     * @tc.number: test_tabs_uiObserverWithoutIdTest_001
     * @tc.name   test_tabs_uiObserverWithoutIdTest_001
     * @tc.desc   Monitor changes in the tabs component,Click the 'Add' button, the index value changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_tabs_uiObserverWithoutIdTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('test_tabs_uiObserverWithoutIdTest_001 START');
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('idGet'));
      await btn1.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson1: string = getInspectorByKey('textIndex');
      console.info('test_tabs_uiObserverWithoutIdTest_001 ' + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_001 content1: " + JSON.parse(strJson1).$attrs.content);
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');
      let strJson2: string = getInspectorByKey('textTabContentId');
      console.info('test_tabs_uiObserverWithoutIdTest_001 ' + JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_001 content2: " + JSON.parse(strJson2).$attrs.content);
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('""');
      let strJson3: string = getInspectorByKey('textTabContentUniqueId');
      console.info('test_tabs_uiObserverWithoutIdTest_001 ' + JSON.stringify(JSON.parse(strJson3)));
      expect(JSON.parse(strJson3).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_001 content3: " + JSON.parse(strJson3).$attrs.content);
      expect(JSON.parse(strJson3).$attrs.content > 0).assertTrue();
      let strJson4: string = getInspectorByKey('textState');
      console.info('test_tabs_uiObserverWithoutIdTest_001 ' + JSON.stringify(JSON.parse(strJson4)));
      expect(JSON.parse(strJson4).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_001 content4: " + JSON.parse(strJson4).$attrs.content);
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('0');
      let strJson5: string = getInspectorByKey('textId');
      console.info('test_tabs_uiObserverWithoutIdTest_001 ' + JSON.stringify(JSON.parse(strJson5)));
      expect(JSON.parse(strJson5).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_001 content5: " + JSON.parse(strJson5).$attrs.content);
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('"tab1"');
      let strJson6: string = getInspectorByKey('textUniqueId');
      console.info('test_tabs_uiObserverWithoutIdTest_002 ' + JSON.stringify(JSON.parse(strJson6)));
      expect(JSON.parse(strJson6).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_002 content6: " + JSON.parse(strJson6).$attrs.content);
      expect(JSON.parse(strJson6).$attrs.content > 0).assertTrue();
      console.info('test_tabs_uiObserverWithoutIdTest_001 END');
      done();
    });

    /**
     * @tc.number test_tabs_uiObserverWithoutIdTest_002
     * @tc.name   test_tabs_uiObserverWithoutIdTest_002
     * @tc.desc   Cancel listening for changes in the tabs component,
     *            Click the 'add' button, The index value will not change
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_tabs_uiObserverWithoutIdTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('test_tabs_uiObserverWithoutIdTest_002 START');
      let driver: Driver = Driver.create();
      let btn5 = await driver.findComponent(ON.id('add'));
      await btn5.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn6 = await driver.findComponent(ON.id('idGet'));
      await btn6.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson01: string = getInspectorByKey('textIndex');
      console.info('test_tabs_uiObserverWithoutIdTest_002 ' + JSON.stringify(JSON.parse(strJson01)));
      expect(JSON.parse(strJson01).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_002 content1: " + JSON.parse(strJson01).$attrs.content);
      expect(JSON.parse(strJson01).$attrs.content).assertEqual('1');
      let strJson02: string = getInspectorByKey('textTabContentId');
      console.info('test_tabs_uiObserverWithoutIdTest_002 ' + JSON.stringify(JSON.parse(strJson02)));
      expect(JSON.parse(strJson02).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_002 content2: " + JSON.parse(strJson02).$attrs.content);
      expect(JSON.parse(strJson02).$attrs.content).assertEqual('""');
      let strJson03: string = getInspectorByKey('textTabContentUniqueId');
      console.info('test_tabs_uiObserverWithoutIdTest_002 ' + JSON.stringify(JSON.parse(strJson03)));
      expect(JSON.parse(strJson03).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_002 content3: " + JSON.parse(strJson03).$attrs.content);
      expect(JSON.parse(strJson03).$attrs.content > 0).assertTrue();
      let strJson04: string = getInspectorByKey('textState');
      console.info('test_tabs_uiObserverWithoutIdTest_002 ' + JSON.stringify(JSON.parse(strJson04)));
      expect(JSON.parse(strJson04).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_002 content4: " + JSON.parse(strJson04).$attrs.content);
      expect(JSON.parse(strJson04).$attrs.content).assertEqual('0');
      let strJson05: string = getInspectorByKey('textId');
      console.info('test_tabs_uiObserverWithoutIdTest_002 ' + JSON.stringify(JSON.parse(strJson05)));
      expect(JSON.parse(strJson05).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_002 content5: " + JSON.parse(strJson05).$attrs.content);
      expect(JSON.parse(strJson05).$attrs.content).assertEqual('"tab1"');
      let strJson06: string = getInspectorByKey('textUniqueId');
      console.info('test_tabs_uiObserverWithoutIdTest_002 ' + JSON.stringify(JSON.parse(strJson06)));
      expect(JSON.parse(strJson06).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_002 content6: " + JSON.parse(strJson06).$attrs.content);
      expect(JSON.parse(strJson06).$attrs.content > 0).assertTrue();
      let strJson07: string = getInspectorByKey('textLastIndex');
      console.info('test_tabs_uiObserverWithoutIdTest_002 ' + JSON.stringify(JSON.parse(strJson07)));
      expect(JSON.parse(strJson07).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_002 content7: " + JSON.parse(strJson07).$attrs.content);
      expect(JSON.parse(strJson07).$attrs.content).assertEqual('0');
      console.info('test_tabs_uiObserverWithoutIdTest_002 END');
      done();
    });

    /**
     * @tc.number test_tabs_uiObserverWithoutIdTest_003
     * @tc.name   test_tabs_uiObserverWithoutIdTest_003
     * @tc.desc   Test other tabs for changes, index value will not change
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_tabs_uiObserverWithoutIdTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('test_tabs_uiObserverWithoutIdTest_003 START');
      let driver: Driver = Driver.create();
      let btn8 = await driver.findComponent(ON.text('Orange'));
      await btn8.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn9 = await driver.findComponent(ON.id('idGet'));
      await btn9.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson001: string = getInspectorByKey('textIndex');
      console.info('test_tabs_uiObserverWithoutIdTest_003 ' + JSON.stringify(JSON.parse(strJson001)));
      expect(JSON.parse(strJson001).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_003 content1: " + JSON.parse(strJson001).$attrs.content);
      expect(JSON.parse(strJson001).$attrs.content).assertEqual('3');
      let strJson002: string = getInspectorByKey('textTabContentId');
      console.info('test_tabs_uiObserverWithoutIdTest_003 ' + JSON.stringify(JSON.parse(strJson002)));
      expect(JSON.parse(strJson002).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_003 content2: " + JSON.parse(strJson002).$attrs.content);
      expect(JSON.parse(strJson002).$attrs.content).assertEqual('""');
      let strJson003: string = getInspectorByKey('textTabContentUniqueId');
      console.info('test_tabs_uiObserverWithoutIdTest_003 ' + JSON.stringify(JSON.parse(strJson003)));
      expect(JSON.parse(strJson003).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_003 content3: " + JSON.parse(strJson003).$attrs.content);
      expect(JSON.parse(strJson003).$attrs.content > 0).assertTrue();
      let strJson004: string = getInspectorByKey('textState');
      console.info('test_tabs_uiObserverWithoutIdTest_003 ' + JSON.stringify(JSON.parse(strJson004)));
      expect(JSON.parse(strJson004).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_003 content4: " + JSON.parse(strJson004).$attrs.content);
      expect(JSON.parse(strJson004).$attrs.content).assertEqual('0');
      let strJson005: string = getInspectorByKey('textId');
      console.info('test_tabs_uiObserverWithoutIdTest_003 ' + JSON.stringify(JSON.parse(strJson005)));
      expect(JSON.parse(strJson005).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_003 content5: " + JSON.parse(strJson005).$attrs.content);
      expect(JSON.parse(strJson005).$attrs.content).assertEqual('"tab1"');
      let strJson006: string = getInspectorByKey('textUniqueId');
      console.info('test_tabs_uiObserverWithoutIdTest_003 ' + JSON.stringify(JSON.parse(strJson006)));
      expect(JSON.parse(strJson006).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_003 content6: " + JSON.parse(strJson006).$attrs.content);
      expect(JSON.parse(strJson006).$attrs.content > 0).assertTrue();
      let strJson007: string = getInspectorByKey('textLastIndex');
      console.info('test_tabs_uiObserverWithoutIdTest_003 ' + JSON.stringify(JSON.parse(strJson007)));
      expect(JSON.parse(strJson007).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_003 content7: " + JSON.parse(strJson007).$attrs.content);
      expect(JSON.parse(strJson007).$attrs.content).assertEqual('1');
      console.info('test_tabs_uiObserverWithoutIdTest_003 END');
      done();
    });

    /**
     * @tc.number test_tabs_uiObserverWithoutIdTest_004
     * @tc.name   test_tabs_uiObserverWithoutIdTest_004
     * @tc.desc   Test close tabs for changes, index value will not change
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_tabs_uiObserverWithoutIdTest_004', Level.LEVEL0, async (done: Function) => {
      console.info('test_tabs_uiObserverWithoutIdTest_004 START');
      let driver: Driver = Driver.create();
      let btn9 = await driver.findComponent(ON.id('idOff'));
      await btn9.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn10 = await driver.findComponent(ON.id('idGet'));
      await btn10.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson001: string = getInspectorByKey('textIndex');
      console.info('test_tabs_uiObserverWithoutIdTest_004 ' + JSON.stringify(JSON.parse(strJson001)));
      expect(JSON.parse(strJson001).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_004 content1: " + JSON.parse(strJson001).$attrs.content);
      expect(JSON.parse(strJson001).$attrs.content).assertEqual('3');
      let strJson002: string = getInspectorByKey('textTabContentId');
      console.info('test_tabs_uiObserverWithoutIdTest_004 ' + JSON.stringify(JSON.parse(strJson002)));
      expect(JSON.parse(strJson002).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_004 content2: " + JSON.parse(strJson002).$attrs.content);
      expect(JSON.parse(strJson002).$attrs.content).assertEqual('""');
      let strJson003: string = getInspectorByKey('textTabContentUniqueId');
      console.info('test_tabs_uiObserverWithoutIdTest_004 ' + JSON.stringify(JSON.parse(strJson003)));
      expect(JSON.parse(strJson003).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_004 content3: " + JSON.parse(strJson003).$attrs.content);
      expect(JSON.parse(strJson003).$attrs.content > 0).assertTrue();
      let strJson004: string = getInspectorByKey('textState');
      console.info('test_tabs_uiObserverWithoutIdTest_004 ' + JSON.stringify(JSON.parse(strJson004)));
      expect(JSON.parse(strJson004).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_004 content4: " + JSON.parse(strJson004).$attrs.content);
      expect(JSON.parse(strJson004).$attrs.content).assertEqual('0');
      let strJson005: string = getInspectorByKey('textId');
      console.info('test_tabs_uiObserverWithoutIdTest_004 ' + JSON.stringify(JSON.parse(strJson005)));
      expect(JSON.parse(strJson005).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_004 content5: " + JSON.parse(strJson005).$attrs.content);
      expect(JSON.parse(strJson005).$attrs.content).assertEqual('"tab1"');
      let strJson006: string = getInspectorByKey('textUniqueId');
      console.info('test_tabs_uiObserverWithoutIdTest_004 ' + JSON.stringify(JSON.parse(strJson006)));
      expect(JSON.parse(strJson006).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_004 content6: " + JSON.parse(strJson006).$attrs.content);
      expect(JSON.parse(strJson006).$attrs.content > 0).assertTrue();
      let strJson007: string = getInspectorByKey('textLastIndex');
      console.info('test_tabs_uiObserverWithoutIdTest_004 ' + JSON.stringify(JSON.parse(strJson007)));
      expect(JSON.parse(strJson007).$type).assertEqual('Text');
      console.info("test_tabs_uiObserverWithoutIdTest_004 content7: " + JSON.parse(strJson007).$attrs.content);
      expect(JSON.parse(strJson007).$attrs.content).assertEqual('1');
      console.info('test_tabs_uiObserverWithoutIdTest_004 END');
      done();
    });
  })
}
