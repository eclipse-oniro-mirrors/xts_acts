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
import { Router, ComponentUtils, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import emitter from '@ohos.events.emitter'
import Utils from '../../../ets/MainAbility/common/Utils';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function backgroundJsunit() {
  describe('backgroundTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("backgroundTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")

    });
    beforeEach(() => {
      console.info("backgroundTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Background/background',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get background state success " + JSON.stringify(pages));
        if (!("background" == pages.name)) {
          console.info("get background state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push background page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      Utils.sleep(1000);
      console.info("background after each called");
    });

    
    /**
     * @tc.number   testBackground_static_0100
     * @tc.name     testBackground_static_0100
     * @tc.desc     testBackground_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testBackground_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testBackground_0100 START');
      await Utils.sleep(4000);
      let strJson = inspector.getInspectorByKey('fontColor');
      await Utils.sleep(2000);
      console.info("testBackground_0100 component strJson:" + strJson);

      console.info("testBackground_0100 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");
      console.info('testBackground_0100 END');
      done();
    });

    
    /**
     * @tc.number   testBackground_static_0200
     * @tc.name     testBackground_static_0200
     * @tc.desc     testBackground_static_0200
     * @tc.level    Level.LEVEL0
     */
it('testBackground_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testBackground_0200 START');
      await Utils.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "color": '0xFF0000'
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 2,
          priority: emitter.EventPriority.LOW
        }
        console.info("testBackground_0200 start pages");
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testBackground_0200 change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('backgroundColor');
      await Utils.sleep(2000);
      console.info("testBackground_0200 component strJson:" + strJson);
      console.info("testBackground_0200 rowDirection: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('direction'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual("#FFEEEE00");
      done();
    });

    
    /**
     * @tc.number   testBackground_static_0300
     * @tc.name     testBackground_static_0300
     * @tc.desc     testBackground_static_0300
     * @tc.level    Level.LEVEL0
     */
it('testBackground_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testBackground_0300 START');
      await Utils.sleep(4000);
      let strJson = inspector.getInspectorByKey('backgroundColor');
      await Utils.sleep(2000);
      console.info("testBackground_0300 component strJson:" + strJson);
      console.info("testBackground_0300 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth')).assertEqual("1.00vp");
      console.info('testBackground_0300 END');
      done();
    });
  })
}
