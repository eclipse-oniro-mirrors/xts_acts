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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function selectTitleBarLabelTest() {
  describe('selectTitleBarLabelTest', () => {
    beforeEach(async (done: Function) => {
      console.info('selectTitleBarLabelTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectTitleBar/selectTitleBarLabelPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get selectTitleBarLabelTest state pages: ' + JSON.stringify(pages));
        if (!('selectTitleBarLabelPage' == pages.name)) {
          console.info('get selectTitleBarLabelTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push selectTitleBarLabelTest page result successful');
        }
      } catch (err) {
        console.error('push selectTitleBarLabelTest page error: ' + err);
      }

      await Utils.sleep(1000)
      console.info('selectTitleBarLabelTest beforeEach end');
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('selectTitleBarLabelTest after each called');
    })

    /**
     * @tc.name   selectTitleBarLabelTest_0100
     * @tc.number selectTitleBarLabelTest
     * @tc.desc   Test selectTitleBarLabel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectTitleBarLabelTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[selectTitleBarLabelTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看是否存在以下入口。
      let found = await driver.findComponent(ON.text('所有照片'));
      expect(found !== null).assertTrue();
      console.info('[selectTitleBarLabelTest_0100] END');
      done();
    });
  })
}