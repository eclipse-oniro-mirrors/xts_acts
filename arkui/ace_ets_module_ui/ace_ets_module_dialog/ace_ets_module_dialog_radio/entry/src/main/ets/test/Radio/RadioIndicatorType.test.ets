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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';


export default function RadioIndicatorType() {
  describe('RadioIndicatorType', () => {
    beforeEach(async (done: Function) => {
      console.info("RadioIndicatorType beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/RadioIndicatorType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RadioIndicatorType state success " + JSON.stringify(pages));
        if (!("RadioIndicatorType" == pages.name)) {
          console.info("get RadioIndicatorType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push RadioIndicatorType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RadioIndicatorType page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RadioIndicatorType after each called");
    });


    /**
     * @tc.name   RadioIndicatorType_001
     * @tc.number SUB_ARKUI_API_RadioIndicatorType_001
     * @tc.desc   RadioAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RadioIndicatorType_001', Level.LEVEL1, async (done: Function) => {
      console.info('[RadioIndicatorType_001] START');
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('RadioIndicatorType_Radio1');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[RadioIndicatorType_001] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.indicatorType).assertEqual('TICK');

      console.info('[RadioIndicatorType_001] END');
      done();
    });



    /**
     * @tc.name   RadioIndicatorType_002
     * @tc.number SUB_ARKUI_API_RadioIndicatorType_002
     * @tc.desc   RadioAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RadioIndicatorType_002', Level.LEVEL1, async (done: Function) => {
      console.info('[RadioIndicatorType_002] START');
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('RadioIndicatorType_Radio2');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[RadioIndicatorType_002] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.indicatorType).assertEqual('DOT');

      console.info('[RadioIndicatorType_002] END');
      done();
    });

    /**
     * @tc.name   RadioIndicatorType_003
     * @tc.number SUB_ARKUI_API_RadioIndicatorType_003
     * @tc.desc   RadioAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RadioIndicatorType_003', Level.LEVEL1, async (done: Function) => {
      console.info('[RadioIndicatorType_003] START');
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('RadioIndicatorType_Radio3');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[RadioIndicatorType_003] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.indicatorType).assertEqual('CUSTOM');

      let strJson2 = getInspectorByKey('RadioIndicatorType_Text');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[RadioIndicatorType_003] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('Custom');

      console.info('[RadioIndicatorType_003] END');
      done();
    });


  })
}


