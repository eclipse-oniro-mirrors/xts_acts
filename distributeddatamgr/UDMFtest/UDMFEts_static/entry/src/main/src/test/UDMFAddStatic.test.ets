/**
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { image } from '@kit.ImageKit';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
let tag: string = 'testTag';
let optionsValid: unifiedDataChannel.Options = {
  intention: unifiedDataChannel.Intention.DATA_HUB
};

export default function UDMFAddApiStaticTest() {
  describe("UDMFAddApiStaticTest", (): void => {
    beforeAll(() => {	 
      console.info("beforeAll");	 
      unifiedDataChannel.deleteData(optionsValid).then((data: Array<unifiedDataChannel.UnifiedData>) => {	 
        let size = data.length;	 
        console.info(` [beforeAll] success to deleteData data.size = ${size}`);	 
      }).catch((error) => {	 
        let err: BusinessError = error as BusinessError;	 
        console.info(` [beforeAll] Failed to deleteData. code is ${err.code},message is ${err.message} `);	 
      });	 
    })

    afterAll(() => { 
      console.info("afterAll"); 
      unifiedDataChannel.deleteData(optionsValid).then((data: Array<unifiedDataChannel.UnifiedData>) => { 
        let size = data.length; 
        console.info(` [afterAll] success to deleteData data.size = ${size}`); 
      }).catch((error) => { 
        let err: BusinessError = error as BusinessError; 
        console.info(` [afterAll] Failed to deleteData. code is ${err.code},message is ${err.message} `); 
      }); 
    })

    /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFHasTypeStaticTest_0100
         * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFHasTypeStaticTest_0100
         * @tc.desc   insertData insertData callback test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
    it('SUB_DistributedData_UDMF_SDK_UDMFHasTypeStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag, `SUB_DistributedData_UDMF_SDK_UDMFHasTypeStaticTest_0100 start`);
      let unifiedData = new unifiedDataChannel.UnifiedData()
      try {
        let result = unifiedData.hasType('');
        expect(result).assertEqual(false);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag, `SUB_DistributedData_UDMF_SDK_UDMFHasTypeStaticTest_0100 end`);
    })

    /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0100
         * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0100
         * @tc.desc   insertData insertData callback test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
    it('SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0100 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        key: '',
        visibility: unifiedDataChannel.Visibility.ALL
      }
      try {
        unifiedDataChannel.insertData(options, unifiedData, (err, key) => {
          console.log(tag, `Succeeded in inserting data. key = ${key}`);
          expect(key).assertContain('SystemShare/com.example.udmfetstest.static');
          console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0100 end');
          done();
        });
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Insert data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0200
         * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0200
         * @tc.desc   insertData insertData callback test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
    it('SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0200 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        key: '',
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      }
      try {
        unifiedDataChannel.insertData(options, unifiedData, (err, key) => {
          console.log(tag, `Succeeded in inserting data. key = ${key}`);
          expect(key).assertContain('SystemShare/com.example.udmfetstest.static');
          console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0200 end');
          done();
        });
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Insert data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0300
         * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0300
         * @tc.desc   insertData insertData callback test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
    it('SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0300 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        key: '',
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      }
      try {
        let key = await unifiedDataChannel.insertData(options, unifiedData);
        console.log(tag, `Succeeded in inserting data. key = ${key}`);
        expect(key).assertContain('SystemShare/com.example.udmfetstest.static');
        console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFInsertDataStaticTest_0300 end');
        done();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Insert data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0100
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0100
       * @tc.desc   insertData insertData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0100 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let updateOptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        key: key,
        visibility: unifiedDataChannel.Visibility.ALL
      }
      let plainTextUpdate: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent for update',
        textAbstract: 'This is a text abstract'
      }
      let textUpdate =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextUpdate);
      let unifiedDataUpdate = new unifiedDataChannel.UnifiedData(textUpdate);
      try {
        unifiedDataChannel.updateData(updateOptions, unifiedDataUpdate, (err) => {
          expect(err).assertEqual(null);
          console.log(tag, 'Succeeded in updating data.');
          console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0100 end');
          done();
        });
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Update data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0200
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0200
       * @tc.desc   insertData updateData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0200 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let updateOptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER,
        key: ''
      }
      let plainTextUpdate: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent for update',
        textAbstract: 'This is a text abstract'
      }
      let textUpdate =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextUpdate);
      let unifiedDataUpdate = new unifiedDataChannel.UnifiedData(textUpdate);
      try {
        unifiedDataChannel.updateData(updateOptions, unifiedDataUpdate, (err) => {
          if (err !== null) {
            let error = err as BusinessError;
            console.log(tag, `err code is ${error.code}, message is ${error.message}`);
            expect(error.code).assertEqual(401);
            console.log(tag, "SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0200 end");
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Update data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0300
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0300
       * @tc.desc   insertData updateData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0300 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let updateOptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU,
        key: key,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      }
      let plainTextUpdate: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent for update',
        textAbstract: 'This is a text abstract'
      }
      let textUpdate =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextUpdate);
      let unifiedDataUpdate = new unifiedDataChannel.UnifiedData(textUpdate);
      try {
        unifiedDataChannel.updateData(updateOptions, unifiedDataUpdate, (err) => {
          expect(err).assertEqual(null);
          console.log(tag, 'Succeeded in updating data.');
          console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0300 end');
          done();
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Update data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0400
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0400
       * @tc.desc   insertData insertData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0400 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let updateOptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER,
        key: key
      }
      let plainTextUpdate: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent for update',
        textAbstract: 'This is a text abstract'
      }
      let textUpdate =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextUpdate);
      let unifiedDataUpdate = new unifiedDataChannel.UnifiedData(textUpdate);
      try {
        unifiedDataChannel.updateData(updateOptions, unifiedDataUpdate, (err) => {
          expect(err).assertEqual(null);
          console.log(tag, 'Succeeded in updating data.');
          console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0400 end');
          done();
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Update data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0500
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0500
       * @tc.desc   insertData insertData promise test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0500 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let updateOptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DRAG,
        key: key
      }
      let plainTextUpdate: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent for update',
        textAbstract: 'This is a text abstract'
      }
      let textUpdate =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextUpdate);
      let unifiedDataUpdate = new unifiedDataChannel.UnifiedData(textUpdate);
      try {
        unifiedDataChannel.updateData(updateOptions, unifiedDataUpdate);
        console.log(tag, 'Succeeded in updating data.');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Update data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0500 end');
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0600
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0600
       * @tc.desc   insertData insertData promise test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0600 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let updateOptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        key: key
      }
      let plainTextUpdate: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent for update',
        textAbstract: 'This is a text abstract'
      }
      let textUpdate =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextUpdate);
      let unifiedDataUpdate = new unifiedDataChannel.UnifiedData(textUpdate);
      try {
        unifiedDataChannel.updateData(updateOptions, unifiedDataUpdate);
        console.log(tag, 'Succeeded in updating data.');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Update data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0600 end');
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0700
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0700
       * @tc.desc   insertData insertData promise test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0700 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let updateOptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        key: ''
      }
      let plainTextUpdate: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent for update',
        textAbstract: 'This is a text abstract'
      }
      let textUpdate =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextUpdate);
      let unifiedDataUpdate = new unifiedDataChannel.UnifiedData(textUpdate);
      try {
        unifiedDataChannel.updateData(updateOptions, unifiedDataUpdate);
        console.log(tag, 'Succeeded in updating data.');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Update data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFUpdateDataStaticTest_0700 end');
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0100
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFQueryDataDataStaticTest_0100
       * @tc.desc   insertData queryData promise test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0100 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let querydataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        key: key,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      try {
        let ret = await unifiedDataChannel.queryData(querydataoptions);
        let size = ret.length;
        console.log(tag, `data.size = ${size}`);
        for (let i = 0; i < size; i++) {
          let records = ret[i].getRecords();
          let size = records.length;
          for (let j = 0; j < size; j++) {
            if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
              const text = records[j].getValue() as uniformDataStruct.PlainText;
              expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
              expect(text.textContent).assertEqual(plainText.textContent);
              expect(text.textAbstract).assertEqual(plainText.textAbstract);
              console.log(tag, ` queryData.result = ${i + 1}.${text.textContent}`);
            }
          }
        }
        await unifiedDataChannel.deleteData(querydataoptions);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `QueryData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0100 end');
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0200
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFQueryDataDataStaticTest_0200
       * @tc.desc   insertData queryData promise test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0200 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let querydataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER,
        key: key,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      try {
        let ret = await unifiedDataChannel.queryData(querydataoptions);
        let size = ret.length;
        console.log(tag, `data.size = ${size}`);
        for (let i = 0; i < size; i++) {
          let records = ret[i].getRecords();
          let size = records.length;
          for (let j = 0; j < size; j++) {
            if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
              const text = records[j].getValue() as uniformDataStruct.PlainText;
              expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
              expect(text.textContent).assertEqual(plainText.textContent);
              expect(text.textAbstract).assertEqual(plainText.textAbstract);
              console.log(tag, ` queryData.result = ${i + 1}.${text.textContent}`);
            }
          }
        }
        await unifiedDataChannel.deleteData(querydataoptions);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `QueryData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0200 end');
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0300
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFQueryDataDataStaticTest_0300
       * @tc.desc   insertData queryData promise test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0300 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let querydataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU,
        key: key
      };
      try {
        let ret = await unifiedDataChannel.queryData(querydataoptions);
        let size = ret.length;
        console.log(tag, `data.size = ${size}`);
        for (let i = 0; i < size; i++) {
          let records = ret[i].getRecords();
          let size = records.length;
          for (let j = 0; j < size; j++) {
            if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
              const text = records[j].getValue() as uniformDataStruct.PlainText;
              expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
              expect(text.textContent).assertEqual(plainText.textContent);
              expect(text.textAbstract).assertEqual(plainText.textAbstract);
              console.log(tag, ` queryData.result = ${i + 1}.${text.textContent}`);
            }
          }
        }
        await unifiedDataChannel.deleteData(querydataoptions);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `QueryData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0300 end');
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0400
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFQueryDataDataStaticTest_0400
       * @tc.desc   insertData queryData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0400 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let querydataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        key: key,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      try {
        unifiedDataChannel.queryData(querydataoptions, (err, ret) => {
          if (ret !== undefined) {
            let size = ret.length;
            console.log(tag, `data.size = ${size}`);
            expect(size > 0).assertTrue();
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (let j = 0; j < size; j++) {
                if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
                  const text = records[j].getValue() as uniformDataStruct.PlainText;
                  expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
                  expect(text.textContent).assertEqual(plainText.textContent);
                  expect(text.textAbstract).assertEqual(plainText.textAbstract);
                  console.log(tag, ` queryData.result = ${i + 1}.${text.textContent}`);
                  console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0400 end');
                }
              }
            }
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `QueryData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0500
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFQueryDataDataStaticTest_0500
       * @tc.desc   insertData queryData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0500 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let querydataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER,
        key: key,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      try {
        unifiedDataChannel.queryData(querydataoptions, (err, ret) => {
          if (ret !== undefined) {
            let size = ret.length;
            console.log(tag, `data.size = ${size}`);
            expect(size > 0).assertTrue();
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (let j = 0; j < size; j++) {
                if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
                  const text = records[j].getValue() as uniformDataStruct.PlainText;
                  expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
                  expect(text.textContent).assertEqual(plainText.textContent);
                  expect(text.textAbstract).assertEqual(plainText.textAbstract);
                  console.log(tag, ` queryData.result = ${i + 1}.${text.textContent}`);
                  console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0500 end');
                }
              }
            }
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `QueryData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0600
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFQueryDataDataStaticTest_0600
       * @tc.desc   insertData queryData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0600 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let querydataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU,
        key: key,
      };
      try {
        unifiedDataChannel.queryData(querydataoptions, (err, ret) => {
          if (ret !== undefined) {
            let size = ret.length;
            console.log(tag, `data.size = ${size}`);
            expect(size > 0).assertTrue();
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (let j = 0; j < size; j++) {
                if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
                  const text = records[j].getValue() as uniformDataStruct.PlainText;
                  expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
                  expect(text.textContent).assertEqual(plainText.textContent);
                  expect(text.textAbstract).assertEqual(plainText.textAbstract);
                  console.log(tag, ` queryData.result = ${i + 1}.${text.textContent}`);
                  console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0600 end');
                }
              }
            }
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `QueryData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done()
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0700
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFQueryDataDataStaticTest_0700
       * @tc.desc   insertData queryData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0700 start');
      let querydataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        key: 'udmf://DataHub/com.example.udmfetstest.static/fn8dCV3T1NZ;VX>AMWGG`uzlktZ?luYj'
      };
      try {
        unifiedDataChannel.queryData(querydataoptions, (err, ret) => {
          if (ret !== undefined) {
            let size = ret.length;
            console.log(tag, `data.size = ${size}`);
            expect(size).assertEqual(0);
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `QueryData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done()
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0800
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFQueryDataDataStaticTest_0800
       * @tc.desc   insertData queryData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFQueryDataStaticTest_0800 start');
      let querydataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        key: 'udmf://DataHub/com.example.udmfetstest.static/fn8dCV3T1NZ;VX>AMWGG`uzlktZ?luYj'
      };
      try {
        let ret = await unifiedDataChannel.queryData(querydataoptions)
        let size = ret.length;
        console.log(tag, `data.size = ${size}`);
        expect(size).assertEqual(0);
        done();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `QueryData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done()
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0100
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0100
       * @tc.desc   insertData deleteData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0100 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let deletedataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        key: key,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      try {
        unifiedDataChannel.deleteData(deletedataoptions, (err, ret) => {
          if (ret !== undefined) {
            let size = ret.length;
            console.log(tag, `data.size = ${size}`);
            expect(size > 0).assertTrue();
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (let j = 0; j < size; j++) {
                if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
                  const text = records[j].getValue() as uniformDataStruct.PlainText;
                  expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
                  expect(text.textContent).assertEqual(plainText.textContent);
                  expect(text.textAbstract).assertEqual(plainText.textAbstract);
                  console.log(tag, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0100 end');
                }
              }
            }
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Delete data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0200
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0200
       * @tc.desc   insertData deleteData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0200 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let deletedataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        key: key,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      try {
        unifiedDataChannel.deleteData(deletedataoptions, (err, ret) => {
          if (ret !== undefined) {
            let size = ret.length;
            console.log(tag, `data.size = ${size}`);
            expect(size > 0).assertTrue();
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (let j = 0; j < size; j++) {
                if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
                  const text = records[j].getValue() as uniformDataStruct.PlainText;
                  expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
                  expect(text.textContent).assertEqual(plainText.textContent);
                  expect(text.textAbstract).assertEqual(plainText.textAbstract);
                  console.log(tag, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0200 end');
                }
              }
            }
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Delete data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0300
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0300
       * @tc.desc   insertData deleteData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0300 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let deletedataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER,
        key: key,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      try {
        unifiedDataChannel.deleteData(deletedataoptions, (err, ret) => {
          if (ret !== undefined) {
            let size = ret.length;
            console.log(tag, `data.size = ${size}`);
            expect(size > 0).assertTrue();
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (let j = 0; j < size; j++) {
                if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
                  const text = records[j].getValue() as uniformDataStruct.PlainText;
                  expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
                  expect(text.textContent).assertEqual(plainText.textContent);
                  expect(text.textAbstract).assertEqual(plainText.textAbstract);
                  console.log(tag, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0300 end');
                }
              }
            }
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Delete data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0400
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0400
       * @tc.desc   insertData deleteData callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0400 start');
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is a plain text example',
        textAbstract: 'This is a text abstract'
      }
      let text = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
      let unifiedData = new unifiedDataChannel.UnifiedData(text);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU
      }
      let key = await unifiedDataChannel.insertData(options, unifiedData)
      let deletedataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU,
        key: key,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      try {
        unifiedDataChannel.deleteData(deletedataoptions, (err, ret) => {
          if (ret !== undefined) {
            let size = ret.length;
            console.log(tag, `data.size = ${size}`);
            expect(size > 0).assertTrue();
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (let j = 0; j < size; j++) {
                if (records[j].getType() == (uniformTypeDescriptor.UniformDataType.PLAIN_TEXT).toString()) {
                  const text = records[j].getValue() as uniformDataStruct.PlainText;
                  expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
                  expect(text.textContent).assertEqual(plainText.textContent);
                  expect(text.textAbstract).assertEqual(plainText.textAbstract);
                  console.log(tag, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0400 end');
                }
              }
            }
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Delete data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done();
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0500
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0500
       * @tc.desc   deletedata callback test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0500 start');
      let deletedataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        key: 'udmf://DataHub/com.example.udmfetstest.static/fn8dCV3T1NZ;VX>AMWGG`uzlktZ?luYj'
      };
      try {
        unifiedDataChannel.deleteData(deletedataoptions, (err, ret) => {
          if (ret !== undefined) {
            let size = ret.length;
            console.log(tag, `data.size = ${size}`);
            expect(size).assertEqual(0);
            done();
          }
        })
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `DeleteData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done()
      }
    })

    /**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0600
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0600
       * @tc.desc   deletedata promise test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
    it('SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFDeleteDataStaticTest_0600 start');
      let querydataoptions: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        key: 'udmf://DataHub/com.example.udmfetstest.static/fn8dCV3T1NZ;VX>AMWGG`uzlktZ?luYj'
      };
      try {
        let ret = await unifiedDataChannel.queryData(querydataoptions)
        let size = ret.length;
        console.log(tag, `data.size = ${size}`);
        expect(size).assertEqual(0);
        done();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `DeleteData data throws an exception. code is ${error.code}, message is ${error.message} `);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFBelongsToTest_0100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFBelongsToTest_0100
     * @tc.desc   Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFBelongsToTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFBelongsToTest_0100 start');
      let typeObj1 = uniformTypeDescriptor.getTypeDescriptor(uniformTypeDescriptor.UniformDataType.NAVIGATION);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo("")
        }
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFBelongsToTest_0100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFIsLowerLevelTypeTest_0100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFIsLowerLevelTypeTest_0100
     * @tc.desc   Invalid parameter to isLowerLevelType() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFIsLowerLevelTypeTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFBelongsToTest_0100 start');
      let typeObj1 = uniformTypeDescriptor.getTypeDescriptor(uniformTypeDescriptor.UniformDataType.NAVIGATION);
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType("")
        }
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFIsLowerLevelTypeTest_0100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFIsHigherLevelTypeTest_0100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFIsHigherLevelTypeTest_0100
     * @tc.desc   Invalid parameter to isHigherLevelType() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFIsHigherLevelTypeTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFIsHigherLevelTypeTest_0100 start');
      let typeObj1 = uniformTypeDescriptor.getTypeDescriptor(uniformTypeDescriptor.UniformDataType.TEXT);
      try {
        if (typeObj1) {
          let result = typeObj1.isHigherLevelType('')
        }
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFIsHigherLevelTypeTest_0100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFGetTypeDescriptorTest_0100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFGetTypeDescriptorTest_0100
     * @tc.desc   Invalid parameter to getTypeDescriptor().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFGetTypeDescriptorTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFGetTypeDescriptorTest_0100 start');

      try {
        let typeObj1 = uniformTypeDescriptor.getTypeDescriptor('');
        expect(typeObj1 == null).assertTrue();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFGetTypeDescriptorTest_0100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0100
     * @tc.desc   Invalid parameter to getTypeDescriptor().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0100 start');

      try {
        let typeObj1 = uniformTypeDescriptor.getUniformDataTypeByFilenameExtension(uniformTypeDescriptor.UniformDataType.TEXT, '');
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0200
     * @tc.desc   Invalid parameter to getTypeDescriptor().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0200 start');

      try {
        let typeObj1 = uniformTypeDescriptor.getUniformDataTypeByFilenameExtension(uniformTypeDescriptor.UniformDataType.TEXT, undefined);
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypeByFilenameExtensionTest_0200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0100
     * @tc.desc   Invalid parameter to getTypeDescriptor().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0100 start');

      try {
        let typeObj1 = uniformTypeDescriptor.getUniformDataTypesByFilenameExtension(uniformTypeDescriptor.UniformDataType.TEXT, '');
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0200
     * @tc.desc   Invalid parameter to getTypeDescriptor().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0200 start');

      try {
        let typeObj1 = uniformTypeDescriptor.getUniformDataTypesByFilenameExtension(uniformTypeDescriptor.UniformDataType.TEXT, undefined);
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByFilenameExtensionTest_0200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0100
     * @tc.desc   getUniformDataTypeByMIMEType paramter is "video/mp2t"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0100 start');
      try {
        let result = uniformTypeDescriptor.getUniformDataTypesByMIMEType("video/mp2t", '');
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log('SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0100 end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0200
     * @tc.desc   getUniformDataTypeByMIMEType paramter is "video/mp2t"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0200 start');
      try {
        let result = uniformTypeDescriptor.getUniformDataTypesByMIMEType("video/mp2t", undefined);
        expect(result).assertContain('general.ts');
        expect(result).assertContain('general.mp2t');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag, 'SUB_DistributedData_UDMF_SDK_UDMFGetUniformDataTypesByMIMETypeTest_0200 end');
    });

    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFDataTypeStaticTest_0100
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFDataTypeStaticTest_0100
    * @tc.desc   unifiedDataChannel data type interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFDataTypeStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFDataTypeStaticTest_0100 start');
      let text_0 = new unifiedDataChannel.Text();
      let textDetails: Record<string, string> = {
        "title": 'MyTitle',
        "content": 'This is content'
      };
      text_0.details = textDetails;
      expect(text_0.details!['title']).assertEqual('MyTitle');
      expect(text_0.details!['content']).assertEqual('This is content');

      let text = new unifiedDataChannel.PlainText();
      text.textContent = 'this is textContent';
      text.textAbstract = 'This is a text abstract';
      expect(text.textContent).assertEqual('this is textContent');
      expect(text.textAbstract).assertEqual('This is a text abstract');

      let link = new unifiedDataChannel.Hyperlink();
      link.url = 'www.XXX.com';
      link.description = 'This is description';
      expect(link.url).assertEqual('www.XXX.com');
      expect(link.description).assertEqual('This is description');

      let html = new unifiedDataChannel.HTML();
      html.htmlContent = '<div><p>标题</p></div>';
      html.plainContent = 'This is plainContent';
      expect(html.htmlContent).assertEqual('<div><p>标题</p></div>');
      expect(html.plainContent).assertEqual('This is plainContent');

      let file = new unifiedDataChannel.File();
      let title: Record<string, string> | undefined = {
        'name': 'test',
        'type': 'txt'
      }
      file.details = title
      file.uri = 'uri';
      expect(file.details!['name']).assertEqual('test');
      expect(file.details!['type']).assertEqual('txt');
      expect(file.uri).assertEqual('uri');

      let image = new unifiedDataChannel.Image();
      image.imageUri = 'uri';
      expect(image.imageUri).assertEqual('uri');

      let video = new unifiedDataChannel.Video();
      video.videoUri = 'uri';
      expect(video.videoUri).assertEqual('uri');

      let audio = new unifiedDataChannel.Audio();
      audio.audioUri = 'uri';
      expect(audio.audioUri).assertEqual('uri');

      let folder = new unifiedDataChannel.Folder();
      folder.folderUri = 'uri';
      expect(folder.folderUri).assertEqual('uri');

      let form = new unifiedDataChannel.SystemDefinedForm();
      form.formId = 123456;
      form.formName = 'MyFormName';
      form.bundleName = 'MyBundleName';
      form.abilityName = 'MyAbilityName';
      form.module = 'MyModule';
      expect(form.formId).assertEqual(123456);
      expect(form.formName).assertEqual('MyFormName');
      expect(form.bundleName).assertEqual('MyBundleName');
      expect(form.abilityName).assertEqual('MyAbilityName');
      expect(form.module).assertEqual('MyModule');

      let appItem = new unifiedDataChannel.SystemDefinedAppItem();
      appItem.appId = 'MyAppId';
      appItem.appName = 'MyAppName';
      appItem.appIconId = 'MyAppIconId';
      appItem.appLabelId = 'MyAppLabelId';
      appItem.bundleName = 'MyBundleName';
      appItem.abilityName = 'MyAbilityName';
      expect(appItem.appId).assertEqual('MyAppId');
      expect(appItem.appName).assertEqual('MyAppName');
      expect(appItem.appIconId).assertEqual('MyAppIconId');
      expect(appItem.appLabelId).assertEqual('MyAppLabelId');
      expect(appItem.bundleName).assertEqual('MyBundleName');
      expect(appItem.abilityName).assertEqual('MyAbilityName');

      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let sdPixel = new unifiedDataChannel.SystemDefinedPixelMap();
      sdPixel.rawData = u8Array;
      expect(JSON.stringify(sdPixel.rawData)).assertEqual(JSON.stringify(new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])));

      let record = new unifiedDataChannel.ApplicationDefinedRecord();
      record.applicationDefinedType = 'ApplicationDefinedType';
      record.rawData = u8Array;
      expect(record.applicationDefinedType).assertEqual('ApplicationDefinedType');
      expect(JSON.stringify(record.rawData)).assertEqual(JSON.stringify(new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])));

      let sdr = new unifiedDataChannel.SystemDefinedRecord();
      sdr.details = {
        "title": 'recordTitle',
        "version": 1,
        "content": u8Array
      };
      expect(sdr.details!['title']).assertEqual('recordTitle');
      expect(sdr.details!['version']).assertEqual(1);
      expect(JSON.stringify(sdr.details!['content'])).assertEqual(JSON.stringify(new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])));
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFDataTypeStaticTest_0100 end');
    })

    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFUniformDataStructStaticTest_0100
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFUniformDataStructStaticTest_0100
    * @tc.desc   uniformDataStruct hyperlink test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFUniformDataStructStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFUniformDataStructStaticTest_0100 start');
      let hyperlinkDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2'
      };
      let hyperlink: uniformDataStruct.Hyperlink = {
        uniformDataType: 'general.hyperlink',
        url: 'www.XXX.com',
        description: 'This is the description of this hyperlink',
        details: hyperlinkDetails
      };
      expect(hyperlink.details!['attr1']).assertEqual('value1');
      expect(hyperlink.details!['attr2']).assertEqual('value2');

      let htmlObjDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2'
      }
      let htmlObj: uniformDataStruct.HTML = {
        uniformDataType: 'general.html',
        htmlContent: '<div><p>标题</p></div>',
        plainContent: 'this is plainContent',
        details: htmlObjDetails
      }
      expect(htmlObj.details!['attr1']).assertEqual('value1');
      expect(htmlObj.details!['attr2']).assertEqual('value2');
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFUniformDataStructStaticTest_0100 end');
    })

    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFTypeDescriptorStaticTest_0100
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFTypeDescriptorStaticTest_0100
    * @tc.desc   uniformDataStruct hyperlink test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFTypeDescriptorStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFTypeDescriptorStaticTest_0100 start');
      let typeDescriptor = new uniformTypeDescriptor.TypeDescriptor();
      typeDescriptor.typeId = 'com.example.myHap.image';
      typeDescriptor.belongingToTypes = ['general.image'];
      typeDescriptor.filenameExtensions = ['.myImage'];
      typeDescriptor.mimeTypes = ['application/myImage'];
      typeDescriptor.description = 'myHap defined image type';
      typeDescriptor.referenceURL = 'typeDescriptor referenceURL';
      typeDescriptor.iconFile = 'typeDescriptor iconFile';
      console.log(tag, `typeId: ${typeDescriptor.typeId}`);
      console.log(tag, `belongingToTypes: ${typeDescriptor.belongingToTypes}`);
      console.log(tag, `filenameExtensions: ${typeDescriptor.filenameExtensions}`);
      console.log(tag, `mimeTypes: ${typeDescriptor.mimeTypes}`);
      console.log(tag, `description: ${typeDescriptor.description}`);
      console.log(tag, `referenceURL: ${typeDescriptor.referenceURL}`);
      console.log(tag, `iconFile: ${typeDescriptor.iconFile}`);
      expect(typeDescriptor.typeId).assertEqual('com.example.myHap.image');
      expect(typeDescriptor.belongingToTypes[0]).assertEqual('general.image');
      expect(typeDescriptor.filenameExtensions[0]).assertEqual('.myImage');
      expect(typeDescriptor.mimeTypes[0]).assertEqual('application/myImage');
      expect(typeDescriptor.description).assertEqual('myHap defined image type');
      expect(typeDescriptor.referenceURL).assertEqual('typeDescriptor referenceURL');
      expect(typeDescriptor.iconFile).assertEqual('typeDescriptor iconFile');
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFUniformDataStructStaticTest_0100 end');
    })
  });
}