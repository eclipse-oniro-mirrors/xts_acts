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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
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

export default function spanBaselineOffsetJsunit() {
  describe('spanBaselineOffsetJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("spanBaselineOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/spanBaselineOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get spanBaselineOffset state pages: " + JSON.stringify(pages));
        if (!("spanBaselineOffset" == pages.name)) {
          console.info("get spanBaselineOffset state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push spanBaselineOffset page error: " + err);
      }
      done();
    })
    /*
    * @tc.number
    * @tc.name       : SpanBaselineOffsetJsunit_0101
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('SpanBaselineOffsetJsunit_0101', 0, async (done: Function) => {
      console.info('[SpanBaselineOffsetJsunit_0101] START');
      let strJson = getInspectorByKey('SpanBaselineOffsetKey001');
      console.info("[SpanBaselineOffsetJsunit_0101] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.baselineOffset).assertEqual('10.00vp');
      console.info('[SpanBaselineOffsetJsunit_0101] END**********************************');
      done();
    });
    /*
    * @tc.number 
    * @tc.name       : SpanBaselineOffsetJsunit_0102
    * @tc.desc       : test prefetchResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('SpanBaselineOffsetJsunit_0102', 0, async (done: Function) => {
      console.info('[SpanBaselineOffsetJsunit_0102] START');
      let strJson = getInspectorByKey('SpanBaselineOffsetKey002');
      console.info("[SpanBaselineOffsetJsunit_0102] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.baselineOffset).assertEqual(5);
      console.info('[SpanBaselineOffsetJsunit_0102] END**********************************');
      done();
    });
  });
}
