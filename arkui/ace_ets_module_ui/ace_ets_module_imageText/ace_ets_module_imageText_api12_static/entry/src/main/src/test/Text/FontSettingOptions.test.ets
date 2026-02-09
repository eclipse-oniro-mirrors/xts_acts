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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function FontSettingOptions() {
  describe('FontSettingOptions', () => {
    beforeAll(() => {
      console.info("FontSettingOptions beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("FontSettingOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/FontSettingOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FontSettingOptions state pages:" + JSON.stringify(pages));
        if (!("FontSettingOptions" == pages.name)) {
          console.info("get FontSettingOptions pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FontSettingOptions page error:" + err);
      }
      console.info("FontSettingOptions beforeEach end");
    }); 


    
    /**
     * @tc.number   FontSettingOptions_static_0010
     * @tc.name     FontSettingOptions_static_0010
     * @tc.desc     FontSettingOptions_static_0010
     * @tc.level   Level.LEVEL0
     */
    it('FontSettingOptions_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FontSettingOptions_0010 START');
      let FontSettingOptions_1 = inspector.getInspectorByKey('FontTestText_01');
      console.info('--------------'+JSON.parseJsonElement(FontSettingOptions_1).getElement('$attrs').getString('font'))
      expect(""+JSON.parseJsonElement(FontSettingOptions_1).getString('$type')).assertEqual('Text');
      console.info('FontSettingOptions_0010 END');
      done();
    });
	
	
    /**
     * @tc.number   FontSettingOptions_static_0020
     * @tc.name     FontSettingOptions_static_0020
     * @tc.desc     FontSettingOptions_static_0020
     * @tc.level   Level.LEVEL0
     */
    it('FontSettingOptions_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FontSettingOptions_0020 START');
      let FontSettingOptions_2 = inspector.getInspectorByKey('FontTestText_02');
      console.info('--------------'+JSON.parseJsonElement(FontSettingOptions_2).getElement('$attrs').getString('fontWeight'))
      expect(""+JSON.parseJsonElement(FontSettingOptions_2).getString('$type')).assertEqual('Text');
      console.info('FontSettingOptions_0020 END');
      done();
    });
  })
}