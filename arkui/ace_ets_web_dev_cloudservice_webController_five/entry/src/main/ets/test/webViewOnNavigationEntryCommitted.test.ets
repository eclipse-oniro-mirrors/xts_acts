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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewOnNavigationEntryCommitted() {
  describe('ActsAceWebViewOnNavigationEntryCommitted', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewOnNavigationEntryCommitted',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewOnNavigationEntryCommitted state success " + JSON.stringify(pages));
            if (!("webViewOnNavigationEntryCommitted" == pages.name)) {
                console.info("get webViewOnNavigationEntryCommitted state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewOnNavigationEntryCommitted state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewOnNavigationEntryCommitted page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
        await Utils.sleep(1000);
        done();
    })


    /*
     *@tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0001
     *@tc.name testWebViewOnNavigationEntryCommitted isMainFrame
     *@tc.desc test onNavigationEntryCommitted
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewOnNavigationEntryCommitted01', 0, async (done: Function) => {
        emitKey = "emitWebViewOnNavigationEntryCommitted01"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewOnNavigationEntryCommitted01", 'success', 8009, done);
        sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0002
     *@tc.name testWebViewOnNavigationEntryCommitted isSameDocument
     *@tc.desc test onNavigationEntryCommitted
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewOnNavigationEntryCommitted02', 0, async (done: Function) => {
      emitKey = "emitWebViewOnNavigationEntryCommitted02"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewOnNavigationEntryCommitted02", 'success', 8010, done);
      sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0003
     *@tc.name testWebViewOnNavigationEntryCommitted didReplaceEntry
     *@tc.desc test onNavigationEntryCommitted
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewOnNavigationEntryCommitted03', 0, async (done: Function) => {
      emitKey = "emitWebViewOnNavigationEntryCommitted03"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewOnNavigationEntryCommitted03", 'success', 8011, done);
      sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0004
     *@tc.name testWebViewOnNavigationEntryCommitted navigationType
     *@tc.desc test onNavigationEntryCommitted
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewOnNavigationEntryCommitted04', 0, async (done: Function) => {
      emitKey = "emitWebViewOnNavigationEntryCommitted04"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewOnNavigationEntryCommitted04", 'success', 8012, done);
      sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0005
     *@tc.name testWebViewOnNavigationEntryCommitted url
     *@tc.desc test onNavigationEntryCommitted
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewOnNavigationEntryCommitted05', 0, async (done: Function) => {
      emitKey = "emitWebViewOnNavigationEntryCommitted05"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewOnNavigationEntryCommitted05", 'success', 8013, done);
      sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
    })
  })
}
