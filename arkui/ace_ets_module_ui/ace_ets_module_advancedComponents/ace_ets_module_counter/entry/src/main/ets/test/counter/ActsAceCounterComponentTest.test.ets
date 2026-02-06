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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ActsAceCounterComponentTest() {
  describe('ActsAceCounterComponentTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/counter/ActsAceCounterComponentTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ActsAceCounterComponentTest state success " + JSON.stringify(pages));
        if (!("ActsAceCounterComponentTest" == pages.name)) {
          console.info("get ActsAceCounterComponentTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ActsAceCounterComponentTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ActsAceCounterComponentTest page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done();
    })

    /**
     * @tc.name   Advanced_ui_counterComponent_0100
     * @tc.number Advanced_ui__counterComponent_0100
     * @tc.desc   Test listCounter Component UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Advanced_ui_counterComponent_0100', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create()
      let listCounterComponent = await driver.findComponent(ON.text('Number'))
      let type = await listCounterComponent.getType();
      expect(type).assertEqual('Text');
      done();
    });

    /**
     * @tc.name   Advanced_ui_counterComponent_0200
     * @tc.number Advanced_ui__counterComponent_0200
     * @tc.desc   Test compactCounter Component UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Advanced_ui_counterComponent_0200', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create()
      let compactCounter = await driver.findComponent(ON.text('Total'))
      let type = await compactCounter.getType();
      expect(type).assertEqual('Text');
      done();
    });

  })
}

