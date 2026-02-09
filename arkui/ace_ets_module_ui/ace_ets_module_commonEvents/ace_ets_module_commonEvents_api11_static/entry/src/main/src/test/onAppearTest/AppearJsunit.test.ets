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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import emitter from '@ohos.events.emitter'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function appearJsunit() {
  describe('appearTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("appearTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAppear/appear',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get appearTest state pages:" + JSON.stringify(pages));
        if (!("appear" == pages.name)) {
          console.info("get appearTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push appearTest page error:" + err);
      }
      console.info("appearTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("appear after each called");
    })


    
    /**
     * @tc.number   testAppear_static_01
     * @tc.name     testAppear_static_01
     * @tc.desc     testAppear_static_01
     * @tc.level    Level.LEVEL0
     */
it('testAppear_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testAppear01] START');
      await CommonFunc.sleep(1000);
      try {
        let callBackAppear1 = (backData: emitter.EventData) => {
          const data: Record<String,RecordData> =
            backData.data as Record<String,RecordData>
          console.info("testAppear01 get appearEvent result is: " + JSON.stringify(backData));
          await CommonFunc.sleep(1000);
          expect(data['ACTION']).assertEqual(false);
          done()
        }
        let appearEvent1: emitter.InnerEvent = {
          eventId: 58,
          priority: emitter.EventPriority.LOW
        }
        emitter.on(appearEvent1, callBackAppear1);
      } catch (err: Error) {
        console.info("testAppear01 on appearEvent err : " + JSON.stringify(err));
      }
      console.info("testAppear01 click result is: " + JSON.stringify(inspector.sendEventByKey('appear', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('[testAppear01] END');

      console.info('[testAppear02] START');
      try {
        let callBackDisAppear = (backData1: emitter.EventData) => {
          const data: Record<String,RecordData> =
            backData1.data as Record<String,RecordData>
          console.info("testAppear02 get disAppearEvent result is: " + JSON.stringify(backData1));
          console.info("testAppear02 get backData1.data.ACTION result is: " + data['ACTION']);
          expect(data['ACTION']).assertEqual(true);
          done()
        }
        let disAppearEvent: emitter.InnerEvent = {
          eventId: 60,
          priority: emitter.EventPriority.LOW
        }
        emitter.on(disAppearEvent, callBackDisAppear);
      } catch (err: Error) {
        console.info("testAppear02 on disAppearEvent err : " + JSON.stringify(err));
      }

      await CommonFunc.sleep(1000);
      console.info('[testAppear03] START');
      let callBackAppear2 = (backData2: emitter.EventData) => {
        const data: Record<String,RecordData> =
          backData2.data as Record<String,RecordData>
        console.info("testAppear03 get appearEvent result is: " + JSON.stringify(backData2));
        console.info("testAppear03 get backData2.data.APPEAR: " + data['APPEAR']);
        expect(data['APPEAR']).assertEqual("appearStatusOn");
        done()
      }
      let appearEvent2: emitter.InnerEvent = {
        eventId: 59,
        priority: emitter.EventPriority.LOW
      }
      try {
        console.info("testAppear03 appearEvent click result is: " +
        JSON.stringify(inspector.sendEventByKey('appear', 10, "")));
        emitter.on(appearEvent2, callBackAppear2);
      } catch (err: Error) {
        console.info("testAppear03 on appearEvent err : " + JSON.stringify(err));
      }

    });
  })
}
