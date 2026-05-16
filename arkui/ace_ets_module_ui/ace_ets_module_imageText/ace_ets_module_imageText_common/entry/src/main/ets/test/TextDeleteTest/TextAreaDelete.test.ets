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

export default function TextAreaDeleteTest() {
  describe('TextAreaDeleteTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextAreaDeleteTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/TextDelete/TextAreaDelete',
      };
      try {
        router.clear();
        const pages = router.getState();
        console.info('get TextAreaDeleteTest state success ' + JSON.stringify(pages));
        if (!pages.path.includes('Page/Page')) {
          const result = await router.replaceUrl(options);
          console.info('push TextAreaDeleteTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push TextAreaDeleteTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TextAreaDeleteTest afterEach called');
    });

    /**
     * @tc.name   TextAreaDeleteTest001
     * @tc.number TextAreaDeleteTest001
     * @tc.desc   test the TextArea deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextAreaDeleteTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[TextAreaDeleteTest001] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let deleteBackwardBtn = await driver.findComponent(ON.id('textareadeleteBackward'));
      await CommonFunc.sleep(500);
      await deleteBackwardBtn.click();
      await CommonFunc.sleep(500);
      let miningTimeTextArea = await driver.findComponent(ON.id('miningTimeTextArea'));
      let actualContent = await miningTimeTextArea.getText();
      console.info('[TextAreaDeleteTest001] actual content is: ' + actualContent);
      expect(actualContent).assertEqual('测试文本⛏️⛏️⛏️⛏️⛏️⛏️⛏️⛏️⛏️⛏️⛏️⛏️⛏️');
     
      console.info('[TextAreaDeleteTest001] END');
      done();
    });
  })
}