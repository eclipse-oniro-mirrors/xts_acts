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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from "../../MainAbility/common/Common";

export default function MovingPhotoView() {
  describe('MovingPhotoView', function () {
    beforeEach(async function (done) {
      console.info("MovingPhotoView beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Video/MovingPhotoView',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MovingPhotoView state pages: " + JSON.stringify(pages));
        if (!("MovingPhotoView" == pages.name)) {
          console.info("get MovingPhotoView state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push MovingPhotoView page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MovingPhotoView page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   MovingPhotoView_001
     * @tc.number MovingPhotoView_001
     * @tc.desc   MovingPhotoView_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MovingPhotoView_001', Level.LEVEL3, async function (done) {

      console.info('[MovingPhotoView_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('MovingPhotoViewText');
      await CommonFunc.sleep(200);
      let obj = JSON.parse(strJson);
      console.info("[MovingPhotoView_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('start');

      console.info('[MovingPhotoView_001] END');
      done();
    });


    /**
     * @tc.name   MovingPhotoView_002
     * @tc.number MovingPhotoView_002
     * @tc.desc   MovingPhotoView_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MovingPhotoView_002', Level.LEVEL3, async function (done) {

      console.info('[MovingPhotoView_002] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('MovingPhotoViewText2');
      await CommonFunc.sleep(200);
      let obj = JSON.parse(strJson);
      console.info("[MovingPhotoView_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('stop');

      console.info('[MovingPhotoView_002] END');
      done();
    });





  })
}
