/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, beforeEach } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import CommonEventManager from '@ohos.commonEventManager';
import { Driver, ON } from '@ohos.UiTest';

let Subscriber:CommonEventManager.CommonEventSubscriber;
let subscriberInfo_MainAbility:CommonEventManager.CommonEventSubscribeInfo = {
  events: ['RELY_ABILITY_RESTART_SUCCESS']
};
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
let targetVersion:number;
let tag = 'testTag'
let testAbilityContext: common.UIAbilityContext;

export default function abilityDelegatorStage() {
  describe('abilityDelegatorStage', () => {
    beforeAll(async() => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start1');
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start2');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.applicationcontexttest.static')
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start3');
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0200
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0200
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0200 begin');
      let applicationContext: common.ApplicationContext = testAbilityContext.getApplicationContext();
      let colorMode = testAbilityContext.config.colorMode;
      try {
        if (colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK) {
          applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
          await Utils.msSleep(2000);
          expect(testAbilityContext.config.colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
        } else {
          applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
          await Utils.msSleep(2000);
          expect(testAbilityContext.config.colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        }
        done();
      } catch (error:Error) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SetColorMode_0200 failed ' +  error.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0200
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0200
     * @tc.desc   Application call interface to set language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0200 begin');
      let applicationContext: common.ApplicationContext = testAbilityContext.getApplicationContext();
      let language = testAbilityContext.config.language;
      try {
        if (language === 'zh-cn') {
          applicationContext.setLanguage('en-us');
          await Utils.msSleep(2000);
          expect(testAbilityContext.config.language === 'en-us');
        } else {
          applicationContext.setLanguage('zh-cn');
          await Utils.msSleep(2000);
          expect(testAbilityContext.config.language === 'zh-cn');
        }
        done();
      } catch (error:Error) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SetLanguage_0200 failed ' + error.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize_0200
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize_0200
     * @tc.desc   Check if the application can be successfully set to the font
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize_0200 begin');
      let applicationContext: common.ApplicationContext = testAbilityContext.getApplicationContext();
      try {
        applicationContext.setFontSizeScale(-1);
        expect().assertFail()
        done();
      } catch (error:BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s','setFontSizeScale failed ' +  error?.message);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0300
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0300
     * @tc.desc   Check if the application can be successfully set to the font
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0300 begin');
      let applicationContext: common.ApplicationContext = testAbilityContext.getApplicationContext();
      try {
        applicationContext.setFont('');
        expect().assertFail()
        done()
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s','setFont failed ' +  error?.message);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setSupportedProcessCache_0100
     * @tc.number SUB_Ability_AbilityRuntime_setSupportedProcessCache_0100
     * @tc.desc   Test setSupportedProcessCache can not use in iphone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setSupportedProcessCache_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_setSupportedProcessCache_0100`;
        try{
          let ApplicationContexts:common.ApplicationContext = testAbilityContext.getApplicationContext();
          ApplicationContexts?.setSupportedProcessCache(false)
          done();
        }catch(e: BusinessError){
          if(JSON.stringify(e?.code) == '801'){
            done();
          }else{
            expect().assertFail()
            done();
          }
        }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ProcessCache_3000
     * @tc.number SUB_Ability_AbilityRuntime_ProcessCache_3000
     * @tc.desc   Test killAllProcess in ApplicationContext(AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ProcessCache_3000', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_ProcessCache_3000 begin');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.applicationcontexttest.static')
      await Utils.msSleep(2000)
      try {
        testAbilityContext.startAbilityForResult({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility3',
          action: 'killAllProcess-callback'
        }, (err: BusinessError<void> | null, data:common.AbilityResult | undefined):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback success ' + JSON.stringify(data));
          expect(data?.resultCode).assertEqual(-1);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_ProcessCache_3000 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ProcessCache_3100
     * @tc.number SUB_Ability_AbilityRuntime_ProcessCache_3100
     * @tc.desc   Test killAllProcess in ApplicationContext with clearPageStack (promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ProcessCache_3100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_ProcessCache_3100 begin');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.applicationcontexttest.static')
      await Utils.msSleep(2000)
      try {
        testAbilityContext.startAbilityForResult({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility3',
          action: 'killAllProcess-clearPageStack'
        }, (err: BusinessError<void> | null, data:common.AbilityResult | undefined):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback success ' + JSON.stringify(data));
          expect(data?.resultCode).assertEqual(-1);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_ProcessCache_3100 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ProcessCache_3200
     * @tc.number SUB_Ability_AbilityRuntime_ProcessCache_3200
     * @tc.desc   Test killAllProcess in ApplicationContext(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ProcessCache_3200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_ProcessCache_3200 begin');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.applicationcontexttest.static')
      await Utils.msSleep(2000)
      try {
        testAbilityContext.startAbilityForResult({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility3',
          action: 'killAllProcess-promise'
        }, (err: BusinessError<void> | null, data:common.AbilityResult | undefined):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback success ' + JSON.stringify(data));
          expect(data?.resultCode).assertEqual(-1);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_ProcessCache_3200 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_clearUpApplicationData_0100
     * @tc.number SUB_Ability_AbilityRuntime_clearUpApplicationData_0100
     * @tc.desc   Unable to start specified PageAbility (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_clearUpApplicationData_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_clearUpApplicationData_0100 begin');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.applicationcontexttest.static')
      await Utils.msSleep(2000)
      try {
        testAbilityContext.startAbilityForResult({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility3',
          action: 'clearUpApplicationData-callback'
        }, (err: BusinessError<void> | null, data:common.AbilityResult | undefined):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback success ' + JSON.stringify(data));
          expect(data?.resultCode).assertEqual(-1);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_clearUpApplicationData_0100 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_clearUpApplicationData_0200
     * @tc.number SUB_Ability_AbilityRuntime_clearUpApplicationData_0200
     * @tc.desc   Unable to start specified PageAbility (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_clearUpApplicationData_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_clearUpApplicationData_0200 begin');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.applicationcontexttest.static')
      await Utils.msSleep(2000)
      try {
        testAbilityContext.startAbilityForResult({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility3',
          action: 'clearUpApplicationData-promise'
        }, (err: BusinessError<void> | null, data:common.AbilityResult | undefined):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback success ' + JSON.stringify(data));
          expect(data?.resultCode).assertEqual(-1);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_clearUpApplicationData_0200 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_restartApp_0100
     * @tc.number SUB_Ability_AbilityRuntime_restartApp_0100
     * @tc.desc   Unable to start specified PageAbility (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_restartApp_0100 begin');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.applicationcontexttest.static')
      await Utils.msSleep(2000);
      let SubscribeCallBack = (err:BusinessError | null, data:CommonEventManager.CommonEventData | undefined):void => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_restartApp_0100 data?.event' + data?.event);
        expect(data?.event).assertEqual('RELY_ABILITY_RESTART_SUCCESS');
        done();
      }
      CommonEventManager.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber |null) => {
        Subscriber = data as CommonEventManager.CommonEventSubscriber;
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_restartApp_0100 createSubscriber');
        CommonEventManager.subscribe(Subscriber, SubscribeCallBack);
      })
      await Utils.msSleep(1000)
      try {
        testAbilityContext.startAbilityForResult({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility3',
          action: 'restartApp-success'
        }, (err: BusinessError<void> | null, data:common.AbilityResult | undefined):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback success ' + JSON.stringify(data));
          expect(data?.resultCode).assertEqual(-1);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_restartApp_0100 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_restartApp_0300
     * @tc.number SUB_Ability_AbilityRuntime_restartApp_0300
     * @tc.desc   Unable to start specified PageAbility (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_restartApp_0300 begin');
      await Utils.msSleep(1000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.applicationcontexttest.static')
      await Utils.msSleep(2000)
            hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_restartApp_0300 afterback');
      let ApplicationContexts:common.ApplicationContext = testAbilityContext.getApplicationContext();
      try {
        ApplicationContexts.restartApp({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility3',
        })
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_restartApp_0300 restartApp');
      } catch (error:BusinessError) {
        hilog.error(0x0000, 'testTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_restartApp_0300 failed ' + JSON.stringify(error));
        expect(error?.code).assertEqual(16000063);
        done();
      }
    });
  })
}