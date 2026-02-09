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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SnapshotOptions_region() {
  describe('SnapshotOptions_region', () => {
    beforeEach(async (done: Function) => {
      console.info('SnapshotOptions_region beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SnapshotOptions_region/SnapshotOptions_region',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SnapshotOptions_region state pages: ' + JSON.stringify(pages));
        if (!('SnapshotOptions_region' == pages.name)) {
          console.info('get SnapshotOptions_region state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push SnapshotOptions_region success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SnapshotOptions_region page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SnapshotOptions_region_0100
     * @tc.number SnapshotOptions_region_0100
     * @tc.desc   test the region_SnapshotRegion api15 CallBack  child & parent component response when child component return false and  child component return false when trigger 'TAB' key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SnapshotOptions_region_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SnapshotOptions_region_0100] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('SnapshotRegion'));
      await button1.click();
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SnapshotOptions_region_0100] strJson is: ' + strJson);
      console.info('[SnapshotOptions_region_0100] SnapshotOptions_region obj is: ' + JSON.stringify(obj.$attrs.width));
      console.info('[SnapshotOptions_region_0100] SnapshotOptions_region obj is: ' + JSON.stringify(obj.$attrs.height));
      let height: number = parseFloat(obj.$attrs.height.toString());
      let width: number = parseFloat(obj.$attrs.width.toString());
      let expectValue: number = width / height;
      expect(expectValue).assertEqual(1);
      console.info('[SnapshotOptions_region_0100] END');
      done();
    });

     /**
      * @tc.name   SnapshotOptions_region_0200
      * @tc.number SnapshotOptions_region_0200
      * @tc.desc   test the region_LocalizedSnapshotRegion api15 CallBack  child & parent component response when child component return false and  child component return false when trigger 'TAB' key
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SnapshotOptions_region_0200', Level.LEVEL0, async (done: Function) => {
       console.info('[SnapshotOptions_region_0200] START');
       let driver: Driver = Driver.create();
       let button2 = await driver.findComponent(ON.id('LocalizedSnapshotRegion'));
       await button2.click();
       await CommonFunc.sleep(2000);

       // test the child component response
       let strJson = getInspectorByKey('image1');
       let obj: ESObject = JSON.parse(strJson);
       console.info('[SnapshotOptions_region_0200] strJson is: ' + strJson);
       console.info('[SnapshotOptions_region_0200] SnapshotOptions_region obj is: ' + JSON.stringify(obj.$attrs.width));
       console.info('[SnapshotOptions_region_0200] SnapshotOptions_region obj is: ' + JSON.stringify(obj.$attrs.height));
       let height: number = parseFloat(obj.$attrs.height.toString());
       let width: number = parseFloat(obj.$attrs.width.toString());
       let expectValue: number = width / height;
       expect(expectValue).assertEqual(1);

       console.info('[SnapshotOptions_region_0200] END');
       done();
     });
    
     /**
      * @tc.name   SnapshotOptions_region_0300
      * @tc.number SnapshotOptions_region_0300
      * @tc.desc   test the region_SnapshotRegion api15 CallBack  child & parent component response when child component return false and  child component return false when trigger 'TAB' key
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SnapshotOptions_region_0300', Level.LEVEL0, async (done: Function) => {
       console.info('[SnapshotOptions_region_0300] START');
       let driver: Driver = Driver.create();
       let button1 = await driver.findComponent(ON.id('SnapshotRegion1'));
       await button1.click();
       await CommonFunc.sleep(2000);

       // test the child component response
       let strJson = getInspectorByKey('image2');
       let obj: ESObject = JSON.parse(strJson);
       console.info('[SnapshotOptions_region_0300] strJson is: ' + strJson);
       console.info('[SnapshotOptions_region_0300] SnapshotOptions_region obj is: ' + JSON.stringify(obj.$attrs.width));
       console.info('[SnapshotOptions_region_0300] SnapshotOptions_region obj is: ' + JSON.stringify(obj.$attrs.height));
       expect(obj.$attrs.height).assertEqual('0.00vp');
       expect(obj.$attrs.width).assertEqual('0.00vp');


       console.info('[SnapshotOptions_region_0300] END');
       done();
     });

    
     /**
      * @tc.name   SnapshotOptions_region_0400
      * @tc.number SnapshotOptions_region_0400
      * @tc.desc   test the region_LocalizedSnapshotRegion api15 CallBack  child & parent component response when child component return false and  child component return false when trigger 'TAB' key
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SnapshotOptions_region_0400', Level.LEVEL0, async (done: Function) => {
       console.info('[SnapshotOptions_region_0400] START');
       let driver: Driver = Driver.create();
       let button2 = await driver.findComponent(ON.id('LocalizedSnapshotRegion1'));
       await button2.click();
       await CommonFunc.sleep(2000);

       // test the child component response
       let strJson = getInspectorByKey('image2');
       let obj: ESObject = JSON.parse(strJson);
       console.info('[SnapshotOptions_region_0400] strJson is: ' + strJson);
       console.info('[SnapshotOptions_region_0400] SnapshotOptions_region obj is: ' + JSON.stringify(obj.$attrs.width));
       console.info('[SnapshotOptions_region_0400] SnapshotOptions_region obj is: ' + JSON.stringify(obj.$attrs.height));
       expect(obj.$attrs.height).assertEqual('0.00vp');
       expect(obj.$attrs.width).assertEqual('0.00vp');

       console.info('[SnapshotOptions_region_0400] END');
       done();
     });
  })
}