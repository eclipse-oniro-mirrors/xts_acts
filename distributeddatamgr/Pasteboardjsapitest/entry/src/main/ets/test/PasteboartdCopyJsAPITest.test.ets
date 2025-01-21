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
import pasteboard from '@ohos.pasteboard';
import { BusinessError } from '@ohos.base';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import image from '@ohos.multimedia.image';
let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
export default function PasteboartdCopyJsAPITest() {
  describe('PasteboartdCopyJsAPITest', () => {
    beforeEach(async (done:Function)=>{
      await systemPasteboard.clearDataSync();
      done();
    })

    afterEach( ()=>{
    })
    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_0100
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0100
     * @tc.desc      : Verify the properties of the Text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0100', 0, () => {
      let textData = new unifiedDataChannel.UnifiedData();
      let text = new unifiedDataChannel.Text();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      textData.properties = properties;
      text.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      textData.addRecord(text);
      systemPasteboard.setUnifiedData(textData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.TEXT) {
              let text = records[i] as unifiedDataChannel.Text;
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });


    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_0200
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0200
     * @tc.desc      : Verify the properties of the PlainText type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0200', 0, () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties = properties;
      plainText.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      plainText.textContent = 'delayTextContent';
      plainText.abstract = 'delayTextContent';
      plainTextData.addRecord(plainText);
      systemPasteboard.setUnifiedData(plainTextData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
              let text = records[i] as unifiedDataChannel.PlainText;
              expect(text.textContent).assertEqual("delayTextContent");
              expect(text.abstract).assertEqual("delayTextContent");
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_0300
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0300
     * @tc.desc      : Verify the properties of the Hyperlink type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0300', 0, () => {
      let hyperLinkData = new unifiedDataChannel.UnifiedData();
      let hyperLink = new unifiedDataChannel.Hyperlink();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      hyperLinkData.properties = properties;
      hyperLink.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      hyperLink.url = 'delayTextContent';
      hyperLink.description = 'delayTextContent';
      hyperLinkData.addRecord(hyperLink);
      systemPasteboard.setUnifiedData(hyperLinkData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.HYPERLINK) {
              let text = records[i] as unifiedDataChannel.Hyperlink;
              expect(text.url).assertEqual("delayTextContent");
              expect(text.description).assertEqual("delayTextContent");
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_0400
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0400
     * @tc.desc      : Verify the properties of the HTML type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0400', 0, () => {
      let htmlData = new unifiedDataChannel.UnifiedData();
      let html = new unifiedDataChannel.HTML();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      htmlData.properties = properties;
      html.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      html.htmlContent = 'delayTextContent';
      html.plainContent = 'delayTextContent';
      htmlData.addRecord(html);
      systemPasteboard.setUnifiedData(htmlData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.HTML) {
              let text = records[i] as unifiedDataChannel.HTML;
              expect(text.htmlContent).assertEqual("delayTextContent");
              expect(text.plainContent).assertEqual("delayTextContent");
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_0500
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0500
     * @tc.desc      : Verify the properties of the File type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0500', 0, () => {
      let fileData = new unifiedDataChannel.UnifiedData();
      let file = new unifiedDataChannel.File();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      fileData.properties = properties;
      file.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      file.uri = 'delayTextContent';
      fileData.addRecord(file);
      systemPasteboard.setUnifiedData(fileData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.FILE) {
              let text = records[i] as unifiedDataChannel.File;
              expect(text.uri).assertEqual("delayTextContent");
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_0600
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0600
     * @tc.desc      : Verify the properties of the Folder type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0600', 0, () => {
      let folderData = new unifiedDataChannel.UnifiedData();
      let folder = new unifiedDataChannel.Folder();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      folderData.properties = properties;
      folder.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      folder.uri = 'delayTextContent';
      folder.folderUri = 'delayTextContent';
      folderData.addRecord(folder);
      systemPasteboard.setUnifiedData(folderData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.FOLDER) {
              let text = records[i] as unifiedDataChannel.Folder;
              expect(text.uri).assertEqual("delayTextContent");
              expect(text.folderUri).assertEqual("delayTextContent");
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_0700
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0700
     * @tc.desc      : Verify the properties of the Image type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0700', 0, () => {
      let imageData = new unifiedDataChannel.UnifiedData();
      let image = new unifiedDataChannel.Image();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      imageData.properties = properties;
      image.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      image.uri = 'delayTextContent';
      image.imageUri='delayTextContent';
      imageData.addRecord(image);
      systemPasteboard.setUnifiedData(imageData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.IMAGE) {
              let text = records[i] as unifiedDataChannel.Image;
              expect(text.uri).assertEqual("delayTextContent");
              expect(text.imageUri).assertEqual("delayTextContent");
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_0800
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0800
     * @tc.desc      : Verify the properties of the Video type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0800', 0, () => {
      let videData = new unifiedDataChannel.UnifiedData();
      let video = new unifiedDataChannel.Video();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      videData.properties = properties;
      video.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      video.uri = 'delayTextContent';
      video.videoUri = 'schema://com.samples.test/files/test.mp4';
      videData.addRecord(video);
      systemPasteboard.setUnifiedData(videData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.VIDEO) {
              let text = records[i] as unifiedDataChannel.Video;
              expect(text.uri).assertEqual("delayTextContent");
              expect(text.videoUri).assertEqual('schema://com.samples.test/files/test.mp4');
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_0900
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0900
     * @tc.desc      : Verify the properties of the Audio type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_0900', 0, () => {
      let audioData = new unifiedDataChannel.UnifiedData();
      let audio = new unifiedDataChannel.Audio();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      audioData.properties = properties;
      audio.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      audio.uri = 'delayTextContent';
      audio.audioUri = 'schema://com.samples.test/files/test.mp4';
      audioData.addRecord(audio);
      systemPasteboard.setUnifiedData(audioData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.AUDIO) {
              let text = records[i] as unifiedDataChannel.Audio;
              expect(text.uri).assertEqual("delayTextContent");
              expect(text.audioUri).assertEqual('schema://com.samples.test/files/test.mp4');
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_1000
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1000
     * @tc.desc      : Verify the properties of the SystemDefinedRecord type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1000', 0, () => {
      let sdrData = new unifiedDataChannel.UnifiedData();
      let sdr  = new unifiedDataChannel.SystemDefinedRecord();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      sdrData.properties = properties;
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      sdr.details = {
        title: 'recordTitle',
        version: 1,
        content: u8Array,
      };
      sdrData.addRecord(sdr);
      systemPasteboard.setUnifiedData(sdrData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.TEXT) {
              let text = records[i] as unifiedDataChannel.SystemDefinedRecord;
              if (text.details != undefined) {
                expect(text.details.title).assertEqual("recordTitle");
                expect(text.details.version).assertEqual(1);
                expect(text.details.content).assertEqual(u8Array);
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_1100
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1100
     * @tc.desc      : Verify the properties of the SystemDefinedForm type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1100', 0, () => {
      let sdfData = new unifiedDataChannel.UnifiedData();
      let form = new unifiedDataChannel.SystemDefinedForm();
      form.formId = 123456;
      form.formName = 'MyFormName';
      form.bundleName = 'MyBundleName';
      form.abilityName = 'MyAbilityName';
      form.module = 'MyModule';
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      form.details = {
        formKey1: 123,
        formKey2: 'formValue',
        formKey3: u8Array,
      };
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      sdfData.properties = properties;
      sdfData.addRecord(form);
      systemPasteboard.setUnifiedData(sdfData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.TEXT) {
              let text = records[i] as unifiedDataChannel.SystemDefinedForm;
              expect(text.formId).assertEqual(123456);
              expect(text.formName).assertEqual('MyFormName');
              expect(text.bundleName).assertEqual('MyBundleName');
              expect(text.abilityName).assertEqual('MyAbilityName');
              expect(text.module).assertEqual('MyModule');
              if (text.details != undefined) {
                expect(text.details.formKey1).assertEqual(123);
                expect(text.details.formKey2).assertEqual("formValue");
                expect(text.details.formKey3).assertEqual(u8Array);
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_1200
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1200
     * @tc.desc      : Verify the properties of the SystemDefinedAppItem type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1200', 0, () => {
      let appItemData = new unifiedDataChannel.UnifiedData();
      let appItem = new unifiedDataChannel.SystemDefinedAppItem();
      appItem.appId = 'MyAppId';
      appItem.appName = 'MyAppName';
      appItem.appIconId = 'MyAppIconId';
      appItem.appLabelId = 'MyAppLabelId';
      appItem.bundleName = 'MyBundleName';
      appItem.abilityName = 'MyAbilityName';
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      appItem.details = {
        appItemKey1: 123,
        appItemKey2: 'appItemValue',
        appItemKey3: u8Array,
      };
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      appItemData.properties = properties;
      appItemData.addRecord(appItem);
      systemPasteboard.setUnifiedData(appItemData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.TEXT) {
              let text = records[i] as unifiedDataChannel.SystemDefinedAppItem;
              expect(text.appId).assertEqual("MyAppId");
              expect(text.appName).assertEqual('MyAppName');
              expect(text.appIconId).assertEqual('MyAppIconId');
              expect(text.appLabelId).assertEqual('MyAppLabelId');
              expect(text.bundleName).assertEqual('MyBundleName');
              expect(text.abilityName).assertEqual('MyAbilityName');
              if (text.details != undefined) {
                expect(text.details.appItemKey1).assertEqual(123);
                expect(text.details.appItemKey2).assertEqual("appItemValue");
                expect(text.details.appItemKey3).assertEqual(u8Array);
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_1300
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1300
     * @tc.desc      : Verify the properties of the ApplicationDefinedRecord type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1300', 0, () => {
      let recordData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.ApplicationDefinedRecord();
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      record.applicationDefinedType = 'ApplicationDefinedType';
      record.rawData = u8Array;
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      recordData.properties = properties;
      recordData.addRecord(record);
      systemPasteboard.setUnifiedData(recordData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.TEXT) {
              let text = records[i] as unifiedDataChannel.ApplicationDefinedRecord;
              expect(text.applicationDefinedType).assertEqual("ApplicationDefinedType");
              expect(text.rawData).assertEqual(u8Array);
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_1400
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1400
     * @tc.desc      : Verify the properties of the OPENHARMONY_PIXEL_MAP type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1400', 0, async () => {
      const color = new ArrayBuffer(96); // 创建pixelmap对象
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      let pixelmap:image.PixelMap = await image.createPixelMapSync(color, opts);
      let pixelMapRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP,pixelmap);
      let sdpixelData = new unifiedDataChannel.UnifiedData();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      sdpixelData.properties = properties;
      sdpixelData.addRecord(pixelMapRecord);
      systemPasteboard.setUnifiedData(sdpixelData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let outputData = data;
          let records = outputData.getRecords();
          if (records[0].getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP){
            let pixelMap = records[0].getValue() as image.PixelMap;
            let imageInfo = pixelMap.getImageInfo();
            console.info(' Get PixelMap Data Success, type: '+records[0].getType() +
              ',bytesNumber:'+ pixelMap.getPixelBytesNumber() + ',imageInfo:'+ JSON.stringify(imageInfo));
            expect(pixelMap.getPixelBytesNumber() == 60).assertTrue();
          }else{
            console.info(' Get PixelMap Data No Success, type: '+records[0].getType())
            expect().assertFail();
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_1500
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1500
     * @tc.desc      : Verify the properties of the OPENHARMONY_WANT type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1500', 0, () => {
      let object: Want = {
        bundleName: "com.example.aafwk.test",
        abilityName: "com.example.aafwk.test.TwoAbility"
      };
      let want = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT,object);
      let wantData = new unifiedDataChannel.UnifiedData();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      wantData.properties = properties;
      wantData.addRecord(want);
      systemPasteboard.setUnifiedData(wantData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT) {
              expect(JSON.stringify(records[i].getValue())).assertEqual(object)
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })

    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_1600
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1600
     * @tc.desc      : setUnifiedDataSync and getUnifiedData
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1600', 0, async  (done:Function) => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties = properties;
      plainText.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      plainText.textContent = 'delayTextContent';
      plainText.abstract = 'delayTextContent';
      plainTextData.addRecord(plainText);
      try {
        systemPasteboard.setUnifiedDataSync(plainTextData);
        done();
        systemPasteboard.getUnifiedData().then((data) => {
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
              let text = records[i] as unifiedDataChannel.PlainText;
              expect(text.textContent).assertEqual("delayTextContent");
              expect(text.abstract).assertEqual("delayTextContent");
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }else {
                expect().assertFail();
              }
            }
          }
        }).catch((err: BusinessError) => {
          console.error('Failed to get UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        })
      } catch (err) {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_1700
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1700
     * @tc.desc      : setUnifiedData and getUnifiedDataSync
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1700', 0, () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties = properties;
      plainText.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      plainText.textContent = 'delayTextContent';
      plainText.abstract = 'delayTextContent';
      plainTextData.addRecord(plainText);
      systemPasteboard.setUnifiedData(plainTextData).then((data: void) => {
        console.info('Succeeded in setting UnifiedData.');
        try{
          let data:unifiedDataChannel.UnifiedData = systemPasteboard.getUnifiedDataSync();
          let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
          for (let i = 0; i < records.length; i++) {
            if (records[i].getType() === uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
              let text = records[i] as unifiedDataChannel.PlainText;
              expect(text.textContent).assertEqual("delayTextContent");
              expect(text.abstract).assertEqual("delayTextContent");
              if (text.details != undefined) {
                expect(text.details.key).assertEqual("delayPlaintext");
                expect(text.details.Value).assertEqual("delayPlaintext");
              }
            }
          }
        } catch (err) {
          console.error('Failed to set UnifiedData. Cause: ' + err.message);
          expect().assertFail();
        }
      }).catch((err: BusinessError) => {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      })
    });


    /**
     * @tc.name      : testSUB_Pasteboard_Local_SDK_Copy_JsApiTest_1800
     * @tc.number    : SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1800
     * @tc.desc      : setUnifiedDataSync and getUnifiedDataSync
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_Copy_JsApiTest_1800', 0, async  () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties = properties;
      plainText.details = {
        Value1: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      plainText.textContent = 'delayTextContent';
      plainText.abstract = 'delayTextContent';
      plainTextData.addRecord(plainText);
      try {
        await systemPasteboard.setUnifiedDataSync(plainTextData);
        let data:unifiedDataChannel.UnifiedData =await systemPasteboard.getUnifiedDataSync();
        let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
        for (let i = 0; i < records.length; i++) {
          if (records[i].getType() === uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
            let text = records[i] as unifiedDataChannel.PlainText;
            expect(text.textContent).assertEqual("delayTextContent");
            expect(text.abstract).assertEqual("delayTextContent");
            if (text.details != undefined) {
              expect(text.details.Value1).assertEqual("delayPlaintext");
              expect(text.details.Value).assertEqual("delayPlaintext");
            }
          }
        }
      } catch (err) {
        console.error('Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      }
    });
  })
}

