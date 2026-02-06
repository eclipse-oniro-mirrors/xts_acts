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

export default function webDefaultFontSizeNoMinFontSize() {
  describe('ActsAceWebDevWebDefaultFontSizeNoMinFontSizeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webDefaultFontSizeNoMinFontSize',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webDefaultFontSizeNoMinFontSize state success " + JSON.stringify(pages));
        if (!("webDefaultFontSizeNoMinFontSize" == pages.name)) {
          console.info("get webDefaultFontSizeNoMinFontSize state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);

          console.info("push webDefaultFontSizeNoMinFontSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webDefaultFontSizeNoMinFontSize page error: " + err);
      }
      await driver.waitForComponent(ON.id("webDefaultFontSizeNoMinFontSize"), 10000);
      console.log("waitForComponent webDefaultFontSizeNoMinFontSize");
      done();
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webDefaultFontSizeNoMinFontSize beforeEach start");
      done();
    })
    
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBPATR6_API_0400
     *tc.name testDefaultFontSize7AndNoMinFontSizeWebC
     *tc.desc test with defaultfontsize 7 and no set minfontsize
     */
    it('testDefaultFontSize7AndNoMinFontSizeWebC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitdefaultFontSize7AndNominFontSizeWebC";
      Utils.emitEvent(emitKey, 150070)
      Utils.registerEvent("testDefaultFontSize7AndNoMinFontSizeWebC", "8px", 150080, done);
      let component = await driver.findComponent(ON.id("webDefaultFontSizeNoMinFontSize"));
      await component.click();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBPATR6_API_0500
     *tc.name testDefaultFontSize17AndCssFontSize9WebC
     *tc.desc test with defaultfontsize 17 and css font-size 9
     */
    it('testDefaultFontSize17AndCssFontSize9WebC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitdefaultFontSize17AndCssFontSize9WebC";
      Utils.emitEvent(emitKey, 150070)
      Utils.registerEvent("testDefaultFontSize17AndCssFontSize9WebC", "9px", 150090, done);
      let component = await driver.findComponent(ON.id("webDefaultFontSizeNoMinFontSize"));
      await component.click();
    })
  })
}