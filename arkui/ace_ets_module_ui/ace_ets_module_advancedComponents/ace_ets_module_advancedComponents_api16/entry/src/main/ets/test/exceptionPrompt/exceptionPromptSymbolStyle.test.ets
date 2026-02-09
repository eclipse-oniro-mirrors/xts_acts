/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';

import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import router from '@ohos.router';

export default function exceptionPromptSymbolStyleTest() {
  describe('exceptionPromptSymbolStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info('exceptionPromptSymbolStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/exceptionPrompt/exceptionPromptSymbolStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get exceptionPromptSymbolStyleTest state pages: ' + JSON.stringify(pages));
        if (!('exceptionPromptSymbolStyle' == pages.name)) {
          console.info('get exceptionPromptSymbolStyleTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push exceptionPromptSymbolStyleTest page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('exceptionPromptSymbolStyleTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('exceptionPromptSymbolStyleTest after each called');
    })

    /**
     * @tc.name   exceptionPromptSymbolStyleTest_0100
     * @tc.number exceptionPromptSymbolStyleTest
     * @tc.desc   Test exceptionPromptSymbolStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('exceptionPromptSymbolStyleTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
      console.info('[exceptionPromptSymbolStyleTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看exceptionPromptSymbolStylePage是否存在以下入口。
      let tip = await driver.findComponent(ON.text('异常提示'));
      let actionText = await driver.findComponent(ON.text('设置网络'));
      expect(tip !== null).assertTrue();
      expect(actionText !== null).assertTrue();
      console.info('[exceptionPromptSymbolStyleTest_0100] END');
      done();
    });
  })
}