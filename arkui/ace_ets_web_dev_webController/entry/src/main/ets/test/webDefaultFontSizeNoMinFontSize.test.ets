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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';

let emitKey = "emitdefaultFontSize7AndNominFontSizeWebC";

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
          await Utils.sleep(2000);
          console.info("push webDefaultFontSizeNoMinFontSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webDefaultFontSizeNoMinFontSize page error: " + err);
      }
      done();
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webDefaultFontSizeNoMinFontSize beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webDefaultFontSizeNoMinFontSize afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBPATR6_API_0400
     *tc.name testDefaultFontSize7AndNoMinFontSizeWebC
     *tc.desc test with defaultfontsize 7 and no set minfontsize
     */
    it('testDefaultFontSize7AndNoMinFontSizeWebC', 0, async (done: Function) => {
      emitKey = "emitdefaultFontSize17AndCssFontSize9WebC";
      Utils.registerEvent("testDefaultFontSize7AndNoMinFontSizeWebC", "8px", 436, done);
      sendEventByKey('webDefaultFontSizeNoMinFontSize', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBPATR6_API_0500
     *tc.name testDefaultFontSize17AndCssFontSize9WebC
     *tc.desc test with defaultfontsize 17 and css font-size 9
     */
    it('testDefaultFontSize17AndCssFontSize9WebC', 0, async (done: Function) => {
      emitKey = "emitdefaultFontSize17AndCssFontSize9WebC";
      Utils.registerEvent("testDefaultFontSize17AndCssFontSize9WebC", "9px", 438, done);
      sendEventByKey('webDefaultFontSizeNoMinFontSize', 10, '');
    })
  })
}