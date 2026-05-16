/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function webInitTest() {
  describe('webInitTest', ():void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsweberrorpagetest.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         testSetErrorPageEnabledAndGetErrorPageEnabledStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0001
    * @tc.desc         test setErrorPageEnabled true getErrorPageEnabled true
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledAndGetErrorPageEnabledStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetErrorPageEnabledAndGetErrorPageEnabled01', true, 60600, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetErrorPageEnabledAndGetErrorPageEnabledStatic02
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0002
    * @tc.desc         test setErrorPageEnabled false getErrorPageEnabled false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledAndGetErrorPageEnabledStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled02', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetErrorPageEnabledAndGetErrorPageEnabled02', false, 60601, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })


    /**
    * @tc.name         testSetErrorPageEnabledErrorCodeStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0003
    * @tc.desc         test setErrorPageEnabled init error
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetErrorPageEnabledErrorCodeStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetErrorPageEnabledErrorCode01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetErrorPageEnabledErrorCode01', 17100001, 60604, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testGetErrorPageEnabledErrorCodeStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0004
    * @tc.desc         test setErrorPageEnabled init error
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testGetErrorPageEnabledErrorCodeStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetErrorPageEnabledErrorCode01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testGetErrorPageEnabledErrorCode01', 17100001, 60605, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testPrivateNetworkAccessStatic01
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0005
    * @tc.desc         test enablePrivateNetworkAccess true isPrivateNetworkAccessEnabled true
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testPrivateNetworkAccessStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPrivateNetworkAccess01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testPrivateNetworkAccess01', true, 60606, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testPrivateNetworkAccessStatic02
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0006
    * @tc.desc         test enablePrivateNetworkAccess false isPrivateNetworkAccessEnabled false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testPrivateNetworkAccessStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPrivateNetworkAccess02', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testPrivateNetworkAccess02', false, 60607, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetAutoPreconnectFalseStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0007
    * @tc.desc         test setAutoPreconnect  false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetAutoPreconnectFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetAutoPreconnectFalse', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetAutoPreconnectFalse', false, 60608, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetAutoPreconnectTrueStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0008
    * @tc.desc         test setAutoPreconnect  true
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testSetAutoPreconnectTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetAutoPreconnectTrue', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetAutoPreconnectTrue', true, 60609, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         emitWebSiteIsolationModeStatic001
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0009
    * @tc.desc         emitWebSiteIsolationMode001
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('emitWebSiteIsolationModeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebSiteIsolationMode001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('emitWebSiteIsolationMode001', true, 60610, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         emitWebSiteIsolationModeStatic002
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0010
    * @tc.desc         emitWebSiteIsolationMode002
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('emitWebSiteIsolationModeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebSiteIsolationMode002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('emitWebSiteIsolationMode002', 17100001, 60611, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

   /**
    * @tc.name         testEnableAdsBlockErrorStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0011
    * @tc.desc         test enableAdsBlock error
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testEnableAdsBlockErrorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitEnableAdsBlockErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testEnableAdsBlockErrorStatic', 17100001, 60612, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testIsAdsBlockEnabledCheckStatic001
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0012
    * @tc.desc         test isAdsBlockEnabledCheck
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testIsAdsBlockEnabledCheckStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitIsAdsBlockEnabledCheck001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testIsAdsBlockEnabledCheckStatic001', true, 60613, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testIsAdsBlockEnabledCheckStatic002
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0013
    * @tc.desc         test isAdsBlockEnabledCheck
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testIsAdsBlockEnabledCheckStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitIsAdsBlockEnabledCheck002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testIsAdsBlockEnabledCheckStatic002', false, 60614, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testIsAdsBlockEnabledForCurPageStatic
    * @tc.number       SUB_ACE_WEB_ERRORPAGE_API_0014
    * @tc.desc         test isAdsBlockEnabledForCurPage
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testIsAdsBlockEnabledForCurPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitIsAdsBlockEnabledForCurPage', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testIsAdsBlockEnabledForCurPageStatic', false, 60616, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebErrorPageButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
  })
}
