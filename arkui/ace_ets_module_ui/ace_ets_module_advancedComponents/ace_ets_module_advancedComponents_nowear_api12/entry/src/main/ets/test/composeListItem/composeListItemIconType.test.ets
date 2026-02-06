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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function composeListItemIconType() {
  describe('composeListItemIconType', () => {
    beforeEach(async (done: Function) => {
      console.info('composeListItemIconType beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItem/composeListItemIconType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get composeListItemIconType state pages: ' + JSON.stringify(pages));
        if (!('composeListItemIconType' == pages.name)) {
          console.info('get composeListItemIconType pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push composeListItemIconType page result successful');
        }
      } catch (err) {
        console.error('push composeListItemIconType page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('composeListItemIconType beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('composeListItemIconType after each called');
    })

    /**
     * @tc.number composeListItemIconType
     * @tc.name   composeListItemIconType_0100
     * @tc.desc   Test composeListItemIconType
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeListItemIconType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[composeListItemIconType_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看composeListItemIconType是否存在以下入口。
      let iconType = await driver.findComponent(ON.text('BADGE'));
      expect(iconType !== null).assertTrue();
      console.info('[composeListItemIconType_0100] END');
      done();
    });
  })
}