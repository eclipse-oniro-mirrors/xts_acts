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

export default function richEditorTest() {
  describe('richEditorTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextChangeObserver/richEditor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get richEditorTest state pages: ' + JSON.stringify(pages));
        if (!('shaderStyle' == pages.name)) {
          console.info('get richEditorTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push richEditorTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push richEditorTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('textChangeObserverTest after each called');
    });

    /**
     * @tc.name   richEditorTest_0010
     * @tc.number richEditorTest_0010
     * @tc.desc   Global observer enabled or disabled, text change of the richEditor component, Expected: observed text is 'global:richEditorTest_0010'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('richEditorTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[richEditorTest_0010] START');

      let driver:Driver = Driver.create();
      
      let globalObserverOpenButton: Component = await driver.findComponent(ON.id('全局监听(开)'));
      await globalObserverOpenButton.click();

      let richEditor: Component = await driver.findComponent(ON.id('richEditor'));
      await CommonFunc.sleep(500);
	  
	    let Button: Component = await driver.findComponent(ON.id('输入文本richEditorTest_0010'));
	    await Button.click()
	    await CommonFunc.sleep(500);
	  
      let globalOutputRichEditor1: Component = await driver.findComponent(ON.id('globalOutputRichEditor'));
      let globalOutput1 = await globalOutputRichEditor1.getText();
      
      console.info('[richEditorTest_0010] textContent: ' + globalOutput1);
      expect(globalOutput1).assertEqual('global:richEditorTest_0010');

      let globalObserverCloseButton: Component = await driver.findComponent(ON.id('全局监听(关)'));
      await globalObserverCloseButton.click();
	    await CommonFunc.sleep(500);
	  
	    let Button1: Component = await driver.findComponent(ON.id('输入文本Add'));
	    await Button1.click()
	    await CommonFunc.sleep(500);

      let globalOutputRichEditor2: Component = await driver.findComponent(ON.id('globalOutputRichEditor'));
      let globalOutput2 = await globalOutputRichEditor2.getText();

      console.info('[richEditorTest_0010] textContent: ' + globalOutput2);
      expect(globalOutput2).assertEqual('global:richEditorTest_0010');

      console.info('[richEditorTest_0010] END');
      done();
    });

    /**
     * @tc.name   richEditorTest_0011
     * @tc.number richEditorTest_0011
     * @tc.desc   Local observer enabled or disabled, text change of the richEditor component, Expected: observed text is 'local:richEditorTest_0011'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('richEditorTest_0011', Level.LEVEL1, async (done: Function) => {
      console.info('[richEditorTest_0011] START');

      let driver:Driver = Driver.create();
      
      let localObserverOpenButton: Component = await driver.findComponent(ON.id('局部richEditor(开)'));
      await localObserverOpenButton.click();

      let richEditor: Component = await driver.findComponent(ON.id('richEditor'));
      await CommonFunc.sleep(500);
	  
	    let Button: Component = await driver.findComponent(ON.id('输入文本richEditorTest_0010'));
	    await Button.click()
	    await CommonFunc.sleep(500);

      let localOutputRichEditor1: Component = await driver.findComponent(ON.id('localOutputRichEditor'));
      let localOutput1 = await localOutputRichEditor1.getText();

      console.info('[richEditorTest_0010] textContent: ' + localOutput1);
      expect(localOutput1).assertEqual('local:richEditorTest_0010');

      let localObserverCloseButton: Component = await driver.findComponent(ON.id('局部richEditor(关)'));
      await localObserverCloseButton.click()
	    await CommonFunc.sleep(500);
	  
	    let Button1: Component = await driver.findComponent(ON.id('输入文本Add'));
	    await Button1.click()
	    await CommonFunc.sleep(500);

      let localOutputRichEditor2: Component = await driver.findComponent(ON.id('localOutputRichEditor'));
      let localOutput2 = await localOutputRichEditor2.getText();

      console.info('[richEditorTest_0010] textContent: ' + localOutput2);
      expect(localOutput2).assertEqual('local:richEditorTest_0010');

      console.info('[richEditorTest_0011] END');
      done();
    });
  })
}