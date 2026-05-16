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
      beforeAll(async ( ) :Promise<void>=> {
        console.log('App start')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', 'Succeed!')
      });

      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info('ActsAceWebOnNativeEmbedObjectParamChange beforeEach start');

      })

    /**
     * @tc.name   emitNativeEmbedParamDataInfo_static_001
     * @tc.number SUB_WEB_EMBEDVISIBILITYCHANGE_01001
     * @tc.desc   test NativeEmbedParamDataInfo embedId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
      it('emitNativeEmbedParamDataInfo_static_001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitOnNativeEmbedObjectParamChange001', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange001', "3", 16571658, done);
        await Utils.msSleep(1000);
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange001', "test-object", 16571659, done);
        await Utils.msSleep(1000);
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange001', "param-1", 16571660, done);
        await Utils.msSleep(1000);
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange001', "newName1", 16571661, done);
        await Utils.msSleep(1000);
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange001', "newValue1", 16571662, done);
        await Utils.msSleep(1000);
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange001', 0, 16571663, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebOnNativeEmbedObjectParamChangeButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

      /**
       * @tc.name   emitSwitchNextPageStatic5
       * @tc.number emitSwitchNextPageStatic5
       * @tc.desc   test emitSwitchNextPageStatic5
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('emitSwitchNextPageStatic5',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent('emitSwitchNextPage5', 10)
        await Utils.msSleep(3000);
        inspector.sendEventByKey('WebOnNativeEmbedObjectParamChangeButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}

