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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function MultiEntry() {
  describe('MultiEntry', () => {
    beforeEach(async (done: Function) => {
      console.info('MultiEntry beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiEntry',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get MultiEntry state pages:' + JSON.stringify(pages));
        if (!('MultiEntryEntry' == pages.name)) {
          console.info('get MultiEntry pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push MultiEntry page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push MultiEntry page error:' + err);
      }
      console.info('MultiEntry beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('MultiEntry after each called');
    });


    /**
     * @tc.name   MultiEntry_0100
     * @tc.number MultiEntry_0100
     * @tc.desc   Test onHomeShowOnTop and MultiNavPathStack.popToName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntry_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntry_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await btn1.click()
      console.info('[MultiEntry_0100] btn1 click');
      await CommonFunc.sleep(1000);


      let btn2 = await driver.findComponent(ON.id('popToHomeId'));
      await btn2.click()
      console.info('[MultiEntry_0100] btn1 click');
      await CommonFunc.sleep(3000);

      let onNavigationModeChangeCallbackValue:number = AppStorage.get('onNavigationModeChangeCallbackValue') as number
      expect(onNavigationModeChangeCallbackValue).assertEqual(1);
      AppStorage.delete('onNavigationModeChangeCallbackValue');

      console.info('MultiEntry_0100 END');
      done();
    });

    
    /**
     * @tc.name   MultiEntry_0200
     * @tc.number MultiEntry_0200
     * @tc.desc   Test MultiNavPathStack.replacePathByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntry_0200', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntry_0200 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1: Component = await driver.findComponent(ON.id('replacePathByNameId'));
      await btn1.click()
      console.info('[MultiEntry_0200] btn1 click');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('detailTextId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[MultiEntry_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiEntry_0200] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PageDetail');

      console.info('MultiEntry_0200 END');
      done();
    });

    
    /**
     * @tc.name   MultiEntry_0300
     * @tc.number MultiEntry_0300
     * @tc.desc   Test MultiNavPathStack.moveToTopId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntry_0300', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntry_0300 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await btn1.click()
      console.info('[MultiEntry_0300] btn1 click');
      await CommonFunc.sleep(1000);


      let btn2 = await driver.findComponent(ON.id('moveToTopId'));
      await btn2.click()
      console.info('[MultiEntry_0300] btn1 click');
      await CommonFunc.sleep(3000);

      let strJson: string = getInspectorByKey('homeText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[MultiEntry_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiEntry_0300] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PageHome');

      console.info('MultiEntry_0300 END');
      done();
    });

    /**
     * @tc.name   MultiEntry_0400
     * @tc.number MultiEntry_0400
     * @tc.desc   Test MultiNavPathStack.getAllPathName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntry_0400', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntry_0400 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await btn1.click()
      console.info('[MultiEntry_0400] btn1 click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('getAllPathNameId'));
      await btn2.click()
      console.info('[MultiEntry_0400] btn2 click');
      await CommonFunc.sleep(3000);

      let allPathName:String = AppStorage.get('allPathName') as String;
      expect(allPathName).assertEqual('PageHome,PageDetail');
      AppStorage.delete('allPathName');

      console.info('MultiEntry_0400 END');
      done();
    });

    /**
     * @tc.name   MultiEntry_0500
     * @tc.number MultiEntry_0500
     * @tc.desc   Test MultiNavPathStack.getParamByIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntry_0500', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntry_0500 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await btn1.click()
      console.info('[MultiEntry_0500] btn1 click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('getParamByIndexId'));
      await btn2.click()
      console.info('[MultiEntry_0500] btn2 click');
      await CommonFunc.sleep(3000);

      let indexParam:String = AppStorage.get('indexParam') as String;
      expect(indexParam).assertEqual('paramTest');
      AppStorage.delete('indexParam');

      console.info('MultiEntry_0500 END');
      done();
    });

    /**
     * @tc.name   MultiEntry_0600
     * @tc.number MultiEntry_0600
     * @tc.desc   Test MultiNavPathStack.getParamByIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntry_0600', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntry_0600 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await btn1.click()
      console.info('[MultiEntry_0600] btn1 click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('getParamByNameId'));
      await btn2.click()
      console.info('[MultiEntry_0600] btn2 click');
      await CommonFunc.sleep(3000);

      let nameParam:String = AppStorage.get('nameParam') as String;
      expect(nameParam).assertEqual('testParam');
      AppStorage.delete('nameParam');

      console.info('MultiEntry_0600 END');
      done();
    });

    /**
     * @tc.name   MultiEntry_0700
     * @tc.number MultiEntry_0700
     * @tc.desc   Test MultiNavPathStack.size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntry_0700', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntry_0700 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await btn1.click()
      console.info('[MultiEntry_0700] btn1 click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('getSizeId'));
      await btn2.click()
      console.info('[MultiEntry_0700] btn2 click');
      await CommonFunc.sleep(3000);

      let sizeNum:number = AppStorage.get('sizeNum') as number;
      expect(sizeNum).assertEqual(2);
      AppStorage.delete('sizeNum');

      console.info('MultiEntry_0700 END');
      done();
    });

    /**
     * @tc.name   MultiEntry_0800
     * @tc.number MultiEntry_0800
     * @tc.desc   Test MultiNavPathStack getIndexByName not empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntry_0800', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntry_0800 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushPathByNameId'));
      await btn1.click()
      console.info('[MultiEntry_0800] btn1 click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('getIndexByNameId'));
      await btn2.click()
      console.info('[MultiEntry_0800] btn2 click');
      await CommonFunc.sleep(3000);

      let indexLength: number = AppStorage.get('indexLength') as number;
      expect(indexLength).assertEqual(1);
      AppStorage.delete('indexLength');

      console.info('MultiEntry_0800 END');
      done();
    });
  })
}