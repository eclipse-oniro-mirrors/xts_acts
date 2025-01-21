/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium'
import entry from 'libentry.so'

export default function oHPrintTest() {
  describe('OHPrintTest', () => {
    /**
     * @tc.number     : SUB_PRINT_FWK_OH_PRINT_TEST_0100
     * @tc.name       : testOHPrint001
     * @tc.desc       : test oHPrintInit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHPrint001', 0, async () => {
      let result: number = await entry.oHPrintInit();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_PRINT_TEST_0200
     * @tc.name       : testOHPrint002
     * @tc.desc       : test oHPrintListener
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHPrint002', 0, async () => {
      let result: number = await entry.oHPrintListener();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_PRINT_TEST_0300
     * @tc.name       : testOHPrint003
     * @tc.desc       : test oHPrintDiscovery
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHPrint003', 0, async () => {
      let result: number = await entry.oHPrintDiscovery();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_PRINT_TEST_0400
     * @tc.name       : testOHPrint004
     * @tc.desc       : test oHPrintConnect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHPrint004', 0, async () => {
      let result: number = await entry.oHPrintConnect();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_PRINT_TEST_0500
     * @tc.name       : testOHPrint005
     * @tc.desc       : test oHPrintJob
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHPrint005', 0, async () => {
      let result: number = await entry.oHPrintJob();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_PRINT_TEST_0600
     * @tc.name       : testOHPrint006
     * @tc.desc       : test oHPrintList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHPrint006', 0, async () => {
      let result: number = await entry.oHPrintList();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_PRINT_TEST_0700
     * @tc.name       : testOHPrint007
     * @tc.desc       : test oHPrintInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHPrint007', 0, async () => {
      let result: number = await entry.oHPrintInfo();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_PRINT_TEST_0800
     * @tc.name       : testOHPrint008
     * @tc.desc       : test oHPrintProperty
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHPrint008', 0, async () => {
      let result: number = await entry.oHPrintProperty();
      expect(result).assertEqual(0);
    });
  })
}