/**
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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;
export default function WebSchemeHandlerResponse() {

  describe('WebSchemeHandlerResponse', () => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void=> {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsacenetworkinterceptiondevfourtest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
    * @tc.name        testWebSchemeHandlerResponse_getUrlStatic
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('WebSchemeHandlerResponse_getUrlStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getUrl", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getUrl", "http://www.example.com", 8806, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
    * @tc.name        testWebSchemeHandlerResponse_getStatusStatic
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('WebSchemeHandlerResponse_getStatusStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getStatus", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getStatus", 200, 8808, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
    * @tc.name        testWebSchemeHandlerResponse_getStatusTextStatic
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('WebSchemeHandlerResponse_getStatusTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getStatusText", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getStatusText", "OK", 8810, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
    * @tc.name        testWebSchemeHandlerResponse_getMimeTypeStatic
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('WebSchemeHandlerResponse_getMimeTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getMimeType", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getMimeType", "text/html", 8812, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
    * @tc.name        testWebSchemeHandlerResponse_getEncodingStatic
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('WebSchemeHandlerResponse_getEncodingStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getEncoding", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getEncoding", "utf-8", 8814, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
    * @tc.name        testWebSchemeHandlerResponse_getHeaderByNameStatic
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('WebSchemeHandlerResponse_getHeaderByNameStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getHeaderByName", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getHeaderByName", "value1", 8816, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
    * @tc.name        testWebSchemeHandlerResponse_getNetErrorCodeStatic
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('WebSchemeHandlerResponse_getNetErrorCodeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getNetErrorCode", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getNetErrorCode", WebNetErrorList.NET_OK, 8818, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
        await Utils.msSleep(2000);
        done();
      })


    /**
    * @tc.name        testWebSchemeHandlerResponse_getUrl2Static
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebSchemeHandlerResponse_getUrl2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getUrl2", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getUrl2", "", 9806, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse2', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        testWebSchemeHandlerResponse_getStatusText2Static
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebSchemeHandlerResponse_getStatusText2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getStatusText2", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getStatusText2", "", 9810, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse2', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        testWebSchemeHandlerResponse_getMimeType2Static
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebSchemeHandlerResponse_getMimeType2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getMimeType2", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getMimeType2", "", 9812, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse2', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        testWebSchemeHandlerResponse_getEncoding2Static
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebSchemeHandlerResponse_getEncoding2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getEncoding2", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getEncoding2", "", 9814, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse2', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        testWebSchemeHandlerResponse_getHeaderByName2Static
    * @tc.number      SUB_WEB_WEBSCHEMEHANDLERRESPONSE_0100
    * @tc.desc        test WebSchemeHandlerResponse
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebSchemeHandlerResponse_getHeaderByName2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_getHeaderByName2", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("WebSchemeHandlerResponse_getHeaderByName2", "", 9816, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse2', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        testemitOnSwitchNextPageStatic
    * @tc.number      testemitOnSwitchNextPageStatic6666
    * @tc.desc        test emitonSwitchNextPage
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testemitOnSwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebSchemeHandlerResponse2', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
