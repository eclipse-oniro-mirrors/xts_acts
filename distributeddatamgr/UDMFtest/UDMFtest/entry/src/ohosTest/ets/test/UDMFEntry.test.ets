/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file expect in compliance with the License.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
import { BusinessError } from '@ohos.base';
import { uniformTypeDescriptor } from '@kit.ArkData';


export default function UDMFEntryTest() {
  describe('UDMFEntryTest', () => {
    beforeEach(async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      await unifiedDataChannel.deleteData(options);
    })
    afterEach(async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      await unifiedDataChannel.deleteData(options);
    })

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
        details: formDetails,
      }

      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let recordType = unifiedDataRecord.getType();
              let record = unifiedDataRecord.getValue() as object;
              if (recordType == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                if (record != undefined) {
                  expect(record["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                  expect(record["oriUri"]).assertEqual(fileUri.oriUri);
                  expect(record["fileType"]).assertEqual(fileUri.fileType);
                  expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(fileUri.details));
                }
              }
              if (recordType == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM) {
                if (record != undefined) {
                  expect(record["uniformDataType"]).assertEqual(formData.uniformDataType);
                  expect(record["formId"]).assertEqual(formData.formId);
                  expect(record["formName"]).assertEqual(formData.formName);
                  expect(record["bundleName"]).assertEqual(formData.bundleName);
                  expect(record["abilityName"]).assertEqual(formData.abilityName);
                  expect(record["module"]).assertEqual(formData.module);
                  expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(formData.details));
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });

      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100 end");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
        details: formDetails,
      }

      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let recordType = unifiedDataRecord.getType();
              let record = unifiedDataRecord.getValue() as object;
              if (recordType == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                if (record != undefined) {
                  expect(record["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                  expect(record["oriUri"]).assertEqual(fileUri.oriUri);
                  expect(record["fileType"]).assertEqual(fileUri.fileType);
                  expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(fileUri.details));
                }
              }
              if (recordType == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM) {
                if (record != undefined) {
                  expect(record["uniformDataType"]).assertEqual(formData.uniformDataType);
                  expect(record["formId"]).assertEqual(formData.formId);
                  expect(record["formName"]).assertEqual(formData.formName);
                  expect(record["bundleName"]).assertEqual(formData.bundleName);
                  expect(record["abilityName"]).assertEqual(formData.abilityName);
                  expect(record["module"]).assertEqual(formData.module);
                  expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(formData.details));
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });

      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200 end");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_0300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0300
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0300', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0300 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let formDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
        details: formDetails,
      }

      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, formData);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let recordType = unifiedDataRecord.getType();
              let record = unifiedDataRecord.getValue() as object;
              if (recordType == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                if (record != undefined) {
                  expect(record["uniformDataType"]).assertEqual(formData.uniformDataType);
                  expect(record["formId"]).assertEqual(formData.formId);
                  expect(record["formName"]).assertEqual(formData.formName);
                  expect(record["bundleName"]).assertEqual(formData.bundleName);
                  expect(record["abilityName"]).assertEqual(formData.abilityName);
                  expect(record["module"]).assertEqual(formData.module);
                  expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(formData.details));
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0300 end");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
        details: formDetails,
      }

      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      try {
        record.addEntry("", formData);
        expect().assertFail();
      } catch (err) {
        console.info("err code is " + err.code + "; err message is " + err.message);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400 end");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_0500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0500
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0500', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0500 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
        details: formDetails,
      }

      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      try {
        record.addEntry(undefined, formData);
        expect().assertFail();
      } catch (err) {
        console.info("err code is " + err.code + "; err message is " + err.message);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2600 end");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, undefined);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let recordType = unifiedDataRecord.getType();
              let record = unifiedDataRecord.getValue() as object;
              if (recordType == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                expect(record).assertEqual(undefined);
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600 end");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_0700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0700
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0700', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0700 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
        details: formDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      try {
        record.addEntry(null, formData);
        expect().assertFail();
      } catch (err) {
        console.info("err code is " + err.code + "; err message is " + err.message);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0700 end");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, "@#$%^&*(");
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let recordType = unifiedDataRecord.getType();
              let record = unifiedDataRecord.getValue() as object;
              if (recordType == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                expect(record).assertEqual("@#$%^&*(");
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800 end");
    })
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest2300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
        details: formDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async () => {
        console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900 end 111111111");
        await unifiedDataChannel.queryData(options).then(async (ret) => {
          console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900 end 22222222");
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900 end 333333333");
            let records = ret[i].getRecords();
            for (let i = 0; i < records.length; i++) {
              console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900 end 333333333");
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900 end 333333333");
                let fileUriRead: uniformDataStruct.FileUri =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.FILE_URI) as uniformDataStruct.FileUri
                console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900 end 5555555");
                if (fileUriRead != undefined) {
                  console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900 end 5555555");
                  expect(fileUriRead["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead["oriUri"]).assertEqual(fileUri.oriUri);
                  expect(fileUriRead["fileType"]).assertEqual(fileUri.fileType);
                  expect(JSON.stringify(fileUriRead["details"])).assertEqual(JSON.stringify(fileUri.details));
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900 end");
    });


      /**
       * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1000
       * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1000
       * @tc.desc      : Verify the properties of the contentForm type
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 2
       */
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1000', 0, async () => {
        console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1000 start');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        let fileUriDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://data/image/1.png',
          fileType: 'general.image',
          details: fileUriDetails,
        }
        let formDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let formData: uniformDataStruct.Form = {
          uniformDataType: 'openharmony.form',
          formId: 1,
          formName: 'form',
          bundleName: 'com.xx.app',
          abilityName: 'ability',
          module: 'module',
          details: formDetails,
        }
        let unifiedData = new unifiedDataChannel.UnifiedData();
        let record = new unifiedDataChannel.UnifiedRecord();
        record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
        record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
        unifiedData.addRecord(record);
        await unifiedDataChannel.insertData(options, unifiedData).then(async () => {
          await unifiedDataChannel.queryData(options).then(async (ret) => {
            let size = ret.length;
            console.info(`data.size = ${size}`);
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              for (let i = 0; i < records.length; i++) {
                let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                  let fileUriRead: uniformDataStruct.FileUri =
                    unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.FILE_URI) as uniformDataStruct.FileUri
                  if (fileUriRead != undefined) {
                    expect(fileUriRead["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                    expect(fileUriRead["oriUri"]).assertEqual(fileUri.oriUri);
                    expect(fileUriRead["fileType"]).assertEqual(fileUri.fileType);
                    expect(JSON.stringify(fileUriRead["details"])).assertEqual(JSON.stringify(fileUri.details));
                  }
                }
              }
            }
          }).catch((err: BusinessError) => {
            expect().assertFail();
          });
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1000 end");
      });

      /**
       * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100
       * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100
       * @tc.desc      : Verify the properties of the contentForm type
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 2
       */
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100', 0, async () => {
        console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100 start');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        let fileUriDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://data/image/1.png',
          fileType: 'general.image',
          details: fileUriDetails,
        }
        let formDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let formData: uniformDataStruct.Form = {
          uniformDataType: 'openharmony.form',
          formId: 1,
          formName: 'form',
          bundleName: 'com.xx.app',
          abilityName: 'ability',
          module: 'module',
          details: formDetails,
        }

        let unifiedData = new unifiedDataChannel.UnifiedData();
        let record = new unifiedDataChannel.UnifiedRecord();
        record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
        record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
        let records = unifiedData.getRecords();
        for (let i = 0; i < records.length; i++) {
          let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
          try {
            let fileUriRead: uniformDataStruct.FileUri = unifiedDataRecord.getEntry("") as uniformDataStruct.FileUri
            expect().assertFail();
          } catch (err) {
            console.info("err code is " + err.code + "; err message is " + err.message);
            expect(err.code).assertEqual("401");
          }
        }
        console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100 end");
      });

      /**
       * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1200
       * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1200
       * @tc.desc      : Verify the properties of the contentForm type
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 2
       */
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1200', 0, async () => {
        console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1200 start');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        let fileUriDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://data/image/1.png',
          fileType: 'general.image',
          details: fileUriDetails,
        }
        let formDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let formData: uniformDataStruct.Form = {
          uniformDataType: 'openharmony.form',
          formId: 1,
          formName: 'form',
          bundleName: 'com.xx.app',
          abilityName: 'ability',
          module: 'module',
          details: formDetails,
        }

        let unifiedData = new unifiedDataChannel.UnifiedData();
        let record = new unifiedDataChannel.UnifiedRecord();
        record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
        record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
        let records = unifiedData.getRecords();
        for (let i = 0; i < records.length; i++) {
          let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
          try {
            let fileUriRead: uniformDataStruct.FileUri =
              unifiedDataRecord.getEntry(undefined) as uniformDataStruct.FileUri
            expect().assertFail();
          } catch (err) {
            console.info("err code is " + err.code + "; err message is " + err.message);
            expect(err.code).assertEqual("401");
          }
        }
        console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1200 end");
      });

      /**
       * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1300
       * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1300
       * @tc.desc      : Verify the properties of the contentForm type
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 2
       */
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1300', 0, async () => {
        console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1300 start');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        let fileUriDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://data/image/1.png',
          fileType: 'general.image',
          details: fileUriDetails,
        }
        let formDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let formData: uniformDataStruct.Form = {
          uniformDataType: 'openharmony.form',
          formId: 1,
          formName: 'form',
          bundleName: 'com.xx.app',
          abilityName: 'ability',
          module: 'module',
          details: formDetails,
        }

        let unifiedData = new unifiedDataChannel.UnifiedData();
        let record = new unifiedDataChannel.UnifiedRecord();
        record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
        record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
        let records = unifiedData.getRecords();
        for (let i = 0; i < records.length; i++) {
          let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
          try {
            let fileUriRead: uniformDataStruct.FileUri = unifiedDataRecord.getEntry(null) as uniformDataStruct.FileUri
            expect().assertFail();
          } catch (err) {
            console.info("err code is " + err.code + "; err message is " + err.message);
            expect(err.code).assertEqual("401");
          }
        }
        console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1300 end");
      });

      /**
       * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400
       * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400
       * @tc.desc      : Verify the properties of the contentForm type
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 2
       */
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400', 0, async () => {
        console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400 start');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        let fileUriDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://data/image/1.png',
          fileType: 'general.image',
          details: fileUriDetails,
        }
        let formDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let formData: uniformDataStruct.Form = {
          uniformDataType: 'openharmony.form',
          formId: 1,
          formName: 'form',
          bundleName: 'com.xx.app',
          abilityName: 'ability',
          module: 'module',
          details: formDetails,
        }

        let unifiedData = new unifiedDataChannel.UnifiedData();
        let record = new unifiedDataChannel.UnifiedRecord();
        record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
        record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
        let records = unifiedData.getRecords();
        for (let i = 0; i < records.length; i++) {
          let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
          try {
            let fileUriRead: uniformDataStruct.FileUri =
              unifiedDataRecord.getEntry("@#$%^&*") as uniformDataStruct.FileUri
            expect().assertFail();
          } catch (err) {
            console.info("err code is " + err.code + "; err message is " + err.message);
            expect(err.code).assertEqual("401");
          }
        }
        console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400 end");
      });


      /**
       * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500
       * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500
       * @tc.desc      : Verify the properties of the contentForm type
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 2
       */
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500', 0, async () => {
        console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500 start');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        let fileUriDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://data/image/1.png',
          fileType: 'general.image',
          details: fileUriDetails,
        }
        let formDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let formData: uniformDataStruct.Form = {
          uniformDataType: 'openharmony.form',
          formId: 1,
          formName: 'form',
          bundleName: 'com.xx.app',
          abilityName: 'ability',
          module: 'module',
          details: formDetails,
        }
        let unifiedData = new unifiedDataChannel.UnifiedData();
        let record = new unifiedDataChannel.UnifiedRecord();
        record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
        record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
        unifiedData.addRecord(record);
        await unifiedDataChannel.insertData(options, unifiedData).then(async () => {
          await unifiedDataChannel.queryData(options).then(async (ret) => {
            let size = ret.length;
            console.info(`data.size = ${size}`);
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              for (let i = 0; i < records.length; i++) {
                let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                let entries: Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
                if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                  let fileUriRead: uniformDataStruct.FileUri =
                    entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                  if (fileUriRead != undefined) {
                    expect(fileUriRead["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                    expect(fileUriRead["oriUri"]).assertEqual(fileUri.oriUri);
                    expect(fileUriRead["fileType"]).assertEqual(fileUri.fileType);
                    expect(JSON.stringify(fileUriRead["details"])).assertEqual(JSON.stringify(fileUri.details));
                  }
                }
                if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                  let formRead: uniformDataStruct.Form =
                    entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                  if (formRead != undefined) {
                    expect(formRead["uniformDataType"]).assertEqual(formData.uniformDataType);
                    expect(formRead["formId"]).assertEqual(formData.formId);
                    expect(formRead["formName"]).assertEqual(formData.formName);
                    expect(formRead["bundleName"]).assertEqual(formData.bundleName);
                    expect(formRead["abilityName"]).assertEqual(formData.abilityName);
                    expect(formRead["module"]).assertEqual(formData.module);
                    expect(JSON.stringify(formRead["details"])).assertEqual(JSON.stringify(formData.details));
                  }
                }
              }
            }
          }).catch((err: BusinessError) => {
            expect().assertFail();
          });
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500 end");
      });


      /**
       * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600
       * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600
       * @tc.desc      : Verify the properties of the contentForm type
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 2
       */
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600', 0, async () => {
        console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600 start');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        let fileUriDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://data/image/1.png',
          fileType: 'general.image',
          details: fileUriDetails,
        }
        let formDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let formData: uniformDataStruct.Form = {
          uniformDataType: 'openharmony.form',
          formId: 1,
          formName: 'form',
          bundleName: 'com.xx.app',
          abilityName: 'ability',
          module: 'module',
          details: formDetails,
        }
        let unifiedData = new unifiedDataChannel.UnifiedData();
        let record = new unifiedDataChannel.UnifiedRecord();
        record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
        record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
        unifiedData.addRecord(record);
        await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
          let options1:unifiedDataChannel.Options ={
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key:data
          }
          await unifiedDataChannel.queryData(options1).then(async (ret) => {
            let size = ret.length;
            console.info(`data.size = ${size}`);
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              for (let i = 0; i < records.length; i++) {
                let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                let recordTypes = unifiedDataRecord.getTypes();
                expect(recordTypes.toString()).assertEqual("openharmony.form,general.file-uri");
              }
            }
          }).catch((err: BusinessError) => {
            expect().assertFail();
          });
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600 end");
      });
    })
}