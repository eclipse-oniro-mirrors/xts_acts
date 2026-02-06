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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';;

export default function polylineJsunit() {
  describe('appInfoTest_four_7', () => {
    beforeEach(async (done: Function) => {
      console.info("polyline beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Polyline/polyline',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get polyline state pages:" + JSON.stringify(pages));
        if (!("polyline" == pages.name)) {
          console.info("get polyline state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push polyline page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push polyline page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("polyline after each called");
    });

    /**
     * @tc.name   testPolyline001
     * @tc.number SUB_ARKUI_API_testPolyline001
     * @tc.desc   PolylineAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPolyline001', Level.LEVEL0, async (done: Function) => {
      console.info('[testPolyline001] START');
      await Utils.sleep(4000);

      let strJson: string = getInspectorByKey('polylineJsunitType');
      expect(JSON.parse(strJson).$type).assertEqual('Polyline')

      console.info("[testPolyline001] obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info('[testPolyline001] END');
      done();
    });
  })
}
