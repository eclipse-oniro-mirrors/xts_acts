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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function EffectFillStyle() {
  describe('EffectFillStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("EffectFillStyle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SymbolGlyph/EffectFillStyle",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EffectFillStyle state pages: " + JSON.stringify(pages));
        if (!("EffectFillStyle" == pages.name)) {
          console.info("get EffectFillStyle state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push EffectFillStyle success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EffectFillStyle page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_EffectFillStyle_0100
     * @tc.name      EffectFillStyle_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('EffectFillStyle_0100', 0, async (done: Function) => {
      console.info('EffectFillStyle_0100 START');
      let strJson = getInspectorByKey('ITERATIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[EffectFillStyle_0100] component obj is: " + JSON.stringify(obj));
      console.info("[EffectFillStyle_0100] symbolEffect: " + JSON.stringify(obj.$attrs.symbolEffect));
      expect(obj.$attrs.symbolEffect).assertEqual("{\"effectType\":2,\"scopeType\":0,\"commonSubType\":0,\"fillStyle\":1,\"isTxtActive\":true,\"isActive\":true}");
      console.info('[EffectFillStyle_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EffectFillStyle_0200
     * @tc.name      EffectFillStyle_0200
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('EffectFillStyle_0200', 0, async (done: Function) => {
      console.info('EffectFillStyle_0100 START');
      let strJson = getInspectorByKey('CUMULATIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[EffectFillStyle_0200] component obj is: " + JSON.stringify(obj));
      console.info("[EffectFillStyle_0200] symbolEffect: " + JSON.stringify(obj.$attrs.symbolEffect));
      expect(obj.$attrs.symbolEffect).assertEqual("{\"effectType\":2,\"scopeType\":0,\"commonSubType\":0,\"fillStyle\":0,\"isTxtActive\":true,\"isActive\":true}");
      console.info('[EffectFillStyle_0200] END');
      done();
    });

  })
}

