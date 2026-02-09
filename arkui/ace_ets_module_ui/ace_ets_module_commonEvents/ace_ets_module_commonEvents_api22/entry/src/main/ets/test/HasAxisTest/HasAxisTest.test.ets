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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function HasAxisTest() {
  describe('HasAxis', () => {
    beforeEach(async (done: Function) => {
      console.info("HasAxis beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/HasAxisTest/HasAxisTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get HasAxis state pages:" + JSON.stringify(pages));
        if (!("HasAxis" == pages.name)) {
          console.info("get HasAxis pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push HasAxis page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HasAxis page error:" + err);
      }
      console.info("HasAxis beforeEach end");
      done();
    });

    /**
     * @tc.name   HasAxis_001
     * @tc.number HasAxis_001
     * @tc.desc   ScrollEvent info axis.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HasAxis_001', Level.LEVEL0, async (done: Function) => {
      console.info('[HasAxis_001] START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('button'));
      let center = await button.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseScroll({ x: center.x, y: center.y }, true, 30);
      let strJson: string = getInspectorByKey('has1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[HasAxis_001] component obj is: ' + JSON.stringify(obj));
      console.info('[HasAxis_001] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[HasAxis_001] END');
      done();
    });

    /**
     * @tc.name   HasAxis_002
     * @tc.number HasAxis_002
     * @tc.desc   ScrollEvent info axis.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HasAxis_002', Level.LEVEL0, async (done: Function) => {
      console.info('[HasAxis_002] START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('button'));
      let center = await button.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseScroll({ x: center.x, y: center.y }, true, 30);
      let strJson: string = getInspectorByKey('has2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[HasAxis_002] component obj is: ' + JSON.stringify(obj));
      console.info('[HasAxis_002] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('false');
      console.info('[HasAxis_002] END');
      done();
    });
  })
}