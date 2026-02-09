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
import webView from '@ohos.web.webview';
import { beforeAll, beforeEach, describe, it, TestType, Size, Level,expect } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;
let emitKey = ''

export default function ActsAceWebviewSetBackForwardCacheOptions() {
  describe('ActsAceWebviewSetBackForwardCacheOptions', (): void => {
    beforeAll(async (): Promise<void> => {
        console.log(' App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testWebviewSetBackForwardCacheOptions
     * @tc.number SUB_ACE_WEBVIEW_SETBACKFORWARDCHCHEOPTIONS_API_0001
     * @tc.desc   test webviewSetBackForwardCacheOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebviewSetBackForwardCacheOptions',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(6000);
      emitKey = 'emitWebviewSetBackForwardCacheOptions'
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent('testWebviewSetBackForwardCacheOptions', 'success', 24087, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webviewSetBackForwardCacheOptionsButton', 10, '');
      await Utils.msSleep(6000);
      done();
    })

  })
}
