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
import {
  LocalStorage
} from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface DataA {
  Result: boolean
}
export default function stateManagementGetSharedJsunit() {
  describe('stateManagementGetSharedTest', () => {
    beforeAll(() => {
      console.info("stateManagementGetSharedJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("stateManagementGetSharedJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/stateManagementNew',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stateManagementGetSharedJsunit state pages:" + JSON.stringify(pages));
        if (!("stateManagementNew" == pages.name)) {
          console.info("get stateManagementGetSharedJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push stateManagementGetSharedJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stateManagementGetSharedJsunit page error:" + err);
      }
      console.info("stateManagementGetSharedJsunit beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("stateManagementGetShared after each called");
    });

    
    /**
     * @tc.number   teststateManagementGetShared_static_0001
     * @tc.name     teststateManagementGetShared_static_0001
     * @tc.desc     teststateManagementGetShared_static_0001
     * @tc.level    Level.LEVEL0
     */
it('teststateManagementGetShared_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('stateManagementGetShared teststateManagementGetShared_static_0001 START');
      await CommonFunc.sleep(2000);
      try {
        let EventOne: events_emitter.InnerEvent = {
          eventId: 60223,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackOne = (eventData: events_emitter.EventData) => {
          console.info("teststateManagementGetShared_static_0001 get event state result is: " + JSON.stringify(eventData));
          expect((eventData.data as DataA)?.Result).assertEqual(false);

        }
        console.info("teststateManagementGetShared_static_0001 click result is: " + JSON.stringify(inspector.sendEventByKey('GetSharedText', 10, "")));
        events_emitter.on(EventOne, callbackOne);
      } catch (err) {
        console.info("teststateManagementGetShared_static_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('teststateManagementGetShared_static_0001 END');
    });

    
    /**
     * @tc.number   teststateManagementsetAndLink_static_0001
     * @tc.name     teststateManagementsetAndLink_static_0001
     * @tc.desc     teststateManagementsetAndLink_static_0001
     * @tc.level    Level.LEVEL0
     */
it('teststateManagementsetAndLink_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('stateManagementsetAndLink teststateManagementsetAndLink_static_0001 START');
      await CommonFunc.sleep(1000);
      try {
        let EventTwo: events_emitter.InnerEvent = {
          eventId: 60224,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackTwo = (eventData: events_emitter.EventData) => {
          console.info("teststateManagementsetAndLink_static_0001 get event state result is: " + JSON.stringify(eventData));
          expect((eventData.data as DataA)?.Result).assertEqual("callback2");

        }
        console.info("setAndLink_0001 click result is: " + JSON.stringify(inspector.sendEventByKey('setAndLinkText', 10, "")));
        events_emitter.on(EventTwo, callbackTwo);
      } catch (err) {
        console.info("teststateManagementsetAndLink_static_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('teststateManagementsetAndLink_static_0001 END');
    });

    
    /**
     * @tc.number   teststateManagementsetOrCreate_static_0001
     * @tc.name     teststateManagementsetOrCreate_static_0001
     * @tc.desc     teststateManagementsetOrCreate_static_0001
     * @tc.level    Level.LEVEL0
     */
it('teststateManagementsetOrCreate_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('stateManagementsetOrCreate teststateManagementsetOrCreate_static_0001 START');
      await CommonFunc.sleep(1000);
      try {
        let EventThree: events_emitter.InnerEvent = {
          eventId: 60225,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackThree = (eventData: events_emitter.EventData) => {
          console.info("teststateManagementsetOrCreate_static_0001 get event state result is: " + JSON.stringify(eventData));
          expect((eventData.data as DataA)?.Result).assertEqual("callback3");

        }
        console.info("setOrCreate_0001 click result is: " + JSON.stringify(inspector.sendEventByKey('setOrCreateText', 10, "")));
        events_emitter.on(EventThree, callbackThree);
      } catch (err) {
        console.info("teststateManagementsetOrCreate_static_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('teststateManagementsetOrCreate_static_0001 END');

    });

    
    /**
     * @tc.number   teststateManagementsetAndProp_static_0001
     * @tc.name     teststateManagementsetAndProp_static_0001
     * @tc.desc     teststateManagementsetAndProp_static_0001
     * @tc.level    Level.LEVEL0
     */
it('teststateManagementsetAndProp_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('teststateManagementsetAndProp_static_0001 teststateManagementsetAndProp0001 START');
      await CommonFunc.sleep(1000);
      try {
        let EventFour: events_emitter.InnerEvent = {
          eventId: 60226,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackFour = (eventData: events_emitter.EventData) => {
          console.info("teststateManagementsetAndProp_static_0001 get event state result is: " + JSON.stringify(eventData));
          expect((eventData.data as DataA)?.Result).assertEqual("callback4");

        }
        console.info("setAndProp_0001 click result is: " + JSON.stringify(inspector.sendEventByKey('setAndPropText', 10, "")));
        events_emitter.on(EventFour, callbackFour);
      } catch (err) {
        console.info("teststateManagementsetAndProp_static_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('teststateManagementsetAndProp_static_0001 END');
    });

    
    /**
     * @tc.number   test_staticClear_0001
     * @tc.name     test_staticClear_0001
     * @tc.desc     test_staticClear_0001
     * @tc.level    Level.LEVEL0
     */
it('test_staticClear_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('test_staticClear_0001 Register a customized font in the FontManagerSTART');
      await CommonFunc.sleep(2000);
      try {

        const routerInstance = AppStorage.get<Router>("router") as Router
        let simple = AppStorage.clear();
        console.info('simple is ' + simple)
        expect(simple).assertTrue();
        AppStorage.setOrCreate<Router>('router', routerInstance);
      } catch (err) {
        console.info("test_font_registerFont_0001  err : " + JSON.stringify(err));
        expect(true).assertTrue();

      }
    });

    
    /**
     * @tc.number   test_setAndLink_static_0001
     * @tc.name     test_setAndLink_static_0001
     * @tc.desc     test_setAndLink_static_0001
     * @tc.level    Level.LEVEL0
     */
it('test_setAndLink_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('test_setAndLink_static_0001 START');
      await CommonFunc.sleep(2000);
      try {
        let storage = new LocalStorage()
        storage.setAndLink<string>('storageSimpleProp', '121');
        let size = storage.size()
        expect(size == 1).assertTrue();
      } catch (err) {
        console.info("test_font_registerFont_0001  err : " + JSON.stringify(err));
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   test_setAndProp_static_0002
     * @tc.name     test_setAndProp_static_0002
     * @tc.desc     test_setAndProp_static_0002
     * @tc.level    Level.LEVEL0
     */
it('test_setAndProp_static_0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('test_setAndProp_static_0002 START');
      await CommonFunc.sleep(2000);
      try {
        let storage = new LocalStorage()
        storage.setAndRef<string>("setAndProp", '12');
        let size = storage.size();
        expect(size == 1).assertTrue();
      } catch (err) {
        console.info("test_setAndProp_0002  err : " + JSON.stringify(err));
        expect().assertFail();
      }
    });
  })
}
