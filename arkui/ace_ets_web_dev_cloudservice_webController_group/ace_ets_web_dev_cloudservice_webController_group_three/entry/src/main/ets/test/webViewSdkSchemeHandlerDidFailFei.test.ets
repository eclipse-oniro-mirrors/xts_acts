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

export default function ActsAceWebViewSdkSchemeHandlerDidFailFei() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFailFei', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSdkSchemeHandlerDidFailFei',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerDidFailFei state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandler" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerDidFailFei state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSdkSchemeHandlerDidFailFei state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerDidFailFei page error:" + err);
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
     *@tc.desc test SdkSchemeHandler didFail code 0
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative0', 0, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative0"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative0", 'success', 11000, done);
        sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0002
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -1
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative1', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative1"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative1", 'success', 11001, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0003
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -2
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative2', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative2"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative2", 'success', 11002, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0004
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -3
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative3', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative3"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative3", 'success', 11003, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0005
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -4
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative4', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative4"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative4", 'success', 11004, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0006
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -5
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative5', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative5"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative5", 'success', 11005, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0007
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -6
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative6', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative6"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative6", 'success', 11006, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0008
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -7
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative7', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative7"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative7", 'success', 11007, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0009
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -8
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative8', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative8"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative8", 'success', 11008, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0010
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -9
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative9', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative9"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative9", 'success', 11009, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0011
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -10
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative10', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative10"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative10", 'success', 11010, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0012
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -11
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative11', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative11"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative11", 'success', 11011, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0013
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -12
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative12', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative12"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative12", 'success', 11012, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0014
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -13
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative13', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative13"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative13", 'success', 11013, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0015
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -14
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative14', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative14"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative14", 'success', 11014, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0016
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -15
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative15', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative15"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative15", 'success', 11015, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0017
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -16
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative16', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative16"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative16", 'success', 11016, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0018
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -17
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative17', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative17"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative17", 'success', 11017, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0019
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -18
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative18', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative18"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative18", 'success', 11018, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0020
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -19
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative19', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative19"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative19", 'success', 11019, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0021
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -20
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative20', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative20"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative20", 'success', 11020, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0022
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -21
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative21', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative21"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative21", 'success', 11021, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0023
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -22
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative22', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative22"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative22", 'success', 11022, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0024
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -23
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative23', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative23"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative23", 'success', 11023, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0025
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -25
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative25', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative25"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative25", 'success', 11025, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0026
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -26
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative26', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative26"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative26", 'success', 11026, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0027
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -27
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative27', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative27"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative27", 'success', 11027, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0028
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -29
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative29', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative29"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative29", 'success', 11029, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0029
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -30
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative30', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative30"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative30", 'success', 11030, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0030
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -31
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative31', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative31"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative31", 'success', 11031, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0031
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -32
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative32', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative32"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative32", 'success', 11032, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0032
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -100
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative100', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative100"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative100", 'success', 11100, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0033
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -101
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative101', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative101"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative101", 'success', 11101, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0034
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -102
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative102', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative102"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative102", 'success', 11102, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0035
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -103
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative103', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative103"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative103", 'success', 11103, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0036
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -104
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative104', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative104"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative104", 'success', 11104, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0037
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -105
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative105', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative105"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative105", 'success', 11105, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
         *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0038
         *@tc.name testWebViewSdkSchemeHandlerDidFail
         *@tc.desc test SdkSchemeHandler didFail code -106
         *@tc.size MediumTest
         *@tc.type Function
         *@tc.level 1
         */
    it('testWebViewSdkSchemeHandlerDidFailNegative106', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative106"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative106", 'success', 11106, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0039
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -107
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative107', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative107"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative107", 'success', 11107, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0040
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -108
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative108', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative108"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative108", 'success', 11108, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0041
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -109
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative109', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative109"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative109", 'success', 11109, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0042
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -110
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative110', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative110"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative110", 'success', 11110, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0043
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -111
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative111', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative111"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative111", 'success', 11111, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0044
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -112
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative112', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative112"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative112", 'success', 11112, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0045
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -113
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative113', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative113"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative113", 'success', 11113, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0046
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -114
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative114', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative114"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative114", 'success', 11114, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0047
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -115
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative115', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative115"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative115", 'success', 11115, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0048
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -117
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative117', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative117"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative117", 'success', 11117, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0049
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -118
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative118', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative118"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative118", 'success', 11118, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailFlyButton', 10, '');
    })
  })
}
