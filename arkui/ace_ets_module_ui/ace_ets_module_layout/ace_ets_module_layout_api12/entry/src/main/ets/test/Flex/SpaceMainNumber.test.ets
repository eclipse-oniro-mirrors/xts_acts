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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function SpaceMainNumberJsunit() {
  describe('SpaceMainNumberJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("space1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Flex/SpaceMainNumber",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get space1 state pages: " + JSON.stringify(pages));
        if (!("SpaceMainNumber" == pages.name)) {
          console.info("get space1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push space1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push space1 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   space1Test_0010
     * @tc.number space1Test_0010
     * @tc.desc   Space: get the api of space1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('space1Test_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('space1Test_0010 START');
      let strJson = getInspectorByKey('flex_main_number_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[space1Test_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.space).assertEqual("10.00px");
      console.info('[space1Test_0010] END');
      done();
    });

    /**
     * @tc.name   space1Test_0020
     * @tc.number space1Test_0020
     * @tc.desc   Space: get the api of space1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('space1Test_0020',  Level.LEVEL0, async (done: Function) => {
      console.info('space1Test_0020 START');
      let strJson = getInspectorByKey('flex_main_number_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[space1Test_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.space).assertEqual("0.00vp");
      console.info('[space1Test_0020] END');
      done();
    }); 

    /**
     * @tc.name   space1Test_0030
     * @tc.number space1Test_0030
     * @tc.desc   Space: get the api of space1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('space1Test_0030',  Level.LEVEL0, async (done: Function) => {
      console.info('space1Test_0030 START');
      let strJson = getInspectorByKey('flex_main_number_3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[space1Test_0030] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.space).assertEqual("0.00px");
      console.info('[space1Test_0030] END');
      done();
    }); 

    /**
     * @tc.name   space1Test_0040
     * @tc.number space1Test_0040
     * @tc.desc   Space: get the api of space1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('space1Test_0040',  Level.LEVEL0, async (done: Function) => {
      console.info('space1Test_0040 START');
      let strJson = getInspectorByKey('flex_main_number_4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[space1Test_0040] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.space).assertEqual("0.00px");
      console.info('[space1Test_0040] END');
      done();
    });

    /**
     * @tc.name   space1Test_0050
     * @tc.number space1Test_0050
     * @tc.desc   Space: get the api of space1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('space1Test_0050',  Level.LEVEL0, async (done: Function) => {
      console.info('space1Test_0050 START');
      let strJson = getInspectorByKey('flex_main_number_5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[space1Test_0050] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.space).assertEqual("3276789.00px");
      console.info('[space1Test_0050] END');
      done();
    }); 

  })
}

