/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wifiMg from '@ohos.wifiManager';

let testAbilityContext:common.UIAbilityContext;

export default function webResourceResponseGet() {
  describe('WebResourceResponseGetTestSuite', ():void => {
      beforeAll(async (): Promise<void> => {
        try {
          console.log(' App start')
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
          abilityDelegator.addAbilityMonitor({
            abilityName: 'EntryAbility',
            moduleName: 'entry',
            onAbilityCreate: (abilitys: UIAbility): void => {
              testAbilityContext = abilitys.context
              console.log('onAbilityCreate end')
            },
          }, (err: BusinessError | null): void => {
            if (err != null) {
              console.log('-----' + err.code)
            }
            console.log('BusinessError  end')
          });
          await Utils.msSleep(2000)
          abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsaceloadstatusenhancedtestthree.static')
          await Utils.msSleep(2000)
          console.log('beforeAll end,%s', "Succeed!")
        } catch (error) {
          console.info(`beforeAll error: ${JSON.stringify(error)}`)
        }
      });

    beforeEach(async (done: () => void): Promise<void> => {
      console.info("web beforeEach start");
      if(!wifiMg.isWifiActive()){
        let state:boolean = wifiMg.isWifiActive();
        console.info("======> wifi_test/enable wifi: enabled " + state);
        await Utils.msSleep(2000);
      }
      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
        console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
        console.info("======> Internet chload : " + JSON.stringify(data.chload));
        console.info("======> Internet rssi : " + JSON.stringify(data.rssi));

        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info("======> WLAN connection established ");
        } else {
          throw new Error("======> WLAN Network error");//方式二
          done();
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          throw new Error("======> WLAN Network error");//方式二
          done();
        } else if (data.chload >= 500) {
          console.info("======> The internet connection is poor. ");
        }
        done();
      } catch (err) {
        console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
        throw (err as Error);
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_GETREQUESTHEADER_0100
    * @tc.name       : testGetRequestHeader001
    * @tc.desc       : test getRequestHeader
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetRequestHeaderStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(10000);
      Utils.emitEvent("testGetRequestHeader001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetRequestHeader001", true, 35010, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETREQUESTURL_0100
    * @tc.name       : testGetRequestUrl001
    * @tc.desc       : test getRequestUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetRequestUrlStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent("testGetRequestUrl001", 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testGetRequestUrl001", 'https://gitee.com/openharmony/123', 35011, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ISREQUESTGESTURE_0100
    * @tc.name       : testIsRequestGesture001
    * @tc.desc       : test isRequestGesture
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsRequestGestureStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent("testIsRequestGesture001", 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testIsRequestGesture001", false, 35012, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ISMAINFRAME_0100
    * @tc.name       : testIsMainFrame001
    * @tc.desc       : test isMainFrame
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsMainFrameStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testIsMainFrame001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testIsMainFrame001", true, 35013, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ISREDIRECT_0100
    * @tc.name       : testIsRedirect001
    * @tc.desc       : test isRedirect
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsRedirectStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testIsRedirect001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testIsRedirect001", false, 35014, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETREQUESTMETHOD_0100
    * @tc.name       : testGetRequestMethod001
    * @tc.desc       : test getRequestMethod
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetRequestMethodStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetRequestMethod001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetRequestMethod001", "GET", 35015, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSEENCODING_0100
    * @tc.name       : testGetResponseEncoding001
    * @tc.desc       : test getResponseEncoding
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetResponseEncodingStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseEncoding001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseEncoding001", "utf-8", 35017, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSEMIMETYPE_0100
    * @tc.name       : testGetResponseMimeType001
    * @tc.desc       : test getResponseMimeType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetResponseMimeTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseMimeType001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseMimeType001", "text/html", 35018, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETREASONMESSAGE_0100
    * @tc.name       : testGetReasonMessage001
    * @tc.desc       : test getReasonMessage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetReasonMessageStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetReasonMessage001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetReasonMessage001", "Not Found", 35019, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSEHEADER_0100
    * @tc.name       : testGetResponseHeader001
    * @tc.desc       : test getResponseHeader
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetResponseHeaderStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseHeader001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseHeader001", true, 35020, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSECODE_0100
    * @tc.name       : testGetResponseCode001
    * @tc.desc       : test getResponseCode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetResponseCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetResponseCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseCode001", 404, 35021, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseGetButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })


  })
}
