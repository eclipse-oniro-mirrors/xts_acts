'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import Utils from '../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test'
import events_emitter from '@ohos.events.emitter';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function gridColXlJsunit() {
  describe('gridColXlTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridCol',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get gridCol state success " + JSON.stringify(pages));
        if (!("gridCol" == pages.name)) {
          console.info("get gridCol state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push gridCol page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridCol page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("gridColXl after each called");
    });


    
    /**
     * @tc.number   testgridColXl_static_0001
     * @tc.name     testgridColXl_static_0001
     * @tc.desc     testgridColXl_static_0001
     * @tc.level    Level.LEVEL1
     */
it('testgridColXl_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('gridColXl testgridColXl_static_0001 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('GridCol');
      console.info("[testgridColXl_static_0001] component order strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('GridCol');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('order')).assertEqual("{xl: 10}");
      console.info("[testgridColXl_static_0001] order value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('order'));
      done();
    });


    
    /**
     * @tc.number   testgridColXl_static_0002
     * @tc.name     testgridColXl_static_0002
     * @tc.desc     testgridColXl_static_0002
     * @tc.level    Level.LEVEL1
     */
it('testgridColXl_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('gridColXl testgridColXl_static_0002 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('GridCol');
      console.info("[testgridColXl_static_0002] component backgroundColor strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Color.Green');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor'))
        .assertEqual("Color.Green");
      console.info("[testgridColXl_static_0002] backgroundColor value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundColor'));
      done();
    });
  })
}
