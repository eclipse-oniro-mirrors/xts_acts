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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@system.router'
import { Driver, ON, Component } from '@ohos.UiTest'

export default function abilityTest() {
  const SUITE = 'CounterComponent'
  describe('ActsAceCounterComponentTest', () => {
    beforeEach(async (done: Function) => {
      let options = {
        uri: "../testability/pages/Index",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("Index" == pages.name)) {
          let driver = Driver.create()
          await router.push(options);
          await driver.delayMs(2000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    })
    afterEach(async (done: Function) => {
      let driver = Driver.create()
      await driver.delayMs(2);
      done()
    })

    /*
     * @tc.number       Advanced_ui__counterComponent_0100     
     * @tc.name         listCounter Component UI test
     * @tc.desc         Test listCounter Component UI
     */
    it('Advanced_ui_counterComponent_0100', 0, async (done: Function) => {
      let driver = Driver.create()
      let listCounterComponent = await driver.findComponent(ON.text('Number'))
      let type = await listCounterComponent.getType();
      expect(type).assertEqual('Text');
      done();
    });

    /*
     * @tc.number       Advanced_ui__counterComponent_0200     
     * @tc.name         compactCounter Component UI test
     * @tc.desc         Test compactCounter Component UI
     */
    it('Advanced_ui_counterComponent_0200', 0, async (done: Function) => {
      let driver = Driver.create()
      let compactCounter = await driver.findComponent(ON.text('Total'))
      let type = await compactCounter.getType();
      expect(type).assertEqual('Text');
      done();
    });

  })
}

