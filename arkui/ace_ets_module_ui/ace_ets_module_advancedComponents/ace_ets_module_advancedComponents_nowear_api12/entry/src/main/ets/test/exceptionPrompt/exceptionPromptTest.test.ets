/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function ExceptionPromptTest() {
  describe('ExceptionPromptTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ExceptionPromptTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/exceptionPrompt/exceptionPromptPage',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get ExceptionPromptTest state pages: ' + JSON.stringify(pages));
        if (!('exceptionPromptPage' == pages.name)) {
          console.info('get ExceptionPromptTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push ExceptionPromptTest page error: ' + err);
      }

      await Utils.sleep(1000)
      console.info('ExceptionPromptTest beforeEach end');
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('ExceptionPromptTest after each called');
    })

    /**
     * @tc.number ExceptionPromptTest
     * @tc.name ExceptionPromptTest_0100
     * @tc.desc Test ExceptionPrompt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('exceptionPromptTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看是否存在以下入口。
      let found = await driver.findComponent(ON.text('异常提示'));
      expect(found !== null).assertTrue();
      console.info('[exceptionPromptTest_0100] END');
      done();
    });
  })
}