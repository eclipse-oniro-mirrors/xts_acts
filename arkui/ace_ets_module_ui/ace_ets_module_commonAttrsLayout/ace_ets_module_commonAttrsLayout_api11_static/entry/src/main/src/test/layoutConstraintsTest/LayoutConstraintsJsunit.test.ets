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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function layoutConstraintsJsunit() {
  describe('layoutConstraintsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("layoutConstraintsTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")

    });
    beforeEach(() => {
      console.info("layoutConstraintsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/layoutConstraints/layoutConstraints',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get layoutConstraints state pages:" + JSON.stringify(pages));
        if (!("layoutConstraints" == pages.name)) {
          console.info("get layoutConstraints state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err: BusinessError) {
        console.error("push layoutConstraints page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      const routerInstance = AppStorage.get<Router>("router") as Router
      // routerInstance.back();
      console.info("layoutConstraints after each called");
    });

    
    /**
     * @tc.number   testLayoutConstraints001_static
     * @tc.name     testLayoutConstraints001_static
     * @tc.desc     testLayoutConstraints001_static
     * @tc.level    Level.LEVEL0
     */
it('testLayoutConstraints001_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testLayoutConstraints001] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('aspectRatio');
      await Utils.sleep(1000);
      console.info("[testLayoutConstraints001] component strJson:" + strJson);
      console.info("[testLayoutConstraints001] aspectRatio: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('aspectRatio'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('aspectRatio')).assertEqual(1.5);
      done()
    });

    
    /**
     * @tc.number   testLayoutConstraints002_static
     * @tc.name     testLayoutConstraints002_static
     * @tc.desc     testLayoutConstraints002_static
     * @tc.level    Level.LEVEL0
     */
it('testLayoutConstraints002_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testLayoutConstraints002] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "aspectRatio": 2.0
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 20,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testLayoutConstraints002] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testLayoutConstraints002] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('aspectRatio');
      await Utils.sleep(2000);
      console.info("[testLayoutConstraints002] component strJson:" + strJson);
      console.info("[testLayoutConstraints002] aspectRatio: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('aspectRatio'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('aspectRatio')).assertEqual(2);
      done()
    });

    
    /**
     * @tc.number   testLayoutConstraints003_static
     * @tc.name     testLayoutConstraints003_static
     * @tc.desc     testLayoutConstraints003_static
     * @tc.level    Level.LEVEL0
     */
it('testLayoutConstraints003_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testLayoutConstraints003] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('displayPriority');
      await Utils.sleep(1000);
      console.info("[testLayoutConstraints003] component strJson:" + strJson);
      console.info("[testLayoutConstraints003] displayPriority: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayPriority'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayPriority')).assertEqual(1);
      done()
    });

    
    /**
     * @tc.number   testLayoutConstraints004_static
     * @tc.name     testLayoutConstraints004_static
     * @tc.desc     testLayoutConstraints004_static
     * @tc.level    Level.LEVEL0
     */
it('testLayoutConstraints004_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testLayoutConstraints004] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "displayPriority": 5.0
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 21,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testLayoutConstraints004] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testLayoutConstraints004] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = inspector.getInspectorByKey('displayPriority');
      console.info("[testLayoutConstraints004] component strJson:" + strJson);
      console.info("[testLayoutConstraints004] displayPriority: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayPriority'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayPriority')).assertEqual(1);
      done();
    });

    
    /**
     * @tc.number   testLayoutConstraints005_static
     * @tc.name     testLayoutConstraints005_static
     * @tc.desc     testLayoutConstraints005_static
     * @tc.level    Level.LEVEL0
     */
it('testLayoutConstraints005_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testLayoutConstraints005] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "aspectRatio": -4.0
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 1112,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testLayoutConstraints005] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testLayoutConstraints005] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('aspectRatio');
      await Utils.sleep(1000);
      console.info("[testLayoutConstraints005] component strJson:" + strJson);
      console.info("[testLayoutConstraints005] aspectRatio: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('aspectRatio'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('aspectRatio')).assertEqual("");
      done()
    });

    
    /**
     * @tc.number   testLayoutConstraints006_static
     * @tc.name     testLayoutConstraints006_static
     * @tc.desc     testLayoutConstraints006_static
     * @tc.level    Level.LEVEL0
     */
it('testLayoutConstraints006_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testLayoutConstraints006] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "aspectRatio": 9997077.0
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 1112,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testLayoutConstraints006] start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testLayoutConstraints006] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('aspectRatio');
      await Utils.sleep(1000);
      console.info("[testLayoutConstraints006] component strJson:" + strJson);
      console.info("[testLayoutConstraints006] aspectRatio: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('aspectRatio'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('aspectRatio')).assertEqual(9997077);
      done()
    });
  });
}