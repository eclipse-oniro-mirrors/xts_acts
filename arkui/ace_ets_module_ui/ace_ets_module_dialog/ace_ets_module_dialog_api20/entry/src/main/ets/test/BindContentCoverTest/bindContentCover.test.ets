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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import router from '@ohos.router';
import { Component, Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../MainAbility/common/Common';

export default function bindContentCoverTest() {
  describe('bindContentCoverTest', () => {
    beforeEach(async (done: Function) => {
      console.info('bindContentCoverTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindContentCover/bindContentCover',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get bindContentCoverTest state pages: ' + JSON.stringify(pages));
        if (!('bindContentCoverTest' == pages.name)) {
          console.info('get BindPopupbindContentCoverTestTest pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push bindContentCoverTest page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('bindContentCoverTest beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('bindContentCoverTest after each called');
    })

    /* *
    * @tc.number: bindContentCoverTest_001
    * @tc.name  : bindContentCoverTest_001
    * @tc.desc  : Test the bindContentCoverTest not null
    * @tc.level : Level 1
    */
    it('bindContentCoverTest_001', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('safeArea'));
      await btn1.click()
      await CommonFunc.sleep(1000);

      let button1: Component = await driver.findComponent(ON.id('area1'));
      let toprect = await button1.getBounds();
      console.info("[bindContentCoverTest_001] rect is: " + JSON.stringify(toprect));
      console.info("[bindContentCoverTest_001] rect.top is: " + toprect.top);

      expect(toprect.top == 0).assertFalse();
      expect(toprect.top > 0).assertTrue();
      await CommonFunc.sleep(1000);

      console.info('bindContentCoverTest_001 END');
      done();
    });
  })
}