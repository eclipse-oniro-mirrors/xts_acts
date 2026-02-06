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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { Driver } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
// @ts-nocheck
export default function webViewNativeMediaPlayerProps() {
  describe('ActsAcewebViewNativeMediaPlayerProps', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewNativeMediaPlayerProps',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerProps state success " + JSON.stringify(pages));
        if (!("webViewNativeMediaPlayerProps" == pages.name)) {
          console.info("get webViewNativeMediaPlayerProps state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewNativeMediaPlayerProps state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerProps page error:" + err);
      }
      await waitForComponents("webViewNativeMediaPlayerProps");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewNativeMediaPlayerProps beforeEach start");
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_MediaError_NETWORK_ERROR_API_0002
     *@tc.name testWebViewNativeMediaPlayerNetworkError
     *@tc.desc test MediaError.NETWORK_ERROR
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewNativeMediaPlayerNetworkError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerNetworkError";
      Utils.emitEvent(emitKey, 300010)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkError", true, 300020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerProps');
    })

    /*
     *@tc.number SUB_ACE_WEB_MediaError_FORMAT_ERROR_API_0003
     *@tc.name testWebViewNativeMediaPlayerFORMATERROR
     *@tc.desc test MediaError.FORMAT_ERROR
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerFORMATERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerFORMATERROR";
      Utils.emitEvent(emitKey, 300010)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerFORMATERROR", true, 300030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerProps');
    })

    /*
     *@tc.number SUB_ACE_WEB_MediaError_DECODE_ERROR_API_0004
     *@tc.name testWebViewNativeMediaPlayerDECODEERROR
     *@tc.desc test MediaError.DECODE_ERROR
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerDECODEERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerDecodeERROR";
      Utils.emitEvent(emitKey, 300010)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerDECODEERROR", true, 300040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerProps');
    })

    /*
     *@tc.number SUB_ACE_WEB_CreateNativeMediaPlayerCallback_API_0005
     *@tc.name testWebViewNativeMediaPlayerCreateNativeMediaPlayerCallback
     *@tc.desc test CreateNativeMediaPlayerCallback
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerCreateNativeMediaPlayerCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerCreateNativeMediaPlayerCallback";
      Utils.emitEvent(emitKey, 300010)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerCreateNativeMediaPlayerCallback", true, 300050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerProps');
    })

    /*
     *@tc.number SUB_ACE_WEB_NetworkState_EMPTY_API_0006
     *@tc.name testWebViewNativeMediaPlayerNetworkStateEmpty
     *@tc.desc test NetworkState EMPTY
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerNetworkStateEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerNetworkStateEmpty";
      Utils.emitEvent(emitKey, 300010)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkStateEmpty", true, 300060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerProps');
    })

    /*
     *@tc.number SUB_ACE_WEB_NetworkState_IDLE_API_0007
     *@tc.name testWebViewNativeMediaPlayerNetworkStateIDLE
     *@tc.desc test NetworkState IDLE
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerNetworkStateIDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerNetworkStateIDLE";
      Utils.emitEvent(emitKey, 300010)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkStateIDLE", true, 300070, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerProps');
    })

    /*
     *@tc.number SUB_ACE_WEB_NetworkState_NETWORK_ERROR_API_0008
     *@tc.name testWebViewNativeMediaPlayerNetworkStateNETWORKERROR
     *@tc.desc test NetworkState NETWORK_ERROR
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerNetworkStateNETWORKERROR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerNetworkStateNETWORKERROR";
      Utils.emitEvent(emitKey, 300010)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerNetworkStateNETWORKERROR", true, 300070, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerProps');
    })

    /*
     *@tc.number SUB_ACE_WEB_ReadyState_HAVE_NOTHING_API_0009
     *@tc.name testWebViewNativeMediaPlayerReadyStateHAVENOTHING
     *@tc.desc test ReadyState.HAVE_NOTHING
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('testWebViewNativeMediaPlayerReadyStateHAVENOTHING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerReadyStateHAVENOTHING";
      Utils.emitEvent(emitKey, 300010)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerReadyStateHAVENOTHING", true, 300080, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerProps');
    })

    /*
     *@tc.number SUB_ACE_WEB_MediaPlayer_Preload_API_0010
     *@tc.name testWebViewNativeMediaPlayerPreload
     *@tc.desc test MediaPlayerProps2
     *@tc.type Function
     *@tc.size MediumTest
     *@tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerPreload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = "emitWebViewNativeMediaPlayerProps2";
      Utils.emitEvent(emitKey, 300010)
      Utils.registerBaseEvent("testWebViewNativeMediaPlayerProps2", true, 300090, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewNativeMediaPlayerProps');
    })
  })
}
