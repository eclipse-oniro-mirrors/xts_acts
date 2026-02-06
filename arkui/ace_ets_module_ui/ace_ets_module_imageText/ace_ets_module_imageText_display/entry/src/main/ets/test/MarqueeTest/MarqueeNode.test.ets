// /**
//  * Copyright (c) 2024 Huawei Device Co., Ltd.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function MarqueeNodeTest() {
  describe('MarqueeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MarqueeNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Marquee/MarqueeNode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MarqueeNode state pages: " + JSON.stringify(pages));
        if (!("MarqueeNode" == pages.name)) {
          console.info("get MarqueeNode pages.name: " + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push MarqueeNode page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("MarqueeNode beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MarqueeNode after each called");
    })


    /**
     * @tc.name   marqueeNode0100
     * @tc.number marqueeNode0100
     * @tc.desc   marqueeNode0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('marqueeNode0100', Level.LEVEL0, async (done: Function) => {
      console.log('marqueeNode0100: test' + new Date().getTime())
        let tagName = 'marqueeNode0100';
        console.info('[' + tagName + '] START============================');
        
        let strJsonNew = getInspectorByKey('key_marquee_Node_001');
        console.info('[' + tagName + '] Search fontWeight is: ' + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs
          .fontWeight));
        console.info('[' + tagName + '] Search width is: ' + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs
          .width));
        expect(JSON.parse(strJsonNew).$attrs.fontWeight).assertEqual('700');
        console.info('[' + tagName + '] END ===========================');
        done();
    });


    /**
     * @tc.name   marqueeNode0200
     * @tc.number marqueeNode0200
     * @tc.desc   marqueeNode0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('marqueeNode0200', Level.LEVEL0, async (done: Function) => {
      let tagName = 'marqueeNode0200';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_marquee_Node_001');
      console.info('[' + tagName + '] Search marqueeUpdateStrategy is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .marqueeUpdateStrategy));
      expect(JSON.parse(strJsonNew).$attrs.marqueeUpdateStrategy).assertEqual('MarqueeUpdateStrategy.DEFAULT');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

