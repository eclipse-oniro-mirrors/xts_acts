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

export default function ActsAceWebViewSdkSchemeHandlerDidFail() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFail', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSdkSchemeHandlerDidFail',
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
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0001
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -367
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative367', 0, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative367"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative367", 'success', 11367, done);
        sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0002
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -370
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative370', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative370"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative370", 'success', 11370, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0003
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -371
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative371', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative371"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative371", 'success', 11371, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0004
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -372
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative372', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative372"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative372", 'success', 11372, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0005
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -373
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative373', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative373"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative373", 'success', 11373, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0006
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -374
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative374', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative374"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative374", 'success', 11374, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0007
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -375
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative375', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative375"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative375", 'success', 11375, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0008
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -376
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative376', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative376"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative376", 'success', 11376, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0009
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -377
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative377', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative377"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative377", 'success', 11377, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0010
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -378
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative378', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative378"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative378", 'success', 11378, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0011
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -379
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative379', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative379"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative379", 'success', 11379, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0012
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -380
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative380', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative380"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative380", 'success', 11380, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0013
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -381
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative381', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative381"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative381", 'success', 11381, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0014
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -382
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative382', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative382"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative382", 'success', 11382, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0015
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -383
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative383', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative383"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative383", 'success', 11383, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0016
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -384
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative384', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative384"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative384", 'success', 11384, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0017
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -400
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative400', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative400"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative400", 'success', 11400, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0018
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -401
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative401', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative401"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative401", 'success', 11401, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0019
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -402
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative402', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative402"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative402", 'success', 11402, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0020
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -403
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative403', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative403"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative403", 'success', 11403, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0021
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -404
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative404', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative404"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative404", 'success', 11404, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0022
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -405
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative405', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative405"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative405", 'success', 11405, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0023
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -406
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative406', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative406"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative406", 'success', 11406, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0024
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -407
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative407', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative407"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative407", 'success', 11407, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0025
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -408
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative408', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative408"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative408", 'success', 11408, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0026
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -409
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative409', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative409"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative409", 'success', 11409, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0027
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -410
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative410', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative410"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative410", 'success', 11410, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0028
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -411
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative411', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative411"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative410", 'success', 11411, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0029
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -412
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative412', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative412"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative412", 'success', 11412, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0030
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -413
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative413', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative413"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative413", 'success', 11413, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0031
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -501
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative501', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative501"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative501", 'success', 11501, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0032
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -502
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative502', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative502"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative502", 'success', 11502, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0033
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -503
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative503', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative503"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative503", 'success', 11503, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0034
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -504
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative504', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative504"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative504", 'success', 11504, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0035
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -505
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative505', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative505"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative505", 'success', 11505, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0036
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -506
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative506', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative506"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative506", 'success', 11506, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0037
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -507
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative507', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative507"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative507", 'success', 11507, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0038
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -601
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative601', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative601"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative601", 'success', 11601, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0039
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -602
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative602', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative602"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative602", 'success', 11602, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0040
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -603
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative603', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative603"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative603", 'success', 11603, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0041
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -604
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative604', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative604"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative604", 'success', 11604, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0042
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -605
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative605', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative605"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative605", 'success', 11605, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0043
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -606
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative606', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative606"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative606", 'success', 11606, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0044
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -607
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative607', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative607"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative607", 'success', 11607, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailButton', 10, '');
    })

  })
}
