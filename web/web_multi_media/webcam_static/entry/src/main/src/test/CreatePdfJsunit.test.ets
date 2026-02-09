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
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';


let testAbilityContext:common.UIAbilityContext;

export default function WebCameraApiNoCrash() {

  describe('WebCameraApiNoCrash', ():void => {
    beforeAll(async ():Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.webcamtest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic0100
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_100
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      console.log('click end')
      Utils.emitEvent('WebCameraApiNoCrash0100', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash0100', true, 1401, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(10000);
      done()
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic0200
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_200
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('WebCameraApiNoCrash0200', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash0200', true, 1402, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(2000);
      setTimeout(()=>{
        done()
      },5000)
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic0300
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_300
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('WebCameraApiNoCrash0300', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash0300', true, 1403, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(2000);
      setTimeout(()=>{
        done()
      },5000)
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic0400
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_400
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('WebCameraApiNoCrash0400', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash0400', true, 1404, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(2000);
      setTimeout(()=>{
        done()
      },5000)
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic0500
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_500
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('WebCameraApiNoCrash0500', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash0500', true, 1405, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(2000);
      setTimeout(()=>{
        done()
      },5000)
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic0600
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_600
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('WebCameraApiNoCrash0600', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash0600', true, 1406, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(2000);
      setTimeout(()=>{
        done()
      },5000)
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic0700
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_700
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('WebCameraApiNoCrash0700', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash0700', true, 1407, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(2000);
      setTimeout(()=>{
        done()
      },5000)
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic0800
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_800
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('WebCameraApiNoCrash0800', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash0800', true, 1408, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(2000);
      setTimeout(()=>{
        done()
      },5000)
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic0900
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_900
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('WebCameraApiNoCrash0900', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash0900', true, 1409, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(2000);
      setTimeout(()=>{
        done()
      },5000)
    })

    /**
     * @tc.name   WebCameraApiNoCrashStatic1000
     * @tc.number SUB_WEB_WEBCAMERAAPINOCRASH_1000
     * @tc.desc   test WebCameraApiNoCrash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WebCameraApiNoCrashStatic1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('WebCameraApiNoCrash1000', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('WebCameraApiNoCrash1000', true, 1410, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebCameraApiNoCrash', 10, '');
      console.log('click end')
      await Utils.msSleep(2000);
      setTimeout(()=>{
        done()
      },5000)
    })
  })
}
