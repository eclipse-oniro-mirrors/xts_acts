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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'
import inspector from '@ohos.arkui.inspector'
import { EnterKeyType } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
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
let testAbilityContext: common.UIAbilityContext;


export default function searchEnterKeyTypeTest() {
  describe('searchEnterKeyTypeTest', (): void => {
    beforeAll(() => {
      console.info("searchEnterKeyTypeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("searchEnterKeyTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchEnterKeyType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get searchEnterKeyTypeTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get searchEnterKeyTypeTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push searchEnterKeyTypeTest page error:" + err);
      }
      console.info("searchEnterKeyTypeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      CommonFunc.sleep(1000);
      console.info("searchEnterKeyType after each called");
    })


    
    
    


/**
     * @tc.number   searchEnterKeyType_static_0100
     * @tc.name     searchEnterKeyType_static_0100
     * @tc.desc     searchEnterKeyType_static_0100
     * @tc.level    Level.LEVEL1
     */
it('searchEnterKeyType_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'searchEnterKeyType0100';
      console.info('[' + tagName + '] START============================');
      CommonFunc.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType": EnterKeyType.Go
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 810,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      CommonFunc.sleep(2000);

      let strJsonNew: string = inspector.getInspectorByKey('key_search_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + obj.getElement('$attrs').getString('enterKeyType'));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Go');

      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    
    


/**
     * @tc.number   searchEnterKeyType_static_0200
     * @tc.name     searchEnterKeyType_static_0200
     * @tc.desc     searchEnterKeyType_static_0200
     * @tc.level    Level.LEVEL1
     */
it('searchEnterKeyType_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'searchEnterKeyType0200';
      console.info('[' + tagName + '] START============================');
      CommonFunc.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType": EnterKeyType.Search
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 811,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      CommonFunc.sleep(2000);

      let strJsonNew: string = inspector.getInspectorByKey('key_search_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + obj.getElement('$attrs').getString('enterKeyType'));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    
    


/**
     * @tc.number   searchEnterKeyType_static_0300
     * @tc.name     searchEnterKeyType_static_0300
     * @tc.desc     searchEnterKeyType_static_0300
     * @tc.level    Level.LEVEL1
     */
it('searchEnterKeyType_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'searchEnterKeyType0300';
      console.info('[' + tagName + '] START============================');
      CommonFunc.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType": EnterKeyType.Send
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 812,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      CommonFunc.sleep(2000);

      let strJsonNew: string = inspector.getInspectorByKey('key_search_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + obj.getElement('$attrs').getString('enterKeyType'));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Send');

      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    
    


/**
     * @tc.number   searchEnterKeyType_static_0400
     * @tc.name     searchEnterKeyType_static_0400
     * @tc.desc     searchEnterKeyType_static_0400
     * @tc.level    Level.LEVEL1
     */
it('searchEnterKeyType_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'searchEnterKeyType0400';
      console.info('[' + tagName + '] START============================');
      CommonFunc.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType": EnterKeyType.Next
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 813,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      CommonFunc.sleep(2000);

      let strJsonNew: string = inspector.getInspectorByKey('key_search_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + obj.getElement('$attrs').getString('enterKeyType'));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Next');

      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    
    


/**
     * @tc.number   searchEnterKeyType_static_0500
     * @tc.name     searchEnterKeyType_static_0500
     * @tc.desc     searchEnterKeyType_static_0500
     * @tc.level    Level.LEVEL1
     */
it('searchEnterKeyType_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'searchEnterKeyType0500';
      console.info('[' + tagName + '] START============================');
      CommonFunc.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType": EnterKeyType.Done
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 814,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      CommonFunc.sleep(2000);

      let strJsonNew: string = inspector.getInspectorByKey('key_search_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + obj.getElement('$attrs').getString('enterKeyType'));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');

      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    
    


/**
     * @tc.number   searchEnterKeyType_static_0600
     * @tc.name     searchEnterKeyType_static_0600
     * @tc.desc     searchEnterKeyType_static_0600
     * @tc.level    Level.LEVEL1
     */
it('searchEnterKeyType_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'searchEnterKeyType0600';
      console.info('[' + tagName + '] START============================');
      CommonFunc.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType": EnterKeyType.PREVIOUS
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 815,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      CommonFunc.sleep(2000);

      let strJsonNew: string = inspector.getInspectorByKey('key_search_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + obj.getElement('$attrs').getString('enterKeyType'));
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.PREVIOUS');

      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    
    


/**
     * @tc.number   searchEnterKeyType_static_0700
     * @tc.name     searchEnterKeyType_static_0700
     * @tc.desc     searchEnterKeyType_static_0700
     * @tc.level    Level.LEVEL1
     */
it('searchEnterKeyType_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'searchEnterKeyType0700';
      console.info('[' + tagName + '] START============================');
      CommonFunc.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType": EnterKeyType.NEW_LINE
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 816,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      CommonFunc.sleep(2000);

      let strJsonNew: string = inspector.getInspectorByKey('key_search_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + obj.getElement('$attrs').getString('enterKeyType'));
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.NEW_LINE');
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    
    


/**
     * @tc.number   searchEnterKeyType_static_0800
     * @tc.name     searchEnterKeyType_static_0800
     * @tc.desc     searchEnterKeyType_static_0800
     * @tc.level    Level.LEVEL1
     */
it('searchEnterKeyType_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'searchEnterKeyType0800';
        console.info('[' + tagName + '] START============================');
        CommonFunc.sleep(1000)

        try {
          let eventData: events_emitter.EventData = {
            data: {
              "enterKeyType":  undefined
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 817,
            priority: events_emitter.EventPriority.LOW
          }
          console.info('[' + tagName + '] start to publish emit');
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log('[' + tagName + '] change component data error: ' + err.message);
        }
        CommonFunc.sleep(2000);

        let strJsonNew:string = inspector.getInspectorByKey('key_search_enterkeytype');
        let obj = JSON.parseJsonElement(strJsonNew);
        console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));
        expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');
        console.info('[' + tagName + '] END ===========================');
        done();
      });


      
      
    


/**
     * @tc.number   searchEnterKeyType_static_0900
     * @tc.name     searchEnterKeyType_static_0900
     * @tc.desc     searchEnterKeyType_static_0900
     * @tc.level    Level.LEVEL1
     */
it('searchEnterKeyType_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'searchEnterKeyType0900';
        console.info('[' + tagName + '] START============================');
        let strJsonNew: string = inspector.getInspectorByKey('key_search_enterkeytype_default');
        let obj = JSON.parseJsonElement(strJsonNew);
        console.info('[' + tagName + '] Text EnterKeyType is: ' + obj.getElement('$attrs').getString('enterKeyType'));
        expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}
