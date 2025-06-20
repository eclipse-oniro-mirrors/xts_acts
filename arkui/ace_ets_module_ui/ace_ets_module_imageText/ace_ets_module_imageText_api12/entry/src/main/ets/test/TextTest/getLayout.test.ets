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

export default function getLayout() {
  describe('getLayout', () => {
    beforeEach(async (done: Function) => {
      console.info("getLayout beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getLayout state pages:" + JSON.stringify(pages));
        if (!("getLayout" == pages.name)) {
          console.info("get  getLayout pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Text/getLayout"})
          await CommonFunc.sleep(2000);
          console.info("push getLayout page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getLayout page error:" + err);
      }
      console.info("getLayout foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getLayout after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_Layout_001
     * @tc.desc      getMargin test of Layoutable
     * @tc.level     Level 3
     * @tc.type
     */

    it('getLayout_001', 0, async (done: Function) => {
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
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_Layout_003
     * @tc.desc      getPadding test of Layoutable
     * @tc.level     Level 3
     * @tc.type
     */

    it('getLayout_002', 0, async (done: Function) => {
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
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_Layout_003
     * @tc.desc      getBorderWidth test of Layoutable
     * @tc.level     Level 3
     * @tc.type
     */

    it('getLayout_003', 0, async (done: Function) => {
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
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_Layout_004
     * @tc.desc      getMargin test of Measurable
     * @tc.level     Level 3
     * @tc.type
     */

    it('getLayout_004', 0, async (done: Function) => {
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
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_Layout_005
     * @tc.desc      getPadding test of Measurable
     * @tc.level     Level 3
     * @tc.type
     */

    it('getLayout_005', 0, async (done: Function) => {
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
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_Layout_006
     * @tc.desc      getBorderWidth test of Measurable
     * @tc.level     Level 3
     * @tc.type
     */

    it('getLayout_006', 0, async (done: Function) => {
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
