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

export default function ActsAceWebViewSdkSchemeHandlerDidFailWan2() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFailWan2', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSdkSchemeHandlerDidFailWan2',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerDidFailWan2 state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandler" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerDidFailWan2 state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSdkSchemeHandlerDidFailWan2 state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerDidFailWan2 page error:" + err);
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
     *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
     *@tc.desc test SdkSchemeHandler didFail code -701
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative701', 0, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative701"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative701", 'success', 11701, done);
        sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0002
     *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
     *@tc.desc test SdkSchemeHandler didFail code -702
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative702', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative702"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative702", 'success', 11702, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0003
     *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
     *@tc.desc test SdkSchemeHandler didFail code -703
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative703', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative703"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative703", 'success', 11703, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0004
     *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
     *@tc.desc test SdkSchemeHandler didFail code -704
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative704', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative704"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative704", 'success', 11704, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0005
     *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
     *@tc.desc test SdkSchemeHandler didFail code -705
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative705', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative705"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative705", 'success', 11705, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0006
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -706
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative706', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative706"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative706", 'success', 11706, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0007
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -707
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative707', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative707"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative707", 'success', 11707, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0008
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -708
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative708', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative708"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative708", 'success', 11708, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0009
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -709
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative709', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative709"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative709", 'success', 11709, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0010
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -710
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative710', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative710"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative710", 'success', 11710, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0011
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -712
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative712', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative712"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative712", 'success', 11712, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0012
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -713
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative713', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative713"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative713", 'success', 11713, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0013
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -714
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative714', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative714"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative714", 'success', 11714, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0014
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -716
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative716', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative716"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative716", 'success', 11716, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0015
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -800
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative800', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative800"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative800", 'success', 11800, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0016
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -801
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative801', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative801"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative801", 'success', 11801, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0017
    *@tc.name testWebViewSdkSchemeHandlerDidFailWan2
    *@tc.desc test SdkSchemeHandler didFail code -802
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative802', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative802"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative802", 'success', 11802, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0018
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -803
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative803', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative803"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative803", 'success', 11803, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0019
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -804
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative804', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative804"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative804", 'success', 11804, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0020
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -805
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative805', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative805"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative805", 'success', 11805, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0021
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -806
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative806', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative806"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative806", 'success', 11806, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0022
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -806
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative808', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative808"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative808", 'success', 11808, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0023
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -809
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative809', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative809"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative809", 'success', 11809, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0023
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -810
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative810', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative810"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative810", 'success', 11810, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0024
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -811
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative811', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative811"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative811", 'success', 11811, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0025
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code null
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegativeNull', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegativeNull"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegativeNull", 'success', 11812, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0026
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code 5
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailMore', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailMore"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailMore", 'success', 11813, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFailWan2Button', 10, '');
    })


  })
}
