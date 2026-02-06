/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import Utils from '../../MainAbility/common/Utils'

export default function NavigationApiOther() {
  describe('NavigationApiOther', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationApiOther',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationApi state success " + JSON.stringify(pages));
        if (!("NavigationApiOther" == pages.name)) {
          console.info("get NavigationApi state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push NavigationApi page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationApi page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("NavigationApi after each called");
    });

    /**
     * @tc.name   NavigationApi_002
     * @tc.number NavigationApi_002
     * @tc.desc   Navigation test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavigationApi_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationApi_002] START');
      await Utils.sleep(2000);

      let strJson: string = getInspectorByKey('NavigationApi_Navigation');
      await Utils.sleep(1000);
      console.info("[NavigationApi_002] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Navigation');
      console.info('[NavigationApi_002] END');
      done();
    });
  })
}


