/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import { pasteboard } from '@kit.BasicServicesKit';
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import { Want, abilityAccessCtrl, common, PermissionRequestResult} from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

let TAG = 'ttt';
let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
let html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
let uri = 'dataability:///com.example.myapplication1/user.txt';
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let getPermission = async () => {
  console.info('getPermission is start');
  let context:common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_PASTEBOARD'], (err:BusinessError, data:PermissionRequestResult) => {
    console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
  })
}

let sleep = (ms:number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

let drivenFn = async () => {
  try {
    let driver: Driver = Driver.create();
    console.info('come in driveFn');
    console.info('driver is ${JSON.stringify(driver)}');
    await sleep(1000);
    let button = await driver.findComponent(ON.text('始终允许'));
    if (button) {
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button.click();
      await  sleep(1000);
    } else {
      let button1 = await driver.findComponent(ON.text('仅本次允许'));
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button1.click();
      await  sleep(1000);
    }
  } catch (err) {
    console.info('err is' + err);
    return
  }
}

export default function PasteboardChangeCountTest() {
  describe('PasteboardChangeCountTest', () => {
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done();
    })
    beforeEach(() => {
      systemPasteboard.clearDataSync();
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0100
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0100
     * @tc.desc   Pasteboard setData and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0100 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content1');
        await systemPasteboard.setData(pasteData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0100 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0200
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0200
     * @tc.desc   Pasteboard setUnifiedData and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0200 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let plainTextData = new unifiedDataChannel.UnifiedData();
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'plaintext',
          Value: 'plaintext'
        };
        plainText.textContent = 'TextContent';
        plainText.abstract = 'TextContent';
        plainTextData.addRecord(plainText);
        await systemPasteboard.setUnifiedData(plainTextData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0200 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0300
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0300
     * @tc.desc   Pasteboard setUnifiedData delay and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0200 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let plainTextData = new unifiedDataChannel.UnifiedData();
        let GetDelayPlainTextData = ((dataType: string) => {
          let plainText = new unifiedDataChannel.PlainText();
          plainText.details = {
            Key: 'plaintext',
            Value: 'plaintext'
          };
          plainText.textContent = 'TextContent';
          plainText.abstract = 'TextContent';
          plainTextData.addRecord(plainText);
          return plainTextData;
        })
        plainTextData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
        plainTextData.properties.getDelayData = GetDelayPlainTextData;
        await systemPasteboard.setUnifiedData(plainTextData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0300 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0400
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0400
     * @tc.desc   Pasteboard setUnifiedDataSync and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0200 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let plainTextData = new unifiedDataChannel.UnifiedData();
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'plaintext',
          Value: 'plaintext'
        };
        plainText.textContent = 'TextContent';
        plainText.abstract = 'TextContent';
        plainTextData.addRecord(plainText);
        systemPasteboard.setUnifiedDataSync(plainTextData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0400 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0500
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0500
     * @tc.desc   Pasteboard setUnifiedData text and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0500 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let textData = new unifiedDataChannel.UnifiedData();
        let text = new unifiedDataChannel.Text();
        text.details = {
          Key: 'text',
          Value: 'text'
        };
        textData.addRecord(text);
        await systemPasteboard.setUnifiedData(textData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0500 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0600
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0600
     * @tc.desc   Pasteboard setUnifiedData hyperlink and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0600 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let hyperLinkData = new unifiedDataChannel.UnifiedData();
        let link = new unifiedDataChannel.Hyperlink();
        link.details = {
          Key: 'hyperLink',
          Value: 'hyperLink'
        };
        link.url = 'url';
        link.description = 'description';
        hyperLinkData.addRecord(link);
        await systemPasteboard.setUnifiedData(hyperLinkData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0600 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0700
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0700
     * @tc.desc   Pasteboard setUnifiedData html and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0700 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let htmlData = new unifiedDataChannel.UnifiedData();
        let html = new unifiedDataChannel.HTML();
        html.details = {
          Key: 'html',
          Value: 'html'
        };
        html.htmlContent = 'htmlContent';
        html.plainContent = 'plainContent';
        htmlData.addRecord(html);
        await systemPasteboard.setUnifiedData(htmlData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0700 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0800
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0800
     * @tc.desc   Pasteboard setUnifiedData file and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0800 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let fileData = new unifiedDataChannel.UnifiedData();
        let file = new unifiedDataChannel.File();
        file.details = {
          Key: 'file',
          Value: 'file'
        };
        file.uri = 'uri';
        fileData.addRecord(file);
        await systemPasteboard.setUnifiedData(fileData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0800 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0900
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0900
     * @tc.desc   Pasteboard setUnifiedData folder and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0900 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let folderData = new unifiedDataChannel.UnifiedData();
        let folder = new unifiedDataChannel.File();
        folder.details = {
          Key: 'folder',
          Value: 'folder'
        };
        folder.uri = 'folderUri';
        folderData.addRecord(folder);
        await systemPasteboard.setUnifiedData(folderData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_0900 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1000
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1000
     * @tc.desc   Pasteboard setUnifiedData image and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1000 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let imageData = new unifiedDataChannel.UnifiedData();
        let image = new unifiedDataChannel.Image();
        image.details = {
          Key: 'image',
          Value: 'image'
        };
        image.uri = 'imageUri';
        imageData.addRecord(image);
        await systemPasteboard.setUnifiedData(imageData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1000 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1100
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1100
     * @tc.desc   Pasteboard setUnifiedData video and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1100 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let videoData = new unifiedDataChannel.UnifiedData();
        let video = new unifiedDataChannel.Video();
        video.details = {
          Key: 'video',
          Value: 'video'
        };
        video.videoUri = 'videoUri';
        videoData.addRecord(video);
        await systemPasteboard.setUnifiedData(videoData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1100 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1200
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1200
     * @tc.desc   Pasteboard setUnifiedData audio and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1200 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let audioData = new unifiedDataChannel.UnifiedData();
        let audio = new unifiedDataChannel.Audio();
        audio.details = {
          Key: 'audio',
          Value: 'audio'
        };
        audio.audioUri = 'audioUri';
        audioData.addRecord(audio);
        await systemPasteboard.setUnifiedData(audioData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1200 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1300
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1300
     * @tc.desc   Pasteboard setUnifiedData sysForm and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1300 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let sysFormData = new unifiedDataChannel.UnifiedData();
        let form = new unifiedDataChannel.SystemDefinedForm();
        form.formId = 0;
        form.formName = 'formName';
        form.bundleName = 'bundleName';
        form.abilityName = 'abilityName';
        form.module = 'module';
        form.details = {
          formKey1: 1,
          formKet2: 'form',
          formKey3: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
        };
        sysFormData.addRecord(form);
        await systemPasteboard.setUnifiedData(sysFormData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1300 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1400
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1400
     * @tc.desc   Pasteboard setUnifiedData sysAppItem and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1400 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let sysAppItemData = new unifiedDataChannel.UnifiedData();
        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.appId = 'appId';
        appItem.appName = 'appName';
        appItem.bundleName = 'bundleName';
        appItem.abilityName = 'abilityName';
        appItem.appIconId = 'appIconId';
        appItem.appLabelId = 'appLabelId';
        appItem.details = {
          formKey1: 1,
          formKet2: 'appItem',
          formKey3: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
        };
        sysAppItemData.addRecord(appItem);
        await systemPasteboard.setUnifiedData(sysAppItemData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1400 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1500
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1500
     * @tc.desc   Pasteboard setUnifiedData appRecord and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1500 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let appRecordData = new unifiedDataChannel.UnifiedData();
        let appRecord = new unifiedDataChannel.ApplicationDefinedRecord();
        let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        appRecord.applicationDefinedType = 'ApplicationDefinedType';
        appRecord.rawData = u8Array;
        appRecordData.addRecord(appRecord);
        await systemPasteboard.setUnifiedData(appRecordData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1500 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1600
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1600
     * @tc.desc   Pasteboard setUnifiedData want and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1600 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let wantData = new unifiedDataChannel.UnifiedData();
        let object:Want = {
          bundleName: 'bundleName',
          abilityName: 'abilityName'
        };
        let wantRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT, object);
        wantData.addRecord(wantRecord);
        await systemPasteboard.setUnifiedData(wantData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.')
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1600 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1700
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1700
     * @tc.desc   Pasteboard setUnifiedData pixelMap and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1700 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let pixelMapData = new unifiedDataChannel.UnifiedData();
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5}
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: 3,
          editable: true,
          alphaType: 1,
          scaleMode: 1
        };
        let pixelMap:image.PixelMap = image.createPixelMapSync(buffer, opt);
        let pixelMapRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMap);
        pixelMapData.addRecord(pixelMapRecord);
        await systemPasteboard.setUnifiedData(pixelMapData);

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.')
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1700 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1800
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1800
     * @tc.desc   Pasteboard setData html and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1800 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, html);
        await systemPasteboard.setData(pasteData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1800 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1900
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1900
     * @tc.desc   Pasteboard setData uri and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1900 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri);
        await systemPasteboard.setData(pasteData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_1900 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2000
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2000
     * @tc.desc   Pasteboard setData pixelMap and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2000 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: 3,
          editable: true,
          alphaType: 1,
          scaleMode: 1
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(buffer, opt);
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_PIXELMAP, pixelMap)
        await systemPasteboard.setData(pasteData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2000 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2100
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2100
     * @tc.desc   Pasteboard setData want and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2100 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let object: Want = {
          bundleName: 'com.example.aafwk.test',
          abilityName: 'com.example.aafwk.test.TwoAbility'
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_WANT, object);
        await systemPasteboard.setData(pasteData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2100 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2200
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2200
     * @tc.desc   Pasteboard setData want and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2200 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let dataXml = new ArrayBuffer(256);
        let pasteData: pasteboard.PasteData = pasteboard.createData('styleStr', dataXml);
        await systemPasteboard.setData(pasteData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2200 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2300
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2300
     * @tc.desc   Pasteboard setUnifiedData multiple types and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2300 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let plainTextData = new unifiedDataChannel.UnifiedData();
        let plainText = new unifiedDataChannel.PlainText();
        plainText.details = {
          Key: 'plaintext',
          Value: 'plaintext'
        };
        plainText.textContent = 'TextContent';
        plainText.abstract = 'TextContent';
        plainTextData.addRecord(plainText);

        let text = new unifiedDataChannel.Text();
        text.details = {
          Key: 'text',
          Value: 'text'
        };
        plainTextData.addRecord(text);

        let link = new unifiedDataChannel.Hyperlink();
        link.details = {
          Key: 'hyperLink',
          Value: 'hyperLink'
        };
        link.url = 'url';
        link.description = 'description';
        plainTextData.addRecord(link);

        let html = new unifiedDataChannel.HTML();
        html.details = {
          Key: 'html',
          Value: 'html'
        };
        html.htmlContent = 'htmlContent';
        html.plainContent = 'plainContent';
        plainTextData.addRecord(html);

        let file = new unifiedDataChannel.File();
        file.details = {
          Key: 'file',
          Value: 'file'
        };
        file.uri = 'uri';
        plainTextData.addRecord(file);

        let folder = new unifiedDataChannel.File();
        folder.details = {
          Key: 'folder',
          Value: 'folder'
        };
        folder.uri = 'folderUri';
        plainTextData.addRecord(folder);

        let image1 = new unifiedDataChannel.Image();
        image1.details = {
          Key: 'image',
          Value: 'image'
        };
        image1.uri = 'imageUri';
        plainTextData.addRecord(image1);

        let video = new unifiedDataChannel.Video();
        video.details = {
          Key: 'video',
          Value: 'video'
        };
        video.videoUri = 'videoUri';
        plainTextData.addRecord(video);

        let audio = new unifiedDataChannel.Audio();
        audio.details = {
          Key: 'audio',
          Value: 'audio'
        };
        audio.audioUri = 'audioUri';
        plainTextData.addRecord(audio);

        let form = new unifiedDataChannel.SystemDefinedForm();
        form.formId = 0;
        form.formName = 'formName';
        form.bundleName = 'bundleName';
        form.abilityName = 'abilityName';
        form.module = 'module';
        form.details = {
          formKey1: 1,
          formKet2: 'form',
          formKey3: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
        };
        plainTextData.addRecord(form);

        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.appId = 'appId';
        appItem.appName = 'appName';
        appItem.bundleName = 'bundleName';
        appItem.abilityName = 'abilityName';
        appItem.appIconId = 'appIconId';
        appItem.appLabelId = 'appLabelId';
        appItem.details = {
          formKey1: 1,
          formKet2: 'appItem',
          formKey3: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
        };
        plainTextData.addRecord(appItem);

        let appRecord = new unifiedDataChannel.ApplicationDefinedRecord();
        let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        appRecord.applicationDefinedType = 'ApplicationDefinedType';
        appRecord.rawData = u8Array;
        plainTextData.addRecord(appRecord);

        let object:Want = {
          bundleName: 'bundleName',
          abilityName: 'abilityName'
        };
        let wantRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT, object);
        plainTextData.addRecord(wantRecord);

        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5}
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: 3,
          editable: true,
          alphaType: 1,
          scaleMode: 1
        };
        let pixelMap:image.PixelMap = image.createPixelMapSync(buffer, opt);
        let pixelMapRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMap);
        plainTextData.addRecord(pixelMapRecord);

        await systemPasteboard.setUnifiedData(plainTextData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2300 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2400
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2400
     * @tc.desc   Pasteboard setUnifiedData delay text and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2400 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let textData = new unifiedDataChannel.UnifiedData();
        let GetDelayTextData = ((dataType:string) => {
          let text = new unifiedDataChannel.Text();
          text.details = {
            Key: 'text',
            Value: 'text'
          };
          textData.addRecord(text);
          return textData;
        })
        textData.properties.getDelayData = GetDelayTextData;
        expect(systemPasteboard.hasDataSync()).assertFalse();
        await systemPasteboard.setUnifiedData(textData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2400 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2500
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2500
     * @tc.desc   Pasteboard setUnifiedData delay link and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2500 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let hyperLinkData = new unifiedDataChannel.UnifiedData();
        let GetDelayLinkData = ((dataType:string) => {
          let link = new unifiedDataChannel.Hyperlink();
          link.details = {
            Key: 'hyperLink',
            Value: 'hyperLink'
          };
          link.url = 'url';
          link.description = 'description';
          hyperLinkData.addRecord(link);
          return hyperLinkData;
        })
        hyperLinkData.properties.getDelayData = GetDelayLinkData;
        await systemPasteboard.setUnifiedData(hyperLinkData)
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2500 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2600
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2600
     * @tc.desc   Pasteboard setUnifiedData delay html and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2600 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let htmlData = new unifiedDataChannel.UnifiedData();
        let GetDelayHtmlData = ((dataType:string) => {
          let html = new unifiedDataChannel.HTML();
          html.details = {
            Key: 'html',
            Value: 'html'
          };
          html.htmlContent = 'htmlContent';
          html.plainContent = 'plainContent';
          htmlData.addRecord(html);
          return htmlData;
        })
        htmlData.properties.getDelayData = GetDelayHtmlData;
        await systemPasteboard.setUnifiedData(htmlData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2600 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2700
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2700
     * @tc.desc   Pasteboard setUnifiedData delay fileUri and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2700 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let fileData = new unifiedDataChannel.UnifiedData();
        let GetDelayFileData = ((dataType:string) => {
          let file = new unifiedDataChannel.File();
          file.details = {
            Key: 'file',
            Value: 'file'
          };
          file.uri = 'uri';
          fileData.addRecord(file);
          return fileData;
        })
        fileData.properties.getDelayData = GetDelayFileData;
        await systemPasteboard.setUnifiedData(fileData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2700 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2800
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2800
     * @tc.desc   Pasteboard setUnifiedData delay folder and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2800 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let folderData = new unifiedDataChannel.UnifiedData();
        let GetDelayFolderData = ((dataType:string) => {
          let folder = new unifiedDataChannel.File();
          folder.details = {
            Key: 'folder',
            Value: 'folder'
          };
          folder.uri = 'folderUri';
          folderData.addRecord(folder);
          return folderData;
        })
        folderData.properties.getDelayData = GetDelayFolderData;
        await systemPasteboard.setUnifiedData(folderData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2800 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2900
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2900
     * @tc.desc   Pasteboard setUnifiedData delay image and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2900 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let imageData = new unifiedDataChannel.UnifiedData();
        let GetDelayImageData = ((dataType:string) => {
          let image = new unifiedDataChannel.Image();
          image.details = {
            Key: 'image',
            Value: 'image'
          };
          image.uri = 'imageUri';
          imageData.addRecord(image);
          return imageData;
        })
        imageData.properties.getDelayData = GetDelayImageData;
        await systemPasteboard.setUnifiedData(imageData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_2900 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3000
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3000
     * @tc.desc   Pasteboard setUnifiedData delay video and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3000 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let videoData = new unifiedDataChannel.UnifiedData();
        let GetDelayVideoData = ((dataType:string) => {
          let video = new unifiedDataChannel.Video();
          video.details = {
            Key: 'video',
            Value: 'video'
          };
          video.videoUri = 'videoUri';
          videoData.addRecord(video);
          return videoData;
        })
        videoData.properties.getDelayData = GetDelayVideoData;
        await systemPasteboard.setUnifiedData(videoData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3000 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3100
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3100
     * @tc.desc   Pasteboard setUnifiedData delay audio and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3100 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let audioData = new unifiedDataChannel.UnifiedData();
        let GetDelayAudioData = ((dataType:string) => {
          let audio = new unifiedDataChannel.Audio();
          audio.details = {
            Key: 'audio',
            Value: 'audio'
          };
          audio.audioUri = 'audioUri';
          audioData.addRecord(audio);
          return audioData;
        })
        audioData.properties.getDelayData = GetDelayAudioData;
        await systemPasteboard.setUnifiedData(audioData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3100 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3200
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3200
     * @tc.desc   Pasteboard setUnifiedData delay sysForm and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3200 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let sysFormData = new unifiedDataChannel.UnifiedData();
        let GetDelayFormData = ((dataType:string) => {
          let form = new unifiedDataChannel.SystemDefinedForm();
          form.formId = 0;
          form.formName = 'formName';
          form.bundleName = 'bundleName';
          form.abilityName = 'abilityName';
          form.module = 'module';
          form.details = {
            formKey1: 1,
            formKet2: 'form',
            formKey3: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
          };
          sysFormData.addRecord(form);
          return sysFormData;
        })
        sysFormData.properties.getDelayData = GetDelayFormData;
        await systemPasteboard.setUnifiedData(sysFormData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3200 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3300
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3300
     * @tc.desc   Pasteboard setUnifiedData delay appItem and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3300 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let sysAppItemData = new unifiedDataChannel.UnifiedData();
        let GetDelayItemData = ((dataType:string) => {
          let appItem = new unifiedDataChannel.SystemDefinedAppItem();
          appItem.appId = 'appId';
          appItem.appName = 'appName';
          appItem.bundleName = 'bundleName';
          appItem.abilityName = 'abilityName';
          appItem.appIconId = 'appIconId';
          appItem.appLabelId = 'appLabelId';
          appItem.details = {
            formKey1: 1,
            formKet2: 'appItem',
            formKey3: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
          };
          sysAppItemData.addRecord(appItem);
          return sysAppItemData;
        })
        sysAppItemData.properties.getDelayData = GetDelayItemData;
        await systemPasteboard.setUnifiedData(sysAppItemData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3300 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3400
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3400
     * @tc.desc   Pasteboard setUnifiedData delay appRecord and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3400 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let appRecordData = new unifiedDataChannel.UnifiedData();
        let GetDelayAppRecordData = ((dataType:string) => {
          let appRecord = new unifiedDataChannel.ApplicationDefinedRecord();
          let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
          appRecord.applicationDefinedType = 'ApplicationDefinedType';
          appRecord.rawData = u8Array;
          appRecordData.addRecord(appRecord)
          return appRecordData;
        })
        appRecordData.properties.getDelayData = GetDelayAppRecordData;
        await systemPasteboard.setUnifiedData(appRecordData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3400 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3500
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3500
     * @tc.desc   Pasteboard setUnifiedData delay want and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3500 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let wantData = new unifiedDataChannel.UnifiedData();
        let GetDelayWantData = ((dataType:string) => {
          let object:Want = {
            bundleName: 'bundleName',
            abilityName: 'abilityName'
          };
          let wantRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT, object);
          wantData.addRecord(wantRecord)
          return wantData;
        })
        wantData.properties.getDelayData = GetDelayWantData;
        await systemPasteboard.setUnifiedData(wantData);
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3500 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3600
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3600
     * @tc.desc   Pasteboard setUnifiedData delay pixelMap and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3600 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        let pixelMapData = new unifiedDataChannel.UnifiedData();
        let GetDelayPixelMapData = ((dataType:string) => {
          let buffer = new ArrayBuffer(128);
          let realSize: image.Size = { height: 3, width: 5}
          let opt: image.InitializationOptions = {
            size: realSize,
            pixelFormat: 3,
            editable: true,
            alphaType: 1,
            scaleMode: 1
          };
          let pixelMap:image.PixelMap = image.createPixelMapSync(buffer, opt);
          let pixelMapRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP, pixelMap);
          pixelMapData.addRecord(pixelMapRecord)
          return pixelMapData;
        })
        pixelMapData.properties.getDelayData = GetDelayPixelMapData;
        await systemPasteboard.setUnifiedData(pixelMapData)
        console.info(TAG + 'Succeeded in setting pasteData');

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3600 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3700
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3700
     * @tc.desc   Pasteboard clearDataSync and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3700 start ************')
      try {
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result0:${result1}`);

        systemPasteboard.clearDataSync();

        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3700 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3800
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3700
     * @tc.desc   Pasteboard setData twice and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3800 start ************')
      try {
        let pasteData1: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content1');
        await systemPasteboard.setData(pasteData1);
        console.info(TAG + 'Succeeded in setting pasteData');
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result1}`);

        let pasteData2: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content1');
        await systemPasteboard.setData(pasteData2);
        console.info(TAG + 'Succeeded in setting pasteData');
        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);

        expect(result2).assertEqual(result1 + 1);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3800 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3900
     * @tc.number SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3900
     * @tc.desc   Pasteboard getDataSync and getChangeCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3900 start ************')
      try {
        let pasteData1: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content1');
        await systemPasteboard.setData(pasteData1);
        console.info(TAG + 'Succeeded in setting pasteData');
        let  result1: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result1}`);
        systemPasteboard.getDataSync();
        let  result2: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1);
        let  result3: number = systemPasteboard.getChangeCount();
        console.info(TAG + `Succeeded in getting the change count.Result1:${result3}`);
        expect(result3).assertEqual(result2);
        console.info(TAG + 'Pasteboard change success.');
      } catch (err) {
        console.error(TAG + `Failed to get the change count.Cause:${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_Local_SDK_PasteboardChangeCountTest_3900 end ************')
    })
  })
}