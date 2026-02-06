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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function lineNeJsunit() {
  describe('lineNeTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("line beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/line/line',
      }
      try {
        const lineCallback = AppStorage.get<Router>("router") as Router
        lineCallback.clear();
        let pages = lineCallback.getState();
        console.info("get line state success: " + JSON.stringify(pages));
        if (!("line" == pages.name)) {
          console.info("get line state success: " + JSON.stringify(pages.name));
          // let result = await videoCallback.pushUrl(options);
          lineCallback.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push VideoCallbackJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push line page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("lineNe after each called");
    });


    
    /**
     * @tc.number   testlineNe0001
     * @tc.name     testlineNe0001
     * @tc.desc     testlineNe0001
     * @tc.level    Level.LEVEL0
     */
it('testlineNe0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('lineNe testlineNe0001_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('line1');
      console.info("[testlineNe0001_static] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Line');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("50.00vp");
      console.info("[testlineNe0001_static] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    
    /**
     * @tc.number   testlineNe0002
     * @tc.name     testlineNe0002
     * @tc.desc     testlineNe0002
     * @tc.level    Level.LEVEL0
     */
it('testlineNe0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('lineNe testlineNe0002_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('line1');
      console.info("[testlineNe0002_static] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Line');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("100.00vp");
      console.info("[testlineNe0002_static] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });


    
    /**
     * @tc.number   testlineNe0005
     * @tc.name     testlineNe0005
     * @tc.desc     testlineNe0005
     * @tc.level    Level.LEVEL0
     */
it('testlineNe0005', Level.LEVEL0, async (): Promise<void> => {
      console.info('lineNe testlineNe0005_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('line2');
      console.info("[testlineNe0005_static] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Line');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("200.00vp");
      console.info("[testlineNe0005_static] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    
    /**
     * @tc.number   testlineNe0006
     * @tc.name     testlineNe0006
     * @tc.desc     testlineNe0006
     * @tc.level    Level.LEVEL0
     */
it('testlineNe0006', Level.LEVEL0, async (): Promise<void> => {
      console.info('lineNe testlineNe0006_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('line2');
      console.info("[testlineNe0006_static] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Line');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("200.00vp");
      console.info("[testlineNe0006_static] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });
  })
}
