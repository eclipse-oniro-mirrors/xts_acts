/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function webViewCoveredJsunit() {
  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('WebViewCoveredTest', function () {
    beforeEach(async function (done) {
     console.info("WebViewCoveredTest beforeEach start");
      let options = {
        uri: 'pages/webCovered',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewCovered state success " + JSON.stringify(pages));
        if (!("WebViewCovered" == pages.name)) {
          console.info("get WebViewCovered state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push WebViewCovered page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewCovered page error " + JSON.stringify(result));
      }
      await sleep(4)
      done()
    });

    afterEach(async function () {
      await sleep(1)
      console.info("WebViewCovered after each called");
    });



    it('WebViewCoveredJsunit_01', 0, async function (done) {
    console.info('[WebViewCoveredJsunit01] START');
        try{
            let callBack=(backData)=>{
                console.info('WebViewCoveredJsunit01 get result is:'+JSON.stringify(backData));
                expect(backData.data.ACTION).assertEqual(historyItem.icon);
                console.info('[WebViewCoveredJsunit01] END');
                done()
            }
            let innerEvent = {
                eventId:01,
                priority:events_emitter.EventPriority.LOW
            }
            events_emitter.on(innerEvent,callBack)
        }catch(err){
            console.info('[WebViewCoveredJsunit01] err:'+JSON.stringify(err));
        }
    }
    sendEventByKey('webCovered01',10,'');
    done();
    });

    it('WebViewCoveredJsunit_02', 0, async function (done) {
      console.info('[WebViewCoveredJsunit02] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('webCovered02');
      let obj = JSON.parse(strJson);
      console.info("[WebViewCoveredJsunit02] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.webSerifFont).assertEqual("serif");
      expect(obj.$attrs.webSansSerifFont).assertEqual("serif");
      expect(obj.$attrs.minLogicalFontSize).assertEqual(13);
      done();
    });
  })
}

