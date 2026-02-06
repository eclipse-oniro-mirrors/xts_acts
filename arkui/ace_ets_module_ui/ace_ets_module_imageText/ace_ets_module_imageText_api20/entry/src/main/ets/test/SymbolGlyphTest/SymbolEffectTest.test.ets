/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function SymbolEffectTest() {
  describe('SymbolEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SymbolEffectTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolEffectTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("SymbolEffectTest" == pages.name)) {
          console.info("get SymbolEffectTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push SymbolEffectTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolEffectTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SymbolEffectTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_SYMBOL_GLYPH_EFFECT_API_0001
    * @tc.name         SymbolEffectTest0001
    * @tc.desc         test symbolEffect ReplaceSymbolEffect SEQUENTIAL  0
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('SymbolEffectTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('SymbolEffectTest0001 START');
      let symbolGlyph1 = getInspectorByKey('SymbolGlyph1');
      let symbolGlyph1Effect: ESObject = JSON.parse(JSON.parse(symbolGlyph1).$attrs.symbolEffect);
      console.log('symbolGlyph1Obj---effectType:'+symbolGlyph1Effect.effectType)
      console.log('symbolGlyph1Obj---triggerNum:'+symbolGlyph1Effect.triggerNum)
      expect(''+symbolGlyph1Effect.effectType).assertEqual('7')
      expect(''+symbolGlyph1Effect.triggerNum).assertEqual('0')
      console.info("[SymbolEffectTest0001] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_SYMBOL_GLYPH_EFFECT_API_0002
   * @tc.name         SymbolEffectTest0002
   * @tc.desc         test symbolEffect ReplaceSymbolEffect CROSS_FADE 0
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        3
    */
    it('SymbolEffectTest0002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('SymbolEffectTest0002 START');
      let symbolGlyph2 = getInspectorByKey('SymbolGlyph2');
      let symbolGlyph2Effect: ESObject = JSON.parse(JSON.parse(symbolGlyph2).$attrs.symbolEffect);
      console.log('symbolGlyph1Obj---effectType:'+symbolGlyph2Effect.effectType)
      console.log('symbolGlyph1Obj---triggerNum:'+symbolGlyph2Effect.triggerNum)
      expect(''+symbolGlyph2Effect.effectType).assertEqual('9')
      expect(''+symbolGlyph2Effect.triggerNum).assertEqual('0')
      console.info("[SymbolEffectTest0002] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_SYMBOL_GLYPH_EFFECT_API_0003
   * @tc.name         SymbolEffectTest0003
   * @tc.desc         test symbolEffect ReplaceSymbolEffect SLASH_OVERLAY  0
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        3
    */
    it('SymbolEffectTest0003', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('SymbolEffectTest0003 START');
      let symbolGlyph3 = getInspectorByKey('SymbolGlyph3');
      let symbolGlyph3Effect: ESObject = JSON.parse(JSON.parse(symbolGlyph3).$attrs.symbolEffect);
      console.log('symbolGlyph1Obj---effectType:'+symbolGlyph3Effect.effectType)
      console.log('symbolGlyph1Obj---triggerNum:'+symbolGlyph3Effect.triggerNum)
      expect(''+symbolGlyph3Effect.effectType).assertEqual('8')
      expect(''+symbolGlyph3Effect.triggerNum).assertEqual('0')
      console.info("[SymbolEffectTest0003] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_SYMBOL_GLYPH_EFFECT_API_0004
   * @tc.name         SymbolEffectTest0004
   * @tc.desc         test symbolEffect ReplaceSymbolEffect SEQUENTIAL  1
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        3
    */
    it('SymbolEffectTest0004', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('SymbolEffectTest0004 START');
      let trigger_1 = await driver.findComponent(ON.id('trigger_1'))
      await CommonFunc.sleep(500);
      await trigger_1.click()
      await CommonFunc.sleep(500);
      let symbolGlyph1 = getInspectorByKey('SymbolGlyph1');
      let symbolGlyph1Effect: ESObject = JSON.parse(JSON.parse(symbolGlyph1).$attrs.symbolEffect);
      console.log('symbolGlyph1Obj---effectType:'+symbolGlyph1Effect.effectType)
      console.log('symbolGlyph1Obj---triggerNum:'+symbolGlyph1Effect.triggerNum)
      expect(''+symbolGlyph1Effect.effectType).assertEqual('7')
      expect(''+symbolGlyph1Effect.triggerNum).assertEqual('1')
      console.info("[SymbolEffectTest0004] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_SYMBOL_GLYPH_EFFECT_API_0005
   * @tc.name         SymbolEffectTest0005
   * @tc.desc         test symbolEffect ReplaceSymbolEffect CROSS_FADE 1
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        3
    */
    it('SymbolEffectTest0005', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('SymbolEffectTest0005 START');
      let trigger_2 = await driver.findComponent(ON.id('trigger_2'))
      await CommonFunc.sleep(500);
      await trigger_2.click()
      await CommonFunc.sleep(500);
      let symbolGlyph2 = getInspectorByKey('SymbolGlyph2');
      let symbolGlyph2Effect: ESObject = JSON.parse(JSON.parse(symbolGlyph2).$attrs.symbolEffect);
      console.log('symbolGlyph1Obj---effectType:'+symbolGlyph2Effect.effectType)
      console.log('symbolGlyph1Obj---triggerNum:'+symbolGlyph2Effect.triggerNum)
      expect(''+symbolGlyph2Effect.effectType).assertEqual('9')
      expect(''+symbolGlyph2Effect.triggerNum).assertEqual('1')
      console.info("[SymbolEffectTest0005] end");
      done();
    });

    /*
  * @tc.number       SUB_ACE_BASIC_ETS_SYMBOL_GLYPH_EFFECT_API_0006
  * @tc.name         SymbolEffectTest0006
  * @tc.desc         test symbolEffect ReplaceSymbolEffect SLASH_OVERLAY  1
  * @tc.size         MediumTest
  * @tc.type         Function
  * @tc.level        3
   */
    it('SymbolEffectTest0006', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('SymbolEffectTest0006 START');
      let trigger_3 = await driver.findComponent(ON.id('trigger_3'))
      await CommonFunc.sleep(500);
      await trigger_3.click()
      await CommonFunc.sleep(500);
      let SymbolGlyph3 = getInspectorByKey('SymbolGlyph3');
      let symbolGlyph3Effect: ESObject = JSON.parse(JSON.parse(SymbolGlyph3).$attrs.symbolEffect);
      console.log('symbolGlyph1Obj---effectType:'+symbolGlyph3Effect.effectType)
      console.log('symbolGlyph1Obj---triggerNum:'+symbolGlyph3Effect.triggerNum)
      expect(''+symbolGlyph3Effect.effectType).assertEqual('8')
      expect(''+symbolGlyph3Effect.triggerNum).assertEqual('1')
      console.info("[SymbolEffectTest0006] end");
      done();
    });
  })
}