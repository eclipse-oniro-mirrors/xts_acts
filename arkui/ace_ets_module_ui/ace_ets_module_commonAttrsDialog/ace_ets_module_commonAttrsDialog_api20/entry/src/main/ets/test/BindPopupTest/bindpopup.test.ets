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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function BindPopupTest() {
  describe('BindPopupTest', () => {
    beforeEach(async (done: Function) => {
      console.info('BindPopupTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindPopup/bindpopup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get BindPopupTest state pages: ' + JSON.stringify(pages));
        if (!('BindPopupTest' == pages.name)) {
          console.info('get BindPopupTest pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push BindPopupTest page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('BindPopupTest beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BindPopupTest after each called');
    })

    /* *
    * @tc.number: bindPopupTest_001
    * @tc.name  : bindPopupTest_001
    * @tc.desc  : Test the bindpopup component
    * @tc.level : Level 0
    */
    it('bindPopupTest_001', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('bindPopup001'));
      await btn1.click()
      await CommonFunc.sleep(5000);
      expect(btn1 != null).assertTrue();
      done();
    });
  })
}