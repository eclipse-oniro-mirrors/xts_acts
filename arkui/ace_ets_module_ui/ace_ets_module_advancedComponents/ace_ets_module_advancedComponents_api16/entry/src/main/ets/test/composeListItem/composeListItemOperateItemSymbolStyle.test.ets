/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function composeListItemOperateItemSymbolStyle() {
  describe('composeListItemOperateItemSymbolStyle', () => {
    beforeEach(async (done: Function) => {
      console.info('composeListItemOperateItemSymbolStyle beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItem/composeListItemOperateItemSymbolStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get composeListItemOperateItemSymbolStyle state pages: ' + JSON.stringify(pages));
        if (!('composeListItemOperateItemSymbolStyle' == pages.name)) {
          console.info('get composeListItemOperateItemSymbolStyle pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push composeListItemOperateItemSymbolStyle page result successful');
        }
      } catch (err) {
        console.error('push composeListItemOperateItemSymbolStyle page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('composeListItemOperateItemSymbolStyle beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('composeListItemOperateItemSymbolStyle after each called');
    })

    /**
     * @tc.number composeListItemOperateItemSymbolStyle
     * @tc.name   composeListItemOperateItemSymbolStyle_0100
     * @tc.desc   Test composeListItemOperateItemSymbolStyle
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeListItemOperateItemSymbolStyle_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('[composeListItemOperateItemSymbolStyle_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看composeListItemOperateItemSymbolStyle是否存在以下入口。
      let primaryText = await driver.findComponent(ON.text('operateItemSymbolStyle'));
      expect(primaryText !== null).assertTrue();
      console.info('[composeListItemOperateItemSymbolStyle_0100] END');
      done();
    });
  })
}