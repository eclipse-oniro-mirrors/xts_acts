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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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
import CommonFunc from '../../MainAbility/utils/Common';
import bundle from '@ohos.bundle.bundleManager';

export default function blendMode1Jsunit() {
  describe('blendMode1Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("blendMode1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/backgroundEffect/blendMode1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get blendMode1Jsunit state pages: " + JSON.stringify(pages));
        if (!("blendMode1" == pages.name)) {
          console.info("get blendMode1Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push blendMode1Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push blendMode1Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number blendMode1Jsunit_0100
     * @tc.name blendMode1Jsunit_0100
     * @tc.desc set api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendMode1Jsunit_0100', 0, async (done: Function) => {
      // Get the information of the blendMode component
      console.info('[blendMode1Jsunit_0100] START');
      let strJson = getInspectorByKey('blendMode11_DESTINATION_IN');
      let obj = JSON.parse(strJson);
      console.info("[blendMode1Jsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.blendMode).assertEqual(1);
      console.info('[blendMode1Jsunit_0100] END');
      done();
    });

    /**
     * @tc.number blendMode1Jsunit_0200
     * @tc.name blendMode1Jsunit_0200
     * @tc.desc set api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendMode1Jsunit_0200', 0, async (done: Function) => {
      // Get the information of the blendMode component
      console.info('[blendMode1Jsunit_0200] START');
      let strJson = getInspectorByKey('blendMode11_SOURCE_IN');
      console.info("[blendMode1Jsunit_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(2);
      console.info('[blendMode1Jsunit_0200] END');
      done();
    });

    /**
     * @tc.number blendMode1Jsunit_0300
     * @tc.name blendMode1Jsunit_0300
     * @tc.desc set api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('blendMode1Jsunit_0300', 0, async (done: Function) => {
      // Get the information of the blendMode component
      console.info('[blendMode1Jsunit_0300] START');
      let strJson = getInspectorByKey('blendMode11_NORMAL');
      console.info("[blendMode1Jsunit_0300] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(0);
      console.info('[blendMode1Jsunit_0300] END');
      done();
    });
  })
}
