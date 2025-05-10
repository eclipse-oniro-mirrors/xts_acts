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
import CommonFunc from '../../MainAbility/common/Common';


export default function getXComponentSurfaceRectJsunit() {
  describe('getXComponentSurfaceRectJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("getXComponentSurfaceRect beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/XComponent/getXComponentSurfaceRect",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getXComponentSurfaceRect state pages: " + JSON.stringify(pages));
        if (!("getXComponentSurfaceRect" == pages.name)) {
          console.info("get getXComponentSurfaceRect state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getXComponentSurfaceRect success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getXComponentSurfaceRect page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number getXComponentSurfaceRectTest_0010
     * @tc.name getXComponentSurfaceRectTest_0010
     * @tc.desc Xcomponent: get the api of getXComponentSurfaceRect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getXComponentSurfaceRectTest_0010', 0, async (done: Function) => {
      console.info('getXComponentSurfaceRectTest_0010 START');
      let strJson = getInspectorByKey('getXComponentSurfaceRect1_text');
      console.info("[getXComponentSurfaceRectTest_0010] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content)
        .assertEqual('{"offsetX":20,"offsetY":20,"surfaceWidth":500,"surfaceHeight":500}');
      console.info('[getXComponentSurfaceRectTest_0010] END');
      done();
    });
  })
}

