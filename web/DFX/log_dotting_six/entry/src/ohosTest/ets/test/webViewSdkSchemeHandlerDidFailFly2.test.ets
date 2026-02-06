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

export default function ActsAceWebViewSdkSchemeHandlerDidFailFly2() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFailFly2', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandlerDidFailFly2',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerDidFailFly2 state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerDidFailFly2" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerDidFailFly2 state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewSdkSchemeHandlerDidFailFly2 state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerDidFailFly2 page error:" + err);
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

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative119
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0122
     * @tc.desc   test SdkSchemeHandler didFail code -119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative119"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative119", 'success', 121700, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative120
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0123
     * @tc.desc   test SdkSchemeHandler didFail code -120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative120"
        Utils.emitEvent(emitKey, 121690);
        Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative120", 'success', 121710, done);
        sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative121
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0124
     * @tc.desc   test SdkSchemeHandler didFail code -121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative121"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative121", 'success', 121720, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative122
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0125
     * @tc.desc   test SdkSchemeHandler didFail code -122
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative122"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative122", 'success', 121730, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative123
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0126
     * @tc.desc   test SdkSchemeHandler didFail code -123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative123"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative123", 'success', 121740, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative124
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0127
     * @tc.desc   test SdkSchemeHandler didFail code -124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative124"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative124", 'success', 121750, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative125
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0128
     * @tc.desc   test SdkSchemeHandler didFail code -125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative125"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative125", 'success', 121760, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative126
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0129
     * @tc.desc   test SdkSchemeHandler didFail code -126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative126"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative126", 'success', 121770, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative127
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0130
     * @tc.desc   test SdkSchemeHandler didFail code -127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative127"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative127", 'success', 121780, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative130
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0131
     * @tc.desc   test SdkSchemeHandler didFail code -130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative130"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative130", 'success', 121790, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative131
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0132
     * @tc.desc   test SdkSchemeHandler didFail code -131
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative131"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative131", 'success', 121800, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative133
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0133
     * @tc.desc   test SdkSchemeHandler didFail code -133
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative133"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative133", 'success', 121810, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative134
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0134
     * @tc.desc   test SdkSchemeHandler didFail code -11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative134"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative134", 'success', 121820, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative135
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0135
     * @tc.desc   test SdkSchemeHandler didFail code -135
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative135"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative135", 'success', 121830, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative136
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0136
     * @tc.desc   test SdkSchemeHandler didFail code -136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative136"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative136", 'success', 121840, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative137
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0137
     * @tc.desc   test SdkSchemeHandler didFail code -137
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative137"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative137", 'success', 121850, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative138
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0138
     * @tc.desc   test SdkSchemeHandler didFail code -138
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative138"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative138", 'success', 121860, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative139
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0139
     * @tc.desc   test SdkSchemeHandler didFail code -139
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative139"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative139", 'success', 121870, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative140
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0140
     * @tc.desc   test SdkSchemeHandler didFail code -140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative140"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative140", 'success', 121880, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative141
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0141
     * @tc.desc   test SdkSchemeHandler didFail code -141
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative141"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative141", 'success', 121890, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative142
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0142
     * @tc.desc   test SdkSchemeHandler didFail code -142
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative142"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative142", 'success', 121900, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative145
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0143
     * @tc.desc   test SdkSchemeHandler didFail code -145
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative145"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative145", 'success', 121910, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative147
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0144
     * @tc.desc   test SdkSchemeHandler didFail code -147
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative147"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative147", 'success', 121920, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative148
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0145
     * @tc.desc   test SdkSchemeHandler didFail code -148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative148"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative148", 'success', 121930, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative149
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0146
     * @tc.desc   test SdkSchemeHandler didFail code -149
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative149"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative149", 'success', 121940, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative150
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0147
     * @tc.desc   test SdkSchemeHandler didFail code -150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative150"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative150", 'success', 121950, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative151
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0148
     * @tc.desc   test SdkSchemeHandler didFail code -25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative151"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative151", 'success', 121960, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative153
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0149
     * @tc.desc   test SdkSchemeHandler didFail code -153
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative153"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative153", 'success', 121970, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative154
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0150
     * @tc.desc   test SdkSchemeHandler didFail code -154
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative154"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative154", 'success', 121980, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative156
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0151
     * @tc.desc   test SdkSchemeHandler didFail code -156
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative156"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative156", 'success', 121990, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative159
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0152
     * @tc.desc   test SdkSchemeHandler didFail code -159
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative159"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative159", 'success', 122000, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative160
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0153
     * @tc.desc   test SdkSchemeHandler didFail code -160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative160"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative160", 'success', 122010, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative161
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0154
     * @tc.desc   test SdkSchemeHandler didFail code -161
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative161"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative161", 'success', 122020, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative162
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0155
     * @tc.desc   test SdkSchemeHandler didFail code -162
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative162"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative162", 'success', 122030, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative163
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0156
     * @tc.desc   test SdkSchemeHandler didFail code -163
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative163"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative163", 'success', 122040, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative164
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0157
     * @tc.desc   test SdkSchemeHandler didFail code -164
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative164"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative164", 'success', 122050, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative166
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0158
     * @tc.desc   test SdkSchemeHandler didFail code -166
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative166"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative166", 'success', 122060, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative167
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0159
     * @tc.desc   test SdkSchemeHandler didFail code -167
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative167"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative167", 'success', 122070, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative168
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0160
     * @tc.desc   test SdkSchemeHandler didFail code -168
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative168"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative168", 'success', 122080, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative169
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0161
     * @tc.desc   test SdkSchemeHandler didFail code -169
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative169"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative169", 'success', 122090, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative170
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0162
     * @tc.desc   test SdkSchemeHandler didFail code -170
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative170"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative170", 'success', 122100, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative171
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0163
     * @tc.desc   test SdkSchemeHandler didFail code -171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative171"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative171", 'success', 122110, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative172
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0164
     * @tc.desc   test SdkSchemeHandler didFail code -172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative172"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative172", 'success', 122120, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative360
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0165
     * @tc.desc   test SdkSchemeHandler didFail code -360
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative360"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative360", 'success', 122130, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative361
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0166
     * @tc.desc   test SdkSchemeHandler didFail code -361
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative361"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative361", 'success', 122140, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative362
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0167
     * @tc.desc   test SdkSchemeHandler didFail code -362
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative362"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative362", 'success', 122150, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative363
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0168
     * @tc.desc   test SdkSchemeHandler didFail code -363
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative363"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative363", 'success', 122160, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative364
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0169
     * @tc.desc   test SdkSchemeHandler didFail code -364
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative364"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative364", 'success', 122170, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative365
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0170
     * @tc.desc   test SdkSchemeHandler didFail code -365
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative365"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative365", 'success', 122180, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative366
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0171
     * @tc.desc   test SdkSchemeHandler didFail code -366
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative366"
      Utils.emitEvent(emitKey, 121690);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative366", 'success', 122190, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
  })
}
