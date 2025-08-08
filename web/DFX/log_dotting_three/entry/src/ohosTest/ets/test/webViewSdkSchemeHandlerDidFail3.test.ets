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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewSdkSchemeHandlerDidFail3() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFail3', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandlerDidFail3',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerDidFail3" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerDidFail3 page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
          }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        await Utils.sleep(2000);
        done();
    })

      afterEach(async (done: Function) => {
        try {
            let backData: events_emitter.EventData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent : events_emitter.InnerEvent = {
                eventId: 10,
                priority: events_emitter.EventPriority.LOW
            }
            console.info("start send emitKey");
            events_emitter.emit(backEvent, backData);
        } catch (err) {
            console.error("emit emitKey error:" + JSON.stringify(err));
        }
        await Utils.sleep(1000);
      done();
    })


    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0295
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative173
     * @tc.desc        : test SdkSchemeHandler didFail code -173
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative173"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative173", 'success', 11173, done);
        sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })


    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0296
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative174
     * @tc.desc        : test SdkSchemeHandler didFail code -174
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative174"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative174", 'success', 11174, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0297
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative176
     * @tc.desc        : test SdkSchemeHandler didFail code -176
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative176"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative176", 'success', 11176, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0298
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative177
     * @tc.desc        : test SdkSchemeHandler didFail code -177
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative177"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative177", 'success', 11177, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0299
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative178
     * @tc.desc        : test SdkSchemeHandler didFail code -178
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative178"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative178", 'success', 11178, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0300
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative179
     * @tc.desc        : test SdkSchemeHandler didFail code -179
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative179"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative179", 'success', 11179, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0301
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative180
     * @tc.desc        : test SdkSchemeHandler didFail code -180
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative180"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative180", 'success', 11180, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0302
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative181
     * @tc.desc        : test SdkSchemeHandler didFail code -181
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative181"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative181", 'success', 11181, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0303
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative182
     * @tc.desc        : test SdkSchemeHandler didFail code -182
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative182"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative182", 'success', 11182, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0304
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative183
     * @tc.desc        : test SdkSchemeHandler didFail code -183
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative183"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative183", 'success', 11183, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0305
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative184
     * @tc.desc        : test SdkSchemeHandler didFail code -184
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative184"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative184", 'success', 11184, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0306
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative200
     * @tc.desc        : test SdkSchemeHandler didFail code -200
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative200"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative200", 'success', 11200, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0307
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative201
     * @tc.desc        : test SdkSchemeHandler didFail code -201
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative201"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative201", 'success', 11201, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0308
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative202
     * @tc.desc        : test SdkSchemeHandler didFail code -202
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative202"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative202", 'success', 11202, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0309
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative203
     * @tc.desc        : test SdkSchemeHandler didFail code -203
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative203"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative203", 'success', 11203, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0310
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative204
     * @tc.desc        : test SdkSchemeHandler didFail code -204
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative204"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative204", 'success', 11204, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0311
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative205
     * @tc.desc        : test SdkSchemeHandler didFail code -205
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative205"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative205", 'success', 11205, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0312
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative206
     * @tc.desc        : test SdkSchemeHandler didFail code -206
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative206"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative206", 'success', 11206, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0313
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative207
     * @tc.desc        : test SdkSchemeHandler didFail code -207
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative207"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative207", 'success', 11207, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0314
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative208
     * @tc.desc        : test SdkSchemeHandler didFail code -208
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative208"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative208", 'success', 11208, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0315
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative210
     * @tc.desc        : test SdkSchemeHandler didFail code -210
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative210"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative210", 'success', 11210, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0316
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative211
     * @tc.desc        : test SdkSchemeHandler didFail code -211
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative211"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative211", 'success', 11211, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0317
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative212
     * @tc.desc        : test SdkSchemeHandler didFail code -212
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative212"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative212", 'success', 11212, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0318
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative213
     * @tc.desc        : test SdkSchemeHandler didFail code -213
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative213"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative213", 'success', 11213, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0319
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative214
     * @tc.desc        : test SdkSchemeHandler didFail code -214
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative214"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative214", 'success', 11214, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0320
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative215
     * @tc.desc        : test SdkSchemeHandler didFail code -215
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative215"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative215", 'success', 11215, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0321
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative217
     * @tc.desc        : test SdkSchemeHandler didFail code -217
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative217"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative217", 'success', 11217, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0322
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative218
     * @tc.desc        : test SdkSchemeHandler didFail code -218
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative218"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative218", 'success', 11218, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0323
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative219
     * @tc.desc        : test SdkSchemeHandler didFail code -219
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative219"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative219", 'success', 11219, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
  })
}
