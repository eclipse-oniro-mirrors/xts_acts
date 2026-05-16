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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;

export default function webViewSrollableJsunit() {
  describe('bindSelectionMenuTest',  (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   bindSelectionMenuTypeStatic01
     * @tc.number SUB_ACE_BASIC_ETS_BINDSELECTIONMENUTYPE_API_001
     * @tc.desc   test bindSelectionMenuType01 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindSelectionMenuTypeStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent("bindSelectionMenuType01", 10)
      await Utils.msSleep(1000)
      Utils.registerEvent("bindSelectionMenuType01",true,8301,done);
      await Utils.msSleep(1000)

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('bindSelectionMenuType'));
      button?.longClick();
      await Utils.msSleep(2000);
      let buttonOne = await driver.findComponent(ON.text('复制'));
      buttonOne?.click()
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponentSelectionMenu',10,'');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   bindSelectionMenuTypeStatic02
     * @tc.number SUB_ACE_BASIC_ETS_BINDSELECTIONMENUTYPE_API_002
     * @tc.desc   test bindSelectionMenuType02 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('bindSelectionMenuTypeStatic02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent("bindSelectionMenuType02", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("bindSelectionMenuType02",1,8302,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webcomponentSelectionMenu',10,'');
      await Utils.msSleep(5000)
      done();
    })

    /**
     * @tc.name   testGetPreviewWidthStatic001
     * @tc.number SUB_ACE_BASIC_ETS_GETPREVIEWIDTH_0100
     * @tc.desc   test getPreviewWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPreviewWidthStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGetPreviewWidth001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetPreviewWidth001", true, 11000, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponentSelectionMenu', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetPreviewHeightStatic001
     * @tc.number SUB_ACE_BASIC_ETS_GETPREVIEWHEIGTH_0100
     * @tc.desc   test getPreviewHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPreviewHeightStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGetPreviewHeight001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetPreviewHeight001", true, 12000, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponentSelectionMenu', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testYStatic001
     * @tc.number SUB_ACE_BASIC_ETS__Y_0100
     * @tc.desc   test y
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testYStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testY001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testY001", true, 13000, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponentSelectionMenu', 10, '');
        await Utils.msSleep(2000);
        done();
      })


    /**
     * @tc.name   webResponseTypeStatic01
     * @tc.number SUB_ACE_BASIC_ETS_WEBRESPONSETYPE_API_001
     * @tc.desc   test webResponseType interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webResponseTypeStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent("webResponseTypeStatic01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("webResponseTypeStatic01",2,83023233,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webcomponentSelectionMenu',10,'');
      await Utils.msSleep(5000)
      done();
    })

    /**
     * @tc.name   audioSessionTypeStatic01
     * @tc.number SUB_ACE_BASIC_ETS_AUDIOSESSIONTYPE_API_001
     * @tc.desc   test audioSessionType interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('audioSessionTypeStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent("audioSessionTypeStatic01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("audioSessionTypeStatic01",3,83023234,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webcomponentSelectionMenu',10,'');
      await Utils.msSleep(5000)
      done();
    })

    /**
     * @tc.name   onRefreshAccessedHistoryStatic01
     * @tc.number SUB_ACE_BASIC_ETS_ONREFRESHACCESSEDHISTORY_API_001
     * @tc.desc   test onRefreshAccessedHistory interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onRefreshAccessedHistoryStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent("onRefreshAccessedHistoryStatic01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("onRefreshAccessedHistoryStatic01",true,83023235,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webcomponentSelectionMenu',10,'');
      await Utils.msSleep(5000)
      done();
    })

    /**
     * @tc.name   onSearchResultReceiveStatic01
     * @tc.number SUB_ACE_BASIC_ETS_ONSEARCHRESULTRECEIVE_API_001
     * @tc.desc   test onSearchResultReceive interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onSearchResultReceiveStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent("onSearchResultReceiveStatic01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("onSearchResultReceiveStatic01",true,83023236,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webcomponentSelectionMenu',10,'');
      await Utils.msSleep(5000)
      done();
    })

    /**
     * @tc.name   onClientAuthenticationRequestStatic01
     * @tc.number SUB_ACE_BASIC_ETS_ONCLIENTAUTHENTICATIONREQUESTSTATIC01_API_001
     * @tc.desc   test onClientAuthenticationRequestStatic01 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onClientAuthenticationRequestStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent("onClientAuthenticationRequestStatic01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("onClientAuthenticationRequestStatic01",true,83023237,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webcomponentSelectionMenu',10,'');
      await Utils.msSleep(5000)
      done();
    })

    /**
     * @tc.name   webElementTypeStatic01
     * @tc.number SUB_ACE_BASIC_ETS_WEB_ELEMENT_TYPE_API_001
     * @tc.desc   test webElementType01 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webElementTypeStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent("webElementTypeStatic01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("webElementTypeStatic01",2,83023231,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webcomponentSelectionMenu',10,'');
      await Utils.msSleep(5000)
      done();
    })

    /**
     * @tc.name   webElementTypeStatic02
     * @tc.number SUB_ACE_BASIC_ETS_WEB_ELEMENT_TYPE_API_002
     * @tc.desc   test webElementType02 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webElementTypeStatic02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      Utils.emitEvent("webElementTypeStatic02", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("webElementTypeStatic02",3,83023232,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webcomponentSelectionMenu',10,'');
      await Utils.msSleep(5000)
      done();
    })

    /**
    * @tc.name        SwitchNextPageStatic
    * @tc.number      SwitchNextPageStatic_83023232
    * @tc.desc        test bindSelectionMenuType02 interface when choose callback mode.
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(1000);
        let button = await driver.findComponent(ON.id('webcomponentSelectionMenu'));
        await Utils.msSleep(1000);
        button?.click();
        await Utils.msSleep(4000)
        done()
      })
  })
}
