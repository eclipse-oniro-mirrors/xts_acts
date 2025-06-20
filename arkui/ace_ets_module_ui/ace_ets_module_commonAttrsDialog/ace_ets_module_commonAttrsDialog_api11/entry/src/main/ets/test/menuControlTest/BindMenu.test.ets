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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import MyUtils from '../../MainAbility/common/MyUtils';
import CommonFunc from '../../MainAbility/common/Common';

export default function BindMenuTest() {

  const SUITE: string = 'BindMenu'
  const waitUiReadyMs: number = 500;

  describe('BindMenuTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/menuControl/BindMenu",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("BindMenu" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
          await MyUtils.sleep(3000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_Menu_0100
     *tc.name   Call function bindMenu with MenuOptions
     *tc.desc   Call function bindMenu with MenuOptions
     */
    it('ArkUI_Menu_0100', Level.LEVEL0, async (done: Function) => {
      let CASE: string = 'ArkUI_Menu_0100'
      console.info(`${SUITE} ${CASE} START`);
      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onAppear');
      }
      let event: events_emitter.InnerEvent = {
        eventId: 50000,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('BindMenu_bindMenu1', 10, "")

      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.text('Menu1'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_Menu_0200
     *tc.name   Call function bindContextMenu with MenuOptions
     *tc.desc   Call function bindContextMenu with MenuOptions
     */
    it('ArkUI_Menu_0200', Level.LEVEL0, async (done: Function) => {
      let CASE: string = 'ArkUI_Menu_0200'
      console.info(`${SUITE} ${CASE} START`);
      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onAppear');
      }
      let event: events_emitter.InnerEvent = {
        eventId: 60002,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('BindMenu_bindContextMenu1', 11, "")

      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.text('Menu1'));
      await button.click();
      await CommonFunc.sleep(1000);

      console.info(`${SUITE} ${CASE} END`);
      done()
    });
  })
}

