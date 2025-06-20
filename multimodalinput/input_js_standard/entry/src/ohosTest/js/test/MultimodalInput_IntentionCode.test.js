/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import intentionCode from '@ohos.multimodalInput.intentionCode';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
export default function MultimodalInput_IntentionCode_test() {
  describe('MultimodalInput_IntentionCode_test', function () {

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_001', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_001 enter`);

      expect(intentionCode.IntentionCode.INTENTION_UNKNOWN == -1).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_001 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_002', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_002 enter`);

      expect(intentionCode.IntentionCode.INTENTION_UP == 1).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_002 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_003', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_003 enter`);

      expect(intentionCode.IntentionCode.INTENTION_DOWN == 2).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_003 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_004', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_004 enter`);

      expect(intentionCode.IntentionCode.INTENTION_LEFT == 3).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_004 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_005', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_005 enter`);

      expect(intentionCode.IntentionCode.INTENTION_RIGHT == 4).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_005 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_006', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_006 enter`);

      expect(intentionCode.IntentionCode.INTENTION_SELECT == 5).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_006 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_007', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_007 enter`);

      expect(intentionCode.IntentionCode.INTENTION_ESCAPE == 6).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_007 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_008', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_008 enter`);

      expect(intentionCode.IntentionCode.INTENTION_BACK == 7).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_008 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_009', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_009 enter`);

      expect(intentionCode.IntentionCode.INTENTION_FORWARD == 8).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_009 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_010', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_010 enter`);

      expect(intentionCode.IntentionCode.INTENTION_MENU == 9).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_010 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_011', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_011 enter`);

      expect(intentionCode.IntentionCode.INTENTION_PAGE_UP == 11).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_011 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_012', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_012 enter`);

      expect(intentionCode.IntentionCode.INTENTION_PAGE_DOWN == 12).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_012 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_013', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_013 enter`);

      expect(intentionCode.IntentionCode.INTENTION_ZOOM_OUT == 13).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_013 exit`);
    })

    it('Multimodalinput_IntentionCode_SUB_MMI_IntentionCodeTest_014', 0, function () {
      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_014 enter`);

      expect(intentionCode.IntentionCode.INTENTION_ZOOM_IN == 14).assertTrue();

      console.info(`Multimodalinput_IntentionCode_test_SUB_MMI_IntentionCodeTest_014 exit`);
    })
  })
}

