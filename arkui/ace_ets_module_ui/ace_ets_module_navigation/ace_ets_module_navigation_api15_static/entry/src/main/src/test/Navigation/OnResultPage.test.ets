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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function OnResultPage() {
  describe('OnResultPage', () => {
    beforeAll(() => {
      console.info("OnResultPage beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.navigation15.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("OnResultPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/OnResultPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnResultPage state pages:" + JSON.stringify(pages));
        if (!("OnResultPage" == pages.name)) {
          console.info("get OnResultPage pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push OnResultPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnResultPage page error:" + err);
      }
      console.info("OnResultPage beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("OnResultPage after each called");
    });


    
    

    /**
     * @tc.number   OnResultPage_static_0100
     * @tc.name     OnResultPage_static_0100
     * @tc.desc     OnResultPage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('OnResultPage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('OnResultPage_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushId'));
      await (btn1?.click() as Promise<void>)
      console.info('[OnResultPage_0100] btn1 click');
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('pushTwoId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnResultPage_0100] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('popId'));
      await (btn3?.click() as Promise<void>)
      console.info('[OnResultPage_0100] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('OnResultPage_0100 END');
      done();
    });

    
    

    /**
     * @tc.number   OnResultPage_static_0200
     * @tc.name     OnResultPage_static_0200
     * @tc.desc     OnResultPage_static_0200
     * @tc.level    Level.LEVEL0
     */
it('OnResultPage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('OnResultPage_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('pushTwoId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnResultPage_0200] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('popIndexId'));
      await (btn3?.click() as Promise<void>)
      console.info('[OnResultPage_0200] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_0200] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('OnResultPage_0200 END');
      done();
    });

    
    

    /**
     * @tc.number   OnResultPage_static_0300
     * @tc.name     OnResultPage_static_0300
     * @tc.desc     OnResultPage_static_0300
     * @tc.level    Level.LEVEL0
     */
it('OnResultPage_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('OnResultPage_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('pushTwoId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnResultPage_0300] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('popNameId'));
      await (btn3?.click() as Promise<void>)
      console.info('[OnResultPage_0300] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_0300] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('OnResultPage_0300 END');
      done();
    });

    
    

    /**
     * @tc.number   OnResultPage_static_0400
     * @tc.name     OnResultPage_static_0400
     * @tc.desc     OnResultPage_static_0400
     * @tc.level    Level.LEVEL0
     */
it('OnResultPage_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('OnResultPage_0400 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('pushTwoId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnResultPage_0400] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('popUndefinedId'));
      await (btn3?.click() as Promise<void>)
      console.info('[OnResultPage_0400] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_0400] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_0400] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('OnResultPage_0400 END');
      done();
    });

    
    

    /**
     * @tc.number   OnResultPage_static_0500
     * @tc.name     OnResultPage_static_0500
     * @tc.desc     OnResultPage_static_0500
     * @tc.level    Level.LEVEL0
     */
it('OnResultPage_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('OnResultPage_0500 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('pushTwoId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnResultPage_0500] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('popNullId'));
      await (btn3?.click() as Promise<void>)
      console.info('[OnResultPage_0500] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_0500] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_0500] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('OnResultPage_0500 END');
      done();
    });


    
    

    /**
     * @tc.number   OnResultPage_static_0600
     * @tc.name     OnResultPage_static_0600
     * @tc.desc     OnResultPage_static_0600
     * @tc.level    Level.LEVEL0
     */
it('OnResultPage_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('OnResultPage_0600 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('pushDialogId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnResultPage_0600] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('dialogPopId'));
      await (btn3?.click() as Promise<void>)
      console.info('[OnResultPage_0600] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_0600] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_0600] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('OnResultPage_0600 END');
      done();
    });

    
    

    /**
     * @tc.number   OnResultPage_static_0700
     * @tc.name     OnResultPage_static_0700
     * @tc.desc     OnResultPage_static_0700
     * @tc.level    Level.LEVEL0
     */
it('OnResultPage_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('OnResultPage_0700 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('pushDialogId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnResultPage_0700] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('dialogPopIndexId'));
      await (btn3?.click() as Promise<void>)
      console.info('[OnResultPage_0700] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_0700] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_0700] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('OnResultPage_0700 END');
      done();
    });

    
    

    /**
     * @tc.number   OnResultPage_static_0800
     * @tc.name     OnResultPage_static_0800
     * @tc.desc     OnResultPage_static_0800
     * @tc.level    Level.LEVEL0
     */
it('OnResultPage_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('OnResultPage_0800 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('pushDialogId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnResultPage_0800] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('dialogPopNameId'));
      await (btn3?.click() as Promise<void>)
      console.info('[OnResultPage_0800] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_0800] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_0800] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      console.info('OnResultPage_0800 END');
      done();
    });
  })
}