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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium";
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';


export default function gridObjectSortComponentSymbolTest() {
  describe('GridObjectSortComponentSymbolTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GridObjectSortComponentSymbolTest beforeEach start");
      let opt: router.RouterOptions = {
        url: 'MainAbility/pages/gridObjectSortComponent/GridObjectSortComponentSymbolTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridObjectSortComponentSymbolTest state pages: " + JSON.stringify(pages));
        if (!('GridObjectSortComponentSymbolTest' == pages.name)) {
          console.info("get GridObjectSortComponentSymbolTest pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(opt);
          await Utils.sleep(2000);
          console.info("push GridObjectSortComponentSymbolTest page result successful");
        }
      } catch (err) {
        console.error("push GridObjectSortComponentSymbolTest page error: " + err);
      }

      await Utils.sleep(1000);
      console.info('GridObjectSortComponentSymbolTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('GridObjectSortComponentSymbolTest after each called');
    })


    /**
     * @tc.name   GridObjectSortComponentSymbolTest_0200
     * @tc.number GridObjectSortComponentSymbolTest_0200
     * @tc.desc   GridObjectSortComponentSymbolTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridObjectSortComponentSymbolTest_0200',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[GridObjectSortComponentSymbolTest_0200] START');
      let driver = await Driver.create();
      await Utils.sleep(2000);

      // 断言GridObjectSortComponentItem中存在‘下载’。
      let textItem2 = await driver.findComponent(ON.text('下载'));
      expect(textItem2 !== null).assertTrue();
      console.info('[GridObjectSortComponentSymbolTest_0200] END');
      done();
    });
  })
}