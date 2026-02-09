/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
 
import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'

let TAG = '[testLog-ets]';
export default function pasteboardNdkTest() {
  describe('pasteboardNdkTest', async (done: Function) => {
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0100
     * @tc.desc   OH_UdmfData_GetPrimaryPlainText_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0100', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryPlainText_0001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0100 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0200
     * @tc.desc   OH_UdmfData_GetPrimaryPlainText_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0200', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryPlainText_0003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0200 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0300
     * @tc.desc   OH_UdmfData_GetPrimaryPlainText_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0300', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryPlainText_0005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0300 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0400
     * @tc.desc   OH_UdmfData_GetPrimaryPlainText_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0400', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryPlainText_0006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0400 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0500
     * @tc.desc   OH_UdmfData_GetPrimaryPlainText_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0500', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryPlainText_0007();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0500 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0600
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0600
     * @tc.desc   OH_UdmfData_GetPrimaryHtml_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0600', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryHtml_0001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0600 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0700
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0700
     * @tc.desc   OH_UdmfData_GetPrimaryHtml_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0700', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryHtml_0003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0700 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0800
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0800
     * @tc.desc   OH_UdmfData_GetPrimaryHtml_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0800', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryHtml_0005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0800 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0900
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0900
     * @tc.desc   OH_UdmfData_GetPrimaryHtml_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0900', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryHtml_0006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_0900 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1000
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1000
     * @tc.desc   OH_UdmfData_GetPrimaryHtml_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1000', ' begin');
      let result = testNapi.OH_UdmfData_GetPrimaryHtml_0007();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1000 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1100
     * @tc.desc   OH_UdmfData_GetRecordCount001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1100', ' begin');
      let result = testNapi.OH_UdmfData_GetRecordCount001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1100 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1200
     * @tc.desc   OH_UdmfData_GetRecordCount003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1200', ' begin');
      let result = testNapi.OH_UdmfData_GetRecordCount003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1200 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1300
     * @tc.desc   OH_UdmfData_GetRecordCount004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1300', ' begin');
      let result = testNapi.OH_UdmfData_GetRecordCount004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1300 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1400
     * @tc.desc   OH_UdmfData_GetRecordCount005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1400', ' begin');
      let result = testNapi.OH_UdmfData_GetRecordCount005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1400 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1500
     * @tc.desc   OH_UdmfData_GetRecord001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1500', ' begin');
      let result = testNapi.OH_UdmfData_GetRecord001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1500 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1600
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1600
     * @tc.desc   OH_UdmfData_GetRecord004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1600', ' begin');
      let result = testNapi.OH_UdmfData_GetRecord004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1600 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1700
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1700
     * @tc.desc   OH_UdmfData_GetRecord005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1700', ' begin');
      let result = testNapi.OH_UdmfData_GetRecord005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1700 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1800
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1800
     * @tc.desc   OH_UdmfData_GetRecord006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1800', ' begin');
      let result = testNapi.OH_UdmfData_GetRecord006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1800 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1900
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1900
     * @tc.desc   OH_UdmfData_GetRecord007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1900', ' begin');
      let result = testNapi.OH_UdmfData_GetRecord007();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_1900 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2000
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2000
     * @tc.desc   OH_UdmfData_GetRecord008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2000', ' begin');
      let result = testNapi.OH_UdmfData_GetRecord008();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2000 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2100
     * @tc.desc   OH_UdmfData_GetRecord009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2100', ' begin');
      let result = testNapi.OH_UdmfData_GetRecord009();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2100 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2200
     * @tc.desc   OH_UdmfData_GetRecord010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2200', ' begin');
      let result = testNapi.OH_UdmfData_GetRecord010();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2200 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2300
     * @tc.desc   OH_UdmfData_GetRecord011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2300', ' begin');
      let result = testNapi.OH_UdmfData_GetRecord011();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2300 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2400
     * @tc.desc   OH_UdmfData_IsLocal001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2400', ' begin');
      let result = testNapi.OH_UdmfData_IsLocal001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2400 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2500
     * @tc.desc   OH_UdmfData_IsLocal003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2500', ' begin');
      let result = testNapi.OH_UdmfData_IsLocal003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2500 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2600
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2600
     * @tc.desc   OH_UdmfRecord_AddArrayBuffer001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2600', ' begin');
      let result = testNapi.OH_UdmfRecord_AddArrayBuffer001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2600 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2700
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2700
     * @tc.desc   OH_UdmfRecord_AddArrayBuffer003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2700', ' begin');
      let result = testNapi.OH_UdmfRecord_AddArrayBuffer003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2700 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2800
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2800
     * @tc.desc   OH_UdmfRecord_AddArrayBuffer005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2800', ' begin');
      let result = testNapi.OH_UdmfRecord_AddArrayBuffer005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2800 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2900
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2900
     * @tc.desc   OH_UdmfRecord_AddArrayBuffer006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2900', ' begin');
      let result = testNapi.OH_UdmfRecord_AddArrayBuffer006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_2900 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3000
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3000
     * @tc.desc   OH_UdmfRecord_AddArrayBuffer007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3000', ' begin');
      let result = testNapi.OH_UdmfRecord_AddArrayBuffer007();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3000 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3100
     * @tc.desc   OH_UdmfRecord_AddArrayBuffer008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3100', ' begin');
      let result = testNapi.OH_UdmfRecord_AddArrayBuffer008();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3100 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3200
     * @tc.desc   OH_UdmfRecord_GetArrayBuffer001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3200', ' begin');
      let result = testNapi.OH_UdmfRecord_GetArrayBuffer001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3200 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3300
     * @tc.desc   OH_UdmfRecord_GetArrayBuffer002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3300', ' begin');
      let result = testNapi.OH_UdmfRecord_GetArrayBuffer002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3300 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3400
     * @tc.desc   OH_UdsArrayBuffer_Create_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3400', ' begin');
      let result = testNapi.OH_UdsArrayBuffer_Create_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3400 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3500
     * @tc.desc   OH_UdsArrayBuffer_SetData_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3500', ' begin');
      let result = testNapi.OH_UdsArrayBuffer_SetData_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3500 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3600
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3600
     * @tc.desc   OH_UdsArrayBuffer_SetData_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3600', ' begin');
      let result = testNapi.OH_UdsArrayBuffer_SetData_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3600 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3700
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3700
     * @tc.desc   OH_UdsArrayBuffer_SetData_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3700', ' begin');
      let result = testNapi.OH_UdsArrayBuffer_SetData_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3700 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3800
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3800
     * @tc.desc   OH_UdsArrayBuffer_SetData_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3800', ' begin');
      let result = testNapi.OH_UdsArrayBuffer_SetData_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3800 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3900
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3900
     * @tc.desc   OH_UdsArrayBuffer_SetData_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3900', ' begin');
      let result = testNapi.OH_UdsArrayBuffer_SetData_005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_3900 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4000
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4000
     * @tc.desc   OH_UdsArrayBuffer_GetData001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4000', ' begin');
      let result = testNapi.OH_UdsArrayBuffer_GetData001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4000 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4100
     * @tc.desc   OH_UdmfRecord_GetFileUri001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4100', ' begin');
      let result = testNapi.OH_UdmfRecord_GetFileUri001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4100 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4200
     * @tc.desc   OH_UdmfRecord_GetFileUri002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4200', ' begin');
      let result = testNapi.OH_UdmfRecord_GetFileUri002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4200 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4300
     * @tc.desc   OH_UdmfRecord_GetFileUri003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4300', ' begin');
      let result = testNapi.OH_UdmfRecord_GetFileUri003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4300 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4400
     * @tc.desc   OH_UdmfRecord_GetPixelMap001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4400', ' begin');
      let result = testNapi.OH_UdmfRecord_GetPixelMap001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4400 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4500
     * @tc.desc   OH_UdmfRecord_GetPixelMap002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4500', ' begin');
      let result = testNapi.OH_UdmfRecord_GetPixelMap002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4500 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4600
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4600
     * @tc.desc   OH_UdmfRecord_GetPixelMap003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4600', ' begin');
      let result = testNapi.OH_UdmfRecord_GetPixelMap003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4600 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4700
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4700
     * @tc.desc   OH_UdsFileUri_Create001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4700', ' begin');
      let result = testNapi.OH_UdsFileUri_Create001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4700 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4800
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4800
     * @tc.desc   OH_UdsFileUri_GetType001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4800', ' begin');
      let result = testNapi.OH_UdsFileUri_GetType001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4800 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4900
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4900
     * @tc.desc   OH_UdsFileUri_GetType002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4900', ' begin');
      let result = testNapi.OH_UdsFileUri_GetType002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_4900 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5000
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5000
     * @tc.desc   OH_UdsFileUri_GetFileUri001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5000', ' begin');
      let result = testNapi.OH_UdsFileUri_GetFileUri001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5000 key is : ' + result, 'aa');
    })

    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5100
     * @tc.desc   OH_UdsFileUri_GetFileUri002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5100', ' begin');
      let result = testNapi.OH_UdsFileUri_GetFileUri002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5000 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5300
     * @tc.desc   OH_UdsFileUri_GetFileType001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5300', ' begin');
      let result = testNapi.OH_UdsFileUri_GetFileType001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5300 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5400
     * @tc.desc   OH_UdsFileUri_GetFileType002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5400', ' begin');
      let result = testNapi.OH_UdsFileUri_GetFileType002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5400 key is : ' + result, 'aa');
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5500
     * @tc.desc   OH_UdsFileUri_SetFileUri_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5500', ' begin');
      let result = testNapi.OH_UdsFileUri_SetFileUri_0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5500 result= : ' + JSON.stringify(result));
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5600
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5600
     * @tc.desc   OH_UdsFileUri_SetFileType_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5600', ' begin');
      let result = testNapi.OH_UdsFileUri_SetFileType_0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5600 result= : ' + JSON.stringify(result));
    })
    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5700
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5700
     * @tc.desc   OH_UdsPixelMap_Create_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5700', ' begin');
      let result = testNapi.OH_UdsPixelMap_Create_0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5700 result= : ' + JSON.stringify(result));
    })


    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5800
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5800
     * @tc.desc   OH_UdsPixelMap_GetType_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5800', ' begin');
      let result = testNapi.OH_UdsPixelMap_GetType_0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5800 result= : ' + JSON.stringify(result));
    })

    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5900
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5900
     * @tc.desc   OH_UdsPixelMap_SetPixelMap_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5900', ' begin');
      let result = testNapi.OH_UdsPixelMap_GetType_0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_5900 result= : ' + JSON.stringify(result));
    })


    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6000
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6000
     * @tc.desc   OH_UdmfRecordProvider_Destroy0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6000', ' begin');
      let result = testNapi.OH_UdmfRecordProvider_Destroy0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6000 result= : ' + JSON.stringify(result));
    })



    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6100
     * @tc.desc   OH_UdmfRecordProvider_Destroy0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6100', ' begin');
      let result = testNapi.OH_UdmfRecordProvider_Destroy0200();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6100 result= : ' + JSON.stringify(result));
    })

    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6200
     * @tc.desc   OH_UdmfRecordProvider_Create001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6200', ' begin');
      let result = testNapi.OH_UdmfRecordProvider_Create0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6200 result= : ' + JSON.stringify(result));
    })




    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6300
     * @tc.desc   OH_UdmfRecordProvider_SetData0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6300', ' begin');
      let result = testNapi.OH_UdmfRecordProvider_SetData0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6300 result= : ' + JSON.stringify(result));
    })



    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6400
     * @tc.desc   OH_UdmfRecordProvider_SetData0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6400', ' begin');
      let result = testNapi.OH_UdmfRecordProvider_SetData0200();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6400 result= : ' + JSON.stringify(result));
    })


    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6500
     * @tc.desc   OH_UdmfRecord_SetProvider0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6500', ' begin');
      let result = testNapi.OH_UdmfRecord_SetProvider0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6500 result= : ' + JSON.stringify(result));
    })


    /**
     * @tc.name   SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6600
     * @tc.number SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6600
     * @tc.desc   OH_UdmfRecord_SetProvider0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6600', ' begin');
      let result = testNapi.OH_UdmfRecord_SetProvider0200();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG,
        TAG + 'SUB_DistributedData_Pasteboard_SDK_PasteboardUdmfNdkAPITest_6600 result= : ' + JSON.stringify(result));
    })
  })
}