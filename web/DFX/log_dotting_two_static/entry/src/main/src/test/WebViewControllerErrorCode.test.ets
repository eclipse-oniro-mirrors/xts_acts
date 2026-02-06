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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from "../../../hypium/index";
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';

let testAbilityContext:common.UIAbilityContext;

export default function webViewControllerErrorCode() {

  describe('webViewControllerErrorCode', (): void => {
    beforeEach(async (): Promise<void> => {
      console.log("app start")
    })

    /**
     * @tc.name   testPageUpError001
     * @tc.number SUB_WEB_ERRORCODE_PAGEUP_0100
     * @tc.desc   test pageUp error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageUpError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(4000);
      Utils.emitEvent("testPageUpError001", 10)
      await Utils.msSleep(5000);
      Utils.registerEvent("testPageUpError001", "17100001", 20265, done);
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testPageUpError002
     * @tc.number SUB_WEB_ERRORCODE_PAGEUP_0200
     * @tc.desc   test pageUp error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPageUpError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageUpError002", 10)
      await Utils.msSleep(5000);
      Utils.registerEvent("testPageUpError002", "17100001", 20266, done);
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testPageDownError001
     * @tc.number SUB_WEB_ERRORCODE_PAGEDOWN_0100
     * @tc.desc   test pageDown error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPageDownError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageDownError001", 10)
      await Utils.msSleep(5000);
      Utils.registerEvent("testPageDownError001", "17100001", 20270, done);
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testPageDownError002
     * @tc.number SUB_WEB_ERRORCODE_PAGEDOWN_0200
     * @tc.desc   test pageDown error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPageDownError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageDownError002", 10)
      await Utils.msSleep(5000);
      Utils.registerEvent("testPageDownError002", "17100001", 20271, done);
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0500
    * @tc.name       : SwitchNextPageStatic
    * @tc.desc       : test PAGE_REDIRECT
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
