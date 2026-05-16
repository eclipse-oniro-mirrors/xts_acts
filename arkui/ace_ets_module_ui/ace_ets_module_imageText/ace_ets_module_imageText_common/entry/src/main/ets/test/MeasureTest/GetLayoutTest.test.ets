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

export default function GetLayoutTest() {
  describe('GetLayoutTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetLayoutTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetLayoutTest state pages:" + JSON.stringify(pages));
        if (!("GetLayoutTest" == pages.name)) {
          console.info("get  GetLayoutTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Measure/GetLayoutTest"})
          await CommonFunc.sleep(2000);
          console.info("push GetLayoutTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetLayoutTest page error:" + err);
      }
      console.info("GetLayoutTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetLayoutTest after each called");
    });


    /**
     * @tc.name   getLayout_001
     * @tc.number getLayout_001
     * @tc.desc   getLayout_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLayout_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[getLayout_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getLayout1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getLayout_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content != '').assertTrue();
      console.info('[getLayout_001] END');
      done();
    });


    /**
     * @tc.name   getLayout_002
     * @tc.number getLayout_002
     * @tc.desc   getLayout_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLayout_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[getLayout_002] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getLayout2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getLayout_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content != '').assertTrue();
      console.info('[getLayout_002] END');
      done();
    });


    /**
     * @tc.name   getLayout_003
     * @tc.number getLayout_003
     * @tc.desc   getLayout_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLayout_003',  Level.LEVEL0, async (done: Function) => {
      console.info('[getLayout_003] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getLayout3');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getLayout_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content != '').assertTrue();
      console.info('[getLayout_003] END');
      done();
    });


    /**
     * @tc.name   getLayout_004
     * @tc.number getLayout_004
     * @tc.desc   getLayout_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLayout_004',  Level.LEVEL0, async (done: Function) => {
      console.info('[getLayout_004] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getLayout4');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getLayout_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content != '').assertTrue();
      console.info('[getLayout_004] END');
      done();
    });


    /**
     * @tc.name   getLayout_005
     * @tc.number getLayout_005
     * @tc.desc   getLayout_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLayout_005',  Level.LEVEL0, async (done: Function) => {
      console.info('[getLayout_005] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getLayout5');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getLayout_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content != '').assertTrue();
      console.info('[getLayout_005] END');
      done();
    });


    /**
     * @tc.name   getLayout_006
     * @tc.number getLayout_006
     * @tc.desc   getLayout_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLayout_006',  Level.LEVEL0, async (done: Function) => {
      console.info('[getLayout_006] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('getLayout6');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getLayout_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content != '').assertTrue();
      console.info('[getLayout_006] END');
      done();
    });
  })
}
