/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Size, Level, TestType } from '@ohos/hypium'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';

let TAG = "[ttt]"
export default function UDMFApiDataStructTest() {
  describe('UDMFApiDataStructTest', () => {
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100
     * @tc.desc   Verify the properties of the PlainText type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      await unifiedDataChannel.deleteData(options);
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200
     * @tc.desc   Verify the properties of the Hyperlink type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let hyperlinkDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let hyperlink: uniformDataStruct.Hyperlink = {
        uniformDataType: 'general.hyperlink',
        url: 'www.XXX.com',
        description: 'This is the description of this hyperlink',
        details: hyperlinkDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.hyperlink', hyperlink);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let obj = unifiedDataRecord.getValue() as object;
              if (obj != undefined) {
                expect(obj["uniformDataType"]).assertEqual(hyperlink.uniformDataType);
                expect(obj["url"]).assertEqual(hyperlink.url);
                expect(obj["description"]).assertEqual(hyperlink.description);
                expect(JSON.stringify(obj["details"])).assertEqual(JSON.stringify(hyperlink.details));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300
     * @tc.desc   Verify the properties of the HTML type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let htmlObjDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let htmlObj: uniformDataStruct.HTML = {
        uniformDataType: 'general.html',
        htmlContent: '<div><p>标题</p></div>',
        plainContent: 'this is plainContent',
        details: htmlObjDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.html', htmlObj);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let obj = unifiedDataRecord.getValue() as object;
              if (obj != undefined) {
                expect(obj["uniformDataType"]).assertEqual(htmlObj.uniformDataType);
                expect(obj["htmlContent"]).assertEqual(htmlObj.htmlContent);
                expect(obj["plainContent"]).assertEqual(htmlObj.plainContent);
                expect(JSON.stringify(obj["details"])).assertEqual(JSON.stringify(htmlObj.details));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400
     * @tc.desc   Verify the properties of the OpenHarmonyAppItem type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let appItemDetails: Record<string, number | string | Uint8Array> = {
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
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let obj = unifiedDataRecord.getValue() as object;
              if (obj != undefined) {
                expect(obj["uniformDataType"]).assertEqual(appItem.uniformDataType);
                expect(obj["appId"]).assertEqual(appItem.appId);
                expect(obj["appName"]).assertEqual(appItem.appName);
                expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                expect(obj["appIconId"]).assertEqual(appItem.appIconId);
                expect(obj["bundleName"]).assertEqual(appItem.bundleName);
                expect(obj["abilityName"]).assertEqual(appItem.abilityName);
                expect(JSON.stringify(obj["details"])).assertEqual(JSON.stringify(appItem.details));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0500
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0500 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0600
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0600
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0600 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
        appName: "appName",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0700
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0700
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0700 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
        appName: "appName",
        linkUri: "link Uri",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["linkUri"]).assertEqual(contentForm.linkUri);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0800
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0800
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0800 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
        appName: "appName",
        linkUri: "link Uri",
        description: "description",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["linkUri"]).assertEqual(contentForm.linkUri);
                expect(record["description"]).assertEqual(contentForm.description);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0800 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0900
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0900
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0900 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
        appName: "appName",
        linkUri: "link Uri",
        description: "description",
        appIcon: u8Array,
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["linkUri"]).assertEqual(contentForm.linkUri);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["appIcon"])).assertEqual(JSON.stringify(contentForm.appIcon));
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.info(` [beforeEach] Failed to Data. code is ${err.code},message is ${err.message} `);
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        console.info(` [beforeEach] Failed to Data. code is ${err.code},message is ${err.message} `);
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0900 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1000
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1000
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1000 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
        appName: "appName",
        linkUri: "link Uri",
        description: "description",
        appIcon: u8Array,
        thumbData: u8Array,
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["linkUri"]).assertEqual(contentForm.linkUri);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["appIcon"])).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
              }
            }
          }
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      })
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1000 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1100
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1100 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "string",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["linkUri"]).assertEqual(contentForm.linkUri);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(record["appIcon"]).assertEqual(contentForm.appIcon);
                expect(record["thumbData"]).assertEqual(contentForm.thumbData);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1100 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1200
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1200 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: 'general.content-form',
        title: "",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1200 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["linkUri"]).assertEqual(contentForm.linkUri);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["appIcon"])).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1400
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1400 start');
      let u8Array = new Uint8Array();
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
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1500
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1500
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1500 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: "general.content-form",
        title: "string",
        thumbData: u8Array,
        description: "",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1600
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1600
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1600 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: "general.content-form",
        title: "string",
        thumbData: u8Array,
        description: "!@#$$%^",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data)=>{
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1600 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data)=>{
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["appIcon"])).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1800
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1800
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1800 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let u8Array1 = new Uint8Array();
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
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["appIcon"])).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1800 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1900
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1900
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1900 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: "general.content-form",
        title: "string",
        thumbData: u8Array,
        description: "description",
        appIcon: u8Array,
        appName: "",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["appIcon"])).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1900 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2000
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2000
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2000 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: "general.content-form",
        title: "string",
        thumbData: u8Array,
        description: "description",
        appIcon: u8Array,
        appName: "!@#$%&",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["appIcon"])).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2100
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2100 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: "general.content-form",
        title: "string",
        thumbData: u8Array,
        description: "description",
        appIcon: u8Array,
        appName: "appName",
        linkUri: "",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["linkUri"]).assertEqual(contentForm.linkUri);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["appIcon"])).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2100 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2200
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2200 start');

      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      await unifiedDataChannel.deleteData(options);
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: "general.content-form",
        title: "string",
        thumbData: u8Array,
        description: "description",
        appIcon: u8Array,
        appName: "appName",
        linkUri: "@#@#$%",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
                expect(record["appName"]).assertEqual(contentForm.appName);
                expect(record["linkUri"]).assertEqual(contentForm.linkUri);
                expect(record["description"]).assertEqual(contentForm.description);
                expect(JSON.stringify(record["appIcon"])).assertEqual(JSON.stringify(contentForm.appIcon));
                expect(JSON.stringify(record["thumbData"])).assertEqual(JSON.stringify(contentForm.thumbData));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2200 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2300
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2300 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let contentForm: uniformDataStruct.ContentForm = {
        uniformDataType: "general.content-form",
        title: "@#%&",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(contentForm.uniformDataType);
                expect(record["title"]).assertEqual(contentForm.title);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2400
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2400 start');
    let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let formData: uniformDataStruct.Form  = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: 'undefined',
        bundleName: 'bundleName',
        abilityName: 'abilityName',
        module: 'module',
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
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
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(formData.uniformDataType);
                expect(record["formId"]).assertEqual(formData.formId);
                expect(record["formName"]).assertEqual(formData.formName);
                expect(record["bundleName"]).assertEqual(formData.bundleName);
                expect(record["abilityName"]).assertEqual(formData.abilityName);
                expect(record["module"]).assertEqual(formData.module);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2500
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2500
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2500 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let formData: uniformDataStruct.Form  = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: 'formName',
        bundleName: 'bundleName',
        abilityName: 'abilityName',
        module: 'module',
        details: formDetails
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
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
              let record = unifiedDataRecord.getValue() as object;
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
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2600
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2600
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2600 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let formData: uniformDataStruct.Form  = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: '',
        bundleName: 'bundleName',
        abilityName: 'abilityName',
        module: 'module',
        details: formDetails
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
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
              let record = unifiedDataRecord.getValue() as object;
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
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2700
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2700
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2700 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let formData: uniformDataStruct.Form  = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: 'formName',
        bundleName: '',
        abilityName: 'abilityName',
        module: 'module',
        details: formDetails
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
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
              let record = unifiedDataRecord.getValue() as object;
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
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2800
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2800
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2800 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let formData: uniformDataStruct.Form  = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: 'undefined',
        bundleName: 'bundleName',
        abilityName: '',
        module: 'module',
        details: formDetails
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
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
              let record = unifiedDataRecord.getValue() as object;
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
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2900
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2900
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2900 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let formData: uniformDataStruct.Form  = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: 'undefined',
        bundleName: 'bundleName',
        abilityName: 'abilityName',
        module: '',
        details: formDetails
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
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
              let record = unifiedDataRecord.getValue() as object;
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
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2900 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let formData: uniformDataStruct.Form  = {
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
              let record = unifiedDataRecord.getValue() as object;
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
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3100
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3100 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let formData: uniformDataStruct.Form  = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: 'formName',
        bundleName: '@#$%^',
        abilityName: 'abilityName',
        module: 'module',
        details: formDetails
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
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
              let record = unifiedDataRecord.getValue() as object;
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
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3200
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3200 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let formData: uniformDataStruct.Form  = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: 'undefined',
        bundleName: 'bundleName',
        abilityName: '@#$%^',
        module: 'module',
        details: formDetails
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
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
              let record = unifiedDataRecord.getValue() as object;
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
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3300
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3300 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let formDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let formData: uniformDataStruct.Form  = {
        uniformDataType: 'openharmony.form',
        formId: 123,
        formName: 'undefined',
        bundleName: 'bundleName',
        abilityName: 'abilityName',
        module: '@#$%^&',
        details: formDetails
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let formRecord = new unifiedDataChannel.UnifiedRecord("openharmony.form", formData);
      unifiedData.addRecord(formRecord);
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
              let record = unifiedDataRecord.getValue() as object;
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
        }).catch((err: BusinessError) => {
          expect().assertFail();
        });
        await unifiedDataChannel.deleteData(options1);
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUri : uniformDataStruct.FileUri  = {
        uniformDataType: "general.file-uri",
        oriUri: "oriUri",
        fileType: "fileType",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.file-uri", fileUri);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                expect(record["oriUri"]).assertEqual(fileUri.oriUri);
                expect(record["fileType"]).assertEqual(fileUri.fileType);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3400 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3500
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3500
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3500 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUri : uniformDataStruct.FileUri  = {
        uniformDataType: "general.file-uri",
        oriUri: "",
        fileType: "fileType",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.file-uri", fileUri);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                expect(record["oriUri"]).assertEqual(fileUri.oriUri);
                expect(record["fileType"]).assertEqual(fileUri.fileType);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3500 end");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3600
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3600
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3600 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUri : uniformDataStruct.FileUri  = {
        uniformDataType: "general.file-uri",
        oriUri: "@#$%^",
        fileType: "fileType",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.file-uri", fileUri);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                expect(record["oriUri"]).assertEqual(fileUri.oriUri);
                expect(record["fileType"]).assertEqual(fileUri.fileType);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3600 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3700
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3700
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3700 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUri : uniformDataStruct.FileUri  = {
        uniformDataType: "general.file-uri",
        oriUri: "oriUri",
        fileType: "",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.file-uri", fileUri);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                expect(record["oriUri"]).assertEqual(fileUri.oriUri);
                expect(record["fileType"]).assertEqual(fileUri.fileType);
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
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                expect(record["oriUri"]).assertEqual(fileUri.oriUri);
                expect(record["fileType"]).assertEqual(fileUri.fileType);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3900
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3900
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3900 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<string, number | string |Uint8Array> = {
        'attr1': 'value1',
        'attr2': u8Array,
        'attr3': 123,
      }
      let fileUri : uniformDataStruct.FileUri  = {
        uniformDataType: "general.file-uri",
        oriUri: "oriUri",
        fileType: "fileType",
        details: fileUriDetails,
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.file-uri", fileUri);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(fileUri.uniformDataType);
                expect(record["oriUri"]).assertEqual(fileUri.oriUri);
                expect(record["fileType"]).assertEqual(fileUri.fileType);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(fileUri.details));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_3900 end");
    });
    
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
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
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(pixelMap.details));
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 }, alphaType: 3 };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(opt.pixelFormat);
                expect(imageInfo.alphaType).assertEqual(opt.alphaType);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4200
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4200 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(opt.pixelFormat);
                expect(imageInfo.alphaType).assertEqual(2);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4300
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4300 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(3);
                expect(imageInfo.alphaType).assertEqual(2);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4400
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(3);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(3);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(800);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4600
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4600
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4600 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(3);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(800);
                expect(imageInfo.mimeType).assertEqual("");
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4600 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(3);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(800);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4800
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4800
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4800 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(opt.pixelFormat).assertEqual(opt.pixelFormat);
                expect(imageInfo.pixelFormat).assertEqual(3);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(800);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4900
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4900
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4900 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt : image.InitializationOptions = { editable: true, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(opt.pixelFormat).assertEqual(opt.srcPixelFormat);
                expect(imageInfo.pixelFormat).assertEqual(3);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(800);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4900 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5000
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5000
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5000 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, alphaType: image.AlphaType.OPAQUE, size: { height: 4, width: 6 } }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(7);
                expect(imageInfo.alphaType).assertEqual(1);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(48);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5000 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5100
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5100 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, alphaType: image.AlphaType.PREMUL, size: { height: 4, width: 6 } }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(7);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(48);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5100 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5200
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5200 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, alphaType: image.AlphaType.UNPREMUL, size: { height: 4, width: 6 } }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapSync(arrayBuffer, opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(7);
                expect(imageInfo.alphaType).assertEqual(3);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(48);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5300
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5300 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888,  size: { height: 4, width: 6 } }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapUsingAllocatorSync(opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(4);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(24);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5400
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, alphaType: image.AlphaType.UNPREMUL, size: { height: 4, width: 6 } }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapUsingAllocatorSync(opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(7);
                expect(imageInfo.alphaType).assertEqual(3);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(48);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5500
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5500
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5500 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, alphaType: image.AlphaType.OPAQUE, size: { height: 4, width: 6 } }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapUsingAllocatorSync(opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(7);
                expect(imageInfo.alphaType).assertEqual(1);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(48);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5500 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5600
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5600
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5600 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let arrayBuffer = new ArrayBuffer(4*200*200);
      let opt: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, alphaType: image.AlphaType.PREMUL, size: { height: 4, width: 6 } }
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapUsingAllocatorSync(opt),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(7);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(48);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5600 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5700
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5700
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5700 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let opt : image.InitializationOptions = { editable: true,pixelFormat:image.PixelMapFormat.RGBA_8888, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapUsingAllocatorSync(opt, image.AllocatorType.AUTO),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(3);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(800);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5700 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5800
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5800
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5800 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let opt : image.InitializationOptions = { editable: true,pixelFormat:image.PixelMapFormat.BGRA_8888, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapUsingAllocatorSync(opt, image.AllocatorType.DMA),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(4);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(800);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5800 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let opt : image.InitializationOptions = { editable: true,pixelFormat:image.PixelMapFormat.BGRA_8888, size: { height: 200, width: 200 } };
      let pixelMap : uniformDataStruct.PixelMap = {
        uniformDataType : 'openharmony.pixel-map',
        pixelMap : image.createPixelMapUsingAllocatorSync(opt, image.AllocatorType.SHARE_MEMORY),
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
      unifiedData.addRecord(contentFormRecord)
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) =>{
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
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
              if (record != undefined) {
                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                expect(record["uniformDataType"]).assertEqual(pixelMap.uniformDataType);
                expect(imageInfo.size.height).assertEqual(opt.size.height);
                expect(imageInfo.size.width).assertEqual(opt.size.width);
                expect(imageInfo.pixelFormat).assertEqual(4);
                expect(imageInfo.alphaType).assertEqual(2);
                expect(imageInfo.density).assertEqual(0);
                expect(imageInfo.stride).assertEqual(800);
                expect(imageInfo.mimeType).assertEqual("");
                expect(imageInfo.isHdr).assertEqual(false);
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
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900 end");
    });
  })
}