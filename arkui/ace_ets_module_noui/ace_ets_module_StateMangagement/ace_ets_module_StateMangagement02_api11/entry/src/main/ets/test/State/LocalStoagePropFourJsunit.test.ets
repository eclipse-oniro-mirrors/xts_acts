/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
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
import events_emitter from '@ohos.events.emitter'


export default function LocalStoagePropFourJsunit() {
  describe('LocalStoagePropFourJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStoagePropFourJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/State/LocalStoagePropFour",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStoagePropFourJsunit state pages: " + JSON.stringify(pages));
        if (!("LocalStoagePropFour" == pages.name)) {
          console.info("get LocalStoagePropFourJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStoagePropFourJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStoagePropFourJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   LocalStoagePropFourJsunit_0100
     * @tc.number LocalStoagePropFourJsunit_0100
     * @tc.desc   LocalStoagePropFourJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStoagePropFourJsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('[LocalStoagePropFourJsunit_0200] START');
      let strJson1 = getInspectorByKey('text_state');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStoagePropFourJsunit_0200] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('State:1,Link:1,Prop:1,Provide:1');

      console.info('[LocalStoagePropFourJsunit_0200] END');
      done();

    });


    /**
     * @tc.name   LocalStoagePropFourJsunit_0200
     * @tc.number LocalStoagePropFourJsunit_0200
     * @tc.desc   LocalStoagePropFourJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStoagePropFourJsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStoagePropFourJsunit_0200] START');
      let strJson1 = getInspectorByKey('text_getValue3');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStoagePropFourJsunit_0200] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('localstorage:1,storProp1:1');

      let driver = await UiDriver.create()
      let button_changeInitialValue = await driver.findComponent(BY.key('button_changeInitialValue'));
      await button_changeInitialValue.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('text_getValue3');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LocalStoagePropFourJsunit_0200] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('localstorage:1,storProp1:11');


      let button_changeLocalStorageValue = await driver.findComponent(BY.key('button_changeLocalStorageValue'));
      await button_changeLocalStorageValue.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('text_getValue3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[LocalStoagePropFourJsunit_0100] obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('localstorage:666,storProp1:666');

      console.info('[LocalStoagePropFourJsunit_0100] END');
      done();

    });

  })
}
