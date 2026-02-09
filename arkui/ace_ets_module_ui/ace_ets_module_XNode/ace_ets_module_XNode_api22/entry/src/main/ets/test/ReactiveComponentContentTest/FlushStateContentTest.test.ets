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

export default function FlushStateContentTest() {
  describe('FlushStateContentTest', () => {
    beforeEach(async (done: Function) => {
      console.info('FlushStateContentTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveComponentContent/FlushStateContentTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get FlushStateContentTest state pages:' + JSON.stringify(pages));
        if (!('FlushStateContentTest' == pages.name)) {
          console.info('get FlushStateContentTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push FlushStateContentTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push FlushStateContentTest page error:' + err);
      }
      console.info('FlushStateContentTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('FlushStateContentTest after each called');
    });

    /**
     * @tc.name   FlushStateContentTest_0100
     * @tc.number FlushStateContentTest_0100
     * @tc.desc   ReactiveBuilderNode FlushStateContentTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlushStateContentTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('FlushStateContentTest_0100 START');
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
      console.info('[FlushStateContentTest_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[FlushStateContentTest_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('26');
      console.info('[FlushStateContentTest_0100] END');
      done();
    });

    /**
     * @tc.name   FlushStateContentTest_0200
     * @tc.number FlushStateContentTest_0200
     * @tc.desc   ReactiveComponentContent FlushState Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FlushStateContentTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('FlushStateContentTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('V1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('V1 change'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('getContentFlushState');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlushStateContentTest_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[FlushStateContentTest_0200] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('31');
      console.info('[FlushStateContentTest_0200] END');
      done();
    });
  })
}