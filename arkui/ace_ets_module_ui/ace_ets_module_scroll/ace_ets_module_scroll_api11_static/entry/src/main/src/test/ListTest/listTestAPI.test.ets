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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listNewJsunit() {
  describe('listNewJsunit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listNew',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get list state success " + JSON.stringify(pages));
        if (!("listNew" == pages.name)) {
          console.info("get list state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push list page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push list page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listNe after each called");
    });


    
    /**
     * @tc.number   testListNew_static_0001
     * @tc.name     testListNew_static_0001
     * @tc.desc     testListNew_static_0001
     * @tc.level    Level.LEVEL1
     */
it('testListNew_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listNe testListNew_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNew_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("90.00%");
      console.info("[testListNew_static_0001] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      done()
    });


    
    /**
     * @tc.number   testListNe_static_0002
     * @tc.name     testListNe_static_0002
     * @tc.desc     testListNe_static_0002
     * @tc.level    Level.LEVEL1
     */
it('testListNe_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listNe testListNe_static_0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe_static_0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("300.00vp");
      console.info("[testListNe_static_0002] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      done()
    });


    
    /**
     * @tc.number   testListNe_static_0003
     * @tc.name     testListNe_static_0003
     * @tc.desc     testListNe_static_0003
     * @tc.level    Level.LEVEL1
     */
it('testListNe_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listNe testListNe_static_0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe_static_0003] component editMode strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      // editMode 废弃
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('editMode')).assertTrue();
      console.info("[testListNe_static_0003] editMode value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('editMode'));
      done()
    });


    
    /**
     * @tc.number   testListNe_static_0004
     * @tc.name     testListNe_static_0004
     * @tc.desc     testListNe_static_0004
     * @tc.level    Level.LEVEL1
     */
it('testListNe_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listNe testListNe_static_0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe_static_0004] component alignListItem strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignListItem'))
        .assertEqual("ListItemAlign.Start");
      console.info("[testListNe_static_0004] alignListItem value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('alignListItem'));
      done()
    });


    
    /**
     * @tc.number   testListNe_static_0005
     * @tc.name     testListNe_static_0005
     * @tc.desc     testListNe_static_0005
     * @tc.level    Level.LEVEL1
     */
it('testListNe_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listNe testListNe_static_0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe_static_0005] component lanes strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lanes')).assertEqual('4');
      console.info("[testListNe_static_0005] lanes value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('lanes'));
      done()
    });


    
    /**
     * @tc.number   testListNe_static_0006
     * @tc.name     testListNe_static_0006
     * @tc.desc     testListNe_static_0006
     * @tc.level    Level.LEVEL1
     */
it('testListNe_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listNe testListNe_static_0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe_static_0006] component lanes strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lanes')).assertEqual('4');
      console.info("[testListNe_static_0006] lanes value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('lanes'));
      done()
    });


    
    /**
     * @tc.number   testListNe_static_0007
     * @tc.name     testListNe_static_0007
     * @tc.desc     testListNe_static_0007
     * @tc.level    Level.LEVEL1
     */
it('testListNe_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listNe testListNe_static_0007 START');
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60216,
        priority: events_emitter.EventPriority.LOW
      }
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        try {
          const data = eventData.data as Record<String,RecordData>
          console.info("callback success");
          console.info("testListNe_static_0007 eventData.data?.['result'] result is: " + data['result']);
          expect(data['result']).assertEqual("success");
          console.info("testListNe_static_0007 end");
        } catch (err) {
          console.info("testListNe_static_0007 on events_emitter err : " + JSON.stringify(err));
        }
      }
      try {
        console.info("testListNe_static_0007 click result is: " +
        JSON.stringify(inspector.sendEventByKey('onScrollBegin', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testListNe_static_0007 on events_emitter err : " + JSON.stringify(err));
      }
      done()
    });
  })
}
