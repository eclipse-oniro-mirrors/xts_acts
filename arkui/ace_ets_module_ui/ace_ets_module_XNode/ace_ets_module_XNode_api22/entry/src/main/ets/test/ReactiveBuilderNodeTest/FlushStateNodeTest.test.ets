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

export default function FlushStateNodeTest() {
  describe('FlushStateNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('FlushStateNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveBuilderNode/FlushStateNodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get FlushStateNodeTest state pages:' + JSON.stringify(pages));
        if (!('FlushStateNodeTest' == pages.name)) {
          console.info('get FlushStateNodeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push FlushStateNodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push FlushStateNodeTest page error:' + err);
      }
      console.info('FlushStateNodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('FlushStateNodeTest after each called');
    });

    /**
     * @tc.name   FlushStateNodeTest_0100
     * @tc.number FlushStateNodeTest_0100
     * @tc.desc   ReactiveBuilderNode FlushStateNodeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlushStateNodeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('FlushStateNodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('V2'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('V2 change'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('thisParamsAge1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlushStateNodeTest_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[FlushStateNodeTest_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('26');
      console.info('[FlushStateNodeTest_0100] END');
      done();
    });

    /**
     * @tc.name   FlushStateNodeTest_0200
     * @tc.number FlushStateNodeTest_0200
     * @tc.desc   ReactiveBuilderNode FlushStateNodeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlushStateNodeTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('FlushStateNodeTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('V1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('V1 change'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('getNodeFlushState');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlushStateNodeTest_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[FlushStateNodeTest_0200] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('31');
      console.info('[FlushStateNodeTest_0200] END');
      done();
    });
  })
}