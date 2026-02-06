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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function cancelDataLoadingTest() {

  describe('cancelDataLoadingTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/startDataLoading/dataLoading',
      }
      
      try {
        router.clear();
        let pages = router.getState();
        console.info("get cancelDataLoading state pages: " + JSON.stringify(pages));
        if (!("cancelDataLoading" == pages.name)) {
          console.info("get cancelDataLoading state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push cancelDataLoading success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push cancelDataLoading page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("cancelDataLoading after each called");
    });

    /**
     * @tc.number    cancelDataLoading_0010
     * @tc.name      cancelDataLoading_0010
     * @tc.desc      api: UIContext DragController cancelDataLoading 
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('cancelDataLoading_0010', Level.LEVEL0, async (done: Function) => {
      console.info('cancelDataLoading_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('cancel'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('cancelResult');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('401');
      console.info('[cancelDataLoading_0010] END');
      done();
    });


    /**
     * @tc.number    startDataLoading_0010
     * @tc.name      startDataLoading_0010
     * @tc.desc      api: UIContext DragController startDataLoading
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */


    it('startDataLoading_0010', Level.LEVEL0, async (done: Function) => {
      console.info('startDataLoading_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let image = await driver.findComponent(ON.id('image'));
      let list = await driver.findComponent(ON.id('list'));
      await image.dragTo(list);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('res');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.content != null ).assertTrue();
      console.info('[startDataLoading_0010] END');
      done();
    }); 

    /**
     * @tc.number    disableDataPrefetch_0010
     * @tc.name      cancelDataLoading_0010
     * @tc.desc      property: UIContext DragController  disableDataPrefetch
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */

    it('disableDataPrefetch_0010', Level.LEVEL0, async (done: Function) => {
      console.info('disableDataPrefetch_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let image = await driver.findComponent(ON.id('image'));
      let list = await driver.findComponent(ON.id('list'));
      await image.dragTo(list);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragResult1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('Drag Success');
      console.info('[disableDataPrefetch_0010] END');
      done();
    });    
  })
}
