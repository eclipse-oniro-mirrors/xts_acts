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

export default function imageAddApi() {
  describe('imageAddApi', () => {
    beforeEach(async (done: Function) => {
      console.info("imageAddApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageAddApi state pages:" + JSON.stringify(pages));
        if (!("imageAddApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Image/imageAddApi"})
          await CommonFunc.sleep(2000);
          console.info("push imageAddApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageAddApi page error:" + err);
      }
      console.info("imageAddApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("imageAddApi after each called");
    });


    /**
     * @tc.name   imageAddApi_001
     * @tc.number imageAddApi_001
     * @tc.desc   imageAddApi_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageAddApi_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[imageAddApi_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('imageAddApi');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageAddApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.dynamicRangeMode).assertEqual('STANDARD');
      console.info('[imageAddApi_001] END');
      done();

    });


    /**
     * @tc.name   imageAddApi_002
     * @tc.number imageAddApi_002
     * @tc.desc   imageAddApi_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageAddApi_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[imageAddApi_002] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('imageAddApi2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageAddApi_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.dynamicRangeMode).assertEqual('HIGH');
      console.info('[imageAddApi_002] END');
      done();

    });


    /**
     * @tc.name   imageAddApi_003
     * @tc.number imageAddApi_003
     * @tc.desc   imageAddApi_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageAddApi_003',  Level.LEVEL0, async (done: Function) => {
      console.info('[imageAddApi_003] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('imageAddApi3');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageAddApi_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.dynamicRangeMode).assertEqual('CONSTRAINT');
      console.info('[imageAddApi_003] END');
      done();

    });





  })
}
