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
import { describe, beforeEach, afterEach, it, expect, beforeAll,Level } from "../../../../hypium/index"
import events_emitter from '@ohos.events.emitter'
import router from '@ohos.router'
import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import { Color } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function blank3Jsunit() {
  describe('blank3Jsunit', () => {
    beforeAll(() => {
      console.info("blank3Jsunit beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
   beforeEach(async (): Promise<void> => {
      console.info("blank3Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blank/blank3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get blank state pages: " + "");
        if (!("blank3" == pages.name)) {
          console.info("get blank state pages.name: " + "");
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push blank page error: " + err);
      }
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("blank after each called");
    })

    
    

/**
     * @tc.number   testBlank01_static_01
     * @tc.name     testBlank01_static_01
     * @tc.desc     testBlank01_static_01
     * @tc.level    Level.LEVEL0
     */
it('testBlank01_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBlank01_static_01] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('blank3Jsunit_blank');
     console.info("[testBlank01_static_01] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
     expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Blank');
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual('#FF0000FF');
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();
    });

    
    

/**
     * @tc.number   testBlank02_static_02
     * @tc.name     testBlank02_static_02
     * @tc.desc     testBlank02_static_02
     * @tc.level    Level.LEVEL0
     */
it('testBlank02_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testBlank02_static_02] START');
      await Utils.sleep(1000);
      try {
        AppStorage.setOrCreate<Color>('colorValue', Color.Red);
      } catch (err) {
        console.log("[testBlank02_static_02] change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('blank3Jsunit_blank');
     console.info("[testBlank02_static_02] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
     expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('color')).assertEqual('#FFFF0000');
     expect(JSON.parseJsonElement(strJsonNew).getString('$type')).assertEqual('Blank');
      done();
    });
  })
}
