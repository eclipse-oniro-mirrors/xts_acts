'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
interface Data {
  data: number
}
export default function navigatorJsunit() {


  describe('navigatorTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigator/Navigator',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await UtilsTest.msSleep(1000);
        let pages = routerInstance.getState();
        console.info("get Navigator state success " + JSON.stringify(pages));
        if (!("Navigator" == pages.name)) {
          console.info("get Navigator state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          console.info("push Navigator page success ");
        }
      } catch (err) {
        console.error("push Navigator page error " + JSON.stringify(err));
      }
      await UtilsTest.msSleep(2000)
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000)
      console.info("Navigator after each called");
    });


    
/**
     * @tc.number   navigatorTestStatic001
     * @tc.name     navigatorTestStatic001
     * @tc.desc     navigatorTestStatic001
     * @tc.level    Level.LEVEL0
     */
it('navigatorTestStatic001', Level.LEVEL0, async (): Promise<void> => {
      console.info('++++++++++++++++ Navigator TestCase 1 START ++++++++++++++++');
      await UtilsTest.msSleep(1000)
      let strJson = inspector.getInspectorByKey('navigator');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.getString('$type')))
      expect(obj.getString('$type')).assertEqual('Navigation')
      console.info('++++++++++++++++ Navigator TestCase 1 End ++++++++++++++++');
    });


    
/**
     * @tc.number   navigatorTestStatic002
     * @tc.name     navigatorTestStatic002
     * @tc.desc     navigatorTestStatic002
     * @tc.level    Level.LEVEL0
     */
it('navigatorTestStatic002', Level.LEVEL0, async (): Promise<void> => {
      console.info('++++++++++++++++ Navigator TestCase 2 START ++++++++++++++++');
      await UtilsTest.msSleep(1000)
      let strJson = inspector.getInspectorByKey('navigator2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.getString('$type')))
      expect(obj.getString('$type')).assertEqual('Navigation')
      console.info('++++++++++++++++ Navigator TestCase 2 End ++++++++++++++++');
    });


    
/**
     * @tc.number   navigatorTestStatic003
     * @tc.name     navigatorTestStatic003
     * @tc.desc     navigatorTestStatic003
     * @tc.level    Level.LEVEL0
     */
it('navigatorTestStatic003', Level.LEVEL0, async (): Promise<void> => {
      console.info('++++++++++++++++ Navigator TestCase 3 START ++++++++++++++++');
      await UtilsTest.msSleep(1000)
      let strJson = inspector.getInspectorByKey('navigator3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.getString('$type')))
      expect(obj.getString('$type')).assertEqual('Navigation')
      console.info('++++++++++++++++ Navigator TestCase 3 End ++++++++++++++++');
    });
  })
}
