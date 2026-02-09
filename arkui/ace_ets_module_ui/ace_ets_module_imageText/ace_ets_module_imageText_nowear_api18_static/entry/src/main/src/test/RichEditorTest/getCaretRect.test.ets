'use static';
/*
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

import { describe,beforeAll, beforeEach, it, expect, Level,afterEach } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function getCaretRect() {
  describe('getCaretRect', () => {
    beforeAll(() => {
      console.info("getCaretRect beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("getCaretRect beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/getCaretRect",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getCaretRect state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get getCaretRect pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getCaretRect page error:" + err);
      }
      console.info("getCaretRect beforeEach end");
    });
    afterEach(() => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({url:'MainAbility/pages/index/index'});
      await CommonFunc.sleep(2000);
    })


    /**
     * @tc.number   getCaretRect_static_0001
     * @tc.name     getCaretRect_static_0001
     * @tc.desc     getCaretRect_static_0001
     * @tc.level    Level.LEVEL0
     */
it('getCaretRect_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[getCaretRect0001] start");
      let driver = Driver.create();
      console.info('getCaretRect getCaretRect0001 START');
      await CommonFunc.sleep(1000);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as  Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('text');
        let obj = JSON.parseJsonElement(strJson);
        console.log('addOrDelText0001---obj.$attrs.content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect('' + obj.getElement('$attrs').getString('content')).assertEqual("undefined");

      console.info("[getCaretRect0001] end");
      done();
    });


    /**
     * @tc.number
     * @tc.name     getCaretRect_static_0002
     * @tc.desc     getCaretRect_static_0002
     * @tc.level    Level.LEVEL0
     */
it('getCaretRect_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[getCaretRect0002] start");
      let driver = Driver.create();
      console.info('getCaretRect getCaretRect0002 START');
      await CommonFunc.sleep(1000);
      let richEditor = await driver.findComponent(ON.id('richEditor'));
      await CommonFunc.sleep(500);
      await (richEditor?.click() as  Promise<void>);
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(1000);
      await (but?.click() as  Promise<void>);
      await CommonFunc.sleep(2000);


        let strJson = inspector.getInspectorByKey('text');
        let obj = JSON.parseJsonElement(strJson);
        console.log('addOrDelText0001---obj.$attrs.content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect('' + obj.getElement('$attrs').getString('content')).assertEqual("succ");

      console.info("[getCaretRect0002] end");
      done();
    });
  })
}