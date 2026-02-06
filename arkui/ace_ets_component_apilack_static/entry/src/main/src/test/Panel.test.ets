'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


export default function panelBackgroundMaskJsunit() {
  describe('panelBackgroundMaskTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/panel',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get panel state success " + JSON.stringify(pages));
        if (!("panel" == pages.name)) {
          console.info("get panel state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push panel page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("panelBackgroundMask after each called");
    });

    
    
    
   /**
     * @tc.number   testpanelBackgroundMask_static_0001
     * @tc.name     testpanelBackgroundMask_static_0001
     * @tc.desc     testpanelBackgroundMask_static_0001
     * @tc.level    Level.LEVEL0
     */
//it('testpanelBackgroundMask_static_0001', Level.LEVEL0, async () => { // 组件废弃
    //   console.info('panelBackgroundMask testpanelBackgroundMask0001 START');
    //   await Utils.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('panel');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("get inspector value is: " + JSON.stringify(obj));
    //   console.log(JSON.stringify(obj.getString('$type')))
    //   expect(obj.getString('$type')).assertEqual('Panel')
    //   console.log('Panel‘s backgroundMask is ' + JSON.stringify(obj.getElement('$attrs').getString('backgroundMask')))
    //   expect(obj.getElement('$attrs').getString('backgroundMask')).assertEqual('#FF00FF00');
    //
    // });

    
    
    
    /**
     * @tc.number   testpanelOnHeightChange_static_0002
     * @tc.name     testpanelOnHeightChange_static_0002
     * @tc.desc     testpanelOnHeightChange_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testpanelOnHeightChange_static_0002', Level.LEVEL0, async () => {
      console.info('panelBackgroundMask testpanelOnHeightChange0002 START');
      let panelOnHeightChangeEvent: events_emitter.InnerEvent = {
        eventId: 10111,
        priority: events_emitter.EventPriority.LOW
      }
      let callback1: (eventData: events_emitter.EventData) => void = (backData: events_emitter.EventData) => {
        console.info("testpanelOnHeightChange0002 backData.data.result is: " +
        ((backData.data) as ESObject)?.getProperty('result').toString());
        try {
          console.info("testpanelOnHeightChange0002 callback1 success");
          expect(((backData.data) as ESObject)?.getProperty('result').toString()).assertEqual("success");

        } catch (err) {
          console.info("testpanelOnHeightChange0002 on events_emitter err : " + JSON.stringify(err));
        }
      }
      try {
        console.info("testpanelOnHeightChange0002 click result is: " +
        JSON.stringify(inspector.sendEventByKey('onHeightChangeText', 10, "")));
        events_emitter.on(panelOnHeightChangeEvent, callback1);
      } catch (err) {
        console.info("testpanelOnHeightChange0002 on events_emitter err : " + JSON.stringify(err));
      }
    });

  })
}
