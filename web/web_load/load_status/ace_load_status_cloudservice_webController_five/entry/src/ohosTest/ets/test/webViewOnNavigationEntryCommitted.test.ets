/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewOnNavigationEntryCommitted() {
  describe('ActsAceWebViewOnNavigationEntryCommitted', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewOnNavigationEntryCommitted',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewOnNavigationEntryCommitted state success " + JSON.stringify(pages));
            if (!("webViewOnNavigationEntryCommitted" == pages.name)) {
                console.info("get webViewOnNavigationEntryCommitted state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewOnNavigationEntryCommitted state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewOnNavigationEntryCommitted page error:" + err);
        }
        await waitForComponent("webViewOnNavigationEntryCommittedButton");
        done()
    });
    
    beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
          }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        done();
    })


    /**
     * @tc.name   testWebViewOnNavigationEntryCommitted01
     * @tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0001
     * @tc.desc   test onNavigationEntryCommitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewOnNavigationEntryCommitted01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebViewOnNavigationEntryCommitted01"
        Utils.emitEvent(emitKey, 14071);
        Utils.registerEvent("testWebViewOnNavigationEntryCommitted01", 'success', 14072, done);
        sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })

    /**
     * @tc.name   testWebViewOnNavigationEntryCommitted02
     * @tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0002
     * @tc.desc   test onNavigationEntryCommitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewOnNavigationEntryCommitted02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewOnNavigationEntryCommitted02"
      Utils.emitEvent(emitKey, 14071);
      Utils.registerEvent("testWebViewOnNavigationEntryCommitted02", 'success', 14073, done);
      sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })

    /**
     * @tc.name   testWebViewOnNavigationEntryCommitted03
     * @tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0003
     * @tc.desc   test onNavigationEntryCommitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewOnNavigationEntryCommitted03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewOnNavigationEntryCommitted03"
      Utils.emitEvent(emitKey, 14071);
      Utils.registerEvent("testWebViewOnNavigationEntryCommitted03", 'success', 14074, done);
      sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })

    /**
     * @tc.name   testWebViewOnNavigationEntryCommitted04
     * @tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0004
     * @tc.desc   test onNavigationEntryCommitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewOnNavigationEntryCommitted04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewOnNavigationEntryCommitted04"
      Utils.emitEvent(emitKey, 14071);
      Utils.registerEvent("testWebViewOnNavigationEntryCommitted04", 'success', 14075, done);
      sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })

    /**
     * @tc.name   testWebViewOnNavigationEntryCommitted05
     * @tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0005
     * @tc.desc   test onNavigationEntryCommitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewOnNavigationEntryCommitted05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewOnNavigationEntryCommitted05"
      Utils.emitEvent(emitKey, 14071);
      Utils.registerEvent("testWebViewOnNavigationEntryCommitted05", 'success', 14076, done);
      sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })
  })
}
