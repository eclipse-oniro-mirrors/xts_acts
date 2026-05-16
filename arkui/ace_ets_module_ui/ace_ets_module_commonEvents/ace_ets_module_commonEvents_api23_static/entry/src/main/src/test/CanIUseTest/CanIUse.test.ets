/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, Level } from '../../../../hypium/index';
import { UtilsTest } from '../Util.test';
import { canIUse } from '@internal.full.global';

export default function CanIUseTest() {
  describe('CanIUseTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] CanIUseTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.common.componentSnapshot.static", "EntryAbility");
    });

    /**
     * @tc.number CanIUseTest_001
     * @tc.name canIUseSystemCapabilityArkUIFull
     * @tc.desc Test canIUse with SystemCapability.ArkUI.ArkUI.Full, expect true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('canIUseSystemCapabilityArkUIFull', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CanIUseTest execute: canIUseSystemCapabilityArkUIFull START');
      try {
        const result:boolean = canIUse('SystemCapability.ArkUI.ArkUI.Full');
        expect(result).assertEqual(true);
        console.info('[ARKUI_NEW] CanIUseTest execute: canIUseSystemCapabilityArkUIFull END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CanIUseTest execute: canIUseSystemCapabilityArkUIFull error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanIUseTest_002
     * @tc.name canIUseEmptyString
     * @tc.desc Test canIUse with empty string, expect false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('canIUseEmptyString', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CanIUseTest execute: canIUseEmptyString START');
      try {
        const result:boolean = canIUse('');
        expect(result).assertEqual(false);
        console.info('[ARKUI_NEW] CanIUseTest execute: canIUseEmptyString END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CanIUseTest execute: canIUseEmptyString error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
