'use static';
/*
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
import { RecordData } from '@ohos.base';


let emitKey = "emitUserAgent";

export default function web9Jsunit() {

  describe('web9Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/web_api_9',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get web9Jsunit state success " + JSON.stringify(pages));
        if (!("AlphabetIndexer" == pages.name)) {
          console.info("get web9Jsunit state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push web9Jsunit page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("web beforeEach start");

    })
    afterEach(async () => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          } as Record<String,RecordData>
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);

    })
    
    
    /**
     * @tc.number   webContextMenuResultTest_static_001
     * @tc.name     webContextMenuResultTest_static_001
     * @tc.desc     webContextMenuResultTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('webContextMenuResultTest_static_001', Level.LEVEL0, async () => {
      try {
        emitKey = "emitwebContextMenuResult";
        //Utils.registerContainEvent("webContextMenuResult", true, 1101);
      } catch(error) {
        expect().assertFail();
      }
    })
    
    
    /**
     * @tc.number   setWebControllerTest_static_002
     * @tc.name     setWebControllerTest_static_002
     * @tc.desc     setWebControllerTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('setWebControllerTest_static_002', Level.LEVEL0, async () => {
      try {
        emitKey = "emitsetWebController";
        //Utils.registerContainEvent("setWebController", true, 1102);
      } catch(error) {
        expect().assertFail();
      }
    })
    
    
    /**
     * @tc.number   setWebControllerTest_static_003
     * @tc.name     setWebControllerTest_static_003
     * @tc.desc     setWebControllerTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('setWebControllerTest_static_003', Level.LEVEL0, async () => {
      try {
        emitKey = "emitHitTestValue";
        //Utils.registerContainEvent("HitTestValue", true, 1103);
        inspector.sendEventByKey('web2', 10, '');
      } catch(error) {
        expect().assertFail();
      }
    })


  })
}
