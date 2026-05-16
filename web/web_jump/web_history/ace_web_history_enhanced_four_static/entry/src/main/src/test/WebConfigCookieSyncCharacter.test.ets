/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function webConfigCookieSyncCharacter() {

  describe('webConfigCookieSyncCharacterTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testConfigCookieSyncCharacterStatic001
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_CHARACTER_0100
     * @tc.desc   test configCookieSync \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncCharacterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncCharacter001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncCharacterStatic001', 17100002, 133610, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncCharacterStatic002
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_CHARACTER_0200
     * @tc.desc   test configCookieSync \t
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncCharacterStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncCharacter002', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncCharacterStatic002', 17100005, 133620, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncCharacterStatic003
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_CHARACTER_0300
     * @tc.desc   test configCookieSync \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncCharacterStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncCharacter003', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncCharacterStatic003', 'a=b', 133630, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncCharacterStatic004
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_CHARACTER_0400
     * @tc.desc   test configCookieSync \0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncCharacterStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncCharacter004', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncCharacterStatic004', 'a=b', 133640, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncIncludeHttpOnlyCharacterStatic001
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_CHARACTER_0100
     * @tc.desc   test configCookieSync includeHttpOnly \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncIncludeHttpOnlyCharacterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncIncludeHttpOnlyCharacter001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncIncludeHttpOnlyCharacterStatic001', 17100002, 133650, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncIncludeHttpOnlyCharacterStatic002
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_CHARACTER_0200
     * @tc.desc   test configCookieSync includeHttpOnly \t
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncIncludeHttpOnlyCharacterStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncIncludeHttpOnlyCharacter002', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncIncludeHttpOnlyCharacterStatic002', 17100005, 133660, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncIncludeHttpOnlyCharacterStatic003
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_CHARACTER_0300
     * @tc.desc   test configCookieSync includeHttpOnly \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncIncludeHttpOnlyCharacterStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncIncludeHttpOnlyCharacter003', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncIncludeHttpOnlyCharacterStatic003', 'a=b,HttpOnly', 133670, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncIncludeHttpOnlyCharacterStatic004
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_CHARACTER_0400
     * @tc.desc   test configCookieSync includeHttpOnly \0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncIncludeHttpOnlyCharacterStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncIncludeHttpOnlyCharacter004', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncIncludeHttpOnlyCharacterStatic004', 'a=b,HttpOnly', 133680, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncIncognitoCharacterStatic001
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_INCOGNITO_CHARACTER_0100
     * @tc.desc   test configCookieSync incognito \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncIncognitoCharacterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncIncognitoCharacter001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncIncognitoCharacterStatic001', 'a=b', 133690, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncIncognitoIncludeHttpOnlyCharacterStatic001
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_INCOGNITO_INCLUDEHTTPONLY_CHARACTER_0100
     * @tc.desc   test configCookieSync incognito includeHttpOnly \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncIncognitoIncludeHttpOnlyCharacterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieSyncIncognitoIncludeHttpOnlyCharacter001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieSyncIncognitoIncludeHttpOnlyCharacterStatic001', 'a=b,HttpOnly', 133700, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

  })
}
