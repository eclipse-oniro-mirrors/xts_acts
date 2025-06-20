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

export default function ActsAceWebViewSdkSchemeHandlerDidFail() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFail', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandlerDidFail',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerDidFail state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerDidFail" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerDidFail state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSdkSchemeHandlerDidFail state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerDidFail page error:" + err);
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
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0382
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative367
    * @tc.desc        : test SdkSchemeHandler didFail code -367
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative367"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative367", 'success', 11367, done);
        sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0383
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative370
    * @tc.desc        : test SdkSchemeHandler didFail code -370
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative370"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative370", 'success', 11370, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
 
    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0384
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative371
    * @tc.desc        : test SdkSchemeHandler didFail code -371
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative371"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative371", 'success', 11371, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })


    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0385
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative372
    * @tc.desc        : test SdkSchemeHandler didFail code -372
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative372"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative372", 'success', 11372, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0386
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative373
    * @tc.desc        : test SdkSchemeHandler didFail code -373
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative373"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative373", 'success', 11373, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0387
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative374
    * @tc.desc        : test SdkSchemeHandler didFail code -374
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative374"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative374", 'success', 11374, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0388
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative375
    * @tc.desc        : test SdkSchemeHandler didFail code -375
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative375"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative375", 'success', 11375, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0389
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative376
    * @tc.desc        : test SdkSchemeHandler didFail code -376
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative376"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative376", 'success', 11376, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0390
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative377
    * @tc.desc        : test SdkSchemeHandler didFail code -377
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative377"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative377", 'success', 11377, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0391
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative378
    * @tc.desc        : test SdkSchemeHandler didFail code -378
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative378"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative378", 'success', 11378, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0392
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative379
    * @tc.desc        : test SdkSchemeHandler didFail code -379
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative379"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative379", 'success', 11379, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0393
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative380
    * @tc.desc        : test SdkSchemeHandler didFail code -380
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative380"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative380", 'success', 11380, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0394
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative381
    * @tc.desc        : test SdkSchemeHandler didFail code -381
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative381"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative381", 'success', 11381, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0395
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative382
    * @tc.desc        : test SdkSchemeHandler didFail code -382
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative382"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative382", 'success', 11382, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0396
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative383
    * @tc.desc        : test SdkSchemeHandler didFail code -383
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative383"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative383", 'success', 11383, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0397
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative384
    * @tc.desc        : test SdkSchemeHandler didFail code -384
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative384"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative384", 'success', 11384, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0398
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative400
    * @tc.desc        : test SdkSchemeHandler didFail code -400
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative400"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative400", 'success', 11400, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0399
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative401
    * @tc.desc        : test SdkSchemeHandler didFail code -401
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative401"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative401", 'success', 11401, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0400
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative402
    * @tc.desc        : test SdkSchemeHandler didFail code -402
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative402"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative402", 'success', 11402, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0401
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative403
    * @tc.desc        : test SdkSchemeHandler didFail code -403
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative403"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative403", 'success', 11403, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0402
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative404
    * @tc.desc        : test SdkSchemeHandler didFail code -404
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative404"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative404", 'success', 11404, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0403
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative405
    * @tc.desc        : test SdkSchemeHandler didFail code -405
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative405"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative405", 'success', 11405, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0404
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative406
    * @tc.desc        : test SdkSchemeHandler didFail code -406
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative406"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative406", 'success', 11406, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0405
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative407
    * @tc.desc        : test SdkSchemeHandler didFail code -407
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative407"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative407", 'success', 11407, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0406
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative408
    * @tc.desc        : test SdkSchemeHandler didFail code -408
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative408"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative408", 'success', 11408, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0407
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative409
    * @tc.desc        : test SdkSchemeHandler didFail code -409
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative409"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative409", 'success', 11409, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0408
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative410
    * @tc.desc        : test SdkSchemeHandler didFail code -410
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative410"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative410", 'success', 11410, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0409
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative411
    * @tc.desc        : test SdkSchemeHandler didFail code -411
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative411"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative410", 'success', 11411, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0410
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative412
    * @tc.desc        : test SdkSchemeHandler didFail code -412
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative412"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative412", 'success', 11412, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0411
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative413
    * @tc.desc        : test SdkSchemeHandler didFail code -413
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative413"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative413", 'success', 11413, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0412
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative501
    * @tc.desc        : test SdkSchemeHandler didFail code -501
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative501"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative501", 'success', 11501, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0413
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative502
    * @tc.desc        : test SdkSchemeHandler didFail code -502
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative502"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative502", 'success', 11502, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0414
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative503
    * @tc.desc        : test SdkSchemeHandler didFail code -503
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative503"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative503", 'success', 11503, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0415
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative504
    * @tc.desc        : test SdkSchemeHandler didFail code -504
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative504"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative504", 'success', 11504, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0416
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative505
    * @tc.desc        : test SdkSchemeHandler didFail code -505
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative505"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative505", 'success', 11505, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0417
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative506
    * @tc.desc        : test SdkSchemeHandler didFail code -506
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative506"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative506", 'success', 11506, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0418
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative507
    * @tc.desc        : test SdkSchemeHandler didFail code -507
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative507"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative507", 'success', 11507, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0419
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative601
    * @tc.desc        : test SdkSchemeHandler didFail code -601
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative601"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative601", 'success', 11601, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0420
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative602
    * @tc.desc        : test SdkSchemeHandler didFail code -602
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative602"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative602", 'success', 11602, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0421
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative603
    * @tc.desc        : test SdkSchemeHandler didFail code -603
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative603"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative603", 'success', 11603, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0422
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative604
    * @tc.desc        : test SdkSchemeHandler didFail code -604
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative604"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative604", 'success', 11604, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0423
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative605
    * @tc.desc        : test SdkSchemeHandler didFail code -605
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative605"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative605", 'success', 11605, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0424
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative606
    * @tc.desc        : test SdkSchemeHandler didFail code -606
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative606"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative606", 'success', 11606, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0425
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative607
    * @tc.desc        : test SdkSchemeHandler didFail code -607
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative607"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative607", 'success', 11607, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

  })
}
