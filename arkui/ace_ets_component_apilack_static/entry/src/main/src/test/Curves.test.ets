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
import { Color, $r, PanDirection } from '@ohos.arkui.component'
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  beforeAll,
  Size,
  TestType,
  afterEach,
  afterAll
} from '../../../hypium/index';
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


let domain: number = 0x0000;
let tag: string = 'testTag';

export default function curvesStepsJsunit() {
  describe('curvesStepsTest', () => {

    /**
     * run before testcase
     */
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info('[curvesStepsTest] before each called')

      // let result = '';
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/curves'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.pushUrl(options)
      } catch (err) {
        console.error("push curves page error " + JSON.stringify(err));
      }
      await Utils.sleep(4000)
    });

    /**
     * run after testcase
     */
    afterAll(async () => {
      console.info('[curvesStepsTest] after each called')
      await Utils.sleep(1000)
    });

    
    
    
    /**
     * @tc.number   testcurvesSteps_static_0001
     * @tc.name     testcurvesSteps_static_0001
     * @tc.desc     testcurvesSteps_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcurvesSteps_static_0001', Level.LEVEL0, async () => {
      console.info('curvesSteps testcurvesSteps0001 START');
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60229,
        priority: events_emitter.EventPriority.LOW
      }
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        try {
          console.info("callback success");
          console.info("curveApi eventData.data.curveApi result is: " +
          ((eventData.data) as ESObject)?.getProperty('curveApi').toString());
          expect(((eventData.data) as ESObject)?.getProperty('curveApi').toString()).assertEqual("callBackSuccess");
          console.info("curveApi end");
        } catch (err) {
          console.info("curveApi on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("curveApi click result is: " + JSON.stringify(inspector.sendEventByKey('stepsText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("curveApi on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
