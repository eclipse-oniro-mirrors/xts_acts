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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function symbolEffect() {
  describe('symbolEffect', () => {
    beforeEach(async (done: Function) => {
      console.info("symbolEffect beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SymbolGlyph/symbolEffect",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get symbolEffect state pages: " + JSON.stringify(pages));
        if (!("symbolEffect" == pages.name)) {
          console.info("get symbolEffect state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push symbolEffect success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push symbolEffect page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   symbolEffect_0100
     * @tc.number SUB_ACE_symbolEffect_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('symbolEffect_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('symbolEffect_0100 START');
      let strJson = getInspectorByKey('ScaleSymbolEffect');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[symbolEffect_0100] component obj is: " + JSON.stringify(obj));
      console.info("[symbolEffect_0100] symbolEffect: " + JSON.stringify(obj.$attrs.symbolEffect));
      expect(obj.$attrs.symbolEffect).assertEqual('{"effectType":1,"scopeType":0,"commonSubType":1,"fillStyle":0,"isTxtActive":true,"isActive":true}');
      console.info('[symbolEffect_0100] END');
      done();
    });

    /**
     * @tc.name   symbolEffect_0200
     * @tc.number SUB_ACE_symbolEffect_0200
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('symbolEffect_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('symbolEffect_0200 START');
      let strJson = getInspectorByKey('AppearSymbolEffect');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[symbolEffect_0200] component obj is: " + JSON.stringify(obj));
      console.info("[symbolEffect_0200] symbolEffect: " + JSON.stringify(obj.$attrs.symbolEffect));
      expect(obj.$attrs.symbolEffect).assertEqual('{"effectType":3,"scopeType":1,"commonSubType":0,"fillStyle":0,"isTxtActive":false,"triggerNum":0}');
      console.info('[symbolEffect_0200] END');
      done();
    });

    /**
     * @tc.name   symbolEffect_0300
     * @tc.number SUB_ACE_symbolEffect_0300
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('symbolEffect_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('symbolEffect_0300 START');
      let strJson = getInspectorByKey('DisappearSymbolEffect');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[symbolEffect_0300] component obj is: " + JSON.stringify(obj));
      console.info("[symbolEffect_0300] symbolEffect: " + JSON.stringify(obj.$attrs.symbolEffect));
      expect(obj.$attrs.symbolEffect).assertEqual('{"effectType":4,"scopeType":1,"commonSubType":0,"fillStyle":0,"isTxtActive":false,"triggerNum":0}');
      console.info('[symbolEffect_0300] END');
      done();
    });
    

  })
}

