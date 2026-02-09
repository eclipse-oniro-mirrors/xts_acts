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

import common from '@ohos.app.ability.common';
import { describe, expect, it, Level } from '@ohos/hypium'
import entry from 'libentry.so'

export default function oHPrintTest() {
  describe('OHPrintTest', () => {
    /**
     * @tc.name   testOHPrint001
     * @tc.number SUB_PRINT_FWK_OH_PRINT_TEST_0100
     * @tc.desc   test oHPrintInit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHPrint001', Level.LEVEL1, async () => {
      let result: number = await entry.oHPrintInit();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHPrint002
     * @tc.number SUB_PRINT_FWK_OH_PRINT_TEST_0200
     * @tc.desc   test oHPrintListener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHPrint002', Level.LEVEL1, async () => {
      let result: number = await entry.oHPrintListener();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHPrint003
     * @tc.number SUB_PRINT_FWK_OH_PRINT_TEST_0300
     * @tc.desc   test oHPrintDiscovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHPrint003', Level.LEVEL1, async () => {
      let result: number = await entry.oHPrintDiscovery();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHPrint004
     * @tc.number SUB_PRINT_FWK_OH_PRINT_TEST_0400
     * @tc.desc   test oHPrintConnect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHPrint004', Level.LEVEL1, async () => {
      let result: number = await entry.oHPrintConnect();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHPrint005
     * @tc.number SUB_PRINT_FWK_OH_PRINT_TEST_0500
     * @tc.desc   test oHPrintJob
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHPrint005', Level.LEVEL1, async () => {
      let result: number = await entry.oHPrintJob();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHPrint006
     * @tc.number SUB_PRINT_FWK_OH_PRINT_TEST_0600
     * @tc.desc   test oHPrintList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHPrint006', Level.LEVEL1, async () => {
      let result: number = await entry.oHPrintList();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHPrint007
     * @tc.number SUB_PRINT_FWK_OH_PRINT_TEST_0700
     * @tc.desc   test oHPrintInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHPrint007', Level.LEVEL1, async () => {
      let result: number = await entry.oHPrintInfo();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHPrint008
     * @tc.number SUB_PRINT_FWK_OH_PRINT_TEST_0800
     * @tc.desc   test oHPrintProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHPrint008', Level.LEVEL1, async () => {
      let result: number = await entry.oHPrintProperty();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHPrint009
     * @tc.number SUB_PRINT_FWK_OH_PRINT_TEST_0900
     * @tc.desc   test oHPrintStartPrintByNative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHPrint009', Level.LEVEL1, async () => {
      let context = AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;
      let result: number = await entry.oHPrintStartPrintByNative(context);
      expect(result).assertEqual(0);
    });
  })
}