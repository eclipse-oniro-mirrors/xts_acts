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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitRunJsCallback";
export default function runJavaScript() {
  describe('ActsAceWebControllerTest2', () => {
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/runJavaScript"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get runJavaScript state success " + JSON.stringify(pages));
        if (!("runJavaScript" == pages.name)) {
          console.info("get runJavaScript state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push runJavaScript page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push runJavaScript page error: " + err);
      }
      await waitForComponent("webcomponent01");
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("ActsAceWebControllerTest afterEach start:"+emitKey);
      done();
    })
    /**
     * @tc.name   RunJsCallback
     * @tc.number SUB_ACE_BASIC_ETS_RUNJAVASCRIPT_API_001
     * @tc.desc   RunJsCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunJsCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitRunJsCallback", 171190)
      Utils.registerEvent("testRunJsCallback",'testRunJavaScript',171200,done);
      sendEventByKey('webcomponent01',10,'');
    })

    /**
     * @tc.name   RunJsPromise
     * @tc.number SUB_ACE_BASIC_ETS_RUNJAVASCRIPT_API_002
     * @tc.desc   RunJsPromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunJsPromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent("emitRunJsPromise", 171190)
      Utils.registerEvent("testRunJsPromise",'\"testRunJavaScript\"',171210,done);
      sendEventByKey('webcomponent01',10,'');
    })
  })
}
