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
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function BindSheetTest() {
  describe('BindSheetTest', () => {
    beforeEach(async (done: Function) => {
      console.info('BindSheetTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSheet/bindSheetRadius',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get bindSheetRadius state pages: ' + JSON.stringify(pages));
        if (!('bindSheetRadius' == pages.name)) {
          console.info('get bindSheetRadius pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push bindSheetRadius page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('bindSheetRadius beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('bindSheetRadius after each called');
    })

    /**
     * @tc.name   bindSheetTest_0100
     * @tc.number bindSheetTest_0100
     * @tc.desc   Test the bindSheet component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindSheetTest_0100', Level.LEVEL0, async (done: Function) => {
      let tagName = 'bindSheetTest_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("[bindSheetTest_0100] driver is: " + driver);
      let btn1 = await driver.findComponent(ON.id('bindSheet_001'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let date1 = JSON.stringify(obj1.$children[1].$children[0])
      console.info("[bindSheetTest_0100] date1 is: " + date1);
      console.info("[bindSheetTest_0100] topLeft is: " + Math.trunc(vp2px(parseInt(JSON.parse(date1).$attrs.borderRadius.topLeft))));
      let windowRadiusSmall = getInspectorByKey("window_radius_small");
      let radius: string = JSON.parse(windowRadiusSmall)?.$attrs.content.split(".")[0];
      console.info("[bindSheetTest_0100] windowRadiusSmall is: " + windowRadiusSmall)
      console.info("[bindSheetTest_0100] radius is: " + radius)
      console.info("[bindSheetTest_0100] is: " + JSON.stringify($r('sys.float.window_radius_small')))
      expect(Math.trunc(vp2px(parseInt(JSON.parse(date1).$attrs.borderRadius.topLeft)))).assertEqual(parseInt(radius));
      expect(Math.trunc(vp2px(parseInt(JSON.parse(date1).$attrs.borderRadius.topRight)))).assertEqual(parseInt(radius));
      console.info('[' + tagName + '] END ===========================');
      let btn2 = await driver.findComponent(ON.id('close1'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      done();
    });

    /**
     * @tc.name   bindSheetTest_0200
     * @tc.number bindSheetTest_0200
     * @tc.desc   Test the bindSheet component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindSheetTest_0200', Level.LEVEL0, async (done: Function) => {
      let tagName = 'bindSheetTest_0200';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("[bindSheetTest_0200] driver is: " + driver);
      let btn1 = await driver.findComponent(ON.id('bindSheet_002'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let date1 = JSON.stringify(obj1.$children[1].$children[0])
      console.info("[bindSheetTest_0200] date1 is: " + date1);
      console.info("[bindSheetTest_0200] topLeft is: " + JSON.stringify(JSON.parse(date1).$attrs.borderRadius.topLeft));
      expect(JSON.parse(date1).$attrs.borderRadius.topLeft).assertEqual("0.00vp");
      expect(JSON.parse(date1).$attrs.borderRadius.topRight).assertEqual("0.00vp");
      console.info('[' + tagName + '] END ===========================');
      let btn2 = await driver.findComponent(ON.id('close2'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      done();
    });

    /**
     * @tc.name   bindSheetTest_0300
     * @tc.number bindSheetTest_0300
     * @tc.desc   Test the bindSheet component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindSheetTest_0300', Level.LEVEL0, async (done: Function) => {
      let tagName = 'bindSheetTest_0300';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("[bindSheetTest_0300] driver is: " + driver);
      let btn1 = await driver.findComponent(ON.id('bindSheet_003'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let date1 = JSON.stringify(obj1.$children[1].$children[0])
      console.info("[bindSheetTest_0300] date1 is: " + date1);
      console.info("[bindSheetTest_0300] topLeft is: " + JSON.parse(date1).$attrs.borderRadius.topLeft);
      console.info("[bindSheetTest_0300] topRight is: " + Math.trunc(vp2px(parseInt(JSON.parse(date1).$attrs.borderRadius.topRight))));
      let windowRadiusSmall = getInspectorByKey("window_radius_small");
      let radius: string = JSON.parse(windowRadiusSmall)?.$attrs.content.split(".")[0];
      console.info("[bindSheetTest_0300] windowRadiusSmall is: " + windowRadiusSmall)
      console.info("[bindSheetTest_0300] radius is: " + radius)
      console.info("[bindSheetTest_0300] is: " + JSON.stringify($r('sys.float.window_radius_small')))
      expect(JSON.parse(date1).$attrs.borderRadius.topLeft).assertEqual("100.00vp");
      expect(Math.trunc(vp2px(parseInt(JSON.parse(date1).$attrs.borderRadius.topRight)))).assertEqual(parseInt(radius));
      console.info('[' + tagName + '] END ===========================');
      let btn2 = await driver.findComponent(ON.id('close3'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      done();
    });

    /**
     * @tc.name   bindSheetTest_0400
     * @tc.number bindSheetTest_0400
     * @tc.desc   Test the bindSheet component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindSheetTest_0400', Level.LEVEL0, async (done: Function) => {
      let tagName = 'bindSheetTest_0400';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("[bindSheetTest_0400] driver is: " + driver);
      let btn1 = await driver.findComponent(ON.id('bindSheet_004'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let date1 = JSON.stringify(obj1.$children[1].$children[0])
      console.info("[bindSheetTest_0400] date1 is: " + date1);
      console.info("[bindSheetTest_0400] topLeft is: " + Math.trunc(vp2px(parseInt(JSON.parse(date1).$attrs.borderRadius.topLeft))));
      let windowRadiusSmall = getInspectorByKey("window_radius_small");
      let radius: string = JSON.parse(windowRadiusSmall)?.$attrs.content.split(".")[0];
      console.info("[bindSheetTest_0400] windowRadiusSmall is: " + windowRadiusSmall)
      console.info("[bindSheetTest_0400] radius is: " + radius)
      console.info("[bindSheetTest_0400] is: " + JSON.stringify($r('sys.float.window_radius_small')))
      expect(Math.trunc(vp2px(parseInt(JSON.parse(date1).$attrs.borderRadius.topLeft)))).assertEqual(parseInt(radius));
      expect(Math.trunc(vp2px(parseInt(JSON.parse(date1).$attrs.borderRadius.topRight)))).assertEqual(parseInt(radius));
      console.info('[' + tagName + '] END ===========================');
      let btn2 = await driver.findComponent(ON.id('close4'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      done();
    });
  })
}