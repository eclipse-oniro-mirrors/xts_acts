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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
import { BusinessError } from '@ohos.base';

export default function UDMFApiDataStructTest() {
  describe('UDMFApiDataStructTest', () => {
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
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100
     * @tc.desc      : Verify the properties of the PlainText type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100', 0, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100 start');
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
      let obj = plainText;
      expect(obj.uniformDataType).assertEqual(plainText.uniformDataType)
      expect(obj.textContent).assertEqual(plainText.textContent)
      expect(obj.abstract).assertEqual(plainText.abstract)
      expect(obj.details).assertEqual(plainText.details)
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200
     * @tc.desc      : Verify the properties of the Hyperlink type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200', 0, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200 start');
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
      let obj = hyperlink;
      expect(obj.uniformDataType).assertEqual(hyperlink.uniformDataType)
      expect(obj.url).assertEqual(hyperlink.url)
      expect(obj.description).assertEqual(hyperlink.description)
      expect(obj.details).assertEqual(hyperlink.details)
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300
     * @tc.desc      : Verify the properties of the HTML type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300', 0, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300 start');
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
      let obj = htmlObj;
      expect(obj.uniformDataType).assertEqual(htmlObj.uniformDataType)
      expect(obj.htmlContent).assertEqual(htmlObj.htmlContent)
      expect(obj.plainContent).assertEqual(htmlObj.plainContent)
      expect(obj.details).assertEqual(htmlObj.details)
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400
     * @tc.desc      : Verify the properties of the OpenHarmonyAppItem type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400', 0, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400 start');
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
      let obj = appItem;
      expect(obj.uniformDataType).assertEqual(appItem.uniformDataType)
      expect(obj.appId).assertEqual(appItem.appId)
      expect(obj.appName).assertEqual(appItem.appName)
      expect(obj.appIconId).assertEqual(appItem.appIconId)
      expect(obj.appIconId).assertEqual(appItem.appIconId)
      expect(obj.bundleName).assertEqual(appItem.bundleName)
      expect(obj.abilityName).assertEqual(appItem.abilityName)
      expect(obj.details).assertEqual(appItem.details)
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0500
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0500', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0500 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0600
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0600', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0600 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0700
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0700', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0700 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0800
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0800', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0900
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0900', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        console.info(` [beforeEach] Failed to Data. code is ${err.code},message is ${err.message} `);
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1000
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1000', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      })
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1100
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1100', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1200
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1200', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1300 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1400
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1400', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
        unifiedDataChannel.deleteData(options).then((err) => {
        });
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1400 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1500
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1500', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1500 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1600
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1600', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1800
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1800', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest1900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1900
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1900', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_1900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest2000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2000
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2000', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2000 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest2200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2100
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2100', 0, async () => {
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
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest2200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2200
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2200', 0, async () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2200 start');
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
        linkUri: "@#@#$%",
      };
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord("general.content-form", contentForm);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async () =>{
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest2300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2300
     * @tc.desc      : Verify the properties of the contentForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2300', 0, async () => {
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
      await unifiedDataChannel.insertData(options, unifiedData).then(async () =>{
        await unifiedDataChannel.queryData(options).then(async (ret) => {
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
      }).catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_2300 end");
    });
  })
}