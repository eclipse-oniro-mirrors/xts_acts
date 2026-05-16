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
import Utils from '../Utils';

export default function subHeaderTitleBuilder() {
  describe('subHeaderTitleBuilder', () => {
    beforeEach(async (done: Function) => {
      console.info('subHeaderTitleBuilder beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/api12/subHeaderTitleBuilder',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get subHeaderTitleBuilder state pages: ' + JSON.stringify(pages));
        if (!('subHeaderTitleBuilder' == pages.name)) {
          console.info('get subHeaderTitleBuilder pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push subHeaderTitleBuilder page result successful');
        }
      } catch (err) {
        console.error('push subHeaderTitleBuilder page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('subHeaderTitleBuilder beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('subHeaderTitleBuilder after each called');
    })

    /**
     * @tc.number subHeaderTitleBuilder
     * @tc.name   subHeaderTitleBuilder_0100
     * @tc.desc   Test subHeader titleBuilder
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderTitleBuilder_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderTitleBuilder_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // subHeaderTitleBuilder是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('主标题'));
      let secondaryTitle = await driver.findComponent(ON.text('副标题'));
      expect(primaryTitle !== null).assertTrue();
      expect(secondaryTitle !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderTitleBuilder_0100] END');
      done();
    });
  })
}