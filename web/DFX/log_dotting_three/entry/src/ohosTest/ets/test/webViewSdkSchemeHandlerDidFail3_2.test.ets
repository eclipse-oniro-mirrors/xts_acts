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

export default function ActsAceWebViewSdkSchemeHandlerDidFail3_2() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFail3_2', () => {
      
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
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0324
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative300
     * @tc.desc        : test SdkSchemeHandler didFail code -300
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative300"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative300", 'success', 11300, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0325
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative301
     * @tc.desc        : test SdkSchemeHandler didFail code -301
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative301"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative301", 'success', 11301, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0326
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative302
     * @tc.desc        : test SdkSchemeHandler didFail code -302
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative302"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative302", 'success', 11302, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0327
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative303
     * @tc.desc        : test SdkSchemeHandler didFail code -303
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative303"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative303", 'success', 11303, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0328
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative310
     * @tc.desc        : test SdkSchemeHandler didFail code -310
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative310"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative310", 'success', 11310, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0329
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative311
     * @tc.desc        : test SdkSchemeHandler didFail code -311
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative311"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative311", 'success', 11311, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0330
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative312
     * @tc.desc        : test SdkSchemeHandler didFail code -312
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative312"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative312", 'success', 11312, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0331
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative320
     * @tc.desc        : test SdkSchemeHandler didFail code -320
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative320"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative320", 'success', 11320, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0332
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative321
     * @tc.desc        : test SdkSchemeHandler didFail code -321
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative321"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative321", 'success', 11321, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0333
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative322
     * @tc.desc        : test SdkSchemeHandler didFail code -322
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative322"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative322", 'success', 11322, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0334
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative323
     * @tc.desc        : test SdkSchemeHandler didFail code -323
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative323"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative323", 'success', 11323, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0335
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative324
     * @tc.desc        : test SdkSchemeHandler didFail code -324
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative324"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative324", 'success', 11324, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0336
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative325
     * @tc.desc        : test SdkSchemeHandler didFail code -325
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative325"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative325", 'success', 11325, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0337
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative327
     * @tc.desc        : test SdkSchemeHandler didFail code -327
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative327"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative327", 'success', 11327, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0338
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative328
     * @tc.desc        : test SdkSchemeHandler didFail code -328
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative328"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative328", 'success', 11328, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0339
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative329
     * @tc.desc        : test SdkSchemeHandler didFail code -329
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative329"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative329", 'success', 11329, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0340
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative330
     * @tc.desc        : test SdkSchemeHandler didFail code -330
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative330"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative330", 'success', 11330, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0341
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative331
     * @tc.desc        : test SdkSchemeHandler didFail code -331
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative331"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative331", 'success', 11331, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0342
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative332
     * @tc.desc        : test SdkSchemeHandler didFail code -332
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative332"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative332", 'success', 11332, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0343
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative333
     * @tc.desc        : test SdkSchemeHandler didFail code -333
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative333"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative333", 'success', 11333, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0344
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative334
     * @tc.desc        : test SdkSchemeHandler didFail code -334
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative334"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative334", 'success', 11334, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0345
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative336
     * @tc.desc        : test SdkSchemeHandler didFail code -336
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative336"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative336", 'success', 11336, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0346
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative337
     * @tc.desc        : test SdkSchemeHandler didFail code -337
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative337"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative337", 'success', 11337, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0347
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative338
     * @tc.desc        : test SdkSchemeHandler didFail code -338
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative338"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative338", 'success', 11338, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0348
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative339
     * @tc.desc        : test SdkSchemeHandler didFail code -339
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative339"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative339", 'success', 11339, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0349
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative340
     * @tc.desc        : test SdkSchemeHandler didFail code -340
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative340"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative340", 'success', 11340, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
  })
}
