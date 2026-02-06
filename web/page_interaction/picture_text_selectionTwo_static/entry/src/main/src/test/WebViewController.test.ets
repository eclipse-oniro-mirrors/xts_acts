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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import webview from '@ohos.web.webview'

let testAbilityContext:common.UIAbilityContext;

export default function webViewController() {

  describe('WebViewControllerTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void=> {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.pageInteractionTwo.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });


    /**
     * @tc.name   testHistoryItemIconStatic001
     * @tc.number SUB_WEB_HISTORYITEM_ICON_0100
     * @tc.desc   test HistoryItem icon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHistoryItemIconStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testHistoryItemIcon001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testHistoryItemIcon001", true, 31023, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testHistoryItemHistoryUrlStatic001
     * @tc.number SUB_WEB_HISTORYITEM_HISTORYURL_0100
     * @tc.desc   test HistoryItem historyUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHistoryItemHistoryUrlStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testHistoryItemHistoryUrl001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testHistoryItemHistoryUrl001", "resource://rawfile/HistoryItem.html", 31024, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testHistoryRawUrlStatic001
     * @tc.number SUB_WEB_HISTORYITEM_HISTORYRAWURL_0100
     * @tc.desc   test HistoryItem historyRawUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHistoryRawUrlStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testHistoryRawUrl001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testHistoryRawUrl001", "resource://rawfile/HistoryItem.html", 31025, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testHistoryItemTitleStatic001
     * @tc.number SUB_WEB_HISTORYITEM_TITLE_0100
     * @tc.desc   test HistoryItem title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHistoryItemTitleStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testHistoryItemTitle001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testHistoryItemTitle001", "index", 31026, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
  })
}
