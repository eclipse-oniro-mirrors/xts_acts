'use static';
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function BounceSymbolEffectTest() {
  describe('BounceSymbolEffectTest', (): void => {
    beforeAll(() => {
      console.info("BounceSymbolEffectTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("BounceSymbolEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SymbolGlyph/BounceSymbolEffect",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get BounceSymbolEffectTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get BounceSymbolEffectTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BounceSymbolEffectTest page error:" + err);
      }
      console.info("BounceSymbolEffectTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("BounceSymbolEffectTest after each called");
    });


    
    
    


/**
     * @tc.number   BounceSymbolEffectTest_static_001
     * @tc.name     BounceSymbolEffectTest_static_001
     * @tc.desc     BounceSymbolEffectTest_static_001
     * @tc.level    Level.LEVEL1
     */
it('BounceSymbolEffectTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BounceSymbolEffectTest_001] START');
      let strJson: string = inspector.getInspectorByKey('SymbolGlyph_1');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BounceSymbolEffectTest_001] symbolEffect: ' +
      JSON.stringify(obj.getElement('$attrs').getString('symbolEffect')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('symbolEffect'))
        .assertEqual('{"effectType":5,"scopeType":0,"commonSubType":0,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_001] END');
      done();
    });


    
    
    


/**
     * @tc.number   BounceSymbolEffectTest_static_002
     * @tc.name     BounceSymbolEffectTest_static_002
     * @tc.desc     BounceSymbolEffectTest_static_002
     * @tc.level    Level.LEVEL1
     */
it('BounceSymbolEffectTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BounceSymbolEffectTest_002] START');

      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('SymbolGlyph_2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BounceSymbolEffectTest_002] symbolEffect: ' +
      JSON.stringify(obj.getElement('$attrs').getString('symbolEffect')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('symbolEffect'))
        .assertEqual('{"effectType":5,"scopeType":1,"commonSubType":1,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_002] END');
      done();
    });


    
    
    


/**
     * @tc.number   BounceSymbolEffectTest_static_003
     * @tc.name     BounceSymbolEffectTest_static_003
     * @tc.desc     BounceSymbolEffectTest_static_003
     * @tc.level    Level.LEVEL1
     */
it('BounceSymbolEffectTest_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BounceSymbolEffectTest_003] START');
      let strJson: string = inspector.getInspectorByKey('SymbolGlyph_3');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BounceSymbolEffectTest_003] symbolEffect: ' +
      JSON.stringify(obj.getElement('$attrs').getString('symbolEffect')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('symbolEffect'))
        .assertEqual('{"effectType":5,"scopeType":0,"commonSubType":0,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_003] END');
      done();
    });


    
    
    


/**
     * @tc.number   BounceSymbolEffectTest_static_004
     * @tc.name     BounceSymbolEffectTest_static_004
     * @tc.desc     BounceSymbolEffectTest_static_004
     * @tc.level    Level.LEVEL1
     */
it('BounceSymbolEffectTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BounceSymbolEffectTest_004] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('SymbolGlyph_4');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BounceSymbolEffectTest_004] symbolEffect: ' +
      JSON.stringify(obj.getElement('$attrs').getString('symbolEffect')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('symbolEffect'))
        .assertEqual('{"effectType":5,"scopeType":0,"commonSubType":0,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_004] END');
      done();
    });


    
    
    


/**
     * @tc.number   BounceSymbolEffectTest_static_005
     * @tc.name     BounceSymbolEffectTest_static_005
     * @tc.desc     BounceSymbolEffectTest_static_005
     * @tc.level    Level.LEVEL1
     */
it('BounceSymbolEffectTest_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BounceSymbolEffectTest_005] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('SymbolGlyph_5');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BounceSymbolEffectTest_005] symbolEffect: ' +
      JSON.stringify(obj.getElement('$attrs').getString('symbolEffect')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('symbolEffect'))
        .assertEqual('{"effectType":5,"scopeType":0,"commonSubType":0,"fillStyle":0,"isTxtActive":false}');
      console.info('[BounceSymbolEffectTest_005] END');
      done();
    });
  })
}
