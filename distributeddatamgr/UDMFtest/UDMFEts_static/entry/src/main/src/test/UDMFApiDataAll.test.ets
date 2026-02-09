import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { image } from '@kit.ImageKit';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function UDMFApiDataAllTest() {

  describe("UDMFApiDataAllTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'UDMFApiDataAllTest start');
    let TAG = '';
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100 start');
      hilog.info(domain, tag, 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100');
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100';
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<String,Int|Long|Double|String|Uint8Array> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<String,Int|Long|Double|String|Uint8Array> = {
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
        new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.FILE_URI, formData);
      record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let recordType = unifiedDataRecord.getType();
              if (recordType == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let record: uniformDataStruct.FileUri = unifiedDataRecord.getValue() as uniformDataStruct.FileUri;
                if (record != undefined) {
                  expect(record.uniformDataType).assertEqual(fileUri.uniformDataType);
                  expect(record.oriUri).assertEqual(fileUri.oriUri);
                  expect(record.fileType).assertEqual(fileUri.fileType);
                  expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(fileUri.details));
                }
              }
              if (recordType === uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM.toString()) {
                let record: uniformDataStruct.Form = unifiedDataRecord.getValue() as uniformDataStruct.Form;
                if (record != undefined) {
                  expect(record.uniformDataType).assertEqual(formData.uniformDataType);
                  expect(record.formId).assertEqual(formData.formId);
                  expect(record.formName).assertEqual(formData.formName);
                  expect(record.bundleName).assertEqual(formData.bundleName);
                  expect(record.abilityName).assertEqual(formData.abilityName);
                  expect(record.module).assertEqual(formData.module);
                  let detailsGet: Record<string, int | long | double | string | Uint8Array> =
                    record.details as Record<string, int | long | double | string | Uint8Array>;
                  if (detailsGet) {
                    expect(detailsGet["attr1"]).assertEqual(formDetails["attr1"]);
                    expect(detailsGet["attr2"]).assertEqual(formDetails["attr2"]);
                    hilog.info(domain, tag, `record.details: ${detailsGet["attr1"]}`);
                    hilog.info(domain, tag, `formData.details: ${formDetails["attr1"]}`);
                    hilog.info(domain, tag, `record.details: ${detailsGet["attr2"]}`);
                    hilog.info(domain, tag, `formData.details: ${formDetails["attr2"]}`);
                  }
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200 start');
      const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200';
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<String,Int|Long|Double|String|Uint8Array> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<String,Int|Long|Double|String|Uint8Array> = {
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
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let recordType = unifiedDataRecord.getType();
              if (recordType == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let record: uniformDataStruct.FileUri = unifiedDataRecord.getValue() as uniformDataStruct.FileUri;
                if (record != undefined) {
                  expect(record.uniformDataType).assertEqual(fileUri.uniformDataType);
                  expect(record.oriUri).assertEqual(fileUri.oriUri);
                  expect(record.fileType).assertEqual(fileUri.fileType);
                  expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(fileUri.details));
                }
              }
              if (recordType == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM.toString()) {
                let record: uniformDataStruct.Form = unifiedDataRecord.getValue() as uniformDataStruct.Form;
                if (record != undefined) {
                  expect(record.uniformDataType).assertEqual(formData.uniformDataType);
                  expect(record.formId).assertEqual(formData.formId);
                  hilog.info(domain, tag, '%{public}s', 'record.formId: ' + record.formId);
                  hilog.info(domain, tag, '%{public}s', 'formData.formId: ' + formData.formId);
                  expect(record.formName).assertEqual(formData.formName);
                  expect(record.bundleName).assertEqual(formData.bundleName);
                  expect(record.abilityName).assertEqual(formData.abilityName);
                  expect(record.module).assertEqual(formData.module);
                  let detailsGet: Record<string, int | long | double | string | Uint8Array> =
                    record.details as Record<string, int | long | double | string | Uint8Array>;
                  if (detailsGet) {
                    expect(detailsGet["attr1"]).assertEqual(formDetails["attr1"]);
                    expect(detailsGet["attr2"]).assertEqual(formDetails["attr2"]);
                    hilog.info(domain, tag, `record.details: ${detailsGet["attr1"]}`);
                    hilog.info(domain, tag, `formData.details: ${formDetails["attr1"]}`);
                    hilog.info(domain, tag, `record.details: ${detailsGet["attr2"]}`);
                    hilog.info(domain, tag, `formData.details: ${formDetails["attr2"]}`);
                  }
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, undefined);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let recordType = unifiedDataRecord.getType();
              if (recordType == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let record = unifiedDataRecord.getValue();
                expect(record).assertEqual(undefined);
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, "@#$%^&*(");
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let recordType = unifiedDataRecord.getType();
              if (recordType == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let record = unifiedDataRecord.getValue() as string;
                expect(record).assertEqual("@#$%^&*(");
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500 start');
      TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500';
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<String,Int|Long|Double|String|Uint8Array> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<String,Int|Long|Double|String|Uint8Array> = {
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
      unifiedDataChannel.insertData(options, unifiedData).then(() => {
        unifiedDataChannel.queryData(options).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            for (let i = 0; i < records.length; i++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries: Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead.uniformDataType).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead.oriUri).assertEqual(fileUri.oriUri);
                  expect(fileUriRead.fileType).assertEqual(fileUri.fileType);
                  expect(JSON.stringify(fileUriRead.details)).assertEqual(JSON.stringify(fileUri.details));
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead.uniformDataType).assertEqual(formData.uniformDataType);
                  expect(formRead.formId).assertEqual(formData.formId);
                  hilog.info(domain, tag, '%{public}s', 'formRead.formId: ' + formRead.formId);
                  hilog.info(domain, tag, '%{public}s', 'formData.formId: ' + formData.formId);
                  expect(formRead.formName).assertEqual(formData.formName);
                  expect(formRead.bundleName).assertEqual(formData.bundleName);
                  expect(formRead.abilityName).assertEqual(formData.abilityName);
                  expect(formRead.module).assertEqual(formData.module);
                  expect(JSON.stringify(formRead.details)).assertEqual(JSON.stringify(formData.details));
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1800
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1800
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        textAbstract: 'this is abstract',
      }
      let recordA =
        new unifiedDataChannel.UnifiedRecord();
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextA);
      unifiedData.addRecord(recordA);
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        textAbstract: 'this is abstract',
      }
      let recordB =
        new unifiedDataChannel.UnifiedRecord();
      recordB.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextB);
      let plainTextC: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example2',
        textAbstract: 'this is abstract',
      }
      let recordC =
        new unifiedDataChannel.UnifiedRecord();
      recordC.addEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainTextC);
      unifiedData.addRecord(recordA);
      unifiedData.addRecord(recordB);
      unifiedData.addRecord(recordC);
      let properties = new unifiedDataChannel.UnifiedDataProperties();
      properties.tag = "records_to_entries_data_format";
      unifiedData.properties = properties;
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.toString()) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj.uniformDataType).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj.textContent).assertEqual(plainTextA.textContent);
                  expect(plainObj.textAbstract).assertEqual(plainTextA.textAbstract);
                  expect(plainObj.textContent!= plainTextB.textContent).assertEqual(true);
                  expect(plainObj.textContent!= plainTextC.textContent).assertEqual(true);
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1900
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1900
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1900';
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        textAbstract: 'this is abstract',
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
      let properties = new unifiedDataChannel.UnifiedDataProperties();
      properties.tag = "records_to_entries_data_format";
      unifiedData.properties = properties;
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead.uniformDataType).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead.oriUri).assertEqual(fileUri.oriUri);
                  expect(fileUriRead.fileType).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead.uniformDataType).assertEqual(formData.uniformDataType);
                  expect(formRead.formId).assertEqual(formData.formId);
                  hilog.info(domain, tag, '%{public}s', 'formRead.formId: ' + formRead.formId);
                  hilog.info(domain, tag, '%{public}s', 'formData.formId: ' + formData.formId);
                  expect(formRead.formName).assertEqual(formData.formName);
                  expect(formRead.bundleName).assertEqual(formData.bundleName);
                  expect(formRead.abilityName).assertEqual(formData.abilityName);
                  expect(formRead.module).assertEqual(formData.module);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.toString()) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj.uniformDataType).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj.textContent).assertEqual(plainTextA.textContent);
                  expect(plainObj.textAbstract).assertEqual(plainTextA.textAbstract);
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2000
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2000
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2000';
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example1',
        textAbstract: 'this is abstract',
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
      let opt : image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 200, width: 200 }, alphaType: image.AlphaType.UNPREMUL };
      let pixelMapDetails : Record<String, Int|Long|Double|String|Uint8Array> = {
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
      let properties = new unifiedDataChannel.UnifiedDataProperties();
      properties.tag = "records_to_entries_data_format";
      unifiedData.properties = properties;
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead.uniformDataType).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead.oriUri).assertEqual(fileUri.oriUri);
                  expect(fileUriRead.fileType).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead.uniformDataType).assertEqual(formData.uniformDataType);
                  expect(formRead.formId).assertEqual(formData.formId);
                  hilog.info(domain, tag, '%{public}s', 'formRead.formId: ' + formRead.formId);
                  hilog.info(domain, tag, '%{public}s', 'formData.formId: ' + formData.formId);
                  expect(formRead.formName).assertEqual(formData.formName);
                  expect(formRead.bundleName).assertEqual(formData.bundleName);
                  expect(formRead.abilityName).assertEqual(formData.abilityName);
                  expect(formRead.module).assertEqual(formData.module);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.toString()) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj.uniformDataType).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj.textContent).assertEqual(plainTextA.textContent);
                  expect(plainObj.textAbstract).assertEqual(plainTextA.textAbstract);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP.toString()) {
                let obj:uniformDataStruct.PixelMap = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo:image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj.uniformDataType).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj.details)).assertEqual(JSON.stringify(pixelMap.details));
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM.toString()) {
                let obj:uniformDataStruct.ContentForm = entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(contentForm.uniformDataType);
                  expect(obj.title).assertEqual(contentForm.title);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM.toString()) {
                let obj:uniformDataStruct.OpenHarmonyAppItem = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(appItem.uniformDataType);
                  expect(obj.appId).assertEqual(appItem.appId);
                  expect(obj.appName).assertEqual(appItem.appName);
                  expect(obj.appIconId).assertEqual(appItem.appIconId);
                  expect(obj.bundleName).assertEqual(appItem.bundleName);
                  expect(obj.abilityName).assertEqual(appItem.abilityName);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML.toString()) {
                let obj:uniformDataStruct.HTML = entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(htmlObj.uniformDataType);
                  expect(obj.htmlContent).assertEqual(htmlObj.htmlContent);
                  expect(obj.plainContent).assertEqual(htmlObj.plainContent);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK.toString()) {
                let obj:uniformDataStruct.Hyperlink = entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(hyperlink.uniformDataType);
                  expect(obj.url).assertEqual(hyperlink.url);
                  expect(obj.description).assertEqual(hyperlink.description);
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2100
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2100';

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
        formId: 1 as int,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example A',
        textAbstract: 'this is abstract A',
      }
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example B',
        textAbstract: 'this is abstract C',
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
      let opt : image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 200, width: 200 }, alphaType: image.AlphaType.UNPREMUL };
      let pixelMapDetails : Record<string, int | long | double | string | Uint8Array> = {
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
      let properties = new unifiedDataChannel.UnifiedDataProperties();
      properties.tag = "records_to_entries_data_format";
      unifiedData.properties = properties;
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries(ret[i]);
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead.uniformDataType).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead.oriUri).assertEqual(fileUri.oriUri);
                  expect(fileUriRead.fileType).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM.toString()) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead.uniformDataType).assertEqual(formData.uniformDataType);
                  expect(formRead.formId).assertEqual(formData.formId);
                  expect(formRead.formName).assertEqual(formData.formName);
                  expect(formRead.bundleName).assertEqual(formData.bundleName);
                  expect(formRead.abilityName).assertEqual(formData.abilityName);
                  expect(formRead.module).assertEqual(formData.module);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.toString()) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj.uniformDataType).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj.textContent).assertEqual(plainTextB.textContent);
                  expect(plainObj.textAbstract).assertEqual(plainTextB.textAbstract);
                  expect(plainObj.textContent != plainTextA.textContent).assertEqual(true);
                  expect(plainObj.textAbstract != plainTextA.textAbstract).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP.toString()) {
                let obj:uniformDataStruct.PixelMap = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo:image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj.uniformDataType).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj.details)).assertEqual(JSON.stringify(pixelMap.details));
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM.toString()) {
                let obj:uniformDataStruct.ContentForm = entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(contentForm.uniformDataType);
                  expect(obj.title).assertEqual(contentForm.title);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM.toString()) {
                let obj:uniformDataStruct.OpenHarmonyAppItem = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(appItem.uniformDataType);
                  expect(obj.appId).assertEqual(appItem.appId);
                  expect(obj.appName).assertEqual(appItem.appName);
                  expect(obj.appIconId).assertEqual(appItem.appIconId);
                  expect(obj.appIconId).assertEqual(appItem.appIconId);
                  expect(obj.bundleName).assertEqual(appItem.bundleName);
                  expect(obj.abilityName).assertEqual(appItem.abilityName);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML.toString()) {
                let obj:uniformDataStruct.HTML = entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(htmlObj.uniformDataType);
                  expect(obj.htmlContent).assertEqual(htmlObj.htmlContent);
                  expect(obj.plainContent).assertEqual(htmlObj.plainContent);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK.toString()) {
                let obj:uniformDataStruct.Hyperlink = entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(hyperlink.uniformDataType);
                  expect(obj.url).assertEqual(hyperlink.url);
                  expect(obj.description).assertEqual(hyperlink.description);
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done()
      });
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2200
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2200';

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
        formId: 1 as int,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
      }
      recordA.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      let plainTextA: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example A',
        textAbstract: 'this is abstract A',
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
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 200, width: 200
        },
        alphaType: image.AlphaType.UNPREMUL
      };
      let pixelMapDetails: Record<string, int | long | double | string | Uint8Array> = {
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
        textAbstract: 'this is abstract C',
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
      let properties = new unifiedDataChannel.UnifiedDataProperties();
      properties.tag = "records_to_entries_data_format";
      unifiedData.properties = properties;
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries(ret[i]);
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries: Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead.uniformDataType).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead.oriUri).assertEqual(fileUri.oriUri);
                  expect(fileUriRead.fileType).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM.toString()) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead.uniformDataType).assertEqual(formData.uniformDataType);
                  expect(formRead.formId).assertEqual(formData.formId);
                  expect(formRead.formName).assertEqual(formData.formName);
                  expect(formRead.bundleName).assertEqual(formData.bundleName);
                  expect(formRead.abilityName).assertEqual(formData.abilityName);
                  expect(formRead.module).assertEqual(formData.module);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.toString()) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj.uniformDataType).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj.textContent).assertEqual(plainTextB.textContent);
                  expect(plainObj.textAbstract).assertEqual(plainTextB.textAbstract);
                  expect(plainObj.textContent != plainTextA.textContent).assertEqual(true);
                  expect(plainObj.textAbstract != plainTextA.textAbstract).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP.toString()) {
                let obj: uniformDataStruct.PixelMap =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo: image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj.uniformDataType).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj.details)).assertEqual(JSON.stringify(pixelMap.details));
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM.toString()) {
                let obj: uniformDataStruct.ContentForm =
                  entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(contentForm.uniformDataType);
                  expect(obj.title).assertEqual(contentFormB.title);
                  expect(obj.title != contentForm.title).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM.toString()) {
                let obj: uniformDataStruct.OpenHarmonyAppItem =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(appItem.uniformDataType);
                  expect(obj.appId).assertEqual(appItem.appId);
                  expect(obj.appName).assertEqual(appItem.appName);
                  expect(obj.appIconId).assertEqual(appItem.appIconId);
                  expect(obj.bundleName).assertEqual(appItem.bundleName);
                  expect(obj.abilityName).assertEqual(appItemB.abilityName);
                  expect(obj.abilityName != appItem.abilityName).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML.toString()) {
                let obj: uniformDataStruct.HTML =
                  entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(htmlObj.uniformDataType);
                  expect(obj.htmlContent).assertEqual(htmlObj.htmlContent);
                  expect(obj.plainContent).assertEqual(htmlObj.plainContent);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK.toString()) {
                let obj: uniformDataStruct.Hyperlink =
                  entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(hyperlink.uniformDataType);
                  expect(obj.url).assertEqual(hyperlinkB.url);
                  expect(obj.description).assertEqual(hyperlinkB.description);
                  expect(obj.url != hyperlink.url).assertEqual(true);
                  expect(obj.description != hyperlink.description).assertEqual(true);
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
    });

/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2300
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (done: () => void) => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2300';
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
        textAbstract: 'this is abstract A',
      }
      let plainTextB: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example B',
        textAbstract: 'this is abstract C',
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
      let opt : image.InitializationOptions =
        {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 200, width: 200 },
          alphaType: image.AlphaType.UNPREMUL
        };
      let pixelMapDetails : Record<string, int | long | double | string | Uint8Array> = {
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
      let properties = new unifiedDataChannel.UnifiedDataProperties();
      properties.tag = "records_to_entries_data_format";
      unifiedData.properties = properties;
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead.uniformDataType).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead.oriUri).assertEqual(fileUri.oriUri);
                  expect(fileUriRead.fileType).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM.toString()) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead.uniformDataType).assertEqual(formData.uniformDataType);
                  expect(formRead.formId).assertEqual(formData.formId);
                  expect(formRead.formName).assertEqual(formData.formName);
                  expect(formRead.bundleName).assertEqual(formData.bundleName);
                  expect(formRead.abilityName).assertEqual(formData.abilityName);
                  expect(formRead.module).assertEqual(formData.module);
                  expect(formRead.module != formDataB.module).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.toString()) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj.uniformDataType).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj.textContent).assertEqual(plainTextB.textContent);
                  expect(plainObj.textAbstract).assertEqual(plainTextB.textAbstract);
                  expect(plainObj.textContent != plainTextA.textContent).assertEqual(true);
                  expect(plainObj.textAbstract != plainTextA.textAbstract).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP.toString()) {
                let obj:uniformDataStruct.PixelMap = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo:image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj.uniformDataType).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj.details)).assertEqual(JSON.stringify(pixelMap.details));
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM.toString()) {
                let obj:uniformDataStruct.ContentForm = entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(contentForm.uniformDataType);
                  expect(obj.title).assertEqual(contentForm.title);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM.toString()) {
                let obj:uniformDataStruct.OpenHarmonyAppItem = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(appItem.uniformDataType);
                  expect(obj.appId).assertEqual(appItem.appId);
                  expect(obj.appName).assertEqual(appItem.appName);
                  expect(obj.appIconId).assertEqual(appItem.appIconId);
                  expect(obj.appIconId).assertEqual(appItem.appIconId);
                  expect(obj.bundleName).assertEqual(appItem.bundleName);
                  expect(obj.abilityName).assertEqual(appItem.abilityName);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML.toString()) {
                let obj:uniformDataStruct.HTML = entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(htmlObj.uniformDataType);
                  expect(obj.htmlContent).assertEqual(htmlObj.htmlContent);
                  expect(obj.plainContent).assertEqual(htmlObj.plainContent);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK.toString()) {
                let obj:uniformDataStruct.Hyperlink = entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(hyperlink.uniformDataType);
                  expect(obj.url).assertEqual(hyperlink.url);
                  expect(obj.description).assertEqual(hyperlink.description);
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2400
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (done: () => void) => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_2400';
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
        textAbstract: 'this is abstract A',
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
      let opt : image.InitializationOptions =
        {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 200, width: 200 },
          alphaType: image.AlphaType.UNPREMUL
        };
      let pixelMapDetails : Record<string, int | long | double | string | Uint8Array> = {
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
        textAbstract: 'this is abstract C',
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
      let pixelMapDetails1 : Record<string, int | long | double | string | Uint8Array> = {
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
      let properties = new unifiedDataChannel.UnifiedDataProperties();
      properties.tag = "records_to_entries_data_format";
      unifiedData.properties = properties;
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            unifiedDataChannel.convertRecordsToEntries( ret[i]);
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let recordSize = records.length;
            console.info(`recordSize.size = ${recordSize}`);
            expect(recordSize).assertEqual(1);
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let entries : Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.FILE_URI.toString()) {
                let fileUriRead: uniformDataStruct.FileUri =
                  entries[uniformTypeDescriptor.UniformDataType.FILE_URI] as uniformDataStruct.FileUri;
                if (fileUriRead != undefined) {
                  expect(fileUriRead.uniformDataType).assertEqual(fileUri.uniformDataType);
                  expect(fileUriRead.oriUri).assertEqual(fileUri.oriUri);
                  expect(fileUriRead.fileType).assertEqual(fileUri.fileType);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM.toString()) {
                let formRead: uniformDataStruct.Form =
                  entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM] as uniformDataStruct.Form;
                if (formRead != undefined) {
                  expect(formRead.uniformDataType).assertEqual(formData.uniformDataType);
                  expect(formRead.formId).assertEqual(formData.formId);
                  expect(formRead.formName).assertEqual(formData.formName);
                  expect(formRead.bundleName).assertEqual(formData.bundleName);
                  expect(formRead.abilityName).assertEqual(formData.abilityName);
                  expect(formRead.module).assertEqual(formData.module);
                  expect(formRead.module !=  formDataB.module).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.toString()) {
                let plainObj: uniformDataStruct.PlainText =
                  unifiedDataRecord.getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
                if (plainObj != undefined) {
                  expect(plainObj.uniformDataType).assertEqual(plainTextA.uniformDataType);
                  expect(plainObj.textContent).assertEqual(plainTextB.textContent);
                  expect(plainObj.textAbstract).assertEqual(plainTextB.textAbstract);
                  expect(plainObj.textContent != plainTextA.textContent).assertEqual(true);
                  expect(plainObj.textAbstract != plainTextA.textAbstract).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP.toString()) {
                let obj:uniformDataStruct.PixelMap = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP] as uniformDataStruct.PixelMap;
                if (obj != undefined) {
                  let imageInfo:image.ImageInfo = await obj.pixelMap.getImageInfo();
                  expect(obj.uniformDataType).assertEqual(pixelMap.uniformDataType);
                  expect(imageInfo.size.height).assertEqual(opt.size.height);
                  expect(imageInfo.size.width).assertEqual(opt.size.width);
                  expect(JSON.stringify(obj.details)).assertEqual(JSON.stringify(pixelMapB.details));
                  expect(JSON.stringify(obj.details) != JSON.stringify(pixelMap.details)).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.CONTENT_FORM.toString()) {
                let obj:uniformDataStruct.ContentForm = entries[uniformTypeDescriptor.UniformDataType.CONTENT_FORM] as uniformDataStruct.ContentForm;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(contentForm.uniformDataType);
                  expect(obj.title).assertEqual(contentFormB.title);
                  expect(obj.title != contentForm.title).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM.toString()) {
                let obj:uniformDataStruct.OpenHarmonyAppItem = entries[uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM] as uniformDataStruct.OpenHarmonyAppItem;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(appItem.uniformDataType);
                  expect(obj.appId).assertEqual(appItem.appId);
                  expect(obj.appName).assertEqual(appItem.appName);
                  expect(obj.appIconId).assertEqual(appItem.appIconId);
                  expect(obj.appIconId).assertEqual(appItem.appIconId);
                  expect(obj.bundleName).assertEqual(appItem.bundleName);
                  expect(obj.abilityName).assertEqual(appItemB.abilityName);
                  expect(obj.abilityName != appItem.abilityName).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HTML.toString()) {
                let obj:uniformDataStruct.HTML = entries[uniformTypeDescriptor.UniformDataType.HTML] as uniformDataStruct.HTML;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(htmlObj.uniformDataType);
                  expect(obj.htmlContent).assertEqual(htmlObjB.htmlContent);
                  expect(obj.plainContent).assertEqual(htmlObjB.plainContent);
                  expect(obj.htmlContent != htmlObj.htmlContent).assertEqual(true);
                  expect(obj.plainContent != htmlObj.plainContent).assertEqual(true);
                }
              }
              if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK.toString()) {
                let obj:uniformDataStruct.Hyperlink = entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
                if (obj != undefined) {
                  expect(obj.uniformDataType).assertEqual(hyperlink.uniformDataType);
                  expect(obj.url).assertEqual(hyperlink.url);
                  expect(obj.description).assertEqual(hyperlink.description);
                  expect(obj.url != hyperlink.url).assertEqual(true);
                  expect(obj.description != hyperlink.description).assertEqual(true);
                }
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0500
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      let Options: unifiedDataChannel.Options= {
        key: String(null)
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData, (error, data) => {
          let err = error as BusinessError;
          console.info(TAG + `err = ${err}`);
          if (err === undefined) {
            console.info(TAG + `data = ${data}, options = ${Options}`);
            expect(err === undefined).assertFail();
            done();
          } else {
            console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
            expect(err.code).assertEqual(401);
            done();
          }
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG, `Failed to insertData0500 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1400
     * @tc.desc   unifiedDataChannel queryData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      let options1:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options1, unifiedData, (error1: BusinessError | null, data: string | undefined) => {
          console.info(TAG + `insertData0400 success; data = ${data}, options = ${options1}`);
          let options2:unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: 'data'
          };
          try {
            unifiedDataChannel.queryData(options2, (error2: BusinessError | null, ret: Array<unifiedDataChannel.UnifiedData> | undefined) => {
              const err = error2 as BusinessError;
              if (err === undefined && ret) {
                let size = ret.length;
                console.info(TAG, ` data.size = ${size}`);
                for (let i = 0; i < size; i++) {
                  if (ret[i]) {
                    let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
                    let size = records.length;
                    for (let j = 0; j < size; j++) {
                      if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.toString()) {
                        let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                        console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                      }
                    }
                  }
                }
                expect(err === undefined).assertFail();
                done();
              } else {
                console.info(`Failed to queryData code is ${err.code},message is ${err.message} `);
                expect(err.code === 401).assertTrue();
                done();
              }
            });
          } catch (error3) {
            let errorInfo = error3 as BusinessError;
            console.info(`Failed to queryData. code is ${errorInfo.code},message is ${errorInfo.message} `);
            expect(errorInfo.code).assertEqual('401');
            done();
          }
        });
      } catch (errorInfo4) {
        let error = errorInfo4 as BusinessError;
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400
     * @tc.desc   Verify the properties of the OpenHarmonyAppItem type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let appItemDetails: Record<string, int | long | double | string | Uint8Array> = {
        'appItemKey1': 123,
        'appItemKey2': 'appItemValue',
        'appItemKey3': u8Array,
      }
      let appItem: uniformDataStruct.OpenHarmonyAppItem = {
        uniformDataType: 'openharmony.app-item',
        appId: 'MyAppId',
        appName: 'MyAppName',
        appIconId: 'MyAppIconId',
        appLabelId: 'MyAppLabelId',
        bundleName: 'MyBundleName',
        abilityName: 'MyAbilityName',
        details: appItemDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('openharmony.app-item', appItem);
      unifiedData.addRecord(contentFormRecord);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let obj = unifiedDataRecord.getValue() as uniformDataStruct.OpenHarmonyAppItem;
              if (obj != undefined) {
                expect(obj.uniformDataType).assertEqual(appItem.uniformDataType);
                expect(obj.appId).assertEqual(appItem.appId);
                expect(obj.appName).assertEqual(appItem.appName);
                expect(obj.appIconId).assertEqual(appItem.appIconId);
                expect(obj.bundleName).assertEqual(appItem.bundleName);
                expect(obj.abilityName).assertEqual(appItem.abilityName);
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300 start');
      let u8Array = new Uint8Array([]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: "general.content-form",
        title: "string",
        thumbData: u8Array,
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            console.info(`data.size111`);
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              console.info(`data.size222`);
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.ContentForm;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(contentForm.uniformDataType);
                expect(record.title).assertEqual(contentForm.title);
                expect(record.appName).assertEqual(contentForm.appName);
                expect(record.linkUri).assertEqual(contentForm.linkUri);
                expect(record.description).assertEqual(contentForm.description);
                expect(JSON.stringify(record.appIcon)).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record.thumbData)).assertEqual(JSON.stringify(contentForm.thumbData));
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let u8Array1 = new Uint8Array([]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: "general.content-form",
        title: "string",
        thumbData: u8Array,
        description: "description",
        appIcon: u8Array1,
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      unifiedDataChannel.insertData(options, unifiedData).then((data)=>{
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.ContentForm;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(contentForm.uniformDataType);
                expect(record.title).assertEqual(contentForm.title);
                expect(record.description).assertEqual(contentForm.description);
                expect(JSON.stringify(record.appIcon)).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record.thumbData)).assertEqual(JSON.stringify(contentForm.thumbData));
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000';
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000 start');
      hilog.info(domain, tag, `${TAG} start`);

      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };

      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, int | long | double | string | Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      };

      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: '@#$%',
        bundleName: 'bundleName',
        abilityName: 'abilityName',
        module: 'module',
        details: formDetails
      };

      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
      hilog.info(domain, tag, `${TAG} : UnifiedData created with formId ${formData.formId}`);

      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        hilog.info(domain, tag, `${TAG} : Data inserted successfully with key ${data}`);
        hilog.info(domain, tag, `Inserting formId: ${formData.formId}`);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };

        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          hilog.info(domain, tag, `${TAG} : Query completed, returned ${ret.length} records`);

          let size = ret.length;
          console.info(`data.size = ${size}`);
          hilog.info(domain, tag, `queryData formId: ${formData.formId}`);
          for (let i = 0; i < size; i++) {
            hilog.info(domain, tag, `${TAG} : Processing record ${i}`);
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let recordSize = records.length;

            for (let j = 0; j < recordSize; j++) {
              hilog.info(domain, tag, `${TAG} 555: Processing sub-record ${j}`);
              let unifiedDataRecord = records[j] as unifiedDataChannel.UnifiedRecord; // 修正索引
              let record = unifiedDataRecord.getValue() as uniformDataStruct.Form;

              if (record != undefined) {
                hilog.info(domain, tag, `${TAG} 666: Record found with formId ${record.formId}`);
                expect(record.uniformDataType).assertEqual(formData.uniformDataType);
                hilog.info(domain, tag, `record.uniformDataType: ${record.uniformDataType}`);
                hilog.info(domain, tag, `formData.uniformDataType: ${formData.uniformDataType}`);
                expect(record.formId).assertEqual(formData.formId);
                hilog.info(domain, tag, `record.formId: ${record.formId}`);
                hilog.info(domain, tag, `formData.formId: ${formData.formId}`);
                expect(record.formName).assertEqual(formData.formName);
                hilog.info(domain, tag, `record.formName: ${record.formName}`);
                hilog.info(domain, tag, `formData.formName: ${formData.formName}`);
                expect(record.bundleName).assertEqual(formData.bundleName);
                hilog.info(domain, tag, `record.bundleName: ${record.bundleName}`);
                hilog.info(domain, tag, `formData.bundleName: ${formData.bundleName}`);
                expect(record.abilityName).assertEqual(formData.abilityName);
                hilog.info(domain, tag, `record.abilityName: ${record.abilityName}`);
                hilog.info(domain, tag, `formData.abilityName: ${formData.abilityName}`);
                expect(record.module).assertEqual(formData.module);
                hilog.info(domain, tag, `record.module: ${record.module}`);
                hilog.info(domain, tag, `formData.module: ${formData.module}`);
                let detailsGet: Record<string, int | long | double | string | Uint8Array> =
                  record.details as Record<string, int | long | double | string | Uint8Array>;
                if (detailsGet) {
                  expect(detailsGet["attr1"]).assertEqual(formDetails["attr1"]);
                  expect(Utils.arraysEqual(detailsGet["attr2"] as Uint8Array, formDetails["attr2"] as Uint8Array)).assertEqual(true);
                  expect(detailsGet["attr3"]).assertEqual(formDetails["attr3"]);
                  hilog.info(domain, tag, `record.details: ${detailsGet["attr1"]}`);
                  hilog.info(domain, tag, `formData.details: ${formDetails["attr1"]}`);
                  hilog.info(domain, tag, `record.details: ${detailsGet["attr2"]}`);
                  hilog.info(domain, tag, `formData.details: ${formDetails["attr2"]}`);
                  hilog.info(domain, tag, `record.details: ${detailsGet["attr3"]}`);
                  hilog.info(domain, tag, `formData.details: ${formDetails["attr3"]}`);
                }
              }
            }
          }

          hilog.info(domain, tag, `${TAG} : Test completed successfully`);
          done();
        }).catch((err) => {
          expect().assertFail();
          hilog.info(domain, tag, `${TAG} : Query failed with error ${err}`);
          done();
        });

        unifiedDataChannel.deleteData(options1).then(() => {
          hilog.info(domain, tag, `${TAG} : Data deleted successfully`);
        }).catch((err) => {
          hilog.info(domain, tag, `${TAG} : Delete failed with error ${err}`);
        });
      }).catch((err) => {
        hilog.info(domain, tag, `${TAG}: Insert failed with error ${err}`);
        expect().assertFail();
        done();
      });

      hilog.info(domain, tag, `${TAG} end`);
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUri : uniformDataStruct.FileUri = {
        uniformDataType: "general.file-uri",
        oriUri: "oriUri",
        fileType: "fileType",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.file-uri", fileUri);
      unifiedData.addRecord(contentFormRecord)
      unifiedDataChannel.insertData(options, unifiedData).then((data) =>{
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.FileUri;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(fileUri.uniformDataType);
                expect(record.oriUri).assertEqual(fileUri.oriUri);
                expect(record.fileType).assertEqual(fileUri.fileType);
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3700
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3700
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3700 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUri : uniformDataStruct.FileUri = {
        uniformDataType: "general.file-uri",
        oriUri: "oriUri",
        fileType: "",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.file-uri", fileUri);
      unifiedData.addRecord(contentFormRecord)
      unifiedDataChannel.insertData(options, unifiedData).then((data) =>{
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.FileUri;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(fileUri.uniformDataType);
                expect(record.oriUri).assertEqual(fileUri.oriUri);
                expect(record.fileType).assertEqual(fileUri.fileType);
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3800
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3800
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3800 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUri : uniformDataStruct.FileUri  = {
        uniformDataType: "general.file-uri",
        oriUri: "oriUri",
        fileType: "@#$%^&",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.file-uri", fileUri);
      unifiedData.addRecord(contentFormRecord)
      unifiedDataChannel.insertData(options, unifiedData).then((data) =>{
        let options1:unifiedDataChannel.Options ={
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        }
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.FileUri;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(fileUri.uniformDataType);
                expect(record.oriUri).assertEqual(fileUri.oriUri);
                expect(record.fileType).assertEqual(fileUri.fileType);
              }
            }
          }
          done();
        }).catch((err) => {
          expect().assertFail();
          done();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err) => {
        expect().assertFail();
        done();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3800 end");
    });

    hilog.info(domain, tag, '%{public}s', 'UDMFApiDataAllTest end');
  })
}
