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

export default function subHeaderButton() {
  describe('subHeaderButton', function () {
    beforeEach(async function (done) {
      console.info('subHeaderButton beforeEach start');
      let options = {
        uri: 'MainAbility/pages/subHeader/subHeaderButton',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info('get subHeaderButton state pages: ' + JSON.stringify(pages));
        if (!('subHeaderButton' == pages.name)) {
          console.info('get subHeaderButton pages.name: ' + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push subHeaderButton page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push subHeaderButton page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('subHeaderButton beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('subHeaderButton after each called');
    })

    /**
     * @tc.number subHeaderButton
     * @tc.name   subHeaderButton
     * @tc.desc   Test subHeaderButton
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderButton_0100', 0, async function (done) {
      console.info('[subHeaderButton_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // subHeaderButton是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('一级标题'));
      let secondaryTitle = await driver.findComponent(ON.text('二级标题'));
      let operation = await driver.findComponent(ON.text('操作'));
      expect(primaryTitle !== null).assertTrue();
      expect(secondaryTitle !== null).assertTrue();
      expect(operation !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderButton_0100] END');
      done();
    });
  })
}