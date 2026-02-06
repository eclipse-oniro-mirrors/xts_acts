/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
  UiDriver,
  Component,
  Driver,
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


export default function CombinationState8Jsunit() {
  describe('CombinationState8Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("CombinationState8 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/CombinationState8',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CombinationState8J state pages: " + JSON.stringify(pages));
        if (!("CombinationState8" == pages.name)) {
          console.info("get CombinationState8 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CombinationState8 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CombinationState8 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CombinationState8Jsunit_0100
     * @tc.number CombinationState8Jsunit_0100
     * @tc.desc   CombinationState8Jsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CombinationState8Jsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[CombinationState8Jsunit_0100] START');
      let strJson = getInspectorByKey('SubState1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CombinationState8Jsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[CombinationState8Jsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("@State:1");
      console.info('[CombinationState8Jsunit_0100] END');
      done();
    });

    /**
     * @tc.name   CombinationState8Jsunit_0200
     * @tc.number CombinationState8Jsunit_0200
     * @tc.desc   CombinationState8Jsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CombinationState8Jsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[CombinationState8Jsunit_0200] START');
      let strJson = getInspectorByKey('SubProp1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CombinationState8Jsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[CombinationState8Jsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("@Prop:1");
      console.info('[CombinationState8Jsunit_0200] END');
      done();
    });

    /**
     * @tc.name   CombinationState8Jsunit_0300
     * @tc.number CombinationState8Jsunit_0300
     * @tc.desc   CombinationState8Jsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CombinationState8Jsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[CombinationState8Jsunit_0300] START');
      let strJson = getInspectorByKey('SubProvide1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CombinationState8Jsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[CombinationState8Jsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("@Provide:1");
      console.info('[CombinationState8Jsunit_0300] END');
      done();
    });

    /**
     * @tc.name   CombinationState8Jsunit_0400
     * @tc.number CombinationState8Jsunit_0400
     * @tc.desc   CombinationState8Jsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CombinationState8Jsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[CombinationState8Jsunit_0400] START');
      let strJson = getInspectorByKey('SubLink1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CombinationState8Jsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[CombinationState8Jsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("@Link:1");
      console.info('[CombinationState8Jsunit_0400] END');
      done();
    });
  })
}
