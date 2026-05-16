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
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import  Utils  from '../../../ets/MainAbility/common/Utils';


export default function ResourceColor() {
  describe('ResourceColor', () => {
    beforeAll(() => {
      console.info("ResourceColor beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ResourceColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Resource/ResourceColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ResourceColor state pages:" + JSON.stringify(pages));
        if (!("ResourceColor" == pages.name)) { //ResourceColor" == pages.name
          console.info("get ResourceColor pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(5000);
          // console.info("push ResourceColor page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceColor page error:" + err);
      }
      console.info("ResourceColor beforeEach end");
    });
    afterEach(async () => {
      const router = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/index/index',
      }
      // router.pushUrl(options);
      await Utils.sleep(1000);
    });
    



/**
     * @tc.number   ResourceColor_static_0100
     * @tc.name     ResourceColor_static_0100
     * @tc.desc     ResourceColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ResourceColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ResourceColor_0100 START');
      let strJson = inspector.getInspectorByKey('color');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceColor_0100] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF445566');
      console.info('[ResourceColor_0100] END');
      done();
    });

    



/**
     * @tc.number   ResourceColor_static_0200
     * @tc.name     ResourceColor_static_0200
     * @tc.desc     ResourceColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ResourceColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ResourceColor_0200 START');
      let driver = Driver.create();
      // await CommonFunc.sleep(10000);
  await UtilsTest.msSleep(2000)
  console.log('+++++++++++++++++++++++++++1')
      let button = await driver.findComponent(ON.id('ResourceColor'));
  console.log('+++++++++++++++++++++++++++2',button)
      await (button?.click() as Promise<void>);
  console.log('+++++++++++++++++++++++++++3')
      // await CommonFunc.sleep(10000);
  await UtilsTest.msSleep(2000)
      let strJson = inspector.getInspectorByKey('color');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceColor_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceColor_0200] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF998877');
      console.info('[ResourceColor_0200] END');
      done();
    });
  })
}