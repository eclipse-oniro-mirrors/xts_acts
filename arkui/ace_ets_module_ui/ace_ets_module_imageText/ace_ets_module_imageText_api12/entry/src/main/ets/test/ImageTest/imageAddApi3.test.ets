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

export default function imageAddApi3() {
  describe('imageAddApi3', () => {
    beforeEach(async (done: Function) =>  {
      console.info("imageAddApi3 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageAddApi3 state pages:" + JSON.stringify(pages));
        if (!("imageAddApi3" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Image/imageAddApi3"})
          await CommonFunc.sleep(2000);
          console.info("push imageAddApi3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageAddApi3 page error:" + err);
      }
      console.info("imageAddApi3 foreEach end");
      done();
    });
    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("imageAddApi3 after each called");
    });

    /**
     * @tc.number     : SUB_ACE_UI_COMPONENT_IMAGE_001
     * @tc.desc       : objectFit test of image
     * @tc.name       : imageAddApi3_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('imageAddApi3_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[imageAddApi3_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('imageAddApi3');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageAddApi3_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.objectFit).assertEqual('ImageFit.TOP_START');
      console.info('[imageAddApi3_001] END');
      done();

    });

    /**
     * @tc.number     : SUB_ACE_UI_COMPONENT_IMAGE_002
     * @tc.desc       : objectFit test of image
     * @tc.name       : imageAddApi3_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('imageAddApi3_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[imageAddApi3_002] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('imageAddApi32');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageAddApi3_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.objectFit).assertEqual('ImageFit.TOP_END');
      console.info('[imageAddApi3_002] END');
      done();

    });

    /**
     * @tc.number     : SUB_ACE_UI_COMPONENT_IMAGE_003
     * @tc.desc       : objectFit test of image
     * @tc.name       : imageAddApi3_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('imageAddApi3_003',  Level.LEVEL0, async (done: Function) => {
      console.info('[imageAddApi3_003] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('imageAddApi33');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageAddApi3_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.objectFit).assertEqual('ImageFit.BOTTOM_START');
      console.info('[imageAddApi3_003] END');
      done();

    });

    /**
     * @tc.number     : SUB_ACE_UI_COMPONENT_IMAGE_004
     * @tc.desc       : objectFit test of image
     * @tc.name       : imageAddApi3_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('imageAddApi3_004',  Level.LEVEL0, async (done: Function) => {
      console.info('[imageAddApi3_003] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('imageAddApi34');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageAddApi3_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.objectFit).assertEqual('ImageFit.BOTTOM_END');
      console.info('[imageAddApi3_003] END');
      done();

    });





  })
}
