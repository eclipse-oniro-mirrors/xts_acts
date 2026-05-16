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

export default function pathNewTest() {
  describe('pathNewTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/path/path2',
      }
      try {
        const path = AppStorage.get<Router>("router") as Router
        path.clear();
        let pages = path.getState();
        console.info("get path state success " + JSON.stringify(pages));
        if (!("path2" == pages.name)) {
          console.info("get path state success " + JSON.stringify(pages.name));
          // let result = await path.pushUrl(options);
          path.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push path page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push path page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("pathNe after each called");
    });


    
    /**
     * @tc.number   testpathNe_static_0001
     * @tc.name     testpathNe_static_0001
     * @tc.desc     testpathNe_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testpathNe_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('pathNe testpathNe_static_0001_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Path');
      console.info("[testpathNe_static_0001_static] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Path');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00px");
      console.info("[testpathNe_static_0001_static] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    
    /**
     * @tc.number   testpathNe_static_0002
     * @tc.name     testpathNe_static_0002
     * @tc.desc     testpathNe_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testpathNe_static_0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('pathNe testpathNe_static_0002_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Path');
      console.info("[testpathNe_static_0002_static] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Path');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("100.00px");
      console.info("[testpathNe_static_0002_static] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });


    
    /**
     * @tc.number   testpathNe_static_0003
     * @tc.name     testpathNe_static_0003
     * @tc.desc     testpathNe_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testpathNe_static_0003', Level.LEVEL0, async (): Promise<void> => {
      console.info('pathNe testpathNe_static_0003_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Path');
      console.info("[testpathNe_static_0003_static] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Path');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('commands'))
        .assertEqual("M150 0 L300 300 L0 300 Z");
      console.info("[testpathNe_static_0003_static] commands value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('commands'));

    });
  })
}
