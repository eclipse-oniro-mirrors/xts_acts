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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import Utils from '../../ets/MainAbility/common/Utils';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Callback, MessageManager } from '../../ets/MainAbility/common/MessageManager';
import { startAbility, stopApplication, UtilsTest } from './Util.test'
import CommonFunc from '../../ets/MainAbility/common/Common';
import { HorizontalAlign } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function columnJsunit() {
  describe('columnTest', () => {
    beforeAll(() => {
      console.info("columnTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("column beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/column',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get column state pages:" + JSON.stringify(pages));
        if (!("column" == pages.name)) {
          console.info("get column pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push column page error:" + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("column after each called");
    });



    /**
     * @tc.number   testColumn_static_01
     * @tc.name     testColumn_static_01
     * @tc.desc     testColumn_static_01
     * @tc.level    Level.LEVEL0
     */
it('testColumn_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testColumn_static_01] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('alignItemsColumn');
      console.info("[testColumn_static_01] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual('HorizontalAlign.Start');
      console.info('[testColumn_static_01] END');
      done()
    });

    
    /**
     * @tc.number   testColumn_static_02
     * @tc.name     testColumn_static_02
     * @tc.desc     testColumn_static_02
     * @tc.level    Level.LEVEL0
     */
it('testColumn_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testColumn_static_02] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "alignItems": HorizontalAlign.Center
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testColumn_static_02] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testColumn_static_02] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('alignItemsColumn');
      console.info("[testColumn_static_02] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual('HorizontalAlign.Center');
      console.info('[testColumn_static_02] END');
      done()
    });
  })
}
