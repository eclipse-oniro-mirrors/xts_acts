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

export default function webConfigCookieCharacter() {

  describe('webConfigCookieCharacterTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testConfigCookieCharacterStatic001
     * @tc.number SUB_WEB_CONFIGCOOKIE_CHARACTER_0100
     * @tc.desc   test configCookie \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieCharacterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieCharacter001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieCharacter001', 17100002, 133460, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testConfigCookieCharacterStatic002
     * @tc.number SUB_WEB_CONFIGCOOKIE_CHARACTER_0200
     * @tc.desc   test configCookie \t
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieCharacterStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieCharacter002', 10);
      Utils.registerEvent('testConfigCookieCharacter002', '17100005', 133470, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testConfigCookieCharacterStatic003
     * @tc.number SUB_WEB_CONFIGCOOKIE_CHARACTER_0300
     * @tc.desc   test configCookie \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieCharacterStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieCharacter003', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieCharacterStatic003', '', 133480, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testConfigCookieCharacterStatic004
     * @tc.number SUB_WEB_CONFIGCOOKIE_CHARACTER_0400
     * @tc.desc   test configCookie \0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieCharacterStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieCharacter004', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieCharacterStatic004', '', 133490, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyCharacterStatic001
     * @tc.number SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_CHARACTER_0100
     * @tc.desc   test configCookie includeHttpOnly \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieIncludeHttpOnlyCharacterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyCharacter001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieIncludeHttpOnlyCharacterStatic001', 17100002, 133500, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyCharacterStatic002
     * @tc.number SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_CHARACTER_0200
     * @tc.desc   test configCookie includeHttpOnly \t
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieIncludeHttpOnlyCharacterStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyCharacter002', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieIncludeHttpOnlyCharacterStatic002', '17100005', 133510, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyCharacterStatic003
     * @tc.number SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_CHARACTER_0300
     * @tc.desc   test configCookie includeHttpOnly \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieIncludeHttpOnlyCharacterStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyCharacter003', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieIncludeHttpOnlyCharacterStatic003', '', 133520, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyCharacterStatic004
     * @tc.number SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_CHARACTER_0400
     * @tc.desc   test configCookie includeHttpOnly \0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieIncludeHttpOnlyCharacterStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyCharacter004', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieIncludeHttpOnlyCharacterStatic004', '', 133530, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testConfigCookieCallbackCharacterStatic001
     * @tc.number SUB_WEB_CONFIGCOOKIE_CALLBACK_CHARACTER_0100
     * @tc.desc   test configCookie callback \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieCallbackCharacterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieCallbackCharacter001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieCallbackCharacterStatic001', 17100002, 133540, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(5000);
      done()
    })
    /**
     * @tc.name   testConfigCookieIncognitoCharacterStatic001
     * @tc.number SUB_WEB_CONFIGCOOKIE_INCOGNITO_CHARACTER_0100
     * @tc.desc   test configCookie incognito \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieIncognitoCharacterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieIncognitoCharacter001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieIncognitoCharacterStatic001', 'a=b', 133550, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name   testConfigCookieIncognitoIncludeHttpOnlyCharacterStatic001
     * @tc.number SUB_WEB_CONFIGCOOKIE_INCOGNITO_INCLUDEHTTPONLY_CHARACTER_0100
     * @tc.desc   test configCookie incognito includeHttpOnly \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieIncognitoIncludeHttpOnlyCharacterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitConfigCookieIncognitoIncludeHttpOnlyCharacter001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testConfigCookieIncognitoIncludeHttpOnlyCharacter001', 'a=b,HttpOnly', 133560, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })
    /**
     * @tc.name       : SwitchNextPageStatic
     * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_01
     * @tc.desc       : test PAGE_REDIRECT
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webConfigCookieCharacterButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
