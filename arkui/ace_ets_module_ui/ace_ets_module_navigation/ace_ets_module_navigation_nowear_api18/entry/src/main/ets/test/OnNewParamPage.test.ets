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

import CommonFunc from '../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function OnNewParamPage() {
  describe('OnNewParamPage', () => {
    beforeEach(async (done: Function) => {
      console.info("OnNewParamPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/OnNewParamPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnNewParamPage state pages:" + JSON.stringify(pages));
        if (!("OnNewParamPage" == pages.name)) {
          console.info("get OnNewParamPage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push OnNewParamPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnNewParamPage page error:" + err);
      }
      console.info("OnNewParamPage beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnNewParamPage after each called");
    });


    /**
     * @tc.number    OnNewParamPage_0100
     * @tc.name      OnNewParamPage_0100
     * @tc.desc      Test OnNewParamPage LaunchMode.STANDARD\LaunchMode.NEW_INSTANCE\LaunchMode.POP_TO_SINGLETON\LaunchMode.MOVE_TO_TOP_SINGLETON
     * @tc.level     Level 2
     */
    it('OnNewParamPage_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('OnNewParamPage_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click()
      console.info('[OnNewParamPage_0100] btn1 click');
      await driver.delayMs(1000);

      let btn2: Component = await driver.findComponent(ON.id('standardId'));
      await btn2.click()
      console.info('[OnNewParamPage_0100] btn2 click');
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('paramId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[OnNewParamPage_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[OnNewParamPage_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('');

      let btn3: Component = await driver.findComponent(ON.id('instanceId'));
      await btn3.click()
      console.info('[OnNewParamPage_0100] btn3 click');
      await driver.delayMs(1000);

      let strJson1: string = getInspectorByKey('paramId');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info('[OnNewParamPage_0100] component obj1 is: ' + JSON.stringify(obj1));
      console.info('[OnNewParamPage_0100] content obj1 is: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('');
      await driver.delayMs(1000);

      let btn4: Component = await driver.findComponent(ON.id('moveId'));
      await btn4.click()
      console.info('[OnNewParamPage_0100] btn4 click');
      await driver.delayMs(1000);

      let strJson2: string = getInspectorByKey('paramId');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info('[OnNewParamPage_0100] component obj2 is: ' + JSON.stringify(obj2));
      console.info('[OnNewParamPage_0100] content obj2 is: ' + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('{"msg":"MOVE_TO_TOP_SINGLETON"}');
      await driver.delayMs(1000);

      let btn5: Component = await driver.findComponent(ON.id('popId'));
      await btn5.click()
      console.info('[OnNewParamPage_0100] btn5 click');
      await driver.delayMs(1000);

      let strJson3: string = getInspectorByKey('paramId');
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info('[OnNewParamPage_0100] component obj3 is: ' + JSON.stringify(obj3));
      console.info('[OnNewParamPage_0100] content obj3 is: ' + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('10');

      console.info('OnNewParamPage_0100 END');
      done();
    });

  })
}