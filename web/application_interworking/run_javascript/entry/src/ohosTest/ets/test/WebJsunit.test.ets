/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { beforeAll,afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webJsunit() {
  describe('webJsunit', () => {
    beforeAll(async (done: Function) => {
          console.log('driver waitForComponent start==>');
          await waitForComponent("webcomponent");
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
      console.info("web afterEach start:");
      done();
    })
    /**
     * @tc.name   javaScriptProxy
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_002
     * @tc.desc   javaScriptProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('javaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitJavaScriptProxy", 171250)
      Utils.registerEvent("javaScriptProxy", "backToEts", 171260, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   runJavaScript
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_007
     * @tc.desc   runJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('runJavaScript', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScript", 171250)
      Utils.registerEvent("runJavaScript", "\"testRunJavaScript\"", 171270, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   onConsole
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_040
     * @tc.desc   onConsole
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onConsole', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnConsole", 171250)
      Utils.registerEvent("onConsole", "console test", 171280, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   javaScriptAccess
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_060
     * @tc.desc   javaScriptAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('javaScriptAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitJavaScriptAccess", 171250)
      Utils.registerEvent("javaScriptAccess", true, 171290, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   testRunJavaScript001
     * @tc.number SUB_WEB_RUNJAVASCRIPT_0100
     * @tc.desc   test runJavaScript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunJavaScript001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testRunJavaScript001", 171250)
      Utils.registerEvent("testRunJavaScript001", "\"testRunJavaScript\"", 171300, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
