/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
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

export default function SegmentBtnMaterialTest0070() {
  describe('SegmentBtnMaterialTest0070', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentBtnMaterialTest0070 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentBtnMaterial0070",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("RepeatCloseReuse0110" == pages.name)) {
          console.info("get SegmentBtnMaterialTest0070 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentBtnMaterialTest0070 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentBtnMaterialTest0070 page error:" + err);
      }
      console.info("SegmentBtnMaterialTest0070 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentBtnMaterialTest0070 after each called");
    });

    /**
     * @tc.name   SegmentBtnMaterialTest0070_001
     * @tc.number SegmentBtnMaterialTest0070
     * @tc.desc   Set uiMaterial are undefined or uiMaterial.MaterialType.SEMI_TRANSPARENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentBtnMaterialTest0070_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentBtnMaterialTest0070_001] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree())).$children[0]
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(obj))
        .$children[1]
        .$children[0]
      console.info("[SegmentBtnMaterialTest0070_001] component obj1 is: " + JSON.stringify(obj));
      expect(obj1.$attrs.systemMaterial == null).assertTrue()
      let obj2: ESObject = JSON.parse(JSON.stringify(obj))
        .$children[2]
        .$children[0]
      console.info("[SegmentBtnMaterialTest0070_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.systemMaterial == null).assertTrue()
      let obj3: ESObject = JSON.parse(JSON.stringify(obj))
        .$children[3]
        .$children[0]
      console.info("[SegmentBtnMaterialTest0070_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.systemMaterial == null).assertTrue()
      let obj4: ESObject = JSON.parse(JSON.stringify(obj))
        .$children[3]
        .$children[1]
      console.info("[SegmentBtnMaterialTest0070_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.systemMaterial == null).assertTrue()
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnMaterial0070"));
      await btn.click();
      console.info("[SegmentBtnMaterialTest0070_001] btn click");
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(JSON.stringify(getInspectorTree())).$children[0]
      await CommonFunc.sleep(1000);
      let obj6: ESObject = JSON.parse(JSON.stringify(obj5))
        .$children[1]
        .$children[0]
      console.info("[SegmentBtnMaterialTest0070_001] component obj6 is: " + JSON.stringify(obj6));
      expect(JSON.stringify(obj6.$attrs.systemMaterial))
        .assertEqual('{"material":{"type":"MaterialType.SEMI_TRANSPARENT"}}');
      let obj7: ESObject = JSON.parse(JSON.stringify(obj5))
        .$children[2]
        .$children[0]
      console.info("[SegmentBtnMaterialTest0070_001] component obj7 is: " + JSON.stringify(obj7));
      expect(JSON.stringify(obj7.$attrs.systemMaterial))
        .assertEqual('{"material":{"type":"MaterialType.SEMI_TRANSPARENT"}}');
      let obj8: ESObject = JSON.parse(JSON.stringify(obj5))
        .$children[3]
        .$children[0]
      console.info("[SegmentBtnMaterialTest0070_001] component obj8 is: " + JSON.stringify(obj8));
      expect(JSON.stringify(obj8.$attrs.systemMaterial))
        .assertEqual('{"material":{"type":"MaterialType.SEMI_TRANSPARENT"}}');
      let obj9: ESObject = JSON.parse(JSON.stringify(obj5))
        .$children[3]
        .$children[1]
      console.info("[SegmentBtnMaterialTest0070_001] component obj9 is: " + JSON.stringify(obj9));
      expect(JSON.stringify(obj9.$attrs.systemMaterial))
        .assertEqual('{"material":{"type":"MaterialType.SEMI_TRANSPARENT"}}');
      await CommonFunc.sleep(1000);
      await btn.click();
      console.info("[SegmentBtnMaterialTest0070_001] btn click");
      await CommonFunc.sleep(1000);
      let obj10: ESObject = JSON.parse(JSON.stringify(getInspectorTree())).$children[0]
      await CommonFunc.sleep(1000);
      let obj11: ESObject = JSON.parse(JSON.stringify(obj10))
        .$children[1]
        .$children[0]
      console.info("[SegmentBtnMaterialTest0070_001] component obj11 is: " + JSON.stringify(obj11));
      expect(obj11.$attrs.systemMaterial == null).assertTrue()
      let obj12: ESObject = JSON.parse(JSON.stringify(obj10))
        .$children[2]
        .$children[0]
      console.info("[SegmentBtnMaterialTest0070_001] component obj12 is: " + JSON.stringify(obj12));
      expect(obj12.$attrs.systemMaterial == null).assertTrue()
      let obj13: ESObject = JSON.parse(JSON.stringify(obj10))
        .$children[3]
        .$children[0]
      console.info("[SegmentBtnMaterialTest0070_001] component obj13 is: " + JSON.stringify(obj13));
      expect(obj13.$attrs.systemMaterial == null).assertTrue()
      let obj14: ESObject = JSON.parse(JSON.stringify(obj10))
        .$children[3]
        .$children[1]
      console.info("[SegmentBtnMaterialTest0070_001] component obj14 is: " + JSON.stringify(obj14));
      expect(obj14.$attrs.systemMaterial == null).assertTrue()
      console.info('[SegmentBtnMaterialTest0070_001] END');
      done();
    });

  })
}