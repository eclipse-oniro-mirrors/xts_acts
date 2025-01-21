/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import pasteboard from '@ohos.pasteboard';
import {BusinessError} from '@ohos.base'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel'
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor'

const TAG = 'ttt';
let systemPasteboard:pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();

export default function PasteboardUnifiedTest() {
  describe('PasteboardUnifiedTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
      systemPasteboard.clearDataSync();
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name testSUBDistributedDataPasteboardApiCompatibility0100
     * @tc.number SUB_Pasteboard_Local_Fun_ApiCompatibility_1900
     * @tc.desc setUnifiedData getUnifiedData interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PasteboardSetUnifiedData_0100', 0, async () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      plainText.details = {
        Key:'delayPlaintext',
        Value:'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.abstract = 'abstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      expect(result).assertFalse();
      await systemPasteboard.setUnifiedData(plainTextData).then((data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((error:BusinessError)=>{
        console.info(TAG + 'Failed to set UnifiedData.Cause' + error.message);
        expect().assertFail();
      })

      await systemPasteboard.getUnifiedData().then((data) => {
        let outputData = data;
        let records = outputData.getRecords();
        if(records[0].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT){
          let record = records[0] as unifiedDataChannel.PlainText;
          expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
          console.info(TAG + 'Get Plain Text Unified Data Success, type: ' + records[0].getType() + 'details:' + JSON.stringify(record.details));
        } else {
          console.info(TAG + 'Get Plain Text Data No Success, Type:' + records[0].getType());
          expect().assertFail();
        }
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get Plain Text Unified Data Fail:' + error);
        expect().assertFail();
      })
    })

    /**
     * @tc.name testSUBDistributedDataPasteboardApiCompatibility0200
     * @tc.number SUB_Pasteboard_Local_Fun_ApiCompatibility_2000
     * @tc.desc setUnifiedDataSync getUnifiedDataSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PasteboardSetUnifiedData_0200', 0, async () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      plainText.details = {
        Key:'delayPlaintext',
        Value:'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.abstract = 'abstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      expect(result).assertFalse();
      try {
        await systemPasteboard.setUnifiedDataSync(plainTextData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      } catch (error){
        console.info(TAG + 'Failed To Set UnifiedData.Cause:' + error.message);
        expect().assertFail();
      }
      try {
        let data:unifiedDataChannel.UnifiedData = await systemPasteboard.getUnifiedDataSync();
        let outputData = data;
        let records = outputData.getRecords();
        if(records[0].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT){
          let record = records[0] as unifiedDataChannel.PlainText;
          expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
          console.info(TAG + 'Get Plain Text UnifiedData Success, type:' + records[0].getType() + 'details:' + JSON.stringify(record.details));
        } else {
          console.info(TAG + 'Get Plain Text Data No Success,type:' + records[0].getType());
          expect().assertFail();
        }
      } catch (error){
        console.info(TAG + 'Get Plain Text UnifiedData Fail:' + error);
        expect().assertFail();
      }
    })

    /**
     * @tc.name testSUBDistributedDataPasteboardApiCompatibility0300
     * @tc.number SUB_Pasteboard_Local_Fun_ApiCompatibility_2100
     * @tc.desc setUnifiedData getUnifiedDataSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("PasteboardSetUnifiedData_0300", 0, async () =>{
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      plainText.details = {
        Key:'delayPlaintext',
        Value:'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.abstract = 'abstract';
      plainTextData.addRecord(plainText);
      let result = systemPasteboard.hasDataSync();
      expect(result).assertFalse();
      await systemPasteboard.setUnifiedData(plainTextData).then(async (data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
        try {
          let data: unifiedDataChannel.UnifiedData = await systemPasteboard.getUnifiedDataSync();
          let  outputData = data;
          let records = outputData.getRecords();
          if (records[0].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
            let record = records[0] as unifiedDataChannel.PlainText;
            expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
            console.info(TAG + 'Get Plain Text UnifiedData Success, type:' + records[0].getType() + 'details:' + JSON.stringify(record.details));
          } else {
            console.info(TAG + 'Get Text Unified Data No Success, Type:' + records[0].getType());
            expect().assertFail();
          }
        } catch (error){
          console.info(TAG + 'Get Text Unified Data Fail:' + error);
          expect().assertFail();
        }
      }).catch((err:BusinessError) => {
        console.info(TAG + 'Failed To Set UnifiedData.Cause:' + err.message);
        expect().assertFail();
      })
    })

    /**
     * @tc.name testSUBDistributedDataPasteboardApiCompatibility0400
     * @tc.number SUB_Pasteboard_Local_Fun_ApiCompatibility_2200
     * @tc.desc setUnifiedDataSync getUnifiedData interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("PasteboardSetUnifiedData_0400", 0, async () =>{
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      plainText.details = {
        Key:'delayPlaintext',
        Value:'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.abstract = 'abstract';
      plainTextData.addRecord(plainText);
      let result = systemPasteboard.hasDataSync();
      expect(result).assertFalse();
      try {
        await systemPasteboard.setUnifiedDataSync(plainTextData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      } catch (error){
        console.info(TAG + 'Failed To Set UnifiedData.Cause:' + error.message);
        expect().assertFail();
      }
      await systemPasteboard.getUnifiedData().then((data) => {
        let outputData = data;
        let records = outputData.getRecords();
        if(records[0].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT){
          let record = records[0] as unifiedDataChannel.PlainText;
          expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
          console.info(TAG + 'Get Plain Text Unified Data Success, type: ' + records[0].getType() + 'details:' + JSON.stringify(record.details));
        } else {
          console.info(TAG + 'Get Plain Text Data No Success, Type:' + records[0].getType());
          expect().assertFail();
        }
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get Plain Text Unified Data Fail:' + error);
        expect().assertFail();
      })
    })
  })
}