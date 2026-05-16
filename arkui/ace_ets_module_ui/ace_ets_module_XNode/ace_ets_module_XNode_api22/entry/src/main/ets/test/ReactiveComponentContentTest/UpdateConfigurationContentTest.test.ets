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

export default function UpdateConfigurationContentTest() {
  describe('UpdateConfigurationContentTest', () => {
    beforeEach(async (done: Function) => {
      console.info('UpdateConfigurationContentTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveComponentContent/UpdateConfigurationContentTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get UpdateConfigurationContentTest state pages:' + JSON.stringify(pages));
        if (!('UpdateConfigurationContentTest' == pages.name)) {
          console.info('get UpdateConfigurationContentTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push UpdateConfigurationContentTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push UpdateConfigurationContentTest page error:' + err);
      }
      console.info('UpdateConfigurationContentTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('UpdateConfigurationContentTest after each called');
    });

    /**
     * @tc.name   UpdateConfigurationContentTest_0100
     * @tc.number UpdateConfigurationContentTest_0100
     * @tc.desc   ReactiveComponentContent UpdateConfigurationContentTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UpdateConfigurationContentTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('UpdateConfigurationContentTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('Update'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let ContentmText = getInspectorByKey('updateConfigurationContent');
      console.info('[UpdateConfigurationContentTest_0100] attrs is: ' + JSON.stringify(JSON.parse(ContentmText).$attrs));
      expect(JSON.parse(ContentmText).$attrs.content).assertEqual('updateConfiguration');
      console.info('[UpdateConfigurationContentTest_0100] END');
      done();
    });
  })
}