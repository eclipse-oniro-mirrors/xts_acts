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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function MarqueeNodeTest() {
  describe('MarqueeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("marqueeNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Marquee/marqueeNode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get marqueeNode state pages: " + JSON.stringify(pages));
        if (!("marqueeNode" == pages.name)) {
          console.info("get marqueeNode pages.name: " + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push marqueeNode page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("marqueeNode beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("marqueeNode after each called");
    })

    /**
     * @tc.number marqueeNode0100
     * @tc.name Test the FontWeight property of the Marquee component
     * @tc.desc set the FontWeight property value is  700
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */

    it('marqueeNode0100', 0, async (done: Function) => {
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
     * @tc.number marqueeNode0200
     * @tc.name Test the MarqueeUpdateStrategy property of the Marquee component
     * @tc.desc set the MarqueeUpdateStrategy property value is MarqueeUpdateStrategy.DEFAULT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */

    it('marqueeNode0200', 0, async (done: Function) => {
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

