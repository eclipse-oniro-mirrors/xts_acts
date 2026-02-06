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
import config from '@ohos.accessibility.config'
import accessibility from '@ohos.accessibility'


const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function LocalStoageLinkOneJsunit() {
  describe('LocalStoageLinkOneJsunit', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info('enable success');
      }).catch((err: object) => {
        console.error('failed to enable, ${err}')
      })
      console.info("LocalStoageLinkOneJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/State/LocalStoageLinkOne",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStoageLinkOneJsunit state pages: " + JSON.stringify(pages));
        if (!("LocalStoageLinkOne" == pages.name)) {
          console.info("get LocalStoageLinkOneJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStoageLinkOneJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStoageLinkOneJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    it('LocalStoageLinkOneJsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('[LocalStoageLinkOneJsunit_0100] START');
      let driver = await UiDriver.create()
      let button_has = await driver.findComponent(BY.key('button_has'));
      await button_has.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('button_has');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStoageLinkOneJsunit_0100] obj1 is: " + JSON.stringify(obj1));

      expect(obj1.$attrs.label).assertEqual('Has Has1:true,Has2:false');
      console.info('[LocalStoageLinkOneJsunit_0100] END');
      done();
    });


    it('LocalStoageLinkOneJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('[LocalStoageLinkOneJsunit_0200] START');
      let driver = await UiDriver.create()
      let button_set = await driver.findComponent(BY.key('button_set'));
      await button_set.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('button_set');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStoageLinkOneJsunit_0200] obj1 is: " + JSON.stringify(obj1));

      expect(obj1.$attrs.label).assertEqual('Set Set1:true,Set2:false');
      console.info('[LocalStoageLinkOneJsunit_0200] END');
      done();
    });


    it('LocalStoageLinkOneJsunit_0300', Level.LEVEL0, async (done: Function) => {

      console.info('[LocalStoageLinkOneJsunit_0300] START');
      let driver = await UiDriver.create()
      let button_setOrCreate = await driver.findComponent(BY.key('button_setOrCreate'));
      await button_setOrCreate.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('button_setOrCreate');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStoageLinkOneJsunit_0300] obj1 is: " + JSON.stringify(obj1));

      expect(obj1.$attrs.label).assertEqual('setOrCreate setOrCreate1:true,setOrCreate2:true');
      console.info('[LocalStoageLinkOneJsunit_0300] END');
      done();
    });


    it('LocalStoageLinkOneJsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStoageLinkOneJsunit_0400] START');
      let strJson1 = getInspectorByKey('text_getValue1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStoageLinkOneJsunit_0400] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('localstorage:2,storLink2:2');

      let driver = await UiDriver.create()
      let button_changeInitialValue = await driver.findComponent(BY.key('button_changeInitialValue'));
      await button_changeInitialValue.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('text_getValue1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LocalStoageLinkOneJsunit_0400] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('localstorage:12,storLink2:12');

      let button_changeLocalStorageValue = await driver.findComponent(BY.key('button_changeLocalStorageValue'));
      await button_changeLocalStorageValue.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('text_getValue1');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[LocalStoageLinkOneJsunit_0400] obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('localstorage:666,storLink2:666');
      console.info('[LocalStoageLinkOneJsunit_0400] END');
      done();

    });

  })
}
