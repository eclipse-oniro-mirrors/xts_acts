
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
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function areaChangeJsunit() {
  describe('areaChangeTest', async () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    });
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAreaChange/areaChange',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get areaChange state success " + JSON.stringify(pages));
        if (!("areaChange" == pages.name)) {
          console.info("get areaChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push areaChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push areaChange page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("areaChange after each called");
    });

    /**
     * @tc.name   areaChangeTest_0300
     * @tc.number areaChangeTest_0300
     * @tc.desc   areaChangeTest_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('areaChangeTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('areaChangeTest_0300 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(500);
      let text: Component = await driver.findComponent(ON.id('text'));
      await text.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('areaChangeTest_0300 text content is :' + obj.$attrs.content);
      //大屏分层区域大
      let Text: boolean = ((obj.$attrs.content) == 'TextText')||((obj.$attrs.content) == 'TextTextText');
      expect(Text).assertTrue();
      strJson = getInspectorByKey('text2');
      obj = JSON.parse(strJson);
      console.info('areaChangeTest_0300 text2 content is :' + obj.$attrs.content);
      expect(JSON.stringify(obj.$attrs.content)).assertEqual('"true"');
      console.info('[areaChangeTest_0300] END');
      done();
    });
  })
}
