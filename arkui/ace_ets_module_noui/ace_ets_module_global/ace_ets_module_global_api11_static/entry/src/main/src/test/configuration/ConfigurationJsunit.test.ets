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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'
import emitter from '@ohos.events.emitter';
export default function configurationJsunit() {
  describe('configurationJsunit', () => {
    beforeAll(() => {
      console.info("configurationJsunit beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("configurationJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/configuration/configuration',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get configurationJsunit state pages:" + JSON.stringify(pages));
        if (!("configuration" == pages.name)) {
          console.info("get configurationJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push configurationJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push configurationJsunit page error:" + err);
      }
      console.info("configurationJsunit beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("prompt each called");
    });
    
    



/**
     * @tc.number   configurationTest_static_0100
     * @tc.name     configurationTest_static_0100
     * @tc.desc     configurationTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('configurationTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('configurationTest_static_0100 is start');
      try {
        let callBackConfiguration = (backData: emitter.EventData) => {
          console.info("configurationTest_static_0100 get configurationEvent result is: " + JSON.stringify(backData));
          expect((backData.data as ESObject)?.getProperty('COUNTRY')).assertEqual('CN');
          expect((backData.data as ESObject)?.getProperty('DIR')).assertEqual('ltr');
          done();
        }
        let configurationEvent: emitter.InnerEvent = {
          eventId: 78,
          priority: emitter.EventPriority.LOW
        }
        console.info('configurationTest_static_0100 is start+++++++++++++++++++++1');
        emitter.on(configurationEvent, callBackConfiguration);
        console.info('configurationTest_static_0100 is start+++++++++++++++++++++2');
      } catch (err) {
        console.info("configurationTest_static_0100 on configurationEvent err : " + JSON.stringify(err));
      }
       console.info('configurationTest_static_0100 is start+++++++++++++++++++++3');
      console.info("testAppear01 click result is: " + JSON.stringify(inspector.sendEventByKey('button_c', 10, "")));
      console.info('[configurationTest01] END');
    }
    )
  })
}