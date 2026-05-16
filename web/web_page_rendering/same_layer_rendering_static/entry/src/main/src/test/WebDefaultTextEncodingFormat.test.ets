/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
let testAbilityContext:common.UIAbilityContext;

export default function webDefaultTextEncodingFormat() {
  describe('webDefaultTextEncodingFormat', () => {
    beforeAll(async ( ) :Promise<void>=> {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   webDefaultTextEncodingFormat_static_001
     * @tc.number SUB_WEB_DEFAULTTEXTENCODINGFORMAT_0100
     * @tc.desc   test defaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webDefaultTextEncodingFormat_static_001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent('defaultTextEncodingFormat0100', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('defaultTextEncodingFormat0100', '"UTF-8"', 20260319, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('WebDefaultTextEncodingFormatButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   webDefaultTextEncodingFormat_static_002
     * @tc.number SUB_WEB_DEFAULTTEXTENCODINGFORMAT_0200
     * @tc.desc   test defaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webDefaultTextEncodingFormat_static_002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent('defaultTextEncodingFormat0200', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('defaultTextEncodingFormat0200', '"UTF-8"', 20260320, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('WebDefaultTextEncodingFormatButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   webDefaultTextEncodingFormat_static_003
     * @tc.number SUB_WEB_DEFAULTTEXTENCODINGFORMAT_0300
     * @tc.desc   test defaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webDefaultTextEncodingFormat_static_003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent('defaultTextEncodingFormat0300', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('defaultTextEncodingFormat0300', '"UTF-8"', 20260321, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('WebDefaultTextEncodingFormatButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   emitSwitchNextPageStatic6
     * @tc.number emitSwitchNextPageStatic6
     * @tc.desc   test emitSwitchNextPageStatic6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSwitchNextPageStatic6',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSwitchNextPage6', 10)
      await Utils.msSleep(3000);
      inspector.sendEventByKey('WebDefaultTextEncodingFormatButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })
  })
}
