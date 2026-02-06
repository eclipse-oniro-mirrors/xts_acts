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

export default function onDidIMEInputTest() {
  describe('onDidIMEInputTest', () => {
    beforeEach(async (done: Function) => {
      console.info("onDidIMEInputTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onDidIMEInput',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onDidIMEInputTest state pages:" + JSON.stringify(pages));
        if (!("onDidIMEInput" == pages.name)) {
          console.info("get onDidIMEInputTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onDidIMEInputTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onDidIMEInputTest page error:" + err);
      }
      console.info("onDidIMEInputTest beforeEach end");
      done();
    });

    /**
     * @tc.name   onDidIMEInputTest_0010
     * @tc.number onDidIMEInputTest_0010
     * @tc.desc   set RichEditor: onDidIMEInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDidIMEInputTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('onDidIMEInputTest_0010 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let RichEditor: Component = await driver.findComponent(ON.id('RichEditor_OnDidIMEInput'));
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      let onDidIMEInputTest_1 = getInspectorByKey('OnDidIMEInput_id');
      expect(JSON.parse(onDidIMEInputTest_1).$attrs.content + "").assertEqual("onDidIMEInput succ");
      console.info('onDidIMEInputTest_0010 END');
      done();
    });
  })
}