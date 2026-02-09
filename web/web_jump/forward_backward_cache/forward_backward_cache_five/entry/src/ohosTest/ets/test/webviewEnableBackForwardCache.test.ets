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


export default function ActsAceWebviewEnableBackForwardCache() {
  describe('ActsAceWebviewEnableBackForwardCache', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewEnableBackForwardCache',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewEnableBackForwardCache state success ' + JSON.stringify(pages));
        if (!('webviewEnableBackForwardCache' == pages.name)) {
          console.info('get webviewEnableBackForwardCache state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewEnableBackForwardCache state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewEnableBackForwardCache page error:' + err);
      }
      await waitForComponent('webviewEnableBackForwardCacheButton');
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
      console.info('webviewEnableBackForwardCache afterEach start');
      done();
    })

    /**
     * @tc.name   testWebviewEnableBackForwardCache
     * @tc.number SUB_ACE_WEBVIEW_ENABLEBACKFORWARDCACHE_API_0001
     * @tc.desc   test webviewEnableBackForwardCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebviewEnableBackForwardCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitWebviewEnableBackForwardCache', 137550);
        Utils.registerBaseEvent('testWebviewEnableBackForwardCache', 'success', 137560, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
      })


    /**
     * @tc.name   testWebviewBFCacheNativeEmbed
     * @tc.number SUB_ACE_WEBVIEW_ENABLEBACKFORWARDCACHE_API_0002
     * @tc.desc   test webviewBFCacheNativeEmbed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebviewBFCacheNativeEmbed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebviewBFCacheNativeEmbed', 137550);
      Utils.registerBaseEvent('testWebviewBFCacheNativeEmbed', 'success', 137570, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
    })


    /**
     * @tc.name   testWebviewBFCacheMediaTakeOver
     * @tc.number SUB_ACE_WEBVIEW_ENABLEBACKFORWARDCACHE_API_0003
     * @tc.desc   test webviewBFCacheMediaTakeOver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebviewBFCacheMediaTakeOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitWebviewBFCacheMediaTakeOver', 137550);
        Utils.registerBaseEvent('testWebviewBFCacheMediaTakeOver', 'success', 137580, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
      })
  })
}
