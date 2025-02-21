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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';
import Utils from '../Utils';

export default function editableTitleBarSafeAreaEdges() {
  describe('editableTitleBarSafeAreaEdges', function () {
    beforeEach(async function (done) {
      console.info('editableTitleBarSafeAreaEdges beforeEach start');
      let options = {
        uri: 'MainAbility/pages/editableTitleBar/editableTitleBarSafeAreaEdges',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info('get editableTitleBarSafeAreaEdges state pages: ' + JSON.stringify(pages));
        if (!('editableTitleBarSafeAreaEdges' == pages.name)) {
          console.info('get editableTitleBarSafeAreaEdges pages.name: ' + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push editableTitleBarSafeAreaEdges page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push editableTitleBarSafeAreaEdges page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('editableTitleBarSafeAreaEdges beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('editableTitleBarSafeAreaEdges after each called');
    })

    /**
     * @tc.number editableTitleBarSafeAreaEdges
     * @tc.name   editableTitleBarSafeAreaEdges
     * @tc.desc   Test editableTitleBarSafeAreaEdges
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('editableTitleBarSafeAreaEdges_0100', 0, async function (done) {
      console.info('[editableTitleBarSafeAreaEdges_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 点击打开editableTitleBar是否存在以下入口。
      let title = await driver.findComponent(ON.text('编辑页面'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[editableTitleBarSafeAreaEdges_0100] END');
      done();
    });
  })
}