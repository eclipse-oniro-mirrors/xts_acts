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

export default function UpdateConfigurationNodeTest() {
  describe('UpdateConfigurationNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('UpdateConfigurationNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveBuilderNode/UpdateConfigurationNodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get UpdateConfigurationNodeTest state pages:' + JSON.stringify(pages));
        if (!('UpdateConfigurationNodeTest' == pages.name)) {
          console.info('get UpdateConfigurationNodeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push UpdateConfigurationNodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push UpdateConfigurationNodeTest page error:' + err);
      }
      console.info('UpdateConfigurationNodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('UpdateConfigurationNodeTest after each called');
    });

    /**
     * @tc.name   UpdateConfigurationNodeTest_0100
     * @tc.number UpdateConfigurationNodeTest_0100
     * @tc.desc   ReactiveBuilderNode UpdateConfigurationNodeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UpdateConfigurationNodeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('UpdateConfigurationNodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('Update'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let NodemText = getInspectorByKey('updateConfigurationNode');
      console.info('[UpdateConfigurationNodeTest_0100] attrs is: ' + JSON.stringify(JSON.parse(NodemText).$attrs));
      expect(JSON.parse(NodemText).$attrs.content).assertEqual('Update 1');
      console.info('[UpdateConfigurationNodeTest_0100] END');
      done();
    });
  })
}