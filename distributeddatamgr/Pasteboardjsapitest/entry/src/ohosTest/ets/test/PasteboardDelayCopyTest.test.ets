/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
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
import pasteboard from '@ohos.pasteboard';
import { BusinessError } from '@ohos.base';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import Want from '@ohos.app.ability.Want';
import image from '@ohos.multimedia.image';

export default function PasteboardDelayCopyTest() {
  describe('PasteboardDelayCopyTest', () => {
    let  TAG = "ttt";
    let systemPasteBoard = pasteboard.getSystemPasteboard();
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
    })
    beforeEach(() => {
      systemPasteBoard.clearDataSync();
    })
    afterEach(() => {
    })
    afterAll(() => {
    })


    /**
     * @tc.name setUnifiedDataTest001
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0100
     * @tc.desc setUnifiedData parameter is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0100', 0, async () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      const GetDelayPlainText = ((dataType:string) => {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'delayPlaintext',
          Value: 'delayPlaintext',
        };
        plainText.textContent = 'delayTextContent';
        plainText.abstract = 'delayAbstract';
        plainTextData.addRecord(plainText);
        return plainTextData;
      });
      plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties.getDelayData = GetDelayPlainText;
      try{
        await systemPasteBoard.setUnifiedData(null).then((data)=>{
          console.log("ttt setUnifiedData success");
          expect().assertFail();
        }).catch((error:BusinessError) => {
          console.log("ttt setUnifiedData failed");
          expect().assertFail();
        });
      } catch (error) {
        console.log("ttt setUnifiedData failed");
        expect(error.code == 401).assertTrue();
      }

    })

    /**
     * @tc.name setUnifiedDataTest002
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0200
     * @tc.desc setUnifiedData parameter is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0200', 0, async () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      const GetDelayPlainText = ((dataType:string) => {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'delayPlaintext',
          Value: 'delayPlaintext',
        };
        plainText.textContent = 'delayTextContent';
        plainText.abstract = 'delayAbstract';
        plainTextData.addRecord(plainText);
        return plainTextData;
      });
      plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties.getDelayData = GetDelayPlainText;
      try{
        await pasteboard.getSystemPasteboard().setUnifiedData(undefined).then((data)=>{
          console.log("ttt setUnifiedData success");
          expect().assertFail();
        }).catch((error:BusinessError) => {
          console.log("ttt setUnifiedData failed error is "+error.message);
          expect().assertFail();
        });
      } catch (error) {
        console.log("ttt setUnifiedData failed");
        expect(error.code == 401).assertTrue();
      }


    })

    /**
     * @tc.name setUnifiedDataTest003
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0300
     * @tc.desc setUnifiedDataSync parameter is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0300', 0, () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      const GetDelayPlainText = ((dataType:string) => {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'delayPlaintext',
          Value: 'delayPlaintext',
        };
        plainText.textContent = 'delayTextContent';
        plainText.abstract = 'delayAbstract';
        plainTextData.addRecord(plainText);
        return plainTextData;
      });
      plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties.getDelayData = GetDelayPlainText;
      try{
        systemPasteBoard.setUnifiedDataSync(null);
        expect().assertFail()
      }catch(err){
        expect(err.code == 401).assertTrue();
      }
    })

    /**
     * @tc.name setUnifiedDataTest004
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0400
     * @tc.desc setUnifiedDataSync parameter is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0400', 0, () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      const GetDelayPlainText = ((dataType:string) => {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'delayPlaintext',
          Value: 'delayPlaintext',
        };
        plainText.textContent = 'delayTextContent';
        plainText.abstract = 'delayAbstract';
        plainTextData.addRecord(plainText);
        return plainTextData;
      });
      plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties.getDelayData = GetDelayPlainText;
      try{
        systemPasteBoard.setUnifiedDataSync(undefined);
        expect().assertFail()
      }catch(err){
        expect(err.code == 401).assertTrue();
      }
    })

    /**
     * @tc.name setUnifiedDataTest005
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0500
     * @tc.desc plainText test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0500', 0, async () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      const GetDelayPlainTextData = ((dataType:string) => {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'delayPlaintext',
          Value: 'delayPlaintext',
        };
        plainText.textContent = 'delayTextContent';
        plainText.abstract = 'delayAbstract';
        plainTextData.addRecord(plainText);
        return plainTextData;
      });
      plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties.getDelayData = GetDelayPlainTextData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(plainTextData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log("ttt setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log("ttt setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT){
          let record = records[0] as unifiedDataChannel.PlainText;
          console.info(TAG+' Get PlainText Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details)+ ', textContext:'+
          record.textContent +', abstract:'+ record.abstract);
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayPlaintext');
        }else{
          console.info(TAG+' Get PlainText Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get PlainText Data Fail '+err);
        expect().assertFail();
      })

    })


    /**
     * @tc.name setUnifiedDataTest006
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0600
     * @tc.desc text test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0600', 0, async () => {
      let textData = new unifiedDataChannel.UnifiedData();
      const GetDelayTextData = ((dataType:string) => {
        let text = new unifiedDataChannel.Text();
        text.details = {
          Key: 'delayTextKey',
          Value: 'delayTextValue',
        };
        textData.addRecord(text);
        return textData;
      });
      textData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      textData.properties.getDelayData = GetDelayTextData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(textData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.TEXT){
          let record = records[0] as unifiedDataChannel.Text;
          console.info(TAG+' Get Text Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details));
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayTextKey');
        }else{
          console.info(TAG+' Get Text Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get Text Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest007
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0700
     * @tc.desc Html test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0700', 0, async () => {
      let htmlData = new unifiedDataChannel.UnifiedData();
      const GetDelayHTMLData = ((dataType:string) => {
        let hText = new unifiedDataChannel.HTML();
        hText.details = {
          Key: 'delayHTextKey',
          Value: 'delayHTextValue',
        };
        htmlData.addRecord(hText);
        return htmlData;
      });
      htmlData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      htmlData.properties.getDelayData = GetDelayHTMLData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(htmlData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.HTML){
          let record = records[0] as unifiedDataChannel.HTML;
          console.info(TAG+' Get Html Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details));
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayHTextKey');
        }else{
          console.info(TAG+' Get Html Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get Html Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest008
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0800
     * @tc.desc Hyperlink test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0800', 0, async () => {
      let HyperlinkData = new unifiedDataChannel.UnifiedData();
      const GetDelayHyperlink = ((dataType:string) => {
        let HyperlinkText = new unifiedDataChannel.Hyperlink();
        HyperlinkText.details = {
          Key: 'delayHyperlinkKey',
          Value: 'delayHyperlinkValue',
        };
        HyperlinkData.addRecord(HyperlinkText);
        return HyperlinkData;
      });
      HyperlinkData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      HyperlinkData.properties.getDelayData = GetDelayHyperlink;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(HyperlinkData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK){
          let record = records[0] as unifiedDataChannel.Hyperlink;
          console.info(TAG+' Get Hyperlink Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details));
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayHyperlinkKey');
        }else{
          console.info(TAG+' Get Hyperlink Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get Hyperlink Data Fail '+err);
        expect().assertFail();
      })

    })


    /**
     * @tc.name setUnifiedDataTest009
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0900
     * @tc.desc Image test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0900', 0, async () => {
      let ImageData = new unifiedDataChannel.UnifiedData();
      const GetDelayImageData = ((dataType:string) => {
        let imageText = new unifiedDataChannel.Image();
        imageText.details = {
          Key: 'delayImageKey',
          Value: 'delayImageValue',
        };
        imageText.uri = 'delayImageUri';
        ImageData.addRecord(imageText);
        return ImageData;
      });
      ImageData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      ImageData.properties.getDelayData = GetDelayImageData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(ImageData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.IMAGE){
          let record = records[0] as unifiedDataChannel.Image;
          console.info(TAG+' Get Image Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details));
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayImageKey');
        }else{
          console.info(TAG+' Get Image Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get Image Data Fail '+err);
        expect().assertFail();
      })

    })


    /**
     * @tc.name setUnifiedDataTest010
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0110
     * @tc.desc Folder test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0110', 0, async () => {
      let FolderData = new unifiedDataChannel.UnifiedData();
      const GetDelayFolderData = ((dataType:string) => {
        let folderText = new unifiedDataChannel.Folder();
        folderText.details = {
          Key: 'delayFolderKey',
          Value: 'delayFolderValue',
        };
        FolderData.addRecord(folderText);
        return FolderData;
      });
      FolderData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      FolderData.properties.getDelayData = GetDelayFolderData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(FolderData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.FOLDER){
          let record = records[0] as unifiedDataChannel.Folder;
          console.info(TAG+' Get Folder Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details));
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayFolderKey');
        }else{
          console.info(TAG+' Get Folder Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get Folder Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest012
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0120
     * @tc.desc File test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0120', 0, async () => {
      let FileData = new unifiedDataChannel.UnifiedData();
      const GetDelayFileData = ((dataType:string) => {
        let fileText = new unifiedDataChannel.File();
        fileText.details = {
          Key: 'delayFileKey',
          Value: 'delayFileValue',
        };
        fileText.uri = 'delayFileUri';
        FileData.addRecord(fileText);
        return FileData;
      });
      FileData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      FileData.properties.getDelayData = GetDelayFileData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(FileData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.FILE){
          let record = records[0] as unifiedDataChannel.File;
          console.info(TAG+' Get File Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details));
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayFileKey');
        }else{
          console.info(TAG+' Get File Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get File Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest013
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0130
     * @tc.desc Audio test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0130', 0, async () => {
      let AudioData = new unifiedDataChannel.UnifiedData();
      const GetDelayAudioData = ((dataType:string) => {
        let audioText = new unifiedDataChannel.Audio();
        audioText.details = {
          Key: 'delayAudioKey',
          Value: 'delayAudioValue',
        };
        AudioData.addRecord(audioText);
        return AudioData;
      });
      AudioData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      AudioData.properties.getDelayData = GetDelayAudioData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(AudioData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.AUDIO){
          let record = records[0] as unifiedDataChannel.Audio;
          console.info(TAG+' Get Audio Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details));
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayAudioKey');
        }else{
          console.info(TAG+' Get Audio Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get Audio Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest014
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0140
     * @tc.desc Video test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0140', 0, async () => {
      let VideoData = new unifiedDataChannel.UnifiedData();
      const GetDelayVideoData = ((dataType:string) => {
        let videoText = new unifiedDataChannel.Video();
        videoText.details = {
          Key: 'delayVideoKey',
          Value: 'delayVideoValue',
        };
        videoText.uri ='delayVideoUri';
        VideoData.addRecord(videoText);
        return VideoData;
      });
      VideoData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      VideoData.properties.getDelayData = GetDelayVideoData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(VideoData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.VIDEO){
          let record = records[0] as unifiedDataChannel.Video;
          console.info(TAG+' Get Video Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details));
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayVideoKey');
        }else{
          console.info(TAG+' Get Video Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get Video Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest015
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0150
     * @tc.desc ApplicationDefinedRecord test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0150', 0, async () => {
      let appRecordData = new unifiedDataChannel.UnifiedData();
      const GetDelayAppDefinedRecordData = ((dataType:string) => {
        let appRecord = new unifiedDataChannel.ApplicationDefinedRecord();
        let u8 = new Uint8Array([1,2,3,4,5,6,7,8,9,10])
        appRecord.applicationDefinedType = 'ApplicationDefinedTypeDelay';
        appRecord.rawData = u8;
        appRecordData.addRecord(appRecord);
        return appRecordData;
      });
      appRecordData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      appRecordData.properties.getDelayData = GetDelayAppDefinedRecordData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(appRecordData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == 'ApplicationDefinedType'){
          let record = records[0] as unifiedDataChannel.ApplicationDefinedRecord;
          console.info(TAG+' Get AppRecord Data Success, type: '+records[0].getType() +
            ',rawData:'+ JSON.stringify(record.rawData));
          expect(record.applicationDefinedType).assertEqual('ApplicationDefinedTypeDelay');
        }else{
          console.info(TAG+' Get AppRecord Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get AppRecord Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest016
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0160
     * @tc.desc SystemDefinedForm test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0160', 0, async () => {
      let FormData = new unifiedDataChannel.UnifiedData();
      const GetDelayFormData = ((dataType:string) => {
        let form = new unifiedDataChannel.SystemDefinedForm();
        form.formId = 0;
        form.formName = 'formNameDelay';
        form.abilityName = 'abilityNameDelay';
        form.bundleName = 'bundleNameDelay';
        form.module = 'moduleDelay';
        form.details ={
          formKey1:1,
          formKey2:'form',
          formKey3: new Uint8Array([1,2,3,4,5,6,7,8,9,10])
        }
        FormData.addRecord(form);
        return FormData;
      });
      FormData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      FormData.properties.getDelayData = GetDelayFormData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(FormData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM){
          let record = records[0] as unifiedDataChannel.SystemDefinedForm;
          console.info(TAG+' Get SystemDefinedAppItem Data Success, type: '+records[0].getType() +
            ', details:'+ JSON.stringify(record.details)+
            ', formId:'+record.formId +', formName:'+record.formName +', abilityName:' + record.abilityName +
            ', bundleName:'+record.bundleName +', module:'+record.module );
          expect(record.formName).assertEqual('formNameDelay');
        }else{
          console.info(TAG+' Get SystemDefinedForm Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get SystemDefinedForm Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest017
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0170
     * @tc.desc SystemDefinedAppItem test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0170', 0, async () => {
      let AppItemData = new unifiedDataChannel.UnifiedData();
      const GetDelayAppItemData = ((dataType:string) => {
        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.appId = 'appIdDelay';
        appItem.appName = 'appNameDelay';
        appItem.abilityName = 'abilityNameDelay';
        appItem.bundleName = 'bundleNameDelay';
        appItem.appIconId = 'appIconIdDelay';
        appItem.appLabelId = 'appLabelIdDelay';
        appItem.details ={
          formKey1:1,
          formKey2:'appItem',
          formKey3: new Uint8Array([1,2,3,4,5,6,7,8,9,10])
        }

        AppItemData.addRecord(appItem);
        return AppItemData;
      });
      AppItemData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      AppItemData.properties.getDelayData = GetDelayAppItemData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(AppItemData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM){
          let record = records[0] as unifiedDataChannel.SystemDefinedAppItem;
          console.info(TAG+' Get SystemDefinedAppItem Data Success, type: '+records[0].getType() +
            ', details:'+ JSON.stringify(record.details)+
            ', appId:'+record.appId +', appName:'+record.appName +', abilityName:' + record.abilityName +
            ', bundleName:'+record.bundleName +', appIconId:'+record.appIconId + ',appLabelId:'+record.appLabelId);
          expect(record.appId).assertEqual('appIdDelay');
        }else{
          console.info(TAG+' Get SystemDefinedAppItem Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get SystemDefinedAppItem Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest018
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0180
     * @tc.desc SystemDefinedPixelMap test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0180', 0, async () => {
      let PixelMapData = new unifiedDataChannel.UnifiedData();
      const GetDelayPixelMapData = ((dataType:string) => {
        let buffer = new ArrayBuffer(128);
        let realSize:image.Size={height:3 , width:5};
        let opt :image.InitializationOptions={
          size:realSize,
          pixelFormat:3,
          editable:true,
          alphaType:1,
          scaleMode:1
        }
        let pixelMap:image.PixelMap = image.createPixelMapSync(buffer,opt);
        let pixelMapRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP,pixelMap);

        PixelMapData.addRecord(pixelMapRecord);
        return PixelMapData;
      });
      PixelMapData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      PixelMapData.properties.getDelayData = GetDelayPixelMapData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(PixelMapData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP){
          let pixelMap = records[0].getValue() as image.PixelMap;
          let imageInfo = pixelMap.getImageInfo();
          console.info(TAG+' Get PixelMap Data Success, type: '+records[0].getType() +
            ',bytesNumber:'+ pixelMap.getPixelBytesNumber() + ',imageInfo:'+ JSON.stringify(imageInfo));
          expect(pixelMap.getPixelBytesNumber() == 60).assertTrue();
        }else{
          console.info(TAG+' Get PixelMap Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get PixelMap Data Fail '+err);
        expect().assertFail();
      })

    })


    /**
     * @tc.name setUnifiedDataTest019
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0190
     * @tc.desc Want test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0190', 0, async () => {
      let wantData = new unifiedDataChannel.UnifiedData();
      const GetDelayWantData = ((dataType:string) => {
        let object:Want = {
          bundleName: 'delayWantBundleName',
          abilityName: 'delayWantAbilityName',
        };
        let wantRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT,object);
        wantData.addRecord(wantRecord);
        return wantData;
      });
      wantData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      wantData.properties.getDelayData = GetDelayWantData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      await systemPasteBoard.setUnifiedData(wantData).then(()=>{
        expect(systemPasteBoard.hasDataSync()).assertTrue();
        console.log(TAG+" setUnifiedData success");
      }).catch((error:BusinessError) => {
        expect().assertFail();
        console.log(TAG+" setUnifiedData Failed" +error);
      });

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT){
          console.info(TAG+' Get Want Data Success, type: '+records[0].getType() +
            ',object:'+ JSON.stringify(records[0].getValue()));
          expect(JSON.parse(JSON.stringify(records[0].getValue()))['bundleName']).assertEqual('delayWantBundleName');
        }else{
          console.info(TAG+' Get Want Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
      }).catch((err:BusinessError)=>{
        console.info(TAG+' Get Want Data Fail '+err);
        expect().assertFail();
      })

    })

    /**
     * @tc.name setUnifiedDataTest023
     * @tc.number SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0230
     * @tc.desc setUnifiedDataSync and getUnifiedData test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Pasteboard_Local_SDK_DelayCopy_JsApiTest_0230', 0, async () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      const GetDelayPlainTextData = ((dataType:string) => {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'delayPlaintext',
          Value: 'delayPlaintext',
        };
        plainText.textContent = 'delayTextContent';
        plainText.abstract = 'delayAbstract';
        plainTextData.addRecord(plainText);
        return plainTextData;
      });
      plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      plainTextData.properties.getDelayData = GetDelayPlainTextData;
      expect(systemPasteBoard.hasDataSync()).assertFalse();
      systemPasteBoard.setUnifiedDataSync(plainTextData);
      expect(systemPasteBoard.hasDataSync()).assertTrue();

      await systemPasteBoard.getUnifiedData().then((data)=>{
        let outputData = data;
        let records = outputData.getRecords();
        if (records[0].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT){
          let record = records[0] as unifiedDataChannel.PlainText;
          console.info(TAG+' Get PlainText Data Success, type: '+records[0].getType() +
            ',details:'+ JSON.stringify(record.details)+ ', textContext:'+
          record.textContent +', abstract:'+ record.abstract);
          expect(JSON.parse(JSON.stringify(record.details))['Key']).assertEqual('delayPlaintext');
        }else{
          console.info(TAG+' Get PlainText Data No Success, type: '+records[0].getType())
          expect().assertFail();
        }
        });

    })

    /**
     * @tc.name fromHtmlTest001
     * @tc.number SUB_Pasteboard_Local_SDK_FromHtml_0100
     * @tc.desc fromHtml interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_Pasteboard_Local_SDK_FromHtml_0100", 0, async () => {
      console.info(TAG + "SUB_Pasteboard_Local_SDK_FromHtml_0100 ---------start")
      let htmlStr = '<p style ="text-align:center">我是你居中对齐</p>'
      try{
        await StyledString.fromHtml(htmlStr);
        console.info(TAG + "fromHtml success")
      } catch (err) {
        console.info(TAG + "fromHtml failed code =" + err.code + ", message =" + err.message)
        expect().assertFail();
      }
      console.info(TAG + "SUB_Pasteboard_Local_SDK_FromHtml_0100 ---------end")
    })



  })
}