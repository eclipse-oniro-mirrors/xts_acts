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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import {
// UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
// BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import  common  from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest} from '../Util.test'
import { RecordData } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function popup() {
  describe('popup', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("popup beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/popupControl/popup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get popup state pages:" + JSON.stringify(pages));
        if (!("popup" == pages.name)) {
          console.info("get popup pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push popup page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push popup page error:" + err);
      }
      console.info("popup beforeEach end");
    });


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("bindPopup after each called");
    });
    
    
    /**
     * @tc.number   popup_static_0100
     * @tc.name     popup_static_0100
     * @tc.desc     popup_static_0100
     * @tc.level    Level.LEVEL0
     */
it('popup_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('popup_0100 START');
      await Utils.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        const data = indexEvent.data as Record<String,RecordData>
        const arrowWidth = data['arrowWidth'] as Record<String,RecordData>
        const arrowHeight = data['arrowHeight'] as Record<String,RecordData>
        const arrowPointPosition = data['arrowPointPosition'] as Record<String,RecordData>

        console.info("popup_0100 get state result is: " + JSON.stringify(indexEvent));
        console.info("zxr " + JSON.stringify(arrowPointPosition));
        expect(arrowWidth).assertEqual('20px');
        expect(arrowHeight).assertEqual('20px');
        expect(arrowPointPosition).assertEqual('Start');
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 65,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("popup_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("popup_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await Utils.sleep(1000);
      console.info('popup_0100 END');
      done();
    });
  })
}