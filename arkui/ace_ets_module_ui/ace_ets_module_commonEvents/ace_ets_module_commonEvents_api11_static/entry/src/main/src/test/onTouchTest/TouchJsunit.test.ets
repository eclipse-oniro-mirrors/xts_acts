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

export default function touchJsunit() {
  describe('touchTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("touchTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onTouch/touch',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get touchTest state pages:" + JSON.stringify(pages));
        if (!("touch" == pages.name)) {
          console.info("get touchTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push touchTest page error:" + err);
      }
      console.info("touchTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("touch after each called");
    })


    
    /**
     * @tc.number   testTouch_static_01
     * @tc.name     testTouch_static_01
     * @tc.desc     testTouch_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTouch_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTouch01] START');
      await CommonFunc.sleep(1000);
      try {
        let callBackTouch = (backData: emitter.EventData) => {
          const data: Record<String,RecordData> =
            backData.data as Record<String,RecordData>
          console.info("testTouch01 get backEvent result is: " + JSON.stringify(backData));
          console.info("testTouch01 get flag result is: " + JSON.stringify(data['ACTION']));
          expect(data['ACTION']).assertEqual(true);
          done()
        }
        let backEvent: emitter.InnerEvent = {
          eventId: 43,
          priority: emitter.EventPriority.LOW
        }
        emitter.on(backEvent, callBackTouch);
      } catch (err: Error) {
        console.info("testTouch01 on touchEvent err : " + JSON.stringify(err));
      }
      console.info("testTouch01 click result is: " + JSON.stringify(inspector.sendEventByKey('touch', 10, "")));
      console.info('[testTouch01] END');
    });
  })
}
