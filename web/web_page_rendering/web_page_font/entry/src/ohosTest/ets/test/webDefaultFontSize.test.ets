/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = " ";

export default function webDefaultFontSize() {
  describe('ActsAceWebDevWebDefaultFontSizeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webDefaultFontSize',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webDefaultFontSize state success " + JSON.stringify(pages));
        if (!("webDefaultFontSize" == pages.name)) {
          console.info("get webDefaultFontSize state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webDefaultFontSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webDefaultFontSize page error: " + err);
      }
      await driver.waitForComponent(ON.id("webDefaultFontSize"), 10000);
      console.log("waitForComponent webDefaultFontSize");
      done();
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webDefaultFontSize beforeEach start");
      done();
    })
  
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBPATR6_API_0200
     *tc.name testDefaultFontSize73AndMinFontSize1WebC
     *tc.desc test with defaultfontsize 73 and minfontsize 1
     */
    it('testDefaultFontSize73AndMinFontSize1WebC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitdefaultFontSize73AndminFontSize1WebC";
      Utils.emitEvent(emitKey, 150020)
      Utils.registerEvent("testDefaultFontSize73AndMinFontSize1WebC", "72px", 150030, done);
      let component = await driver.findComponent(ON.id("webDefaultFontSize"));
      await component.click();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBPATR6_API_0300
     *tc.name testDefaultFontSize73AndMinFontSize73WebC
     *tc.desc test with defaultfontsize 73 and minfontsize 73
     */
    it('testDefaultFontSize73AndMinFontSize73WebC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitdefaultFontSize73AndminFontSize73WebC";
      Utils.emitEvent(emitKey, 150020)
      Utils.registerEvent("testDefaultFontSize73AndMinFontSize73WebC", "72px", 150040, done);
      await Utils.waitAndClickComponent(driver, "webDefaultFontSize");
    })
  })
}