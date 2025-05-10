/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function sheetBorderWidth() {
  describe('sheetBorderWidth', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/sheetBorderWidth',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get sheetBorderWidth state success ' + JSON.stringify(pages));
        if (!('sheetBorderWidth' == pages.name)) {
          console.info('get sheetBorderWidth state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push sheetBorderWidth page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push sheetBorderWidth page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.number SUB_ACE_sheetBorderWidth_0100
     * @tc.name sheetBorderWidth_0100
     * @tc.desc To test the sheetBorderWidth:10
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('sheetBorderWidth_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('sheetBorderWidth_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindSheet_borderWidth'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[sheetBorderWidth_0100] obj2 is: " + JSON.stringify(obj2));

      console.info("[sheetBorderWidth_0100] obj2.$children[1].$children[0] borderWidth is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[sheetBorderWidth_0100] obj2.$children[1].$children[0] borderWidth is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs?.borderWidth));
      let left:string = obj2.$children[1].$children[0].$attrs?.borderWidth.left
      let right:string = obj2.$children[1].$children[0].$attrs?.borderWidth.right
      let top:string = obj2.$children[1].$children[0].$attrs?.borderWidth.top
      let bottom:string = obj2.$children[1].$children[0].$attrs?.borderWidth.bottom
      expect(left).assertEqual('10.00vp');
      expect(right).assertEqual('10.00vp');
      expect(top).assertEqual('10.00vp');
      expect(bottom).assertEqual('0.00vp');
      
      let btn2: Component = await driver.findComponent(ON.id('close1_border'));
      await btn2.click();
      console.info('sheetBorderWidth_0100 END');
      done();
    });


    /**
     * @tc.number SUB_ACE_sheetBorderWidth_0200
     * @tc.name sheetBorderWidth_0200
     * @tc.desc To test the sheetBorderWidth
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('sheetBorderWidth_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('sheetBorderWidth_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindSheet_borderWidth1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[sheetBorderWidth_0200] obj2 is: " + JSON.stringify(obj2));

      console.info("[sheetBorderWidth_0200] obj2.$children[1].$children[0] borderWidth is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[sheetBorderWidth_0200] obj2.$children[1].$children[0] borderWidth is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs?.borderWidth));
      let left:string = obj2.$children[1].$children[0].$attrs?.borderWidth.left
      let right:string = obj2.$children[1].$children[0].$attrs?.borderWidth.right
      let top:string = obj2.$children[1].$children[0].$attrs?.borderWidth.top
      let bottom:string = obj2.$children[1].$children[0].$attrs?.borderWidth.bottom
      expect(top).assertEqual('10.00px');
      expect(right).assertEqual('5.00vp');
      expect(left).assertEqual('5.00vp');
      expect(bottom).assertEqual('0.00vp');
      
      let btn2: Component = await driver.findComponent(ON.id('close1_border'));
      await btn2.click();
      console.info('sheetBorderWidth_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_sheetBorderWidth_0300
     * @tc.name sheetBorderWidth_0300
     * @tc.desc To test the sheetBorderWidth:undefined
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('sheetBorderWidth_0300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('sheetBorderWidth_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindSheet_borderWidth2'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[sheetBorderWidth_0300] obj2 is: " + JSON.stringify(obj2));

      console.info("[sheetBorderWidth_0300] obj2.$children[1].$children[0] borderWidth is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[sheetBorderWidth_0300] obj2.$children[1].$children[0] borderWidth is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs?.borderWidth));
      let borderWidth:string = obj2.$children[1].$children[0].$attrs?.borderWidth
      expect(borderWidth).assertEqual('0.00vp');
            
      let btn2: Component = await driver.findComponent(ON.id('close1_border'));
      await btn2.click();
      console.info('sheetBorderWidth_0300 END');
      done();
    });

  })
}