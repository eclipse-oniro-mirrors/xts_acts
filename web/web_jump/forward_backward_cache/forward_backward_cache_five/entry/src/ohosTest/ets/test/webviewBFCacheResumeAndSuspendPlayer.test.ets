/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function ActsAceWebviewBFCacheResumeAndSuspendPlayer() {
  describe('ActsAceWebviewBFCacheResumeAndSuspendPlayer', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewBFCacheResumeAndSuspendPlayer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheResumeAndSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('webviewBFCacheResumeAndSuspendPlayer' == pages.name)) {
          console.info('get webviewBFCacheResumeAndSuspendPlayer state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewBFCacheResumeAndSuspendPlayer state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewBFCacheResumeAndSuspendPlayer page error:' + err);
      }
      await waitForComponent('webviewBFCacheResumeAndSuspendPlayerButton');
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

    afterEach(async (done: Function) => {
      console.info('webviewBFCacheResumeAndSuspendPlayer afterEach start');
      done();
    })

    /**
     * @tc.name   testWebviewBFCacheResumePlayer
     * @tc.number SUB_ACE_WEBVIEW_BFCACHE_RESUMEPLAYERANDSUSPENDPLAYER_API_0001
     * @tc.desc   test WebviewBFCacheResumePlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebviewBFCacheResumePlayer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebviewBFCacheResumePlayer', 137450);
      Utils.registerBaseEvent('testWebviewBFCacheResumePlayer', 'success', 137460, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewBFCacheResumeAndSuspendPlayerButton', 10, '');
    })

    /**
     * @tc.name   testWebviewBFCacheSuspendPlayer
     * @tc.number SUB_ACE_WEBVIEW_BFCACHE_RESUMEPLAYERANDSUSPENDPLAYER_API_0002
     * @tc.desc   test WebviewBFCacheSuspendPlayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebviewBFCacheSuspendPlayer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('emitWebviewBFCacheSuspendPlayer', 137450);
        Utils.registerBaseEvent('testWebviewBFCacheSuspendPlayer', 'success', 137470, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('webviewBFCacheResumeAndSuspendPlayerButton', 10, '');
      })
  })
}
