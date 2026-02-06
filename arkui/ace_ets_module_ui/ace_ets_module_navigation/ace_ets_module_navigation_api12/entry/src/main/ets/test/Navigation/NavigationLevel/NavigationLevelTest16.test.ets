/**
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function NavigationLevelTest16() {
  describe('NavigationLevelTest16', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationLevelTest16 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationLevel/NavigationLevelTest16',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationLevelTest16 state success " + JSON.stringify(pages));
        if (!("NavigationLevelTest16" == pages.name)) {
          console.info("get NavigationLevelTest16 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationLevelTest16 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationLevelTest16 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationLevelTest16 after each called");
    });

    /**
     * @tc.number    NavigationLevelTest16_0200
     * @tc.name      NavigationLevelTest16_0200
     * @tc.desc      Test getParamByName and getIndexByName return []
     * @tc.level     Level 0
     */
    it('NavigationLevelTest16_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationLevelTest16_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('getParamByNameUndefinedBtn'));
      await btn.click()
      console.info('[NavigationLevelTest16_0200] btn click');
      await CommonFunc.sleep(1000);
      let paramByNameUndefined: ESObject[] | undefined= AppStorage.get('paramByNameUndefined')
      expect(paramByNameUndefined?.length == 0).assertTrue();
      AppStorage.delete('paramByNameUndefined')

      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('getIndexByNameUndefinedBtn'));
      await btn2.click()
      console.info('[NavigationLevelTest16_0200] btn2 click');
      await CommonFunc.sleep(1000);
      let indexByNameUndefined: number[] | undefined = AppStorage.get('indexByNameUndefined')
      expect(indexByNameUndefined && indexByNameUndefined?.length == 0).assertTrue();
      AppStorage.delete('indexByNameUndefined')
      await CommonFunc.sleep(1000);
      
      let btn3 = await driver.findComponent(ON.id('getPathStackNullBtn'));
      await btn3.click()
      console.info('[NavigationLevelTest16_0200] btn3 click');
      await CommonFunc.sleep(1000);
      let stackEmptyValue: number[] | undefined = AppStorage.get('stackEmptyValue')
      expect(stackEmptyValue && stackEmptyValue?.length == 0).assertTrue();
      AppStorage.delete('stackEmptyValue')

      let btn4 = await driver.findComponent(ON.id('getParentNullBtn'));
      await btn4.click()
      console.info('[NavigationLevelTest16_0200] btn4 click');
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('parentValue') == null).assertTrue();
      AppStorage.delete('parentValue')

      console.info('[NavigationLevelTest16_0200] END');
      done();
    });

    /**
     * @tc.number    NavigationLevelTest16_0100
     * @tc.name      NavigationLevelTest16_0100
     * @tc.desc      Test Navigation
     * @tc.level     Level 0
     */
    it('NavigationLevelTest16_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationLevelTest16_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('NavigationLevelTest16_btn1'));
      await btn.click()
      console.info('[NavigationLevelTest16_0100] btn click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('NavigationLevelTest16_btn2'));
      await btn2.click()
      console.info('[NavigationLevelTest16_0100] btn2 click');
      await CommonFunc.sleep(1000);

      let btn4 = await driver.findComponent(ON.id('getParamByNameBtn'));
      await btn4.click()
      console.info('[NavigationLevelTest16_0300] btn4 click');
      await CommonFunc.sleep(1000);

      let paramByName: ESObject[] | undefined = AppStorage.get('paramByName')
      console.info('[NavigationLevelTest16_0100] paramByName ', JSON.stringify(paramByName));
      expect(paramByName && paramByName?.length > 0).assertTrue();
      AppStorage.delete('paramByName')

      let indexByName: number[] | undefined = AppStorage.get('indexByName')
      console.info('[NavigationLevelTest16_0100] indexByName ', JSON.stringify(indexByName));
      expect(indexByName && indexByName?.length > 0).assertTrue();
      AppStorage.delete('indexByName')
      await CommonFunc.sleep(1000);

      let btn5 = await driver.findComponent(ON.id('getPathStackBtn'));
      await btn5.click()
      console.info('[NavigationLevelTest16_0200] btn5 click');
      await CommonFunc.sleep(1000);
      let stackValue: number[] | undefined = AppStorage.get('stackValue')
      expect(stackValue && stackValue?.length > 0).assertTrue();
      AppStorage.delete('stackValue')

      let btn3 = await driver.findComponent(ON.id('NavigationLevelTest16_btn3'));
      await btn3.click()
      console.info('[NavigationLevelTest16_0100] btn3 click');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('NavigationLevelTest16_text1');
      await CommonFunc.sleep(1000);
      console.info("[NavigationLevelTest16_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('getAllPathName:["pageOne","pageTwo"];getParamByIndex:push pageTwo with animation;getParamByName:["push pageTwo with animation"];getIndexByName:[0];size:2');

      console.info('[NavigationLevelTest16_0100] END');
      done();
    });
  })
}

