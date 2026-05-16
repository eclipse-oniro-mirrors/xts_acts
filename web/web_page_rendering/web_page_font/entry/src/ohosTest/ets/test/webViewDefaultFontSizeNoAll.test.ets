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
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@ohos.UiTest';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = "emitdefaultFontSizeAndminFontSizeNoAll";
export default function webViewDefaultFontSizeNoAll() {
  describe('ActsAceWebDevWebViewDefaultFontSizeNoAllTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webViewDefaultFontSizeNoAll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewDefaultFontSizeNoAll state success " + JSON.stringify(pages));
        if (!("webViewDefaultFontSizeNoAll" == pages.name)) {
          console.info("get webViewDefaultFontSizeNoAll state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewDefaultFontSizeNoAll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewDefaultFontSizeNoAll page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewDefaultFontSizeNoAll"), 10000);
      console.log("waitForComponent webViewDefaultFontSizeNoAll");
      done()
    });
    beforeEach(async (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewDefaultFontSizeNoAll beforeEach start");
      done();
    })
   
    /**
     * @tc.name   testNoDefaultFontSizeAndNoMinFontSize
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR6_API_0600
     * @tc.desc   test with no set defaultfontsize or minfontsize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNoDefaultFontSizeAndNoMinFontSize',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitdefaultFontSizeAndminFontSizeNoAll", 150280);
      Utils.registerEvent("testNoDefaultFontSizeAndNoMinFontSize","16px",150290,done);
      let StartModel = await driver.findComponent(ON.id("webViewDefaultFontSizeNoAll"));
      await StartModel.click();
    })
  })
}