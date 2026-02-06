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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function V1ToV2() {
  describe('V1ToV2', () => {
    beforeEach(async (done: Function) => {
      console.info("V1ToV2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/V1V2Mix/V1ToV2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get V1ToV2 state pages:" + JSON.stringify(pages));
        if (!("StateMap0010" == pages.name)) {
          console.info("get V1ToV2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push V1ToV2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push V1ToV2 page error:" + err);
      }
      console.info("V1ToV2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("V1ToV2 after each called");
    });
    /**
     * @tc.name   v1Tov2_001
     * @tc.number v1Tov2_001
     * @tc.desc   test v2 to v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('v1Tov2_001', Level.LEVEL1, async (done: Function) => {
      console.info('[v1Tov2_001] START');
      let obj: ESObject = JSON.parse(getInspectorByKey('state_string_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_001] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('hello v1');
      console.info('[v1Tov2_001] END');
      done();
    })
    /**
     * @tc.name   v1Tov2_002
     * @tc.number v1Tov2_002
     * @tc.desc   test v2 to v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('v1Tov2_002', Level.LEVEL1, async (done: Function) => {
      console.info('[v1Tov2_002] START');
      let obj: ESObject = JSON.parse(getInspectorByKey('prop_number_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_002] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[v1Tov2_002] END');
      done();
    })
    /**
     * @tc.name   v1Tov2_003
     * @tc.number v1Tov2_003
     * @tc.desc   test v2 to v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('v1Tov2_003', Level.LEVEL1, async (done: Function) => {
      console.info('[v1Tov2_003] START');
      let obj: ESObject = JSON.parse(getInspectorByKey('provide_enum_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_003] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[v1Tov2_003] END');
      done();
    })
    /**
     * @tc.name   v1Tov2_004
     * @tc.number v1Tov2_004
     * @tc.desc   test v2 to v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('v1Tov2_004', Level.LEVEL1, async (done: Function) => {
      console.info('[v1Tov2_004] START');
      let obj: ESObject = JSON.parse(getInspectorByKey('consume_null_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_004] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('null');
      console.info('[v1Tov2_004] END');
      done();
    })
    /**
     * @tc.name   v1Tov2_005
     * @tc.number v1Tov2_005
     * @tc.desc   test v2 to v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('v1Tov2_005', Level.LEVEL1, async (done: Function) => {
      console.info('[v1Tov2_005] START');
      let obj: ESObject = JSON.parse(getInspectorByKey('storage_link_undefined_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_005] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[v1Tov2_005] END');
      done();
    })
    /**
     * @tc.name   v1Tov2_006
     * @tc.number v1Tov2_006
     * @tc.desc   test v2 to v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('v1Tov2_006', Level.LEVEL1, async (done: Function) => {
      console.info('[v1Tov2_006] START');
      let obj: ESObject = JSON.parse(getInspectorByKey('storage_prop_string_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_006] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('hello v1');
      console.info('[v1Tov2_006] END');
      done();
    })
    /**
     * @tc.name   v1Tov2_007
     * @tc.number v1Tov2_007
     * @tc.desc   test v2 to v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('v1Tov2_007', Level.LEVEL1, async (done: Function) => {
      console.info('[v1Tov2_007] START');
      let obj: ESObject = JSON.parse(getInspectorByKey('func_value2'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_007] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('hello v1,1,1,null,hello v1,undefined');
      console.info('[v1Tov2_007] END');
      done();
    })
    /**
     * @tc.name   v1Tov2_008
     * @tc.number v1Tov2_008
     * @tc.desc   test v2 to v1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('v1Tov2_008', Level.LEVEL1, async (done: Function) => {
      console.info('[v1Tov2_008] START');
      let obj: ESObject = JSON.parse(getInspectorByKey('link_boolean_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_008] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[v1Tov2_008] END');
      done();
    })
  })
}