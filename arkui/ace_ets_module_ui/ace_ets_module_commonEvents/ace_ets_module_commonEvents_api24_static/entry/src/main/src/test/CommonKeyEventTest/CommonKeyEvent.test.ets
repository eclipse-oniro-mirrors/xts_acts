'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, beforeAll, beforeEach } from '../../../../hypium/index';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { waitForMainRouterForStaticTest } from '../../../ets/MainAbility/common/UIContextStaticTestBridge';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@kit.TestKit';

export default function CommonKeyEventTest(): void {
  describe('CommonKeyEventTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.commonEvents.api24.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let r = await waitForMainRouterForStaticTest();
      expect(r !== undefined && r !== null).assertTrue();
      let ro: router.RouterOptions = { url: 'MainAbility/pages/CommonKeyEventProbe/CommonKeyEventProbe' };
      r!.clear();
      await r!.replaceUrl(ro);
      await Utils.sleep(600);
    });

    const focusInputAndCommitText = async (): Promise<void> => {
      const driver = Driver.create();
      let host = await driver.findComponent(ON.id('commonKeyHost'));
      if (host === undefined || host === null) {
        host = await driver.findComponent(ON.hint('key probe'));
      }
      if (host === undefined || host === null) {
        host = await driver.findComponent(ON.type('TextInput'));
      }
      let hostOk: boolean = host != undefined && host != null;
      expect(hostOk).assertTrue();
      if (host != undefined && host != null) {
        await host.click();
        await host.inputText('K');
      }
      await Utils.sleep(400);
    };

    /**
     * @tc.number SUB_ArkUI_Common_KeyEvent_IsNumLockOn_2900
     * @tc.name SUB_ArkUI_Common_KeyEvent_IsNumLockOn_2900
     * @tc.desc KeyEvent.isNumLockOn：真实 TextInput.onKeyEvent 命中后读取字段
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_KeyEvent_IsNumLockOn_2900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await focusInputAndCommitText();
      expect(AppStorage.get<string>('ke_any')).assertEqual('1');
      let n = AppStorage.get<string>('ke_numlock');
      expect(n === '0' || n === '1').assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Common_KeyEvent_IsCapsLockOn_3000
     * @tc.name SUB_ArkUI_Common_KeyEvent_IsCapsLockOn_3000
     * @tc.desc KeyEvent.isCapsLockOn：真实 onKeyEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_KeyEvent_IsCapsLockOn_3000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await focusInputAndCommitText();
      expect(AppStorage.get<string>('ke_any')).assertEqual('1');
      let c = AppStorage.get<string>('ke_capslock');
      let capsOk: boolean = c === '0' || c === '1';
      expect(capsOk).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Common_KeyEvent_IsScrollLockOn_3100
     * @tc.name SUB_ArkUI_Common_KeyEvent_IsScrollLockOn_3100
     * @tc.desc KeyEvent.isScrollLockOn：真实 onKeyEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_KeyEvent_IsScrollLockOn_3100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await focusInputAndCommitText();
      expect(AppStorage.get<string>('ke_any')).assertEqual('1');
      let s = AppStorage.get<string>('ke_scrolllock');
      let scrollOk: boolean = s === '0' || s === '1';
      expect(scrollOk).assertTrue();
      done();
    });
  });
}
