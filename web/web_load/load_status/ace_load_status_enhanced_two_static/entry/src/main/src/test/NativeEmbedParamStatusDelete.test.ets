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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it ,afterEach} from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import { NativeEmbedParamStatus } from '@ohos.arkui.component'

export default function WebOnNativeEmbedObjectParamChange() {
  describe('ActsAceWebOnNativeEmbedObjectParamChange', ():void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('ActsAceWebOnNativeEmbedObjectParamChange beforeEach start');

    })
    /**
     * @tc.name   emitOnNativeEmbedObjectParamChangeStatic003
     * @tc.number SUB_ACE_WEB_EMITONNATIVEEMBEDOBJECTPARAMCHANGE_API_0300
     * @tc.desc   test NativeEmbedParamStatus	DELETE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitOnNativeEmbedObjectParamChangeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitOnNativeEmbedObjectParamChange003', 10)
      Utils.registerEvent('emitOnNativeEmbedObjectParamChange003', NativeEmbedParamStatus.DELETE, 20250924, done);
      await Utils.msSleep(10000);
      inspector.sendEventByKey('deleteButton', 10, '');
      await Utils.msSleep(3000);
      done()
      })

   /**
    * @tc.name         SwitchNextPageStatic
    * @tc.number       SUB_WEB_ONHTTPERRORRECEIVE_05010
    * @tc.desc         test onHttpErrorReceive callback when returned error code is 500
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('deleteButton', 10, '');
        await Utils.msSleep(3000);
        done()
      })
  })
}