/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function replaceNamedRoute15() {
  describe('replaceNamedRoute15', () => {
    beforeEach(async (done: Function) => {
      console.info("replaceNamedRoute15 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/replaceNamedRoute/replaceNamedRoute15',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get replaceNamedRoute15 state success " + JSON.stringify(pages));
        if (!("replaceNamedRoute15" == pages.name)) {
          console.info("get replaceNamedRoute15 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push replaceNamedRoute15 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push replaceNamedRoute15 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("replaceNamedRoute15 after each called");
    });

    /**
     * @tc.name   replaceNamedRoute_401
     * @tc.number SUB_ARKUI_REPLACENAMEDROUTE_ERRCODE_0100
     * @tc.desc   Test replaceNamedRoute errCode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('replaceNamedRoute_401',  Level.LEVEL0, async (done: Function) => {
      console.info('replaceNamedRoute_401 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('replaceNamedRoute_401'));
      await btn.click()
      await CommonFunc.sleep(1000);
      console.info('[replaceNamedRoute_401] btn click');

      console.log('replaceNamedRoute_401 getValue: ', AppStorage.get('replaceNamedRoute_401'))
      expect(AppStorage.get('replaceNamedRoute_401')).assertEqual("401");
      AppStorage.delete('replaceNamedRoute_401')
      console.info('replaceNamedRoute_401 END');
      done();
    });
  })
}