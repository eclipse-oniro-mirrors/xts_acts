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

export default function SymbolGlyphApi() {
  describe('SymbolGlyphApi', () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolGlyphApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolGlyphApi state pages:" + JSON.stringify(pages));
        if (!("SymbolGlyphApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/SymbolGlyph/SymbolGlyphApi"})
          await CommonFunc.sleep(2000);
          console.info("push SymbolGlyphApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolGlyphApi page error:" + err);
      }
      console.info("SymbolGlyphApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SymbolGlyphApi after each called");
    });


    /**
     * @tc.name   SymbolGlyphApi_001
     * @tc.number SymbolGlyphApi_001
     * @tc.desc   SymbolGlyphApi_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SymbolGlyphApi_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[SymbolGlyphApi_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyphApi');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.symbolEffect).isActive + '';
      console.info("[styledStringApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj).assertEqual('true');
      console.info('[styledStringApi_001] END');
      done();

    });


    /**
     * @tc.name   SymbolGlyphApi_002
     * @tc.number SymbolGlyphApi_002
     * @tc.desc   SymbolGlyphApi_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SymbolGlyphApi_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[SymbolGlyphApi_002] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyphApi1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.symbolEffect).effectType + '';
      console.info("[SymbolGlyphApi_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj).assertEqual('7');
      console.info('[SymbolGlyphApi_002] END');
      done();

    });


    /**
     * @tc.name   SymbolGlyphApi_003
     * @tc.number SymbolGlyphApi_003
     * @tc.desc   SymbolGlyphApi_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SymbolGlyphApi_003',  Level.LEVEL0, async (done: Function) => {
      console.info('[SymbolGlyphApi_003] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyphApi2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.symbolEffect).effectType + '';
      console.info("[SymbolGlyphApi_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj).assertEqual('1');
      console.info('[SymbolGlyphApi_003] END');
      done();

    });


    /**
     * @tc.name   SymbolGlyphApi_004
     * @tc.number SymbolGlyphApi_004
     * @tc.desc   SymbolGlyphApi_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SymbolGlyphApi_004',  Level.LEVEL0, async (done: Function) => {
      console.info('[SymbolGlyphApi_004] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyphApi3');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.symbolEffect).effectType + '';
      console.info("[SymbolGlyphApi_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj).assertEqual('3');
      console.info('[SymbolGlyphApi_004] END');
      done();

    });


    /**
     * @tc.name   SymbolGlyphApi_005
     * @tc.number SymbolGlyphApi_005
     * @tc.desc   SymbolGlyphApi_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SymbolGlyphApi_005',  Level.LEVEL0, async (done: Function) => {
      console.info('[SymbolGlyphApi_005] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyphApi4');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.symbolEffect).effectType + '';
      console.info("[SymbolGlyphApi_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj).assertEqual('4');
      console.info('[SymbolGlyphApi_005] END');
      done();

    });


    /**
     * @tc.name   SymbolGlyphApi_006
     * @tc.number SymbolGlyphApi_006
     * @tc.desc   SymbolGlyphApi_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SymbolGlyphApi_006',  Level.LEVEL0, async (done: Function) => {
      console.info('[SymbolGlyphApi_006] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyphApi5');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(JSON.parse(strJson).$attrs.symbolEffect).effectType + '';
      console.info("[SymbolGlyphApi_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj).assertEqual('5');
      console.info('[SymbolGlyphApi_006] END');
      done();

    });





  })
}
