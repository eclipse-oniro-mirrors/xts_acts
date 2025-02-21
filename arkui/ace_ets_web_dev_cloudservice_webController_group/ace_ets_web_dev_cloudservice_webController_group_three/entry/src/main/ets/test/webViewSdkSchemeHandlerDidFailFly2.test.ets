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

export default function ActsAceWebViewSdkSchemeHandlerDidFailFly2() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFailFly2', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSdkSchemeHandlerDidFailFly2',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerDidFailFly2 state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerDidFailFly2" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerDidFailFly2 state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSdkSchemeHandlerDidFailFly2 state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerDidFailFly2 page error:" + err);
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
         *@tc.desc test SdkSchemeHandler didFail code -119
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative119', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative119"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative119", 'success', 11119, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0002
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -120
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative120', 0, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative120"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative120", 'success', 11120, done);
        sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0003
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -121
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative121', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative121"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative121", 'success', 11121, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0004
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -122
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative122', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative122"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative122", 'success', 11122, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0005
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -123
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative123', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative123"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative123", 'success', 11123, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0006
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -124
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative124', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative124"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative124", 'success', 11124, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0007
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -125
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative125', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative125"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative125", 'success', 11125, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0008
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -126
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative126', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative126"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative126", 'success', 11126, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0009
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -127
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative127', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative127"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative127", 'success', 11127, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0010
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -130
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative130', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative130"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative130", 'success', 11130, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0011
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -131
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative131', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative131"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative131", 'success', 11131, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0012
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -133
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative133', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative133"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative133", 'success', 11133, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0013
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -11
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative134', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative134"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative134", 'success', 11134, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0014
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -135
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative135', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative135"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative135", 'success', 11135, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0015
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -136
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative136', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative136"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative136", 'success', 11136, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0016
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -137
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative137', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative137"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative137", 'success', 11137, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0017
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -138
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative138', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative138"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative138", 'success', 11138, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0018
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -139
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative139', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative139"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative139", 'success', 11139, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0019
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -140
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative140', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative140"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative140", 'success', 11140, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0020
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -141
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative141', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative141"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative141", 'success', 11141, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0021
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -142
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative142', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative142"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative142", 'success', 11142, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0022
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -145
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative145', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative145"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative145", 'success', 11145, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0023
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -147
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative147', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative147"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative147", 'success', 11147, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0024
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -148
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative148', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative148"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative148", 'success', 11148, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0025
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -149
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative149', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative149"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative149", 'success', 11149, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0026
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -150
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative150', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative150"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative150", 'success', 11150, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0027
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -25
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative151', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative151"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative151", 'success', 11151, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0028
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -153
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative153', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative153"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative153", 'success', 11153, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0029
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -154
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative154', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative154"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative154", 'success', 11154, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0030
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -156
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative156', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative156"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative156", 'success', 11156, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0031
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -159
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative159', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative159"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative159", 'success', 11159, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0032
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -160
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative160', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative160"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative160", 'success', 11160, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0033
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -161
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative161', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative161"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative161", 'success', 11161, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0034
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -162
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative162', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative162"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative162", 'success', 11162, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0035
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -163
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative163', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative163"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative163", 'success', 11163, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0036
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -164
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative164', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative164"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative164", 'success', 11164, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0037
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -166
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative166', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative166"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative166", 'success', 11166, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0038
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -167
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative167', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative167"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative167", 'success', 11167, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0039
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -168
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative168', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative168"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative168", 'success', 11168, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0040
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -169
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative169', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative169"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative169", 'success', 11169, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0041
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -170
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative170', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative170"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative170", 'success', 11170, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0042
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -171
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative171', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative171"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative171", 'success', 11171, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0043
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -172
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative172', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative172"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative172", 'success', 11172, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0044
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -360
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative360', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative360"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative360", 'success', 11360, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0045
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -361
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative361', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative361"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative361", 'success', 11361, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0046
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -362
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative362', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative362"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative362", 'success', 11362, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0047
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -363
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative363', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative363"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative363", 'success', 11363, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0048
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -364
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative364', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative364"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative364", 'success', 11364, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0049
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -365
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative365', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative365"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative365", 'success', 11365, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0050
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -366
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative366', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative366"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative366", 'success', 11366, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
  })
}
