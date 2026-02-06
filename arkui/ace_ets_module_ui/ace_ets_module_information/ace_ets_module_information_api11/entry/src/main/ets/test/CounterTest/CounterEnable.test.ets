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
import { describe, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../MainAbility/common/Common';

export default function CounterEnableTest() {

  const SUITE: string = 'CounterEnable'
  const waitUiReadyMs: number = 500;
  describe('CounterEnableTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Counter/CounterEnable",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get CounterEnableTest state pages: " + JSON.stringify(pages));
        if (pages == null || !("CounterEnable" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_Counter_0100
     *tc.name   Counter support maximum and minimum
     *tc.desc   Counter support maximum and minimum
     */
    it('ArkUI_Counter_0100', Level.LEVEL0, async (done: Function) => {
      let CASE: string = 'ArkUI_Counter_0100'
      console.info(`${SUITE} ${CASE} START`);
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('CounterEnable_Button_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('CounterEnable_Counter_1');
      expect(JSON.parse(strJson).$type).assertEqual("Counter");
      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_Counter_0200
     *tc.name   Counter support maximum and minimum
     *tc.desc   Counter support maximum and minimum
     */
    it('ArkUI_Counter_0200', Level.LEVEL0, async (done: Function) => {
      let CASE: string = 'ArkUI_Counter_0200'
      console.info(`${SUITE} ${CASE} START`);
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('CounterEnable_Button_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('CounterEnable_Counter_1');
      expect(JSON.parse(strJson).$type).assertEqual("Counter");
      console.info(`${SUITE} ${CASE} END`);
      done()
    });
  })
}
