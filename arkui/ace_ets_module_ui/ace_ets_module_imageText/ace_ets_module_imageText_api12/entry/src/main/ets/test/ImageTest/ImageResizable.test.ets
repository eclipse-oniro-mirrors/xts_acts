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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ImageResizable() {
  describe('ImageResizable', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageResizable beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageResizable state pages:" + JSON.stringify(pages));
        if (!("ImageResizable" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Image/ImageResizable"})
          await CommonFunc.sleep(2000);
          console.info("push ImageResizable page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageResizable page error:" + err);
      }
      console.info("ImageResizable foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ImageResizable after each called");
    });
    /**
     * @tc.number ImageResizable_001
     * @tc.name   ImageResizable_001
     * @tc.desc   ImageResizable_test
     * @tc.size   ImageResizable
     * @tc.type   Attribute
     * @tc.level  2
     */
    it('ImageResizable_001', 0, async (done: Function) => {
      console.info('[ImageResizable_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageResizable_Image1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageResizable_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$type).assertEqual('Image');
      console.info('[ImageResizable_001] END');
      done();
    });
  })
}