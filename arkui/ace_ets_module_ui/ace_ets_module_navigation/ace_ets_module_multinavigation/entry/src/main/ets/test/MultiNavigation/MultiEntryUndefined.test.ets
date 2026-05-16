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

export default function MultiEntryUndefined() {
  describe('MultiEntryUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info('MultiEntryUndefined beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiEntryUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get MultiEntryUndefined state pages:' + JSON.stringify(pages));
        if (!('MultiEntryUndefinedEntry' == pages.name)) {
          console.info('get MultiEntryUndefined pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push MultiEntryUndefined page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push MultiEntryUndefined page error:' + err);
      }
      console.info('MultiEntryUndefined beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('MultiEntryUndefined after each called');
    });


    /**
     * @tc.name   MultiEntryUndefined_0100
     * @tc.number MultiEntryUndefined_0100
     * @tc.desc   Test and MultiNavPathStack.pop return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntryUndefined_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntryUndefined_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.text('popUndefined'));
      await btn1.click()
      console.info('[MultiEntryUndefined_0100] btn1 click');
      await CommonFunc.sleep(1000);

      let popUndefined: NavPathInfo | undefined = AppStorage.get('popUndefined')
      expect(popUndefined).assertEqual(undefined);
      AppStorage.delete('popUndefined');
      console.info('MultiEntryUndefined_0100 END');
      done();
    });

    
    /**
     * @tc.name   MultiEntryUndefined_0200
     * @tc.number MultiEntryUndefined_0200
     * @tc.desc   Test and MultiNavPathStack.pop with param return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntryUndefined_0200', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntryUndefined_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.text('popParamUndefined'));
      await btn1.click()
      console.info('[MultiEntryUndefined_0200] btn1 click');
      await CommonFunc.sleep(1000);

      let popParamUndefined: NavPathInfo | undefined = AppStorage.get('popParamUndefined')
      expect(popParamUndefined).assertEqual(undefined);
      AppStorage.delete('popParamUndefined');

      console.info('MultiEntryUndefined_0200 END');
      done();
    });

    
    /**
     * @tc.name   MultiEntryUndefined_0300
     * @tc.number MultiEntryUndefined_0300
     * @tc.desc   Test MultiNavPathStack getAllPathName return []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntryUndefined_0300', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntryUndefined_0300 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.text('getAllPathNameEmpty'));
      await btn1.click()
      console.info('[MultiEntryUndefined_0300] btn1 click');
      await CommonFunc.sleep(1000);

      let allPathName: string[] | undefined = AppStorage.get('allPathName')
      expect(allPathName && allPathName.length == 0).assertTrue();
      AppStorage.delete('allPathName');

      console.info('MultiEntryUndefined_0300 END');
      done();
    });

    /**
     * @tc.name   MultiEntryUndefined_0400
     * @tc.number MultiEntryUndefined_0400
     * @tc.desc   Test MultiNavPathStack getParamByIndex return Undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntryUndefined_0400', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntryUndefined_0400 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.text('getParamByIndexUndefined'));
      await btn1.click()
      console.info('[MultiEntryUndefined_0400] btn1 click');
      await CommonFunc.sleep(1000);

      let index: NavPathInfo | undefined = AppStorage.get('index')
      expect(index).assertEqual(undefined);
      AppStorage.delete('index');

      console.info('MultiEntryUndefined_0400 END');
      done();
    });

    /**
     * @tc.name   MultiEntryUndefined_0500
     * @tc.number MultiEntryUndefined_0500
     * @tc.desc   Test MultiNavPathStack getParamByName return []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntryUndefined_0500', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntryUndefined_0500 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.text('getParamByNameEmpty'));
      await btn1.click()
      console.info('[MultiEntryUndefined_0500] btn1 click');
      await CommonFunc.sleep(1000);

      let params: object[] |undefined = AppStorage.get('params');
      expect(params && params.length == 0).assertTrue();
      AppStorage.delete('params');

      console.info('MultiEntryUndefined_0500 END');
      done();
    });

    /**
     * @tc.name   MultiEntryUndefined_0600
     * @tc.number MultiEntryUndefined_0600
     * @tc.desc   Test MultiNavPathStack getIndexByName return []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntryUndefined_0600', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntryUndefined_0600 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.text('getIndexByNameEmpty'));
      await btn1.click()
      console.info('[MultiEntryUndefined_0600] btn1 click');
      await CommonFunc.sleep(1000);

      let indexs: number[] | undefined = AppStorage.get('indexs');
      expect(indexs && indexs.length == 0).assertTrue();
      AppStorage.delete('indexs');

      console.info('MultiEntryUndefined_0600 END');
      done();
    });

    /**
     * @tc.name   MultiEntryUndefined_0700
     * @tc.number MultiEntryUndefined_0700
     * @tc.desc   Test MultiNavPathStack switchFullScreenState return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiEntryUndefined_0700', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntryUndefined_0700 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.text('switchFullScreenState'));
      await btn1.click()
      console.info('[MultiEntryUndefined_0700] btn1 click');
      await CommonFunc.sleep(1000);

      let flag: boolean | undefined = AppStorage.get('flag');
      expect(flag).assertFalse();
      AppStorage.delete('flag');

      console.info('MultiEntryUndefined_0700 END');
      done();
    });

    /**
     * @tc.number    MultiEntryUndefined_0800
     * @tc.name      MultiEntryUndefined_0800
     * @tc.desc      Test MultiNavPathStack getParamByIndex -1
     * @tc.level     Level 0
     */
    it('MultiEntryUndefined_0800', Level.LEVEL0, async (done: Function) => {
      console.info('MultiEntryUndefined_0800 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.text('getParamByIndex-1'));
      await btn1.click()
      console.info('[MultiEntryUndefined_0800] btn1 click');
      await CommonFunc.sleep(1000);

      let index: NavPathInfo | undefined = AppStorage.get('index')
      expect(index).assertEqual(undefined);
      AppStorage.delete('index');

      console.info('MultiEntryUndefined_0800 END');
      done();
    });
  })
}