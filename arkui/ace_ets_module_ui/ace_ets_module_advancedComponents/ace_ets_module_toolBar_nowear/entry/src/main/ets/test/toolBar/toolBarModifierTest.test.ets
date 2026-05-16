/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function toolBarModifierTest() {
  describe('toolBarModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("toolBarModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toolBar/toolBarModifierTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get toolBarModifierTest state pages: " + JSON.stringify(pages));
        if (!('toolBarModifierTest' == pages.name)) {
          console.info("get toolBarModifierTest pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push toolBarModifierTest page error: " + err);
      }

      await Utils.sleep(1000);
      console.info('toolBarModifierTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('toolBarModifierTest after each called');
    })

    /**
     * @tc.number toolBarModifierTest
     * @tc.name toolBarModifierTest_0100
     * @tc.desc Test toolBarModifierTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('toolBarModifierTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[toolBarModifierTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看ToolBarPage是否存在以下入口。
      let toolBarModifier1 = await driver.findComponent(ON.text('Paste'));
      let toolBarModifier2 = await driver.findComponent(ON.text('Copy'));
      expect(toolBarModifier1 !== null).assertTrue();
      expect(toolBarModifier2 !== null).assertTrue();
      console.info('[toolBarModifierTest_0100] END');
      done();
    });
  })
}