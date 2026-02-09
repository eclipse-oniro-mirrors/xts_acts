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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext:common.UIAbilityContext;


export default function WebViewJavaScriptProxyAndOnPageVisible() {

  describe('WebViewJavaScriptProxyAndOnPageVisibleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('app start');
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   testOnPageVisibleStatic001
     * @tc.number SUB_WEB_ONPAGEVISIBLE_STATIC_0100
     * @tc.desc   test onPageVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnPageVisibleStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      inspector.sendEventByKey('buttonJavaScriptProxyAndPageVisible', 10, '');
      Utils.emitEvent('emitOnPageVisible', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testOnPageVisible001', 'resource://rawfile/icon.html', 1372, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonJavaScriptProxyAndPageVisible', 10, '');
      await Utils.msSleep(3000);
      Utils.emitEvent('', 10)
      inspector.sendEventByKey('buttonJavaScriptProxyAndPageVisible', 10, '');
      await Utils.msSleep(6000);
      done();
    })

  })
}
