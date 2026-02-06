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

export default function ActsAceWebViewSdkSchemeHandlerDidFail3_3() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFail3_3', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandlerDidFail3',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerDidFail3" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerDidFail3 page error:" + err);
        }
      await waitForComponent("webViewSdkSchemeHandlerDidFail3Button");
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
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0056
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative341
    *@tc.desc test SdkSchemeHandler didFail code -341
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative341"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative341", 'success', 121020, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0057
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative342
    *@tc.desc test SdkSchemeHandler didFail code -342
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative342"
      Utils.emitEvent(emitKey,121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative342", 'success', 121030, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0058
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative343
    *@tc.desc test SdkSchemeHandler didFail code -343
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative343"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative343", 'success', 121040, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0059
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative344
    *@tc.desc test SdkSchemeHandler didFail code -344
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative344"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative344", 'success', 121050, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0060
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative345
    *@tc.desc test SdkSchemeHandler didFail code -345
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative345"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative345", 'success', 121060, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0061
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative346
    *@tc.desc test SdkSchemeHandler didFail code -346
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative346"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative346", 'success', 121070, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0062
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative347
    *@tc.desc test SdkSchemeHandler didFail code -347
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative347"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative347", 'success', 121080, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0063
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative348
    *@tc.desc test SdkSchemeHandler didFail code -348
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative348"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative348", 'success', 121090, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0064
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative349
    *@tc.desc test SdkSchemeHandler didFail code -349
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative349"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative349", 'success', 121100, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0065
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative350
    *@tc.desc test SdkSchemeHandler didFail code -350
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative350"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative350", 'success', 121110, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0066
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative351
    *@tc.desc test SdkSchemeHandler didFail code -351
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative351"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative351", 'success', 121120, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0067
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative352
    *@tc.desc test SdkSchemeHandler didFail code -352
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative352"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative352", 'success', 121130, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0068
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative354
    *@tc.desc test SdkSchemeHandler didFail code -354
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative354"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative354", 'success', 121140, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0069
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative355
    *@tc.desc test SdkSchemeHandler didFail code -355
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative355"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative355", 'success', 121150, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0070
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative356
    *@tc.desc test SdkSchemeHandler didFail code -356
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative356"
      Utils.emitEvent(emitKey,121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative356", 'success', 121160, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0071
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative357
    *@tc.desc test SdkSchemeHandler didFail code -357
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative357"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative357", 'success', 121170, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_GROUP_THREE_API_0072
    *@tc.name testWebViewSdkSchemeHandlerDidFailNegative358
    *@tc.desc test SdkSchemeHandler didFail code -358
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative358"
      Utils.emitEvent(emitKey, 121010);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative358", 'success', 121180, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    
  })
}
