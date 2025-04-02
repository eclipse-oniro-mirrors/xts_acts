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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function imageMatrix() {
  describe('imageMatrix', () => {
    beforeEach(async (done: Function) => {
      console.info('imageMatrix beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageMatrix/imageMatrix',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get imageMatrix state pages: ' + JSON.stringify(pages));
        if (!('imageMatrix' == pages.name)) {
          console.info('get imageMatrix state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push imageMatrix success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push imageMatrix page error: ' + err);
        expect().assertFail();
      }
      done();
    });

        /**
     * @tc.number imageMatrix_0100
     * @tc.name   imageMatrix_0100
     * @tc.desc   test the onKeyEvent api16 CallBack  child & parent component response when child component return false and  child component return false when trigger 'TAB' key 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('imageMatrix_0100', 0, async (done: Function) => {
      console.info('[imageMatrix_0100] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('button1'));
      await button1.click();
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageMatrix');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[imageMatrix_0100] strJson is: ' + strJson);
      console.info('[imageMatrix_0100] imageMatrix obj is: ' + JSON.stringify(obj.$attrs.imageMatrix));
      expect(obj.$attrs.imageMatrix).assertEqual(
        '4.532353,2.110965,-0.040063,0.000000,\n'+
        '-2.009852,4.342766,1.449440,0.000000,\n'+
        '0.129348,-0.259554,0.957027,0.000000,\n'+
        '30.180006,61.629848,11.275022,1.000000,\n');

      console.info('[imageMatrix_0100] END');
      done();
    });
  })
}