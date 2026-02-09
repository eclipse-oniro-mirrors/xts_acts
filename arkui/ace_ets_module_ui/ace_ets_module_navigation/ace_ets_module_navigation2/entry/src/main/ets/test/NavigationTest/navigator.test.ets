/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function navigatorTargetJsunit() {
  describe('navigatorTargetTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigator2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigator state success " + JSON.stringify(pages));
        if (!("navigator" == pages.name)) {
          console.info("get navigator state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push navigator page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigator page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("navigatorTarget after each called");
    });

    /**
     * @tc.name   testnavigatorTarget0001
     * @tc.number testnavigatorTarget0001
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testnavigatorTarget0001',  Level.LEVEL0, async () => {
      console.info('navigatorTarget testnavigatorTarget0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Navigator');
      console.info("[testnavigatorTarget0001] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Navigator');
      expect(JSON.parse(strJson).$attrs.target).assertEqual("pages/index");
      console.info("[testnavigatorTarget0001] target value :" + JSON.parse(strJson).$attrs.target);

    });
  })
}
