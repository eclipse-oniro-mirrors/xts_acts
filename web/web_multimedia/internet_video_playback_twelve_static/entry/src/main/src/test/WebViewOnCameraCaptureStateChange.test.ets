/*
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
const driver = Driver.create();

export default function ActsAceWebViewOnCameraCaptureStateChangeCase() {
  describe('ActsAceWebViewOnCameraCaptureStateChangeTest', (): void => {
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
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.internetvideoplaybacktwelvetest.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         testOnCameraCaptureStateChangeStatic001
    * @tc.number       SUB_ACE_WEBVIEW_ONCAMERACAPTURESTATECHANGE_0001
    * @tc.desc         onCameraCaptureStateChange
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testOnCameraCaptureStateChangeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let buttonOne = await driver.findComponent(ON.text('开启摄像头'));
      if(buttonOne)
      {
        await buttonOne.click();
        console.log("✅ 成功点击「开启摄像头」按钮");
      }
      await Utils.msSleep(2000);
      Utils.emitEvent('testOnCameraCaptureStateChange001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testOnCameraCaptureStateChange001', 1, 60600, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnCameraCaptureStateChangeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testOnCameraCaptureStateChangeStatic002
    * @tc.number       SUB_ACE_WEBVIEW_ONCAMERACAPTURESTATECHANGE_API_0002
    * @tc.desc         onCameraCaptureStateChange
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testOnCameraCaptureStateChangeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testOnCameraCaptureStateChange002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testOnCameraCaptureStateChange002', 2, 60601, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnCameraCaptureStateChangeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testOnCameraCaptureStateChangeStatic003
    * @tc.number       SUB_ACE_WEBVIEW_ONCAMERACAPTURESTATECHANGE_API_0003
    * @tc.desc         onCameraCaptureStateChange
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testOnCameraCaptureStateChangeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testOnCameraCaptureStateChange003', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testOnCameraCaptureStateChange003', 0, 60602, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewOnCameraCaptureStateChangeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         SwitchNextPageStatic
    * @tc.number       SUB_WEB_ONHTTPERRORRECEIVE_050011
    * @tc.desc         test onHttpErrorReceive callback when returned error code is 500
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewOnCameraCaptureStateChangeButton', 10, '');
        await Utils.msSleep(3000);
        done()
      })
  })
}