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
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewSdkSchemeHandlerDidFailFei() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFailFei', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandlerDidFailFei',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerDidFailFei state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerDidFailFei" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerDidFailFei state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewSdkSchemeHandlerDidFailFei state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerDidFailFei page error:" + err);
        }
      await waitForComponent("webViewSdkSchemeHandlerDidFailFlyButton");
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

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0073
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative0
     *@tc.desc test SdkSchemeHandler didFail code 0
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative0"
        await Utils.emitEvent(emitKey, 121190);
        Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative0", 'success', 121200, done);
        sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0074
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative1
     *@tc.desc test SdkSchemeHandler didFail code -1
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative1"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative1", 'success', 121210, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0075
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative2
     *@tc.desc test SdkSchemeHandler didFail code -2
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative2"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative2", 'success', 121220, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0076
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative3
     *@tc.desc test SdkSchemeHandler didFail code -3
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative3"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative3", 'success', 121230, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0077
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative4
     *@tc.desc test SdkSchemeHandler didFail code -4
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative4"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative4", 'success', 121240, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0078
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative5
     *@tc.desc test SdkSchemeHandler didFail code -5
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative5"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative5", 'success', 121250, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0079
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative6
     *@tc.desc test SdkSchemeHandler didFail code -6
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative6"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative6", 'success', 121260, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0080
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative7
     *@tc.desc test SdkSchemeHandler didFail code -7
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative7"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative7", 'success', 121270, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0081
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative8
     *@tc.desc test SdkSchemeHandler didFail code -8
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative8"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative8", 'success', 121280, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0082
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative9
     *@tc.desc test SdkSchemeHandler didFail code -9
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative9"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative9", 'success', 121290, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0083
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative10
     *@tc.desc test SdkSchemeHandler didFail code -10
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative10"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative10", 'success', 121300, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0084
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative11
     *@tc.desc test SdkSchemeHandler didFail code -11
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative11"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative11", 'success', 121310, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0085
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative12
     *@tc.desc test SdkSchemeHandler didFail code -12
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative12"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative12", 'success', 121320, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0086
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative13
     *@tc.desc test SdkSchemeHandler didFail code -13
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative13"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative13", 'success', 121330, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0087
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative14
     *@tc.desc test SdkSchemeHandler didFail code -14
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative14"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative14", 'success', 121340, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0088
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative15
     *@tc.desc test SdkSchemeHandler didFail code -15
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative15"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative15", 'success', 121350, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0089
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative16
     *@tc.desc test SdkSchemeHandler didFail code -16
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative16"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative16", 'success', 121360, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0090
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative17
     *@tc.desc test SdkSchemeHandler didFail code -17
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative17"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative17", 'success', 121370, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0091
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative18
     *@tc.desc test SdkSchemeHandler didFail code -18
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative18"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative18", 'success', 121380, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0092
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative19
     *@tc.desc test SdkSchemeHandler didFail code -19
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative19"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative19", 'success', 121390, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0093
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative20
     *@tc.desc test SdkSchemeHandler didFail code -20
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative20"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative20", 'success', 121400, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0094
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative21
     *@tc.desc test SdkSchemeHandler didFail code -21
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative21"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative21", 'success', 121410, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0095
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative22
     *@tc.desc test SdkSchemeHandler didFail code -22
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative22"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative22", 'success', 121420, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0096
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative23
     *@tc.desc test SdkSchemeHandler didFail code -23
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative23"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative23", 'success', 121430, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0097
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative25
     *@tc.desc test SdkSchemeHandler didFail code -25
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative25"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative25", 'success', 121440, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0098
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative26
     *@tc.desc test SdkSchemeHandler didFail code -26
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative26"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative26", 'success', 121450, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0099
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative27
     *@tc.desc test SdkSchemeHandler didFail code -27
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative27"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative27", 'success', 121460, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0100
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative29
     *@tc.desc test SdkSchemeHandler didFail code -29
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative29"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative29", 'success', 121470, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0101
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative30
     *@tc.desc test SdkSchemeHandler didFail code -30
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative30"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative30", 'success', 121480, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0102
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative31
     *@tc.desc test SdkSchemeHandler didFail code -31
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative31"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative31", 'success', 121490, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0103
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative32
     *@tc.desc test SdkSchemeHandler didFail code -32
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative32"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative32", 'success', 121500, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0104
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative100
     *@tc.desc test SdkSchemeHandler didFail code -100
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative100"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative100", 'success', 121510, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0105
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative101
     *@tc.desc test SdkSchemeHandler didFail code -101
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative101"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative101", 'success', 121520, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0106
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative102
     *@tc.desc test SdkSchemeHandler didFail code -102
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative102"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative102", 'success', 121530, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0107
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative103
     *@tc.desc test SdkSchemeHandler didFail code -103
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative103"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative103", 'success', 121540, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0108
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative104
     *@tc.desc test SdkSchemeHandler didFail code -104
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative104"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative104", 'success', 121550, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0109
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative105
     *@tc.desc test SdkSchemeHandler didFail code -105
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative105"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative105", 'success', 121560, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0110
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative106
     *@tc.desc test SdkSchemeHandler didFail code -106
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative106"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative106", 'success', 121570, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0111
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative107
     *@tc.desc test SdkSchemeHandler didFail code -107
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative107"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative107", 'success', 121580, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0112
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative108
     *@tc.desc test SdkSchemeHandler didFail code -108
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative108"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative108", 'success', 121590, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0113
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative109
     *@tc.desc test SdkSchemeHandler didFail code -109
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative109"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative109", 'success', 121600, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0114
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative110
     *@tc.desc test SdkSchemeHandler didFail code -110
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative110"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative110", 'success', 121610, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0115
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative111
     *@tc.desc test SdkSchemeHandler didFail code -111
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative111"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative111", 'success', 121620, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0116
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative112
     *@tc.desc test SdkSchemeHandler didFail code -112
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative112"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative112", 'success', 121630, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0117
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative113
     *@tc.desc test SdkSchemeHandler didFail code -113
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative113"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative113", 'success', 121640, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0118
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative114
     *@tc.desc test SdkSchemeHandler didFail code -114
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative114"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative114", 'success', 121650, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0119
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative115
     *@tc.desc test SdkSchemeHandler didFail code -115
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative115"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative115", 'success', 121660, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0120
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative117
     *@tc.desc test SdkSchemeHandler didFail code -117
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative117"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative117", 'success', 121670, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0121
     *@tc.name testWebViewSdkSchemeHandlerDidFailNegative118
     *@tc.desc test SdkSchemeHandler didFail code -118
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative118"
      await Utils.emitEvent(emitKey, 121190);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative118", 'success', 121680, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
  })
}
