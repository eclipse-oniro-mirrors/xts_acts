'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  Level
} from '../../../../hypium/index'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export default function NodeAdapterTotalNodeCountTest() {
  describe('NodeAdapterTotalNodeCountTest', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility('com.arkui.ace.XNode.api12.static', 'EntryAbility');
      await UtilsTest.msSleep(1000);
      console.info('NodeAdapterTotalNodeCountTest startAbility completed');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/NodeAdapterTotalNodeCount',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push frameNodeApi page error:' + err);
      }
      console.info('frameNodeApi beforeEach end');
      console.info('beforeAll case');
    });

    beforeEach(async () => {
      console.info('frameNodeApi beforeEach start');
    });


    afterEach(() => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.number   NodeAdapterTotalNodeCount_0100
     * @tc.name     NodeAdapterTotalNodeCount_0100
     * @tc.desc     Test NodeAdapter totalNodeCount method with integer value 5
     * @tc.level    Level.LEVEL1
     */
    it('NodeAdapterTotalNodeCount_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NodeAdapterTotalNodeCount_0100] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_count_5'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('totalNodeCount_display');
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapterTotalNodeCount_0100] content: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content).assertEqual('"Current totalNodeCount: 5"');
      done();

    });

    /**
     * @tc.number   NodeAdapterTotalNodeCount_0200
     * @tc.name     NodeAdapterTotalNodeCount_0200
     * @tc.desc     Test NodeAdapter totalNodeCount method with integer value 10
     * @tc.level    Level.LEVEL1
     */
    it('NodeAdapterTotalNodeCount_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NodeAdapterTotalNodeCount_0200] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_count_10'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('totalNodeCount_display');
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapterTotalNodeCount_0200] content: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content).assertEqual('"Current totalNodeCount: 10"');
      done();

    });

    /**
     * @tc.number   NodeAdapterTotalNodeCount_0300
     * @tc.name     NodeAdapterTotalNodeCount_0300
     * @tc.desc     Test NodeAdapter totalNodeCount method with integer value 15
     * @tc.level    Level.LEVEL1
     */
    it('NodeAdapterTotalNodeCount_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NodeAdapterTotalNodeCount_0300] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_count_15'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('totalNodeCount_display');
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapterTotalNodeCount_0300] content: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content).assertEqual('"Current totalNodeCount: 15"');
      done();
    });

    /**
     * @tc.number   NodeAdapterTotalNodeCount_0400
     * @tc.name     NodeAdapterTotalNodeCount_0400
     * @tc.desc     Test NodeAdapter totalNodeCount method with integer value 20
     * @tc.level    Level.LEVEL1
     */
    it('NodeAdapterTotalNodeCount_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NodeAdapterTotalNodeCount_0400] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_count_15'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('totalNodeCount_display');
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapterTotalNodeCount_0400] content: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content).assertEqual('"Current totalNodeCount: 15"');
      done();
    });

    /**
     * @tc.number   NodeAdapterTotalNodeCount_0500
     * @tc.name     NodeAdapterTotalNodeCount_0500
     * @tc.desc     Test NodeAdapter totalNodeCount method with integer value 0 (empty list)
     * @tc.level    Level.LEVEL1
     */
    it('NodeAdapterTotalNodeCount_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NodeAdapterTotalNodeCount_0500] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_count_0'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('totalNodeCount_display');
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapterTotalNodeCount_0500] content: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content).assertEqual('"Current totalNodeCount: 0"');
      done();
    });

    /**
     * @tc.number   NodeAdapterTotalNodeCount_0600
     * @tc.name     NodeAdapterTotalNodeCount_0600
     * @tc.desc     Test NodeAdapter totalNodeCount method with integer value 1 (single item)
     * @tc.level    Level.LEVEL1
     */
    it('NodeAdapterTotalNodeCount_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NodeAdapterTotalNodeCount_0600] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_count_1'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('totalNodeCount_display');
      await CommonFunc.sleep(1000);
      console.info('[NodeAdapterTotalNodeCount_0600] content: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      let content =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(content).assertEqual('"Current totalNodeCount: 1"');
      done();
    });
  })
}