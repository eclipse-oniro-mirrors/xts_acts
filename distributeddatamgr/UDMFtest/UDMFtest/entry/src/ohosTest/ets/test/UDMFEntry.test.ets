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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
import { BusinessError } from '@ohos.base';
import { uniformTypeDescriptor } from '@kit.ArkData';
import { image } from '@kit.ImageKit';


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
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
  /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1700
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        abstract: 'this is abstract',
      }
      let recordA =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      unifiedData.addRecord(recordA);
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        abstract: 'this is abstract',
      }
      let recordB =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextB);
      unifiedData.addRecord(recordB);
      let plainTextC: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        abstract: 'this is abstract',
      }
      let recordC =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextC);
      unifiedData.addRecord(recordC);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextA.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextA.abstract);
                  expect(plainObj["textContent"]!= plainTextB.textContent).assertEqual(true);
                  expect(plainObj["textContent"]!= plainTextC.textContent).assertEqual(true);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1800
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        abstract: 'this is abstract',
      }
      let recordA =
        new unifiedDataChannel.UnifiedRecord();
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      unifiedData.addRecord(recordA);
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        abstract: 'this is abstract',
      }
      let recordB =
        new unifiedDataChannel.UnifiedRecord();
      recordB.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextB);
      let plainTextC: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        abstract: 'this is abstract',
      }
      let recordC =
        new unifiedDataChannel.UnifiedRecord();
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextC);
      unifiedData.addRecord(recordA);
      unifiedData.addRecord(recordB);
      unifiedData.addRecord(recordC);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextA.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextA.abstract);
                  expect(plainObj["textContent"]!= plainTextB.textContent).assertEqual(true);
                  expect(plainObj["textContent"]!= plainTextC.textContent).assertEqual(true);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1900
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        abstract: 'this is abstract',
      }
      let recordA =
        new unifiedDataChannel.UnifiedRecord();
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      unifiedData.addRecord(recordA);
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
      }
      let recordB =
        new unifiedDataChannel.UnifiedRecord();
      recordB.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
      }
      let recordC =
        new unifiedDataChannel.UnifiedRecord();
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      unifiedData.addRecord(recordA);
      unifiedData.addRecord(recordB);
      unifiedData.addRecord(recordC);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead["oriUri"]).assertEqual(fileUri.oriUri);
                  expect(fileUriRead["fileType"]).assertEqual(fileUri.fileType);
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
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextA.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextA.abstract);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2000
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        abstract: 'this is abstract',
      }
      let recordA =
        new unifiedDataChannel.UnifiedRecord();
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
      }
      let recordB =
        new unifiedDataChannel.UnifiedRecord();
      recordB.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
      }
      let recordC =
        new unifiedDataChannel.UnifiedRecord();
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);

      let hyperlink: uniformDataStruct.Hyperlink = {
        uniformDataType: 'general.hyperlink',
        url: 'www.XXX.com',
        description: 'This is the description of this hyperlink',
      }
      recordB.addEntry(uniformTypeDescriptor.UniformDataType.HYPERLINK, hyperlink);
      let htmlObj: uniformDataStruct.HTML = {
        uniformDataType: 'general.html',
        htmlContent: '<div><p>标题</p></div>',
        plainContent: 'this is plainContent',
      }
      recordB.addEntry(uniformTypeDescriptor.UniformDataType.HTML, htmlObj);
      let appItem: uniformDataStruct.OpenHarmonyAppItem = {
        uniformDataType: 'openharmony.app-item',
        appId: 'MyAppId',
        appName: 'MyAppName',
        appIconId: 'MyAppIconId',
        appLabelId: 'MyAppLabelId',
        bundleName: 'MyBundleName',
        abilityName: 'MyAbilityName',
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM, appItem);
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
      };
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.CONTENT_FORM, contentForm);
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 }, alphaType: 3 };
      let pixelMapDetails : Record<string, number | string | Uint8Array> = {
        'pixelMapKey1': 123,
        'pixelMapKey2': 'pixelMapValue',
        'pixelMapKey3': u8Array,
      }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
        details : pixelMapDetails
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMap);

      unifiedData.addRecord(recordA);
      unifiedData.addRecord(recordB);
      unifiedData.addRecord(recordC);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead["oriUri"]).assertEqual(fileUri.oriUri);
                  expect(fileUriRead["fileType"]).assertEqual(fileUri.fileType);
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
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextA.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextA.abstract);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP) {
                let obj:uniformDataStruct.PixelMap = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo:image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj["details"])).assertEqual(JSON.stringify(pixelMap.details));
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM) {
                let obj:uniformDataStruct.ContentForm = entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                  expect(obj["title"]).assertEqual(contentForm.title);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM) {
                let obj:uniformDataStruct.OpenHarmonyAppItem = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(appItem.uniformDataType);
                  expect(obj["appId"]).assertEqual(appItem.appId);
                  expect(obj["appName"]).assertEqual(appItem.appName);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["bundleName"]).assertEqual(appItem.bundleName);
                  expect(obj["abilityName"]).assertEqual(appItem.abilityName);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML) {
                let obj:uniformDataStruct.HTML = entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(htmlObj.uniformDataType);
                  expect(obj["htmlContent"]).assertEqual(htmlObj.htmlContent);
                  expect(obj["plainContent"]).assertEqual(htmlObj.plainContent);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK) {
                let obj:uniformDataStruct.Hyperlink = entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(hyperlink.uniformDataType);
                  expect(obj["url"]).assertEqual(hyperlink.url);
                  expect(obj["description"]).assertEqual(hyperlink.description);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2100
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let recordA =
        new unifiedDataChannel.UnifiedRecord();
      let recordC =
        new unifiedDataChannel.UnifiedRecord();
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example A',
        abstract: 'this is abstract A',
      }
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example B',
        abstract: 'this is abstract C',
      }

      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextB);
      let hyperlink: uniformDataStruct.Hyperlink = {
        uniformDataType: 'general.hyperlink',
        url: 'www.XXX.com',
        description: 'This is the description of this hyperlink',
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.HYPERLINK, hyperlink);
      let htmlObj: uniformDataStruct.HTML = {
        uniformDataType: 'general.html',
        htmlContent: '<div><p>标题</p></div>',
        plainContent: 'this is plainContent',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.HTML, htmlObj);
      let appItem: uniformDataStruct.OpenHarmonyAppItem = {
        uniformDataType: 'openharmony.app-item',
        appId: 'MyAppId',
        appName: 'MyAppName',
        appIconId: 'MyAppIconId',
        appLabelId: 'MyAppLabelId',
        bundleName: 'MyBundleName',
        abilityName: 'MyAbilityName',
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM, appItem);
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
      };
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.CONTENT_FORM, contentForm);
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 }, alphaType: 3 };
      let pixelMapDetails : Record<string, number | string | Uint8Array> = {
        'pixelMapKey1': 123,
        'pixelMapKey2': 'pixelMapValue',
        'pixelMapKey3': u8Array,
      }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
        details : pixelMapDetails
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMap);

      unifiedData.addRecord(recordA);
      unifiedData.addRecord(recordC);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead["oriUri"]).assertEqual(fileUri.oriUri);
                  expect(fileUriRead["fileType"]).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead["uniformDataType"]).assertEqual(formData.uniformDataType);
                  expect(formRead["formId"]).assertEqual(formData.formId);
                  expect(formRead["formName"]).assertEqual(formData.formName);
                  expect(formRead["bundleName"]).assertEqual(formData.bundleName);
                  expect(formRead["abilityName"]).assertEqual(formData.abilityName);
                  expect(formRead["module"]).assertEqual(formData.module);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextB.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextB.abstract);
                  expect(plainObj["textContent"] != plainTextA.textContent).assertEqual(true);
                  expect(plainObj["abstract"] != plainTextA.abstract).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP) {
                let obj:uniformDataStruct.PixelMap = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo:image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj["details"])).assertEqual(JSON.stringify(pixelMap.details));
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM) {
                let obj:uniformDataStruct.ContentForm = entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                  expect(obj["title"]).assertEqual(contentForm.title);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM) {
                let obj:uniformDataStruct.OpenHarmonyAppItem = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(appItem.uniformDataType);
                  expect(obj["appId"]).assertEqual(appItem.appId);
                  expect(obj["appName"]).assertEqual(appItem.appName);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["bundleName"]).assertEqual(appItem.bundleName);
                  expect(obj["abilityName"]).assertEqual(appItem.abilityName);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML) {
                let obj:uniformDataStruct.HTML = entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(htmlObj.uniformDataType);
                  expect(obj["htmlContent"]).assertEqual(htmlObj.htmlContent);
                  expect(obj["plainContent"]).assertEqual(htmlObj.plainContent);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK) {
                let obj:uniformDataStruct.Hyperlink = entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(hyperlink.uniformDataType);
                  expect(obj["url"]).assertEqual(hyperlink.url);
                  expect(obj["description"]).assertEqual(hyperlink.description);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })


    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2200
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let recordA =
        new unifiedDataChannel.UnifiedRecord();
      let recordC =
        new unifiedDataChannel.UnifiedRecord();
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example A',
        abstract: 'this is abstract A',
      }

      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);

      let hyperlink: uniformDataStruct.Hyperlink = {
        uniformDataType: 'general.hyperlink',
        url: 'www.XXX.com',
        description: 'This is the description of this hyperlink',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.HYPERLINK, hyperlink);
      let htmlObj: uniformDataStruct.HTML = {
        uniformDataType: 'general.html',
        htmlContent: '<div><p>标题</p></div>',
        plainContent: 'this is plainContent',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.HTML, htmlObj);
      let appItem: uniformDataStruct.OpenHarmonyAppItem = {
        uniformDataType: 'openharmony.app-item',
        appId: 'MyAppId',
        appName: 'MyAppName',
        appIconId: 'MyAppIconId',
        appLabelId: 'MyAppLabelId',
        bundleName: 'MyBundleName',
        abilityName: 'MyAbilityName',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM, appItem);
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
      };
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.CONTENT_FORM, contentForm);
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let arrayBuffer = new ArrayBuffer(4 * 200 * 200);
      let opt: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 200, width: 200
        },
        alphaType: 3
      };
      let pixelMapDetails: Record<string, number | string | Uint8Array> = {
        'pixelMapKey1': 123,
        'pixelMapKey2': 'pixelMapValue',
        'pixelMapKey3': u8Array,
      }
      let pixelMap: uniformDataStruct.PixelMap = {
        uniformDataType: 'openharmony.pixel-map',
        pixelMap: image.createPixelMapSync(arrayBuffer, opt),
        details: pixelMapDetails
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMap);
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example B',
        abstract: 'this is abstract C',
      }
      let hyperlinkB: uniformDataStruct.Hyperlink = {
        uniformDataType: 'general.hyperlink',
        url: 'www.iiii.com',
        description: 'This is the description of this hyperlink ppp',
      }


      recordC.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextB);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.HYPERLINK, hyperlinkB);

      let recordB =
        new unifiedDataChannel.UnifiedRecord();
      let appItemB: uniformDataStruct.OpenHarmonyAppItem = {
        uniformDataType: 'openharmony.app-item',
        appId: 'MyAppId',
        appName: 'MyAppName',
        appIconId: 'MyAppIconId',
        appLabelId: 'MyAppLabelId',
        bundleName: 'MyBundleName',
        abilityName: 'MyAbilityName  ccccccccccccc',
      }
      recordB.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM, appItemB);
      let contentFormB: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string cccccccc ",
      };
      recordB.addEntry(uniformTypeDescriptor.UniformDataType.CONTENT_FORM, contentFormB);

      unifiedData.addRecord(recordA);
      unifiedData.addRecord(recordB);
      unifiedData.addRecord(recordC);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries(ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries: Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead["oriUri"]).assertEqual(fileUri.oriUri);
                  expect(fileUriRead["fileType"]).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead["uniformDataType"]).assertEqual(formData.uniformDataType);
                  expect(formRead["formId"]).assertEqual(formData.formId);
                  expect(formRead["formName"]).assertEqual(formData.formName);
                  expect(formRead["bundleName"]).assertEqual(formData.bundleName);
                  expect(formRead["abilityName"]).assertEqual(formData.abilityName);
                  expect(formRead["module"]).assertEqual(formData.module);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextB.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextB.abstract);
                  expect(plainObj["textContent"] != plainTextA.textContent).assertEqual(true);
                  expect(plainObj["abstract"] != plainTextA.abstract).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP) {
                let obj: uniformDataStruct.PixelMap =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo: image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj["details"])).assertEqual(JSON.stringify(pixelMap.details));
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM) {
                let obj: uniformDataStruct.ContentForm =
                  entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                  expect(obj["title"]).assertEqual(contentFormB.title);
                  expect(obj["title"] != contentForm.title).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM) {
                let obj: uniformDataStruct.OpenHarmonyAppItem =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(appItem.uniformDataType);
                  expect(obj["appId"]).assertEqual(appItem.appId);
                  expect(obj["appName"]).assertEqual(appItem.appName);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["bundleName"]).assertEqual(appItem.bundleName);
                  expect(obj["abilityName"]).assertEqual(appItemB.abilityName);
                  expect(obj["abilityName"] != appItem.abilityName).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML) {
                let obj: uniformDataStruct.HTML =
                  entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(htmlObj.uniformDataType);
                  expect(obj["htmlContent"]).assertEqual(htmlObj.htmlContent);
                  expect(obj["plainContent"]).assertEqual(htmlObj.plainContent);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK) {
                let obj: uniformDataStruct.Hyperlink =
                  entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(hyperlink.uniformDataType);
                  expect(obj["url"]).assertEqual(hyperlinkB.url);
                  expect(obj["description"]).assertEqual(hyperlinkB.description);
                  expect(obj["url"] != hyperlink.url).assertEqual(true);
                  expect(obj["description"] != hyperlink.description).assertEqual(true);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })


    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2300
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let recordA =
        new unifiedDataChannel.UnifiedRecord();
      let recordC =
        new unifiedDataChannel.UnifiedRecord();
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module A',
      }

      let formDataB: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module B',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formDataB);
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example A',
        abstract: 'this is abstract A',
      }
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example B',
        abstract: 'this is abstract C',
      }

      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextB);
      let hyperlink: uniformDataStruct.Hyperlink = {
        uniformDataType: 'general.hyperlink',
        url: 'www.XXX.com',
        description: 'This is the description of this hyperlink',
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.HYPERLINK, hyperlink);
      let htmlObj: uniformDataStruct.HTML = {
        uniformDataType: 'general.html',
        htmlContent: '<div><p>标题</p></div>',
        plainContent: 'this is plainContent',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.HTML, htmlObj);
      let appItem: uniformDataStruct.OpenHarmonyAppItem = {
        uniformDataType: 'openharmony.app-item',
        appId: 'MyAppId',
        appName: 'MyAppName',
        appIconId: 'MyAppIconId',
        appLabelId: 'MyAppLabelId',
        bundleName: 'MyBundleName',
        abilityName: 'MyAbilityName',
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM, appItem);
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
      };
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.CONTENT_FORM, contentForm);
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 }, alphaType: 3 };
      let pixelMapDetails : Record<string, number | string | Uint8Array> = {
        'pixelMapKey1': 123,
        'pixelMapKey2': 'pixelMapValue',
        'pixelMapKey3': u8Array,
      }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
        details : pixelMapDetails
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMap);

      unifiedData.addRecord(recordA);
      unifiedData.addRecord(recordC);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead["oriUri"]).assertEqual(fileUri.oriUri);
                  expect(fileUriRead["fileType"]).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead["uniformDataType"]).assertEqual(formData.uniformDataType);
                  expect(formRead["formId"]).assertEqual(formData.formId);
                  expect(formRead["formName"]).assertEqual(formData.formName);
                  expect(formRead["bundleName"]).assertEqual(formData.bundleName);
                  expect(formRead["abilityName"]).assertEqual(formData.abilityName);
                  expect(formRead["module"]).assertEqual(formData.module);
                  expect(formRead["module"] != formDataB.module).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextB.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextB.abstract);
                  expect(plainObj["textContent"] != plainTextA.textContent).assertEqual(true);
                  expect(plainObj["abstract"] != plainTextA.abstract).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP) {
                let obj:uniformDataStruct.PixelMap = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo:image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj["details"])).assertEqual(JSON.stringify(pixelMap.details));
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM) {
                let obj:uniformDataStruct.ContentForm = entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                  expect(obj["title"]).assertEqual(contentForm.title);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM) {
                let obj:uniformDataStruct.OpenHarmonyAppItem = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(appItem.uniformDataType);
                  expect(obj["appId"]).assertEqual(appItem.appId);
                  expect(obj["appName"]).assertEqual(appItem.appName);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["bundleName"]).assertEqual(appItem.bundleName);
                  expect(obj["abilityName"]).assertEqual(appItem.abilityName);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML) {
                let obj:uniformDataStruct.HTML = entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(htmlObj.uniformDataType);
                  expect(obj["htmlContent"]).assertEqual(htmlObj.htmlContent);
                  expect(obj["plainContent"]).assertEqual(htmlObj.plainContent);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK) {
                let obj:uniformDataStruct.Hyperlink = entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(hyperlink.uniformDataType);
                  expect(obj["url"]).assertEqual(hyperlink.url);
                  expect(obj["description"]).assertEqual(hyperlink.description);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })


    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2400
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let recordA =
        new unifiedDataChannel.UnifiedRecord();

      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module A',
      }
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example A',
        abstract: 'this is abstract A',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
      }
      let hyperlink: uniformDataStruct.Hyperlink = {
        uniformDataType: 'general.hyperlink',
        url: 'www.XXX.com',
        description: 'This is the description of this hyperlink',
      }
      let htmlObj: uniformDataStruct.HTML = {
        uniformDataType: 'general.html',
        htmlContent: '<div><p>标题</p></div>',
        plainContent: 'this is plainContent',
      }
      let appItem: uniformDataStruct.OpenHarmonyAppItem = {
        uniformDataType: 'openharmony.app-item',
        appId: 'MyAppId',
        appName: 'MyAppName',
        appIconId: 'MyAppIconId',
        appLabelId: 'MyAppLabelId',
        bundleName: 'MyBundleName',
        abilityName: 'MyAbilityName',
      }
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 }, alphaType: 3 };
      let pixelMapDetails : Record<string, number | string | Uint8Array> = {
        'pixelMapKey1': 123,
        'pixelMapKey2': 'pixelMapValue',
        'pixelMapKey3': u8Array,
      }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
        details : pixelMapDetails
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.HYPERLINK, hyperlink);
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.HTML, htmlObj);
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM, appItem);
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.CONTENT_FORM, contentForm);
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMap);

      let recordC =
        new unifiedDataChannel.UnifiedRecord();
      let formDataB: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module B',
      }
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example B',
        abstract: 'this is abstract C',
      }
      let fileUriB: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data333333/image/1.png',
        fileType: 'general.image',
      }
      let hyperlinkB: uniformDataStruct.Hyperlink = {
        uniformDataType: 'general.hyperlink',
        url: 'www.BBBB.com',
        description: 'This is the description of this hyperlink bbb',
      }
      let htmlObjB: uniformDataStruct.HTML = {
        uniformDataType: 'general.html',
        htmlContent: '<div><p>标题BBBB</p></div>',
        plainContent: 'this is plainContent BBBB ',
      }
      let appItemB: uniformDataStruct.OpenHarmonyAppItem = {
        uniformDataType: 'openharmony.app-item',
        appId: 'MyAppId',
        appName: 'MyAppName',
        appIconId: 'MyAppIconId',
        appLabelId: 'MyAppLabelId',
        bundleName: 'MyBundleName',
        abilityName: 'MyAbilityName BBBBB',
      }
      let contentFormB: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string BBBB",
      };

      let u8Array1 = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
      let pixelMapDetails1 : Record<string, number | string | Uint8Array> = {
        'pixelMapKey1': 123,
        'pixelMapKey2': 'pixelMapValue',
        'pixelMapKey3': u8Array1,
      }
      let pixelMapB : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
        details : pixelMapDetails1
      }
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formDataB);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUriB);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextB);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.HYPERLINK, hyperlinkB);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.HTML, htmlObjB);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM, appItemB);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.CONTENT_FORM, contentFormB);
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMapB);

      unifiedData.addRecord(recordA);
      unifiedData.addRecord(recordC);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead["oriUri"]).assertEqual(fileUri.oriUri);
                  expect(fileUriRead["fileType"]).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead["uniformDataType"]).assertEqual(formData.uniformDataType);
                  expect(formRead["formId"]).assertEqual(formData.formId);
                  expect(formRead["formName"]).assertEqual(formData.formName);
                  expect(formRead["bundleName"]).assertEqual(formData.bundleName);
                  expect(formRead["abilityName"]).assertEqual(formData.abilityName);
                  expect(formRead["module"]).assertEqual(formData.module);
                  expect(formRead["module"] !=  formDataB.module).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextB.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextB.abstract);
                  expect(plainObj["textContent"] != plainTextA.textContent).assertEqual(true);
                  expect(plainObj["abstract"] != plainTextA.abstract).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP) {
                let obj:uniformDataStruct.PixelMap = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo:image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj["details"])).assertEqual(JSON.stringify(pixelMapB.details));
                  expect(JSON.stringify(obj["details"]) != JSON.stringify(pixelMap.details)).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM) {
                let obj:uniformDataStruct.ContentForm = entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                  expect(obj["title"]).assertEqual(contentFormB.title);
                  expect(obj["title"] != contentForm.title).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM) {
                let obj:uniformDataStruct.OpenHarmonyAppItem = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(appItem.uniformDataType);
                  expect(obj["appId"]).assertEqual(appItem.appId);
                  expect(obj["appName"]).assertEqual(appItem.appName);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                  expect(obj["bundleName"]).assertEqual(appItem.bundleName);
                  expect(obj["abilityName"]).assertEqual(appItemB.abilityName);
                  expect(obj["abilityName"] != appItem.abilityName).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML) {
                let obj:uniformDataStruct.HTML = entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(htmlObj.uniformDataType);
                  expect(obj["htmlContent"]).assertEqual(htmlObjB.htmlContent);
                  expect(obj["plainContent"]).assertEqual(htmlObjB.plainContent);
                  expect(obj["htmlContent"] != htmlObj.htmlContent).assertEqual(true);
                  expect(obj["plainContent"] != htmlObj.plainContent).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK) {
                let obj:uniformDataStruct.Hyperlink = entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj["uniformDataType"]).assertEqual(hyperlink.uniformDataType);
                  expect(obj["url"]).assertEqual(hyperlink.url);
                  expect(obj["description"]).assertEqual(hyperlink.description);
                  expect(obj["url"] != hyperlink.url).assertEqual(true);
                  expect(obj["description"] != hyperlink.description).assertEqual(true);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2500
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let unifiedData = new unifiedDataChannel.UnifiedData();
      unifiedData.properties.tag = "records_to_entries_data_format";
      try{
        unifiedDataChannel.convertRecordsToEntries(null);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual("401");
      }
    })
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2600
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let unifiedData = new unifiedDataChannel.UnifiedData();
      unifiedData.properties.tag = "records_to_entries_data_format";
      try{
        unifiedDataChannel.convertRecordsToEntries(undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual("401");
      }
    })  
 /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2700
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        abstract: 'this is abstract',
      }
      let recordA =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      unifiedData.addRecord(recordA);
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        abstract: 'this is abstract',
      }
      let recordB =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextB);
      unifiedData.addRecord(recordB);
      let plainTextC: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        abstract: 'this is abstract',
      }
      let recordC =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextC);
      unifiedData.addRecord(recordC);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize != 1).assertEqual(true);
            expect(recordSize).assertEqual(3);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  if (plainObj["textContent"] == plainTextA.textContent) {
                    expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                    expect(plainObj["textContent"]).assertEqual(plainTextA.textContent);
                    expect(plainObj["abstract"]).assertEqual(plainTextA.abstract);
                  }
                  if (plainObj["textContent"] == plainTextB.textContent) {
                    expect(plainObj["uniformDataType"]).assertEqual(plainTextB.uniformDataType);
                    expect(plainObj["textContent"]).assertEqual(plainTextB.textContent);
                    expect(plainObj["abstract"]).assertEqual(plainTextB.abstract);
                  }
                  if (plainObj["textContent"] == plainTextC.textContent) {
                    expect(plainObj["uniformDataType"]).assertEqual(plainTextC.uniformDataType);
                    expect(plainObj["textContent"]).assertEqual(plainTextC.textContent);
                    expect(plainObj["abstract"]).assertEqual(plainTextC.abstract);
                  }
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2800
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        abstract: 'this is abstract',
      }
      let recordA =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      unifiedData.addRecord(recordA);
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        abstract: 'this is abstract',
      }
      let recordB =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextB);
      unifiedData.addRecord(recordB);
      let plainTextC: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        abstract: 'this is abstract',
      }
      let recordC =
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextC);
      unifiedData.addRecord(recordC);
      unifiedData.properties.tag = "records_to_entries_data_forma";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize != 1).assertEqual(true);
            expect(recordSize).assertEqual(3);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  if (plainObj["textContent"] == plainTextA.textContent) {
                    expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                    expect(plainObj["textContent"]).assertEqual(plainTextA.textContent);
                    expect(plainObj["abstract"]).assertEqual(plainTextA.abstract);
                  }
                  if (plainObj["textContent"] == plainTextB.textContent) {
                    expect(plainObj["uniformDataType"]).assertEqual(plainTextB.uniformDataType);
                    expect(plainObj["textContent"]).assertEqual(plainTextB.textContent);
                    expect(plainObj["abstract"]).assertEqual(plainTextB.abstract);
                  }
                  if (plainObj["textContent"] == plainTextC.textContent) {
                    expect(plainObj["uniformDataType"]).assertEqual(plainTextC.uniformDataType);
                    expect(plainObj["textContent"]).assertEqual(plainTextC.textContent);
                    expect(plainObj["abstract"]).assertEqual(plainTextC.abstract);
                  }
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })


    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_2900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2900
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        abstract: 'this is abstract',
      }
      let recordA =
        new unifiedDataChannel.UnifiedRecord();
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      unifiedData.addRecord(recordA);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextA.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextA.abstract);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })



    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_3000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3000
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        abstract: 'this is abstract',
      }
      let recordA =
        new unifiedDataChannel.UnifiedRecord();
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      unifiedData.addRecord(recordA);
      unifiedData.properties.tag = "records_to_entries_data_format";
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj["uniformDataType"]).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj["textContent"]).assertEqual(plainTextA.textContent);
                  expect(plainObj["abstract"]).assertEqual(plainTextA.abstract);
                }
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
    })
  })
}