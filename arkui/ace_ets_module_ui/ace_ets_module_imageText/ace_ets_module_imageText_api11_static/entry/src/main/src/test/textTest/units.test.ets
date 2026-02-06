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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common'
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function unitsModuleNameJsunit() {
  describe('unitsModuleNameTest', () => {

    beforeAll(() => {
      console.info("unitsModuleNameTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("unitsModuleNameTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/units',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get unitsModuleNameTest state pages:" + JSON.stringify(pages));
        if (!("units" == pages.name)) {
          console.info("get unitsModuleNameTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push unitsModuleNameTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push unitsModuleNameTest page error:" + err);
      }
      console.info("unitsModuleNameTest beforeEach end");
    });




    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("unitsModuleName after each called");
    });

    
    /**
     * @tc.number   testunitsModuleName0001
     * @tc.name     testunitsModuleName0001
     * @tc.desc     testunitsModuleName0001
     * @tc.level    Level.LEVEL1
     */
    it('testunitsModuleName0001', Level.LEVEL1, async (done: ()=>void) => {
      console.info('unitsModuleName testunitsModuleName0001 START');
      await CommonFunc.sleep(2000);
      try {
        console.info("testunitsModuleName0001 click result is: " + JSON.stringify(inspector.sendEventByKey('moduleNameText', 10, "")));
        await CommonFunc.sleep(2000);
        let innerEvent: emitter.InnerEvent = {
          eventId: 60310,
          priority: emitter.EventPriority.LOW
        }
        let callback = (eventData: emitter.EventData) => {
          console.info("testunitsModuleName0001 get event state result is: " + JSON.stringify(eventData));
          try {
            expect((eventData.data as ESObject)?.getProperty('ModuleName')).assertFalse();
          } catch (err) {
            console.info("testunitsModuleName0001 get event state result is: " + JSON.stringify(err));
          }

        }
        emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testunitsModuleName0001 on click err : " + JSON.stringify(err));
      }
      console.info('testunitsModuleName0001 END');
      done();
    });

    
    /**
     * @tc.number   testunitsGlobalPosition0001
     * @tc.name     testunitsGlobalPosition0001
     * @tc.desc     testunitsGlobalPosition0001
     * @tc.level    Level.LEVEL1
     */
    it('testunitsGlobalPosition0001', Level.LEVEL1, async (done: ()=>void) => {
      console.info('unitsModuleName testunitsGlobalPosition0001 START');
      await CommonFunc.sleep(2000);
      try {
        console.info("testunitsGlobalPosition0001 click result is: " + JSON.stringify(inspector.sendEventByKey('globalPositionText', 10, "")));
        let innerEvent: emitter.InnerEvent = {
          eventId: 60311,
          priority: emitter.EventPriority.LOW
        }
        let callback = (eventData: emitter.EventData) => {
          console.info("testunitsGlobalPosition0001 get event state result is: " + JSON.stringify(eventData));
          expect((eventData.data as ESObject)?.getProperty('Result')).assertEqual(true);
        }
        emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testunitsGlobalPosition0001 on click err : " + JSON.stringify(err));
      }
      console.info('testunitsGlobalPosition0001 END');
      done();
    });

    
    /**
     * @tc.number   testunitsMinWidth0001
     * @tc.name     testunitsMinWidth0001
     * @tc.desc     testunitsMinWidth0001
     * @tc.level    Level.LEVEL1
     */
    it('testunitsMinWidth0001', Level.LEVEL1, async (done: ()=>void) => {
      console.info('unitsModuleName testunitsMinWidth0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('minWidthText');
      console.info("[testunitsMinWidth0001] component constraintSize strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      console.info('[testunitsMinWidth0001] constraintSize value :' + JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('constraintSize')).getString('minWidth'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('constraintSize')).getString('minWidth')).assertEqual('200.00vp');
      console.info("[testunitsMinWidth0001] constraintSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('constraintSize'));
      done();
    });

    
    /**
     * @tc.number   testunitsMinWidth0002
     * @tc.name     testunitsMinWidth0002
     * @tc.desc     testunitsMinWidth0002
     * @tc.level    Level.LEVEL1
     */
    it('testunitsMinWidth0002', Level.LEVEL1, async (done: ()=>void) => {
      console.info('unitsModuleName testunitsMinWidth0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('minWidthText');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testunitsMinWidth0002] component constraintSize strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      console.info("[testunitsMinWidth0002] constraintSize is : " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('constraintSize'));
      expect(obj.getElement('$attrs').getElement('constraintSize').tryGetElement('minWidth')).assertEqual(undefined);
      console.info("[testunitsMinWidth0002] constraintSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('constraintSize'));
      done();
    });
  })
}
