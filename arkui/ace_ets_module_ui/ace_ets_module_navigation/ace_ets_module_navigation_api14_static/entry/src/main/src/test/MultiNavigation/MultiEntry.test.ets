'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0the "License");
 * you may not use this file except in compliance with the License.
 * You may a copy of the License at
 *
 *     http://www.apache.org/licenses-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR OF ANY KIND, either express or implied.
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
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function MultiEntry() {
  describe('MultiEntry', () => {
    beforeAll(() => {
      console.info("MultiEntry beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info('MultiEntry beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiEntry',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get MultiEntry state pages:' + JSON.stringify(pages));
        if (!('MultiEntryEntry' == pages.name)) {
          console.info('get MultiEntry pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push MultiEntry page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push MultiEntry page error:' + err);
      }
      console.info('MultiEntry beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('MultiEntry after each called');
    });


    
    

    /**
     * @tc.number   MultiEntry_static_0100
     * @tc.name     MultiEntry_static_0100
     * @tc.desc     MultiEntry_static_0100
     * @tc.level    Level.LEVEL0
     */
it('MultiEntry_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiEntry_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await (btn1?.click() as Promise<void>)
      console.info('[MultiEntry_0100] btn1 click');
      await CommonFunc.sleep(1000);


      let btn2 = await driver.findComponent(ON.id('popToHomeId'));
      await (btn2?.click() as Promise<void>)
      console.info('[MultiEntry_0100] btn1 click');
      await CommonFunc.sleep(3000);

      let onNavigationModeChangeCallbackValue:Double = AppStorage.get<Double>('onNavigationModeChangeCallbackValue')! as Double
      expect(onNavigationModeChangeCallbackValue).assertEqual(1);
      AppStorage.delete('onNavigationModeChangeCallbackValue');

      console.info('MultiEntry_0100 END');
      done();
    });

    
    
    

    /**
     * @tc.number   MultiEntry_static_0200
     * @tc.name     MultiEntry_static_0200
     * @tc.desc     MultiEntry_static_0200
     * @tc.level    Level.LEVEL0
     */
it('MultiEntry_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiEntry_0200 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('replacePathByNameId'));
      await (btn1?.click() as Promise<void>)
      console.info('[MultiEntry_0200] btn1 click');
      await CommonFunc.sleep(500);

      let strJson: string = inspector.getInspectorByKey('detailTextId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[MultiEntry_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiEntry_0200] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PageDetail');

      console.info('MultiEntry_0200 END');
      done();
    });

    
    
    

    /**
     * @tc.number   MultiEntry_static_0300
     * @tc.name     MultiEntry_static_0300
     * @tc.desc     MultiEntry_static_0300
     * @tc.level    Level.LEVEL0
     */
it('MultiEntry_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiEntry_0300 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await (btn1?.click() as Promise<void>)
      console.info('[MultiEntry_0300] btn1 click');
      await CommonFunc.sleep(1000);


      let btn2 = await driver.findComponent(ON.id('moveToTopId'));
      await (btn2?.click() as Promise<void>)
      console.info('[MultiEntry_0300] btn1 click');
      await CommonFunc.sleep(3000);

      let strJson = inspector.getInspectorByKey('homeText');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[MultiEntry_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiEntry_0300] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PageHome');

      console.info('MultiEntry_0300 END');
      done();
    });

    
    

    /**
     * @tc.number   MultiEntry_static_0400
     * @tc.name     MultiEntry_static_0400
     * @tc.desc     MultiEntry_static_0400
     * @tc.level    Level.LEVEL0
     */
it('MultiEntry_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiEntry_0400 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await (btn1?.click() as Promise<void>)
      console.info('[MultiEntry_0400] btn1 click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('getAllPathNameId'));
      await (btn2?.click() as Promise<void>)
      console.info('[MultiEntry_0400] btn2 click');
      await CommonFunc.sleep(3000);

      let allPathName:String = AppStorage.get<String>('allPathName')! as String;
      expect(allPathName).assertEqual('PageHome,PageDetail');
      AppStorage.delete('allPathName');

      console.info('MultiEntry_0400 END');
      done();
    });

    
    

    /**
     * @tc.number   MultiEntry_static_0500
     * @tc.name     MultiEntry_static_0500
     * @tc.desc     MultiEntry_static_0500
     * @tc.level    Level.LEVEL0
     */
it('MultiEntry_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiEntry_0500 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await (btn1?.click() as Promise<void>)
      console.info('[MultiEntry_0500] btn1 click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('getParamByIndexId'));
      await (btn2?.click() as Promise<void>)
      console.info('[MultiEntry_0500] btn2 click');
      await CommonFunc.sleep(3000);

      let indexParam:String = AppStorage.get<String>('indexParam')! as String;
      expect(indexParam).assertEqual('paramTest');
      AppStorage.delete('indexParam');

      console.info('MultiEntry_0500 END');
      done();
    });

    
    

    /**
     * @tc.number   MultiEntry_static_0600
     * @tc.name     MultiEntry_static_0600
     * @tc.desc     MultiEntry_static_0600
     * @tc.level    Level.LEVEL0
     */
it('MultiEntry_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiEntry_0600 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await (btn1?.click() as Promise<void>)
      console.info('[MultiEntry_0600] btn1 click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('getParamByNameId'));
      await (btn2?.click() as Promise<void>)
      console.info('[MultiEntry_0600] btn2 click');
      await CommonFunc.sleep(3000);

      let nameParam:String = AppStorage.get<String>('nameParam')! as String;
      expect(nameParam).assertEqual('testParam');
      AppStorage.delete('nameParam');

      console.info('MultiEntry_0600 END');
      done();
    });

    
    

    /**
     * @tc.number   MultiEntry_static_0700
     * @tc.name     MultiEntry_static_0700
     * @tc.desc     MultiEntry_static_0700
     * @tc.level    Level.LEVEL0
     */
it('MultiEntry_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiEntry_0700 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await (btn1?.click() as Promise<void>)
      console.info('[MultiEntry_0700] btn1 click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('getSizeId'));
      await (btn2?.click() as Promise<void>)
      console.info('[MultiEntry_0700] btn2 click');
      await CommonFunc.sleep(3000);

      let sizeNum:Double = AppStorage.get<Double>('sizeNum')! as Double;
      expect(sizeNum).assertEqual(2);
      AppStorage.delete('sizeNum');

      console.info('MultiEntry_0700 END');
      done();
    });

  })
}