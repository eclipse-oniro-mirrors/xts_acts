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
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import { PlaybackSpeed } from '@ohos.arkui.component';
interface EventMessage {
  STATUS: string
}
export default function xcomponentGetXComponentContextJsunit() {
  describe('xcomponentGetXComponentContextTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.platform.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/Xcomponent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get xcomponent state success " + JSON.stringify(pages));
        if (!("xcomponent" == pages.name)) {
          console.info("get xcomponent state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push xcomponent page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("xcomponentGetXComponentContext after each called");
    });

    
    /**
     * @tc.number   testxcomponentGetXComponentContextStatic0010
     * @tc.name     testxcomponentGetXComponentContextStatic0010
     * @tc.desc     testxcomponentGetXComponentContextStatic0010
     * @tc.level    Level.LEVEL1
     */
it('testxcomponentGetXComponentContextStatic0010', Level.LEVEL1, async () => {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContextStatic0010 START');
      await Utils.sleep(1000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60228,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("onRequestPopupData_0010 get event state result is: " + JSON.stringify(eventData));
          expect((eventData.data as EventMessage)?.STATUS).assertEqual("callBackSuccess");
        }
        events_emitter.on(innerEventOne, callback1);
        await Utils.sleep(1000);
        console.info("onSelect_0012 click result is: " + JSON.stringify(inspector.sendEventByKey('getXComponentContextText', 10, "")));
        await Utils.sleep(2000);
      } catch (err) {
        console.info("onRequestPopupData_0010 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testxcomponentGetXComponentContextStatic0010 END');

    });

    
    /**
     * @tc.number   testxcomponentSetXComponentSurfaceSizeStatic0001
     * @tc.name     testxcomponentSetXComponentSurfaceSizeStatic0001
     * @tc.desc     testxcomponentSetXComponentSurfaceSizeStatic0001
     * @tc.level    Level.LEVEL1
     */
it('testxcomponentSetXComponentSurfaceSizeStatic0001', Level.LEVEL1, async () => {
      console.info('testxcomponentSetXComponentSurfaceSizeStatic0001 testxcomponentSetXComponentSurfaceSize0001 START');
      await Utils.sleep(2000);
      console.info("setXComponentSurfaceSize0001 click result is: " + JSON.stringify(inspector.sendEventByKey('setXComponentSurfaceSizeText', 10, "")));
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('setXComponentSurfaceSizeText');
      //console
      let obj = JSON.parseJsonElement(strJson);
      console.info("setXComponentSurfaceSize0001 strJsonstringify is: " + JSON.stringify(strJson));
      console.info("setXComponentSurfaceSize0001 strJson is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("setXComponentSurfaceSize0001 strJson obj is: " + obj);
      expect(obj.getString('$type')).assertEqual("Text");
      expect(obj.getElement('$attrs').tryGetElement('surfaceWidth')).assertEqual(undefined);
      console.info('testxcomponentSetXComponentSurfaceSize0001 END');

    });

    
    /**
     * @tc.number   testxcomponentSetXComponentSurfaceSizeStatic0002
     * @tc.name     testxcomponentSetXComponentSurfaceSizeStatic0002
     * @tc.desc     testxcomponentSetXComponentSurfaceSizeStatic0002
     * @tc.level    Level.LEVEL1
     */
it('testxcomponentSetXComponentSurfaceSizeStatic0002', Level.LEVEL1, async () => {
      console.info('testxcomponentSetXComponentSurfaceSizeStatic0002 testxcomponentSetXComponentSurfaceSize0002 START');
      await Utils.sleep(2000);
      console.info("testxcomponentSetXComponentSurfaceSize0002 click result is: " + JSON.stringify(inspector.sendEventByKey('setXComponentSurfaceSizeText', 10, "")))
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('setXComponentSurfaceSizeText');
      //console
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual("Text");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('surfaceHeight')).assertEqual(undefined);
      console.info('testxcomponentSetXComponentSurfaceSizeStatic0002 END');

    });
  })
}
