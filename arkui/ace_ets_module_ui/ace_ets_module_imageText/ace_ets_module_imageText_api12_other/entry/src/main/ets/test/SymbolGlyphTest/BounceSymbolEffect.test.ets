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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function BounceSymbolEffectTest() {
  describe('BounceSymbolEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("BounceSymbolEffectTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BounceSymbolEffectTest state pages:" + JSON.stringify(pages));
        if (!("BounceSymbolEffect" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url:"MainAbility/pages/SymbolGlyph/BounceSymbolEffect"
            })
          await CommonFunc.sleep(2000);
          console.info("push BounceSymbolEffectTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BounceSymbolEffectTest page error:" + err);
      }
      console.info("BounceSymbolEffectTest foreEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("BounceSymbolEffectTest after each called");
    });

    /**
     * @tc.name   BounceSymbolEffectTest_001
     * @tc.number SUB_ACE_UI_COMPONENT_SymbolGlyph_001
     * @tc.desc   symbolEffect test of SymbolGlyph
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BounceSymbolEffectTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[BounceSymbolEffectTest_001] START');
      let strJson = getInspectorByKey('SymbolGlyph_1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BounceSymbolEffectTest_001] symbolEffect: ' + JSON.stringify(obj.$attrs.symbolEffect));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.symbolEffect).assertEqual('{"effectType":5,"scopeType":0,"commonSubType":0,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_001] END');
      done();
    });

    /**
     * @tc.name   BounceSymbolEffectTest_002
     * @tc.number SUB_ACE_UI_COMPONENT_SymbolGlyph_002
     * @tc.desc   symbolEffect test of SymbolGlyph
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BounceSymbolEffectTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[BounceSymbolEffectTest_002] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BounceSymbolEffectTest_002] symbolEffect: ' + JSON.stringify(obj.$attrs.symbolEffect));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.symbolEffect).assertEqual('{"effectType":5,"scopeType":1,"commonSubType":1,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_002] END');
      done();
    });

    /**
     * @tc.name   BounceSymbolEffectTest_003
     * @tc.number SUB_ACE_UI_COMPONENT_SymbolGlyph_003
     * @tc.desc   symbolEffect test of SymbolGlyph
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BounceSymbolEffectTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[BounceSymbolEffectTest_003] START');
      let strJson = getInspectorByKey('SymbolGlyph_3');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BounceSymbolEffectTest_003] symbolEffect: ' + JSON.stringify(obj.$attrs.symbolEffect));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.symbolEffect).assertEqual('{"effectType":5,"scopeType":0,"commonSubType":0,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_003] END');
      done();
    });

    /**
     * @tc.name   BounceSymbolEffectTest_004
     * @tc.number SUB_ACE_UI_COMPONENT_SymbolGlyph_004
     * @tc.desc   symbolEffect test of SymbolGlyph
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BounceSymbolEffectTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[BounceSymbolEffectTest_004] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_4');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BounceSymbolEffectTest_004] symbolEffect: ' + JSON.stringify(obj.$attrs.symbolEffect));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.symbolEffect).assertEqual('{"effectType":5,"scopeType":0,"commonSubType":0,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_004] END');
      done();
    });

    /**
     * @tc.name   BounceSymbolEffectTest_005
     * @tc.number SUB_ACE_UI_COMPONENT_SymbolGlyph_005
     * @tc.desc   symbolEffect test of SymbolGlyph
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BounceSymbolEffectTest_005', Level.LEVEL1, async (done: Function) => {
      console.info('[BounceSymbolEffectTest_005] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyph_5');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BounceSymbolEffectTest_005] symbolEffect: ' + JSON.stringify(obj.$attrs.symbolEffect));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.symbolEffect).assertEqual('{"effectType":5,"scopeType":0,"commonSubType":0,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_005] END');
      done();
    });
  })
}
