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

let testAbilityContext:common.UIAbilityContext;

export default function webViewControllerPart2() {

  describe('WebViewControllerPart2TestSuite', ():void => {
    beforeAll(async ( ) :Promise<void>=> {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('webViewControllerPart2 beforeEach start');

    })

    /**
     * @tc.name   testNativeEmbedStatusStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_NATIVEEMBEDSTATUS_0100
     * @tc.desc   test NativeEmbedStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeEmbedStatusStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testNativeEmbedStatus001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testNativeEmbedStatus001', 3, 37021, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testNativeEmbedStatusStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_NATIVEEMBEDSTATUS_0200
     * @tc.desc   test NativeEmbedStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeEmbedStatusStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testNativeEmbedStatus002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testNativeEmbedStatus002', 4, 37022, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
      await Utils.msSleep(8000);
      Utils.emitEvent('emitonSwitchNextPage1', 10)
      await Utils.msSleep(1000);
      inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
      await Utils.msSleep(5000);
      done();
    })
  })
}
