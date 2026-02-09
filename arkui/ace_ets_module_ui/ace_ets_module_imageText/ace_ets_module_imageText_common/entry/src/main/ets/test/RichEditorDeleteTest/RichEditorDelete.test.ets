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

export default function RichEditorDeleteTest() {
  describe('RichEditorDeleteTest', () => {
    beforeEach(async (done: Function) => {
      console.info('RichEditorDeleteTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorDelete/RichEditorDelete',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get RichEditorDeleteTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('RichEditorDeleteTest')) {

          const result = await router.replaceUrl(options);
          console.info('push RichEditorDeleteTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000); 
      } catch (err) {
        console.error('push RichEditorDeleteTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('RichEditorDeleteTest afterEach called');

    });

    /**
     * @tc.name   RichEditorDeleteTest001
     * @tc.number RichEditorDeleteTest001
     * @tc.desc   test the RichEditor deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RichEditorDeleteTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[RichEditorDeleteTest001] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('button1'));
      await CommonFunc.sleep(500);
      await button1.click();
      await CommonFunc.sleep(500);
      let richEditor1 = await driver.findComponent(ON.id('rich1'));
      let actualContent = await richEditor1.getText();
      console.info('[RichEditorDeleteTest001] actual content is: ' + actualContent);
      expect(actualContent).assertEqual('delete测试123😊🐶🌊🌄🍔☕🥄💻📡🚀⚽🎸🎮🎃🎏✌️🐋📦✨👩💻👪👬🤼‍♂️🏆');
     
      console.info('[RichEditorDeleteTest001] END');
      done();
    });
  })
}