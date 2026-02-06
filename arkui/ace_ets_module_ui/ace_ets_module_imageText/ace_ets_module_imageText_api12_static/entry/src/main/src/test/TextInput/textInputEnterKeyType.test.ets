'use static';
/*
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import { EnterKeyType } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { RecordData } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textInputEnterKeyTypeTest() {
  describe('textInputEnterKeyTypeTest',  ()=> {
    beforeAll(() => {
      console.info("textInputEnterKeyTypeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textInputEnterKeyTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/textInputEnterKeyType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInputEnterKeyTypeTest state pages:" + JSON.stringify(pages));
        if (!("textInputEnterKeyType" == pages.name)) {
          console.info("get textInputEnterKeyTypeTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputEnterKeyTypeTest page error:" + err);
      }
      console.info("textInputEnterKeyTypeTest beforeEach end");
    }); 


    afterEach(async  ()=> {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({url: 'MainAbility/pages/index/index'});
      await Utils.sleep(3000);
      console.info("textInputEnterKeyType after each called");
    })

    
    /**
     * @tc.number   textInputEnterKeyType_static_0100
     * @tc.name     textInputEnterKeyType_static_0100
     * @tc.desc     textInputEnterKeyType_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textInputEnterKeyType_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textInputEnterKeyType0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Go
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
      await Utils.sleep(2000);
    
      let strJsonNew = inspector.getInspectorByKey('key_textinput_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Go');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textInputEnterKeyType_static_0200
     * @tc.name     textInputEnterKeyType_static_0200
     * @tc.desc     textInputEnterKeyType_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('textInputEnterKeyType_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textInputEnterKeyType0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Search
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
      await Utils.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_textinput_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textInputEnterKeyType_static_0300
     * @tc.name     textInputEnterKeyType_static_0300
     * @tc.desc     textInputEnterKeyType_static_0300
     * @tc.level   Level.LEVEL0
     */
    it('textInputEnterKeyType_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textInputEnterKeyType0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Send
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
      await Utils.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_textinput_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Send');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textInputEnterKeyType_static_0400
     * @tc.name     textInputEnterKeyType_static_0400
     * @tc.desc     textInputEnterKeyType_static_0400
     * @tc.level   Level.LEVEL0
     */
    it('textInputEnterKeyType_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textInputEnterKeyType0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Next
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
      await Utils.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_textinput_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Next');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textInputEnterKeyType_static_0500
     * @tc.name     textInputEnterKeyType_static_0500
     * @tc.desc     textInputEnterKeyType_static_0500
     * @tc.level   Level.LEVEL0
     */
    it('textInputEnterKeyType_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textInputEnterKeyType0500';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enterKeyType":  EnterKeyType.Done
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
      await Utils.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_textinput_enterkeytype');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text EnterKeyType is: ' + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));

      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    
})
}
