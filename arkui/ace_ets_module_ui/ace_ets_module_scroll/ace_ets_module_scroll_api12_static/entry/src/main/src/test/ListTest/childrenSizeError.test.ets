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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function childrenSizeError() {
  describe('childrenSizeError', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("childrenSizeError beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/childrenSizeError",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get childrenSizeError state pages:" + JSON.stringify(pages));
        if (!("childrenSizeError" == pages.name)) {
          console.info("get childrenSizeError pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push childrenSizeError page result:" + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push childrenSizeError page error:" + err);
      }
      console.info("childrenSizeError beforeEach end");
    });


    
    /**
     * @tc.number   childrenSizeError_static_0100
     * @tc.name     childrenSizeError_static_0100
     * @tc.desc     childrenSizeError_static_0100
     * @tc.level    Level.LEVEL0
     */
it('childrenSizeError_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[childrenSizeError_static_0100] START');
      let driver = Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('splice_btn_401')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('splice_err_401');
      console.info("[childrenSizeError_static_0100] component obj1 is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[childrenSizeError_static_0100] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('spliceError: 401');
      console.info('[childrenSizeError_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   childrenSizeError_static_0200
     * @tc.name     childrenSizeError_static_0200
     * @tc.desc     childrenSizeError_static_0200
     * @tc.level    Level.LEVEL0
     */
it('childrenSizeError_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[childrenSizeError_static_0200] START');
      let driver = Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('update_btn_401')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('update_err_401');
      console.info("[childrenSizeError_static_0200] component obj1 is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[childrenSizeError_static_0200] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('updateError: 401');
      console.info('[childrenSizeError_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   childrenSizeError_static_0300
     * @tc.name     childrenSizeError_static_0300
     * @tc.desc     childrenSizeError_static_0300
     * @tc.level    Level.LEVEL0
     */
it('childrenSizeError_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[childrenSizeError_static_0300] START');
      let driver = Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('childDefaultSize_btn_401')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('childDefaultSize_err_401');
      console.info("[childrenSizeError_static_0300] component obj1 is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[childrenSizeError_static_0300] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('childDefaultSize: 401');
      console.info('[childrenSizeError_static_0300] END');
      done();
    });
  })
}
