/*
 * Copyright (C) 2022-2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import pasteboard from '@ohos.pasteboard';
import { image } from '@kit.ImageKit';
import { Want, abilityAccessCtrl, common, PermissionRequestResult} from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let TAG = 'ttt';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

let html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
let uri = 'dataability:///com.example.myapplication1/user.txt';

let object: Want = {
  bundleName: "com.example.aafwk.test",
  abilityName: "com.example.aafwk.test.TwoAbility"
};

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

export default function PasteboardVarietyTest() {
  describe('PasteboardVarietyTest', (done:Function) => {
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
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_0100
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0100
     * @tc.desc   Test pasteBoard variety createData plaintext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0100 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataText = pasteData.getPrimaryText();
        expect(pasteDataText).assertEqual('hello');
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0100 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_0200
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0200
     * @tc.desc   Test pasteBoard variety createData Html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0200 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_HTML] = html;
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataHtml = pasteData.getPrimaryHtml()
        expect(pasteDataHtml).assertEqual(html)
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message)
		expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0200 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_0300
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0300
     * @tc.desc   Test pasteBoard variety createData Uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0300 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = uri;
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataUri = pasteData.getPrimaryUri();
        expect(pasteDataUri).assertEqual(uri);
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0300 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_0400
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0400
     * @tc.desc   Test pasteBoard variety createData Want
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0400 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_WANT] = object;
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataWant = pasteData.getPrimaryWant();
        expect(JSON.stringify(pasteDataWant)).assertContain('"bundleName":"com.example.aafwk.test","abilityName":"com.example.aafwk.test.TwoAbility"');
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0400 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_0500
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0500
     * @tc.desc   Test pasteBoard variety createData PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0500 start ************')
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: 3,
        editable: true,
        alphaType: 1,
        scaleMode: 1
      };
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_PIXELMAP] = await image.createPixelMap(buffer, opt);
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pixelMapRecord = pasteData.getRecord(0);
        await pixelMapRecord.getData(pasteboard.MIMETYPE_PIXELMAP).then((value: pasteboard.ValueType) => {
          let pixelMap = value as image.PixelMap;
          let imageInfo = pixelMap.getImageInfoSync();
          expect(JSON.stringify(imageInfo)).assertEqual('{"size":{"width":5,"height":3},"pixelFormat":3,"colorSpace":2,"alphaType":1,"density":0,"stride":20,"mimeType":"","isHdr":false}');
        }).catch((err:BusinessError) => {
          console.info(TAG + 'Cause:' + err.message + ',code:' +err.code)
		  expect().assertFail();
        })
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0500 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_0600
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0600
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0600 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record['app/xml'] = new ArrayBuffer(256);
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataType: Array<String> = await pasteData.getMimeTypes();
        expect(pasteDataType.length).assertEqual(1);
        expect(pasteDataType).assertDeepEquals(["app/xml"]);
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0600 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_0700
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0700
     * @tc.desc   Test pasteBoard variety createData Variety and getData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0700 start ************')
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: 3,
        editable: true,
        alphaType: 1,
        scaleMode: 1
      };
      let pixelMap:image.PixelMap = image.createPixelMapSync(buffer, opt);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = html;
      record[pasteboard.MIMETYPE_TEXT_URI] = uri;
      record[pasteboard.MIMETYPE_TEXT_WANT] = object;
      record[pasteboard.MIMETYPE_PIXELMAP] = pixelMap;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataRecord = pasteData.getRecord(0);
        await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_PLAIN).then((value: pasteboard.ValueType) => {
          let textPlain = value as string;
          expect(textPlain).assertEqual('hello')
        })
        await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_HTML).then((value: pasteboard.ValueType) => {
          let htmlData = value as string;
          expect(htmlData).assertEqual(html)
        })
        await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_URI).then((value: pasteboard.ValueType) => {
          let uriData = value as string;
          expect(uriData).assertEqual(uri)
        })
        await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_WANT).then((value: pasteboard.ValueType) => {
          let wantData = value as string;
          expect(JSON.stringify(wantData)).assertContain('"bundleName":"com.example.aafwk.test","abilityName":"com.example.aafwk.test.TwoAbility"')
        })
        await pasteDataRecord.getData(pasteboard.MIMETYPE_PIXELMAP).then((value: pasteboard.ValueType) => {
          let pixelMap = value as image.PixelMap;
          let imageInfo = pixelMap.getImageInfoSync();
          expect(JSON.stringify(imageInfo)).assertEqual('{"size":{"width":5,"height":3},"pixelFormat":3,"colorSpace":2,"alphaType":1,"density":0,"stride":20,"mimeType":"","isHdr":false}')
        }).catch((err:BusinessError) => {
          console.info(TAG + 'Cause:' + err.message + ',code:' +err.code)
		  expect().assertFail();
        });
      } catch (error) {
        console.info(TAG + ',code:' + error.code + ',message' + error.message)
        expect().assertFail()
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0700 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_0800
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0800
     * @tc.desc   Test pasteBoard variety createData Variety and getValidTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0800 start ************')
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: 3,
        editable: true,
        alphaType: 1,
        scaleMode: 1
      };
      let pixelMap:image.PixelMap = image.createPixelMapSync(buffer, opt);
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      try {
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_HTML, html);
        record.addEntry(pasteboard.MIMETYPE_PIXELMAP, pixelMap)
        record.addEntry(pasteboard.MIMETYPE_TEXT_WANT, object)
        record.addEntry('app/xml', new ArrayBuffer(256),)
        let types: string[] = record.getValidTypes([
          pasteboard.MIMETYPE_TEXT_PLAIN,
          pasteboard.MIMETYPE_TEXT_HTML,
          pasteboard.MIMETYPE_TEXT_URI,
          pasteboard.MIMETYPE_TEXT_WANT,
          pasteboard.MIMETYPE_PIXELMAP,
          'app/xml'
        ]);
        expect(types.length).assertEqual(6);
        expect(types).assertDeepEquals(['text/plain','text/html','text/uri','text/want','pixelMap','app/xml']);
      } catch (error) {
        console.info(TAG + ',code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0800 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_0900
     * @tc.number PasteboardVariety_0100
     * @tc.desc   Test pasteBoard variety createData Variety and getValidTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0900 start ************')
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      try {
        let types: string[] = record.getValidTypes([
          pasteboard.MIMETYPE_TEXT_PLAIN,
          pasteboard.MIMETYPE_TEXT_HTML
        ]);
        expect(types.length).assertEqual(0);
        expect(types).assertDeepEquals([]);
      } catch (error) {
        console.info(TAG + ',code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0900 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_1100
     * @tc.number PasteboardVariety_0300
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1100 start ************')
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createPlainTextData('hello');
        let hasData: boolean = pasteData.hasMimeType(pasteboard.MIMETYPE_TEXT_HTML);
        expect(hasData).assertFalse();
        let hasData1: boolean = pasteData.hasMimeType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasData1).assertTrue();
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1100 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_1200
     * @tc.number PasteboardVariety_0400
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1200 start ************')
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let hasData: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_HTML);
        expect(hasData).assertFalse();
        let hasData1: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasData1).assertTrue();
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1200 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_1300
     * @tc.number PasteboardVariety_0500
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1300 start ************')
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createPlainTextData('hello');
        let isRemove: boolean = pasteData.removeRecordAt(0);
        expect(isRemove).assertTrue();
        let isRemove1: boolean = pasteData.removeRecordAt(0);
        expect(isRemove1).assertFalse();
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1300 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_1400
     * @tc.number PasteboardVariety_0600
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1400 start ************')
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createPlainTextData('hello');
        let record: pasteboard.PasteDataRecord = pasteboard.createUriRecord('dataability:///com.example.myapplication1/user.txt');
        let isReplace: boolean = pasteData.replaceRecordAt(1, record);
        expect(isReplace).assertFalse();
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1400 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_1500
     * @tc.number PasteboardVariety_0700
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1500 start ************')
      try {
        let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        systemPasteboard.hasPasteData((err: BusinessError, data: boolean) => {
          if (err) {
            console.error(`Failed to check the PasteData. Cause: ${err.message}`);
            return;
          }
          expect(data).assertFalse();
          console.info(`Succeeded in checking the PasteData. Data: ${data}`);
        });
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1500 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_1600
     * @tc.number PasteboardVariety_0800
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1600 start ************')
      try {
        let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();        
        systemPasteboard.hasPasteData().then((data: boolean) => {
          expect(data).assertFalse();
          console.info(`Succeeded in checking the PasteData. Data: ${data}`);
        }).catch((err: BusinessError) => {
          console.error(`Failed to check the PasteData. Cause: ${err.message}`);
        });
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1600 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_1700
     * @tc.number PasteboardVariety_0900
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1700 start ************')
      try {
        let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        await systemPasteboard.hasData((err: BusinessError, data: boolean) => {
          if (err) {
            console.error(`Failed to check the PasteData. Cause: ${err.message}`);
            return;
          }
          expect(data).assertFalse();
          console.info(`Succeeded in checking the PasteData. Data: ${data}`);
        });
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1700 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_1800
     * @tc.number PasteboardVariety_1000
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1800 start ************')
      try {
        let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();        
        await systemPasteboard.hasData().then((data: boolean) => {
          expect(data).assertFalse();
          console.info(`Succeeded in checking the PasteData. Data: ${data}`);
        }).catch((err: BusinessError) => {
          console.error(`Failed to check the PasteData. Cause: ${err.message}`);
        });
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_1800 end ************')
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_1900
     * @tc.number PasteboardVariety_1100
     * @tc.desc   setUnifiedData Verify the properties of the appRecordData type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_PasteboardVariety_1900 start-----")
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data.length).assertEqual(0);
        expect(data).assertDeepEquals([]);
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_PasteboardVariety_1900 end-----")
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardVariety_2000
     * @tc.number PasteboardVariety_1200
     * @tc.desc   setUnifiedData Verify the properties of the appRecordData type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_PasteboardVariety_2000 start-----")
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_URI] = 'dataability:///com.example.myapplication1/user.txt';
      record[pasteboard.MIMETYPE_TEXT_HTML] = 'hello';
      let pasteData: pasteboard.PasteData = pasteboard.createData(record);
      await systemPasteboard.setData(pasteData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting PasteData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set PasteData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data.length).assertEqual(3);
        expect(data).assertDeepEquals(['text/html','text/plain','text/uri']);
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_PasteboardVariety_2000 end-----")
    })
  })
}