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


export default function gridObjectSortComponentTest() {
  describe('gridObjectSortComponentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("gridObjectSortComponentTest beforeEach start");
      let opt: router.RouterOptions = {
        url: 'MainAbility/pages/gridObjectSortComponent/gridObjectSortComponentTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridObjectSortComponentTest state pages: " + JSON.stringify(pages));
        if (!('gridObjectSortComponentTest' == pages.name)) {
          console.info("get gridObjectSortComponentTest pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(opt);
          await Utils.sleep(2000);
          console.info("push gridObjectSortComponentTest page result successful");
        }
      } catch (err) {
        console.error("push gridObjectSortComponentTest page error: " + err);
      }

      await Utils.sleep(1000);
      console.info('gridObjectSortComponentTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('gridObjectSortComponentTest after each called');
    })

    /**
     * @tc.number gridObjectSortComponentTest
     * @tc.name   GridObjectSortComponentTest_0200 item
     * @tc.desc   Click gridObjectSortComponent
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */

    it('GridObjectSortComponentTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('[GridObjectSortComponentTest_0200] START');
      let driver = await Driver.create();
      await Utils.sleep(2000);

      //点击GridObjectSortComponentItem中的item
      let textItem1 = await driver.findComponent(ON.text('低电量模式'));
      await textItem1.click();
      await Utils.sleep(1000);
      // 断言GridObjectSortComponentItem中存在‘截屏’。
      let textItem2 = await driver.findComponent(ON.text('截屏'));
      expect(textItem2 !== null).assertTrue();
      console.info('[GridObjectSortComponentTest_0200] END');
      done();
    });
  })
}
