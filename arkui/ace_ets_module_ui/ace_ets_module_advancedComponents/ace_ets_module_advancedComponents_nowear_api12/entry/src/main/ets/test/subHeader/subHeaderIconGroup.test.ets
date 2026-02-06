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

export default function subHeaderIconGroup() {
  describe('subHeaderIconGroup', () => {
    beforeEach(async (done: Function) => {
      console.info('subHeaderIconGroup beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/subHeader/subHeaderIconGroup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get subHeaderIconGroup state pages: ' + JSON.stringify(pages));
        if (!('subHeaderIconGroup' == pages.name)) {
          console.info('get subHeaderIconGroup pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push subHeaderIconGroup page result successful');
        }
      } catch (err) {
        console.error('push subHeaderIconGroup page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('subHeaderIconGroup beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('subHeaderIconGroup after each called');
    })

    /**
     * @tc.name   subHeaderIconGroup_0100
     * @tc.number subHeaderIconGroup
     * @tc.desc   Test subHeaderIconGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('subHeaderIconGroup_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderIconGroup_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // subHeaderIconGroup是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('一级标题'));
      let secondaryTitle = await driver.findComponent(ON.text('二级标题'));
      expect(primaryTitle !== null).assertTrue();
      expect(secondaryTitle !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderIconGroup_0100] END');
      done();
    });
  })
}