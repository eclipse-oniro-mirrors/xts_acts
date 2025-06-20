/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextInputApi1() {
  describe('TextInputApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputApi1 state pages:" + JSON.stringify(pages));
        if (!("TextInputApi1" == pages.name)) {
          console.info("get TextInputApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputApi1 page error:" + err);
      }
      console.info("TextInputApi1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number TextInputApi1_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('TextInputApi1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('TextInputApi1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let TextInput: Component = await driver.findComponent(ON.id('TextInputApi1_TextInput'));
      await TextInput.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2055);
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('TextInputApi1_Text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('before delete')

      let text2 = getInspectorByKey('TextInputApi1_Text2');
      expect(String(JSON.parse(text2).$attrs.content)).assertEqual('after delete')

      await CommonFunc.sleep(1000);

      console.info('TextInputApi1_0100 END');
      done();
    });

  })
}