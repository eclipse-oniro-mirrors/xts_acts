'use static';
/*
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

import events_emitter from '@ohos.events.emitter';
import { $r, Color } from '@ohos.arkui.component'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


export default function listNewJsunit() {
  describe('listNewJsunit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/list',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get list state success " + JSON.stringify(pages));
        if (!("list" == pages.name)) {
          console.info("get list state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push list page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("listNe after each called");
    });

    
    
    
    /**
     * @tc.number   testListNew_static_0001
     * @tc.name     testListNew_static_0001
     * @tc.desc     testListNew_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testListNew_static_0001', Level.LEVEL0, async () => {
      console.info('listNe testListNew0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNew0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("90.00%");
      console.info("[testListNew0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testListNe_static_0002
     * @tc.name     testListNe_static_0002
     * @tc.desc     testListNe_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testListNe_static_0002', Level.LEVEL0, async () => {
      console.info('listNe testListNe0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("300.00vp");
      console.info("[testListNe0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testListNe_static_0003
     * @tc.name     testListNe_static_0003
     * @tc.desc     testListNe_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testListNe_static_0003', Level.LEVEL0, async () => {
      console.info('listNe testListNe0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe0003] component editMode strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      // expect(obj.getElement('$attrs').getBoolean('editMode')).assertTrue();
      // console.info("[testListNe0003] editMode value :" + obj.getElement('$attrs').getBoolean('editMode'));
    });

    
    
    
    /**
     * @tc.number   testListNe_static_0004
     * @tc.name     testListNe_static_0004
     * @tc.desc     testListNe_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testListNe_static_0004', Level.LEVEL0, async () => {
      console.info('listNe testListNe0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe0004] component alignListItem strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(obj.getElement('$attrs').getString('alignListItem')).assertEqual("ListItemAlign.Start");
      console.info("[testListNe0004] alignListItem value :" + obj.getElement('$attrs').getString('alignListItem'));

    });

    
    
    
    /**
     * @tc.number   testListNe_static_0005
     * @tc.name     testListNe_static_0005
     * @tc.desc     testListNe_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testListNe_static_0005', Level.LEVEL0, async () => {
      console.info('listNe testListNe0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe0005] component lanes strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(obj.getElement('$attrs').getString('lanes')).assertEqual('4');
      console.info("[testListNe0005] lanes value :" + obj.getElement('$attrs').getString('lanes'));

    });

    
    
    
    /**
     * @tc.number   testListNe_static_0006
     * @tc.name     testListNe_static_0006
     * @tc.desc     testListNe_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testListNe_static_0006', Level.LEVEL0, async () => {
      console.info('listNe testListNe0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('list1');
      console.info("[testListNe0006] component lanes strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('List');
      expect(obj.getElement('$attrs').getString('lanes')).assertEqual('4');
      console.info("[testListNe0006] lanes value :" + obj.getElement('$attrs').getString('lanes'));

    });

    
    
    
    /**
     * @tc.number   testListNe_static_0007
     * @tc.name     testListNe_static_0007
     * @tc.desc     testListNe_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testListNe_static_0007', Level.LEVEL0, async () => {
      console.info('listNe testListNe0007 START');
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60216,
        priority: events_emitter.EventPriority.LOW
      }
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        try {
          console.info("callback success");
          console.info("testListNe0007 eventData.data.result result is: " +
          ((eventData.data) as ESObject)?.getProperty('result').toString());
          expect(((eventData.data) as ESObject)?.getProperty('result').toString()).assertEqual("success");
          console.info("testListNe0007 end");
        } catch (err) {
          console.info("testListNe0007 on events_emitter err : " + JSON.stringify(err));
        }
      }
      try {
        console.info("testListNe0007 click result is: " + JSON.stringify(inspector.sendEventByKey('onScrollBegin', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testListNe0007 on events_emitter err : " + JSON.stringify(err));
      }

    });
  })
}
