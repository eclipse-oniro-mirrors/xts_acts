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
let emitKey = "emitdefaultFontSizeHalfAndminFontSizeHalf";
export default function webViewDefaultFontSizeWithMinLogical() {
  describe('ActsAceWebDevWebViewDefaultFontSizeWithMinLogicalTest',  () => {
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webViewDefaultFontSizeWithMinLogical',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewDefaultFontSizeWithMinLogical state success " + JSON.stringify(pages));
        if (!("webViewDefaultFontSizeWithMinLogical" == pages.name)) {
          console.info("get webViewDefaultFontSizeWithMinLogical state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewDefaultFontSizeWithMinLogical page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewDefaultFontSizeWithMinLogical page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewDefaultFontSizeWithMinLogical"), 10000);
      console.log("waitForComponent webViewDefaultFontSizeWithMinLogical");
      done()
    });
    beforeEach(async (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewDefaultFontSizeWithMinLogical beforeEach start");
      done();
    })
   
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR6_API_0100
     *tc.name testDefaultFontSizeHalfAndMinFontSizeHalf
     *tc.desc test with defaultfontsize 0.5 , minfontsize 0.5 and minLogicalFontSize 0.5
     */
    it('testDefaultFontSizeHalfAndMinFontSizeHalf',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitdefaultFontSizeHalfAndminFontSizeHalf", 150330);
      Utils.registerEvent("testDefaultFontSizeHalfAndMinFontSizeHalf","1px",150340,done);
      let StartModel = await driver.findComponent(ON.id("webViewDefaultFontSizeWithMinLogical"));
      await StartModel.click();
    })
  })
}