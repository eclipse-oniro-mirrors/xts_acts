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



export default function progressButtonTest() {
  describe('progressButtonTest', () => {
    beforeEach(async (done: Function) => {
      console.info("progressButtonTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progressButton/progressButtonTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get progressButtonTest state pages: " + JSON.stringify(pages));
        if (!('progressButtonTest' == pages.name)) {
          console.info("get progressButtonTest pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push progressButtonTest page result successful");
        }
      } catch (err) {
        console.error("push progressButtonTest page error: " + err);
      }

      await Utils.sleep(1000);
      console.info('progressButtonTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('progressButtonTest after each called');
    })

    /**
     * @tc.name   ProgressButtonTest_0100
     * @tc.number progressButtonTest
     * @tc.desc   Test progressButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ProgressButtonTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ProgressButtonTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      //查询ProgressButton是否存在 '下载按钮'的文本
      let ProgressButtonItem = await driver.findComponent(ON.text('下载按钮'));
      expect(ProgressButtonItem !== null).assertTrue();
      console.info('[ProgressButtonTest_0100] END');
      done();
    });
  })
}