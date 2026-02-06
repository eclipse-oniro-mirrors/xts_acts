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

export default function webDefaultFontSizeNoAll() {
  describe('ActsAceWebDevWebDefaultFontSizeNoAllTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webDefaultFontSizeNoAll',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webDefaultFontSizeNoAll state success " + JSON.stringify(pages));
        if (!("webDefaultFontSizeNoAll" == pages.name)) {
          console.info("get webDefaultFontSizeNoAll state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webDefaultFontSizeNoAll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webDefaultFontSizeNoAll page error: " + err);
      }
      await driver.waitForComponent(ON.id("webDefaultFontSizeNoAll"), 10000);
      console.log("waitForComponent webDefaultFontSizeNoAll");
      done();
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webDefaultFontSizeNoAll beforeEach start");
      done();
    })
    
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBPATR6_API_0600
     *tc.name testNoDefaultFontSizeAndNoMinFontSizeWebC
     *tc.desc test with no set defaultfontsize or minfontsize
     */
    it('testNoDefaultFontSizeAndNoMinFontSizeWebC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitdefaultFontSizeAndminFontSizeNoAllWebC";
      Utils.emitEvent(emitKey, 150050)
      Utils.registerEvent("testNoDefaultFontSizeAndNoMinFontSizeWebC", "16px", 150060, done);
      let StartModel = await driver.findComponent(ON.id("webDefaultFontSizeNoAll"));
      await StartModel.click();
    })
  })
}