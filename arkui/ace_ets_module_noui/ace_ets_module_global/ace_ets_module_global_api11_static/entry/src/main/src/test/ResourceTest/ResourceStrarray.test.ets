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

export default function ResourceStrarray() {
  describe('ResourceStrarray', () => {

    beforeAll(() => {
      console.info("ResourceStrarray beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ResourceStrarray beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Resource/ResourceStrarray',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ResourceStrarray state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ResourceStrarray pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(5000);
          // console.info("push ResourceStrarray page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceStrarray page error:" + err);
      }
      console.info("ResourceStrarray beforeEach end");
    });

    



/**
     * @tc.number   ResourceStrarray_static_0100
     * @tc.name     ResourceStrarray_static_0100
     * @tc.desc     ResourceStrarray_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ResourceStrarray_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ResourceStrarray_0100 START');
      try {
        let strJson = inspector.getInspectorByKey('strarray');
        console.info("push ResourceStrarray_0100 success: " + strJson);
      } catch (err) {
        console.error("push ResourceStrarray_0100 error: " + err);
      }
      let strJson = inspector.getInspectorByKey('strarray');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceStrarray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceStrarray_0100] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('range')));
      expect(obj.getElement('$attrs').getString('range')).assertEqual('[\"icon:,text:11\",\"icon:,text:22\"]');
      console.info('[ResourceStrarray_0100] END');
      done();
    });

    



/**
     * @tc.number   ResourceStrarray_static_0200
     * @tc.name     ResourceStrarray_static_0200
     * @tc.desc     ResourceStrarray_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ResourceStrarray_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ResourceStrarray_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(5000);
      let button = await driver.findComponent(ON.id('ResourceStrarray'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('strarray');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceStrarray_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceStrarray_0200] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('range')));
      expect(obj.getElement('$attrs').getString('range')).assertEqual('[\"icon:,text:111\",\"icon:,text:222\"]');
      console.info('[ResourceStrarray_0200] END');
      done();
    });
  })
}