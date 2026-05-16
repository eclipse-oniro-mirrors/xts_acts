'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SymbolGlyphApi() {
  describe('SymbolGlyphApi', (): void => {
    beforeAll(() => {
      console.info("FontSettingOptions beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("FontSettingOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SymbolGlyph/SymbolGlyphApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FontSettingOptions state pages:" + JSON.stringify(pages));
        if (!("SymbolGlyphApi" == pages.name)) {
          console.info("get FontSettingOptions pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FontSettingOptions page error:" + err);
      }
      console.info("FontSettingOptions beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("SymbolGlyphApi after each called");
    });

    
    /**
     * @tc.number   SymbolGlyphApi_static_001
     * @tc.name     SymbolGlyphApi_static_001
     * @tc.desc     SymbolGlyphApi_static_001
     * @tc.level   Level.LEVEL0
     */
    it('SymbolGlyphApi_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SymbolGlyphApi_static001] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyphApi');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[styledStringApi_001] component obj is: " + obj);
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('symbolEffect')).getBoolean('isActive')).assertEqual(true);
      console.info('[styledStringApi_001] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphApi_static_002
     * @tc.name     SymbolGlyphApi_static_002
     * @tc.desc     SymbolGlyphApi_static_002
     * @tc.level   Level.LEVEL0
     */
    it('SymbolGlyphApi_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SymbolGlyphApi_static002] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyphApi1');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphApi_static002] component obj is: " + obj);
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('symbolEffect')).getDouble('effectType')).assertEqual(7);
      console.info('[SymbolGlyphApi_static002] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphApi_static_003
     * @tc.name     SymbolGlyphApi_static_003
     * @tc.desc     SymbolGlyphApi_static_003
     * @tc.level   Level.LEVEL0
     */
    it('SymbolGlyphApi_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SymbolGlyphApi_static003] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyphApi2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphApi_static003] component obj is: " + obj);
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('symbolEffect')).getDouble('effectType')).assertEqual(1);
      console.info('[SymbolGlyphApi_static003] END');
      done();
    });

    
    /**
     * @tc.number   SymbolGlyphApi_static_004
     * @tc.name     SymbolGlyphApi_static_004
     * @tc.desc     SymbolGlyphApi_static_004
     * @tc.level   Level.LEVEL0
     */
    it('SymbolGlyphApi_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SymbolGlyphApi_static004] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyphApi3');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphApi_static004] component obj is: " + obj);
      await CommonFunc.sleep(1000);

      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('symbolEffect')).getDouble('effectType')).assertEqual(3);
      console.info('[SymbolGlyphApi_static004] END');
      done();

    });

    
    /**
     * @tc.number   SymbolGlyphApi_static_005
     * @tc.name     SymbolGlyphApi_static_005
     * @tc.desc     SymbolGlyphApi_static_005
     * @tc.level   Level.LEVEL0
     */
    it('SymbolGlyphApi_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SymbolGlyphApi_static005] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyphApi4');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphApi_static005] component obj is: " + obj);
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('symbolEffect')).getDouble('effectType')).assertEqual(4);
      console.info('[SymbolGlyphApi_static005] END');
      done();

    });

    
    /**
     * @tc.number   SymbolGlyphApi_static_006
     * @tc.name     SymbolGlyphApi_static_006
     * @tc.desc     SymbolGlyphApi_static_006
     * @tc.level   Level.LEVEL0
     */
    it('SymbolGlyphApi_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SymbolGlyphApi_static006] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SymbolGlyphApi5');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolGlyphApi_static006] component obj is: " + obj);
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('symbolEffect')).getDouble('effectType')).assertEqual(5);
      console.info('[SymbolGlyphApi_static006] END');
      done();

    });
  })
}
