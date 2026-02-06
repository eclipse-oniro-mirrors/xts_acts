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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ContextGetMeasureUtils() {
  describe('ContextGetMeasureUtils', () => {
    beforeEach(async (done: Function) => {
      console.info("ContextGetMeasureUtils beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ContextGetMeasureUtils state pages:" + JSON.stringify(pages));
        if (!("ContextGetMeasureUtils" == pages.name)) {
          console.info("get  ContextGetMeasureUtils pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Measure/ContextGetMeasureUtils"})
          await CommonFunc.sleep(2000);
          console.info("push ContextGetMeasureUtils page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContextGetMeasureUtils page error:" + err);
      }
      console.info("ContextGetMeasureUtils foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Context after each called");
    });


    /**
     * @tc.name   Context_001
     * @tc.number Context_001
     * @tc.desc   Context_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Context_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[Context_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContextIndex');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Context_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content != '').assertTrue();
      console.info('[Context_001] END');
      done();

    });


    /**
     * @tc.name   Context_002
     * @tc.number Context_002
     * @tc.desc   Context_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Context_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[Context_002] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContextText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Context_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content != '').assertTrue();
      console.info('[Context_002] END');
      done();

    });
  })
}
