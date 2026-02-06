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
import {describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@ohos.UiTest';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = "emitdefaultFontSize7AndNominFontSize";
export default function webViewDefaultFontSizeNoMinFontSize() {
  describe('ActsAceWebDevWebViewDefaultFontSizeNoMinFontSizeTest',  () => {
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webViewDefaultFontSizeNoMinFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewDefaultFontSizeNoMinFontSize state success " + JSON.stringify(pages));
        if (!("webViewDefaultFontSizeNoMinFontSize" == pages.name)) {
          console.info("get webViewDefaultFontSizeNoMinFontSize state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewDefaultFontSizeNoMinFontSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewDefaultFontSizeNoMinFontSize page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewDefaultFontSizeNoMinFontSize"), 10000);
      console.log("waitForComponent webViewDefaultFontSizeNoMinFontSize");
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewDefaultFontSizeNoMinFontSize beforeEach start");
      done();
    })
   
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR6_API_0400
     *tc.name testDefaultFontSize7AndNoMinFontSize
     *tc.desc test with defaultfontsize 7 and no set minfontsize
     */
    it('testDefaultFontSize7AndNoMinFontSize',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      Utils.emitEvent("emitdefaultFontSize7AndNominFontSize", 150300);
      Utils.registerEvent("testDefaultFontSize7AndNoMinFontSize","8px",150310,done);
      let StartModel = await driver.findComponent(ON.id("webViewDefaultFontSizeNoMinFontSize"));
      await StartModel.click();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR6_API_0500
     *tc.name testDefaultFontSize17AndCssFontSize9
     *tc.desc test with defaultfontsize 17 and css font-size 9
     */
    it('testDefaultFontSize17AndCssFontSize9',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      Utils.emitEvent("emitdefaultFontSize17AndCssFontSize9", 150300);
      Utils.registerEvent("testDefaultFontSize17AndCssFontSize9","9px",150320,done);
      let StartModel = await driver.findComponent(ON.id("webViewDefaultFontSizeNoMinFontSize"));
      await StartModel.click();
    })
  })
}