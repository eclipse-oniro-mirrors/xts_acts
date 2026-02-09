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

import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import emitter from '@ohos.events.emitter';

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from './Util.test'
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function motionPathJsunit() {
  describe('motionPathTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("motionPathTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/motionPath',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get motionPathTest state pages:" + JSON.stringify(pages));
        if (!("motionPath" == pages.name)) {
          console.info("get motionPathTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push motionPathTest page error:" + err);
      }
      console.info("motionPathTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("motionPath after each called");
    });


    
    /**
     * @tc.number   motionPathTest_static_0100
     * @tc.name     motionPathTest_static_0100
     * @tc.desc     motionPathTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('motionPathTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('motionPathTest_0100 START');
      let strJson = inspector.getInspectorByKey('motionPath');
      await CommonFunc.sleep(1000);
      console.info("motionPathTest_0100 component strJson:" + strJson);
      console.info("motionPathTest_0100 component obj is: " +
      JSON.stringify(String(JSON.parseJsonElement(strJson).getElement("$attrs"))))
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Column');
      done();
    });


    
    /**
     * @tc.number   motionPathTest_static_0200
     * @tc.name     motionPathTest_static_0200
     * @tc.desc     motionPathTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('motionPathTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('motionPathTest_0200 START');
      let callback = (indexEventOne: emitter.EventData) => {
        const data: Record<String,RecordData> =
          indexEventOne.data as Record<String,RecordData>
        console.info("motionPathTest_0200 get state result is: " + JSON.stringify(indexEventOne));
        expect(data['fromX']).assertEqual(0);
        expect(data['toY']).assertEqual(1);
        done();
      }
      let indexEventOne: emitter.InnerEvent = {
        eventId: 133,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("motionPathTest_0200 on emitter err : " + JSON.stringify(err));
      }
      console.info("motionPathTest_0200 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('motionPathTest_0200 END');
      done();
    });


    
    /**
     * @tc.number   motionPathTest_static_0300
     * @tc.name     motionPathTest_static_0300
     * @tc.desc     motionPathTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('motionPathTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('motionPathTest_0300 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: emitter.EventData) => {
        const data: Record<String,RecordData> =
          indexEvent.data as Record<String,RecordData>
        console.info("motionPathTest_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(data['ACTION']).assertEqual(true);
        done();
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 132,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("motionPathTest_0300 on emitter err : " + JSON.stringify(err));
      }
      console.info("motionPathTest_0300 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('motionPathTest_0300 END');
    });
  })
}
