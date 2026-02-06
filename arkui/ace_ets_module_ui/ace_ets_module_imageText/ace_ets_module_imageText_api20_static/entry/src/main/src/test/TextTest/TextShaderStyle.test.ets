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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function TextShaderStyleTest() {
  describe('TextShaderStyleTest', () => {
    beforeAll(() => {
      console.info("TextShaderStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("TextShaderStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextShaderStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextShaderStyleTest state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("TextShaderStyle" == pages.name)) {
          console.info("get TextShaderStyleTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextShaderStyleTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextShaderStyleTest after each called");
    });

    
    /**
     * @tc.number   TextShaderStyleTest_static_0010
     * @tc.name     TextShaderStyleTest_static_0010
     * @tc.desc     TextShaderStyleTest_static_0010
     * @tc.level   Level.LEVEL2
     */
    it('TextShaderStyleTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextShaderStyleTest_static_0010] START');
      let strJson = inspector.getInspectorByKey('Text_linearGradientStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextShaderStyleTest_static_0010] linearGradient: ' + JSON.stringify(obj.getElement('$attrs').getElement('linearGradient')));
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('angle')).assertEqual('45.00px');
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('direction')).assertEqual('GradientDirection.LeftTop');
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('colors')+'').assertEqual('#FFFF0000,0.000000,#FF0000FF,0.300000,#FF008000,0.500000');
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('repeating')).assertEqual('false');
      console.info("[TextShaderStyleTest_static_0010] END");
      done();
    });

    
    /**
     * @tc.number   TextShaderStyleTest_static_0020
     * @tc.name     TextShaderStyleTest_static_0020
     * @tc.desc     TextShaderStyleTest_static_0020
     * @tc.level   Level.LEVEL2
     */
    it('TextShaderStyleTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextShaderStyleTest_static_0020] START');
      let strJson = inspector.getInspectorByKey('Text_radialGradientStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextShaderStyleTest_static_0020] radialGradient: ' + JSON.stringify(obj.getElement('$attrs').getElement('radialGradient')));
      expect(obj.getElement('$attrs').getElement('radialGradient').getString('center')+'').assertEqual('50.00vp,50.00vp');
      expect(obj.getElement('$attrs').getElement('radialGradient').getString('radius')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('radialGradient').getString('colors')+'').assertEqual('#FFFF0000,0.000000,#FF0000FF,0.300000,#FF008000,0.500000');
      expect(obj.getElement('$attrs').getElement('radialGradient').getString('repeating')).assertEqual('true');
      console.info("[TextShaderStyleTest_static_0020] END");
      done();
    });
  })
}