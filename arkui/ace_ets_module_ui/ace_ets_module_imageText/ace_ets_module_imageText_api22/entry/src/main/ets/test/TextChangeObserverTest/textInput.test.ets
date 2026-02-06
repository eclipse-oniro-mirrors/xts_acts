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

export default function textInputTest() {
  describe('textInputTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextChangeObserver/textInput',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get textInputTest state pages: ' + JSON.stringify(pages));
        if (!('shaderStyle' == pages.name)) {
          console.info('get textInputTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push textInputTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textInputTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('textChangeObserverTest after each called');
    });

    /**
     * @tc.name   textInputTest_0010
     * @tc.number textInputTest_0010
     * @tc.desc   Global observer enabled or disabled, text change of the textInput component, Expected: observed text is 'global:textInputTest_0010'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest_0010] START');

      let driver:Driver = Driver.create();
      
      let globalObserverOpenButton: Component = await driver.findComponent(ON.id('全局监听(开)'));
      await globalObserverOpenButton.click();

      let textInput: Component = await driver.findComponent(ON.id('textInput'));
      await textInput.inputText('textInputTest_0010');

      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);

      let globalOutputTextInput1: Component = await driver.findComponent(ON.id('globalOutputTextInput'));
      let globalOutput1 = await globalOutputTextInput1.getText();
      
      console.info('[textInputTest_0010] textContent: ' + globalOutput1);
      expect(globalOutput1).assertEqual('global:textInputTest_0010');

      let globalObserverCloseButton: Component = await driver.findComponent(ON.id('全局监听(关)'));
      await globalObserverCloseButton.click();

      await textInput.inputText('Add');

      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);

      let globalOutputTextInput2: Component = await driver.findComponent(ON.id('globalOutputTextInput'));
      let globalOutput2 = await globalOutputTextInput2.getText();

      console.info('[textInputTest_0010] textContent: ' + globalOutput2);
      expect(globalOutput2).assertEqual('global:textInputTest_0010');

      console.info('[textInputTest_0010] END');
      done();
    });

    /**
     * @tc.name   textInputTest_0011
     * @tc.number textInputTest_0011
     * @tc.desc   Local observer enabled or disabled, text change of the textInput component, Expected: observed text is 'local:textInputTest_0011'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputTest_0011', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest_0011] START');

      let driver:Driver = Driver.create();
      
      let localObserverOpenButton: Component = await driver.findComponent(ON.id('局部textInput(开)'));
      await localObserverOpenButton.click();

      let textInput: Component = await driver.findComponent(ON.id('textInput'));
      await textInput.inputText('textInputTest_0011');

      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);

      let localOutputTextInput1: Component = await driver.findComponent(ON.id('localOutputTextInput'));
      let localOutput1 = await localOutputTextInput1.getText();

      console.info('[textInputTest_0011] textContent: ' + localOutput1);
      expect(localOutput1).assertEqual('local:textInputTest_0011');

      let localObserverCloseButton: Component = await driver.findComponent(ON.id('局部textInput(关)'));
      await localObserverCloseButton.click();

      await textInput.inputText('Add');

      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);

      let localOutputTextInput2: Component = await driver.findComponent(ON.id('localOutputTextInput'));
      let localOutput2 = await localOutputTextInput2.getText();

      console.info('[textInputTest_0011] textContent: ' + localOutput2);
      expect(localOutput2).assertEqual('local:textInputTest_0011');

      console.info('[textInputTest_0011] END');
      done();
    });
  })
}