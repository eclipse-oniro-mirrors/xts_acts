'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level} from "../../../../hypium/index";
import router from '@ohos.router';

import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function flexDirectionJsunit() {
  describe('flexDirectionJsunit', () => {
    beforeAll(() => {
      console.info("flexDirectionJsunit beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/flexDirection',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexDirection state pages:" + "");
        if (!("flexDirection" == pages.name)) {
          console.info("get flexDirection state pages.name:" + "");
          
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          
        }
      } catch (err) {
        console.error("push flexDirection page error:" + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("flexDirection after each called");
    });

    
    

/**
     * @tc.number   flexDirection_static_0100
     * @tc.name     flexDirection_static_0100
     * @tc.desc     flexDirection_static_0100
     * @tc.level    Level.LEVEL0
     */
it('flexDirection_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexDirection_static_0100 START');
      let strJson = inspector.getInspectorByKey('flexDirection');
      console.info("flexDirection_static_0100 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("flexDirection_static_0100 component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual("Text");
     expect(obj.getElement('$attrs').getString('width')).assertEqual("20.00%");
      console.info('flexDirection_static_0100 END');
      done();
    });

    
    

/**
     * @tc.number   flexDirection_static_0200
     * @tc.name     flexDirection_static_0200
     * @tc.desc     flexDirection_static_0200
     * @tc.level    Level.LEVEL0
     */
it('flexDirection_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexDirection_static_0200 START');
      let strJson = inspector.getInspectorByKey('flexDirection');
      console.info("flexDirection_static_0200 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("flexDirection_static_0200 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('height')).assertEqual("40.00vp");
     expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFFF0000");
      console.info('flexDirection_static_0200 END');
      done();
    });

    
    

/**
     * @tc.number   flexDirection_static_0300
     * @tc.name     flexDirection_static_0300
     * @tc.desc     flexDirection_static_0300
     * @tc.level    Level.LEVEL0
     */
it('flexDirection_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexDirection_static_0300 START');
      let strJson = inspector.getInspectorByKey('ColumnReverse');
      console.info("flexDirection_static_0300 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("flexDirection_static_0300 component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual("Text");
     expect(obj.getElement('$attrs').getString('width')).assertEqual("20.00%");
      console.info('flexDirection_static_0300 END');
      done();
    });

    
    

/**
     * @tc.number   flexDirection_static_0400
     * @tc.name     flexDirection_static_0400
     * @tc.desc     flexDirection_static_0400
     * @tc.level    Level.LEVEL0
     */
it('flexDirection_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexDirection_static_0400 START');
      let strJson = inspector.getInspectorByKey('ColumnReverse');
      console.info("flexDirection_static_0400 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("flexDirection_static_0400 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('height')).assertEqual("40.00vp");
     expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFFF0000");
      console.info('flexDirection_static_0400 END');
      done();
    });

    
    

/**
     * @tc.number   flexDirection_0500_static
     * @tc.name     flexDirection_0500_static
     * @tc.desc     flexDirection_0500_static
     * @tc.level    Level.LEVEL0
     */
it('flexDirection_0500_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexDirection_0500_static START');
      let strJson = inspector.getInspectorByKey('Column');
      console.info("flexDirection_0500_static component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("flexDirection_0500_static component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual("Text");
     expect(obj.getElement('$attrs').getString('width')).assertEqual("20.00%");
      console.info('flexDirection_0500_static END');
      done();
    });

    
    

/**
     * @tc.number   flexDirection_static_0600
     * @tc.name     flexDirection_static_0600
     * @tc.desc     flexDirection_static_0600
     * @tc.level    Level.LEVEL0
     */
it('flexDirection_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexDirection_static_0600 START');
      let strJson = inspector.getInspectorByKey('Column');
      console.info("flexDirection_static_0600 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("flexDirection_static_0600 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('height')).assertEqual("40.00vp");
     expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFFF0000");
      console.info('flexDirection_static_0600 END');
      done();
    });

    
    

/**
     * @tc.number   flexDirection_static_0700
     * @tc.name     flexDirection_static_0700
     * @tc.desc     flexDirection_static_0700
     * @tc.level    Level.LEVEL0
     */
it('flexDirection_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexDirection_static_0700 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": "40%",
            "height": "70",
            "backgroundColor": 0xF5DEB3,
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 97,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("flexDirection_static_0700 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("flexDirection_static_0700 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(3000);
      let strJsonNew = inspector.getInspectorByKey('flexDirection');
     let objNew = JSON.parseJsonElement(strJsonNew);
     console.info("flexDirection_static_0700 component objNew is: " + JSON.stringify(objNew));
     expect(objNew.getElement('$attrs').getString('width')).assertEqual('40.00%');
     expect(objNew.getElement('$attrs').getString('height')).assertEqual('70.00vp');
     expect(objNew.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFF5DEB3");
      console.info('flexDirection_static_0700 END');
      done();
      });

    
    

/**
     * @tc.number   flexDirection_static_0800
     * @tc.name     flexDirection_static_0800
     * @tc.desc     flexDirection_static_0800
     * @tc.level    Level.LEVEL0
     */
it('flexDirection_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexDirection_static_0800 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": "45%",
            "height": "60",
            "backgroundColor": 0xF5DEB3,
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 98,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("flexDirection_static_0800 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("flexDirection_static_0800 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(3000);
      let strJsonNew = inspector.getInspectorByKey('ColumnReverse');
     let objNew = JSON.parseJsonElement(strJsonNew);
     console.info("flexDirection_static_0800 component objNew is: " + JSON.stringify(objNew));
     expect(objNew.getElement('$attrs').getString('width')).assertEqual('45.00%');
     expect(objNew.getElement('$attrs').getString('height')).assertEqual('60.00vp');
     expect(objNew.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFF5DEB3");
      console.info('flexDirection_static_0800 END');
      done();
    });

    
    

/**
     * @tc.number   flexDirection_static_0900
     * @tc.name     flexDirection_static_0900
     * @tc.desc     flexDirection_static_0900
     * @tc.level    Level.LEVEL0
     */
it('flexDirection_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexDirection_static_0900 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": "60%",
            "height": "55",
            "backgroundColor": "#FF000990",
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 99,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("flexDirection_static_0900 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("flexDirection_static_0900 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(3000);
      let strJsonNew = inspector.getInspectorByKey('Column');
     let objNew = JSON.parseJsonElement(strJsonNew);
    console.info("flexDirection_static_0900 component objNew is: " + JSON.stringify(objNew));
     expect(objNew.getElement('$attrs').getString('width')).assertEqual('60.00%');
     expect(objNew.getElement('$attrs').getString('height')).assertEqual('55.00vp');
     expect(objNew.getElement('$attrs').getString('backgroundColor')).assertEqual("#FF000990");
      console.info('flexDirection_static_0900 END');
      done();
    });
  })
}