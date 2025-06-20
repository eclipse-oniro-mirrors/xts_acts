/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ButtonAlignTest() {
  describe('ButtonAlignTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ButtonAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BoxAlign/ButtonAlign',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ButtonAlignTest state pages:" + JSON.stringify(pages));
        if (!("ButtonAlignTest" == pages.name)) {
          console.info("get ButtonAlignTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ButtonAlignTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ButtonAlignTest page error:" + err);
      }
      console.info("ButtonAlignTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    
     it('ButtonAlignTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ButtonAlignTest_0100] START');
      console.info('[ButtonAlignTest_0100] START000');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment is:');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment is:' + JSON.stringify(JSON.parse(strJson).$attrs.localizedAlignment));

      let button1 = await driver.findComponent(ON.id('AlignTopStart'));
      await button1.click();
      await Utils.sleep(2000)
      let strJson1 = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment1 is:');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment1 is:' + JSON.stringify(JSON.parse(strJson1).$attrs.localizedAlignment));

      let button2 = await driver.findComponent(ON.id('AlignTop'));
      await button2.click();
      await Utils.sleep(2000)
      let strJson2 = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment2 is:' + JSON.stringify(JSON.parse(strJson2).$attrs.localizedAlignment));

      let button3 = await driver.findComponent(ON.id('AlignTopEnd'));
      await button3.click();
      await Utils.sleep(2000)
      let strJson3 = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment3 is:' + JSON.stringify(JSON.parse(strJson3).$attrs.localizedAlignment));

      let button4 = await driver.findComponent(ON.id('AlignStart'));
      await button4.click();
      await Utils.sleep(2000)
      let strJson4 = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment4 is:' + JSON.stringify(JSON.parse(strJson4).$attrs.localizedAlignment));

      let button5 = await driver.findComponent(ON.id('AlignCenter'));
      await button5.click();
      await Utils.sleep(2000)
      let strJson5 = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment5 is:' + JSON.stringify(JSON.parse(strJson5).$attrs.localizedAlignment));

      let button6 = await driver.findComponent(ON.id('AlignEnd'));
      await button6.click();
      await Utils.sleep(2000)
      let strJson6 = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment6 is:' + JSON.stringify(JSON.parse(strJson6).$attrs.localizedAlignment));

      let button7 = await driver.findComponent(ON.id('AlignBottomStart'));
      await button7.click();
      await Utils.sleep(2000)
      let strJson7 = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment7 is:' + JSON.stringify(JSON.parse(strJson7).$attrs.localizedAlignment));

      let button8 = await driver.findComponent(ON.id('AlignBottom'));
      await button8.click();
      await Utils.sleep(2000)
      let strJson8 = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment8 is:' + JSON.stringify(JSON.parse(strJson8).$attrs.localizedAlignment));

      let button9 = await driver.findComponent(ON.id('AlignBottomEnd'));
      await button9.click();
      await Utils.sleep(2000)
      let strJson9 = getInspectorByKey('GetAlignButton1');
      console.log('[ButtonAlignTest_0100] LocalizedAlignment9 is:' + JSON.stringify(JSON.parse(strJson9).$attrs.localizedAlignment));
   
      expect(JSON.parse(strJson1).$attrs.localizedAlignment).assertEqual('top_start');
      expect(JSON.parse(strJson2).$attrs.localizedAlignment).assertEqual('top');
      expect(JSON.parse(strJson3).$attrs.localizedAlignment).assertEqual('top_end');
      expect(JSON.parse(strJson4).$attrs.localizedAlignment).assertEqual('start');
      expect(JSON.parse(strJson5).$attrs.localizedAlignment).assertEqual('center');
      expect(JSON.parse(strJson6).$attrs.localizedAlignment).assertEqual('end');
      expect(JSON.parse(strJson7).$attrs.localizedAlignment).assertEqual('bottom_start');
      expect(JSON.parse(strJson8).$attrs.localizedAlignment).assertEqual('bottom');
      expect(JSON.parse(strJson9).$attrs.localizedAlignment).assertEqual('bottom_end');
      
      console.info('[ButtonAlignTest_0100] END');
      done();
    });

  })
}