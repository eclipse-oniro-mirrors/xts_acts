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

export default function ResourceString() {
  describe('ResourceString', () => {

    beforeAll(() => {
      console.info("ResourceString beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ResourceString beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Resource/ResourceString',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ResourceString state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ResourceString pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(5000);
          // console.info("push ResourceString page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceString page error:" + err);
      }
      console.info("ResourceString beforeEach end");
    });

    



/**
     * @tc.number   ResourceString_static_0100
     * @tc.name     ResourceString_static_0100
     * @tc.desc     ResourceString_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ResourceString_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ResourceString_0100 START');
      let strJson = inspector.getInspectorByKey('string');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceString_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceString_0100] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('1.00fp');
      console.info('[ResourceString_0100] END');
      done();
    });
    



/**
     * @tc.number   ResourceString_static_0200
     * @tc.name     ResourceString_static_0200
     * @tc.desc     ResourceString_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ResourceString_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ResourceString_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(5000);
      let button = await driver.findComponent(ON.id('ResourceString'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('string');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceString_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceString_0200] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('2.00fp');
      console.info('[ResourceString_0200] END');
      done();
    });
  })
}