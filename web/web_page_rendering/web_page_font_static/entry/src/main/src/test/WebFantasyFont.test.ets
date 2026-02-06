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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let testAbilityContext:common.UIAbilityContext;

export default function webFantasyFont() {
  describe('webFantasyFont', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   emitWebFantasyFontStatic001
     * @tc.number emitWebFantasyFont001
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebFantasyFontStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:() => void): Promise<void> => {
      Utils.emitEvent('emitWebFantasyFont001', 10)
      await Utils.msSleep(2000)
      console.info('Utils.emitEvent start');
      Utils.registerEvent('emitWebFantasyFont001',0, 20253322, done);
      await Utils.msSleep(2000)
      console.info('Utils.registerEvent start');
      inspector.sendEventByKey('WebFantasyFontButton', 10, '');
      await Utils.msSleep(2000)
      done()
    })
  })
}