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
import { UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';

export default function ImageObjectFitTest() {
  describe('ImageObjectFitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageObjectFitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageObjectFitTest state pages:" + JSON.stringify(pages));
        if (!("ImageObjectFit" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Image/ImageObjectFit"
          })
          await CommonFunc.sleep(2000);
          console.info("push ImageObjectFitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageObjectFitTest page error:" + err);
      }
      console.info("ImageObjectFitTest foreEach end");
      done();
    });
    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("ImageObjectFitTest after each called");
    });

    /**
     * @tc.name   ImageObjectFitTest_001
     * @tc.number ImageObjectFitTest_001
     * @tc.desc   objectFit test of image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageObjectFitTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageObjectFitTest_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageObjectFit1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageObjectFitTest_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.TOP_START');
      console.info('[ImageObjectFitTest_001] END');
      done();
    });

    /**
     * @tc.name   ImageObjectFitTest_002
     * @tc.number ImageObjectFitTest_002
     * @tc.desc   objectFit test of image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageObjectFitTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageObjectFitTest_002] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageObjectFit2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageObjectFitTest_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.TOP_END');
      console.info('[ImageObjectFitTest_002] END');
      done();
    });

    /**
     * @tc.name   ImageObjectFitTest_003
     * @tc.number ImageObjectFitTest_003
     * @tc.desc   objectFit test of image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageObjectFitTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageObjectFitTest_003] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageObjectFit3');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageObjectFitTest_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.BOTTOM_START');
      console.info('[ImageObjectFitTest_003] END');
      done();
    });

    /**
     * @tc.name   ImageObjectFitTest_004
     * @tc.number ImageObjectFitTest_004
     * @tc.desc   objectFit test of image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageObjectFitTest_004', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageObjectFitTest_003] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageObjectFit4');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageObjectFitTest_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.BOTTOM_END');
      console.info('[ImageObjectFitTest_003] END');
      done();
    });
  })
}
