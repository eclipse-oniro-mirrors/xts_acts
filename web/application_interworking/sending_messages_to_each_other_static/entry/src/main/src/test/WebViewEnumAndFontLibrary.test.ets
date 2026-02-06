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
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;
export default function webViewEnumAndFontLibrary() {

  describe('webViewEnumAndFontLibrary', ():void => {

    beforeAll(async ():Promise<void> => {
      console.log("App start")
    });

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0100
    * @tc.name       : testMessageLevelStatic001
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testMessageLevelStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitMessageLevelDebug", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testMessageLevelStatic001", '0', 601, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0200
    * @tc.name       : testMessageLevelStatic002
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testMessageLevelStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitMessageLevelInfo", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testMessageLevelStatic002", '2', 602, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0300
    * @tc.name       : testMessageLevelStatic003
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testMessageLevelStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitMessageLevelWarn", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testMessageLevelStatic003", '4', 603, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0400
    * @tc.name       : testMessageLevelStatic004
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testMessageLevelStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitMessageLevelError", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testMessageLevelStatic004", '1', 604, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_MESSAGELEVEL_0500
    * @tc.name       : testMessageLevelStatic005
    * @tc.desc       : test MessageLevel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testMessageLevelStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitMessageLevelLog", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testMessageLevelStatic005", '2', 605, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
      await Utils.msSleep(6000);
      done()
    })


    /*
   * @tc.number     : SUB_WEB_MESSAGELEVEL_0600
   * @tc.name       : SwitchNextPageStatic
   * @tc.desc       : test MessageLevel
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 3
   */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.msSleep(6000);
        done();
      })

  })
}
