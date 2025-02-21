/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import pasteboard from '@ohos.pasteboard';
import Want from '@ohos.app.ability.Want';
import image from '@ohos.multimedia.image';

let TAG = 'ttt';
let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();

let html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
let uri = 'dataability:///com.example.myapplication1/user.txt';
let object: Want = {
  bundleName: "com.example.aafwk.test",
  abilityName: "com.example.aafwk.test.TwoAbility"
};

export default function PasteboardVarietyTest() {
  describe('PasteboardVarietyTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
      systemPasteboard.clearDataSync();
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0100
     * @tc.name CreateData_Plaintext
     * @tc.desc Test pasteBoard variety createData plaintext
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0100', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0100 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataText = pasteData.getPrimaryText();
        console.info(TAG + 'text:' + pasteDataText);
        expect(pasteDataText).assertEqual('hello');
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0200
     * @tc.name CreateData_Html
     * @tc.desc Test pasteBoard variety createData Html
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0200', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0200 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_HTML] = html;
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataHtml = pasteData.getPrimaryHtml()
        console.info(TAG + 'html:' + pasteDataHtml)
        expect(pasteDataHtml).assertEqual(html)
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message)
		expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0200 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0300
     * @tc.name CreateData_Uri
     * @tc.desc Test pasteBoard variety createData Uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0300', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0300 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = uri;
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataUri = pasteData.getPrimaryUri();
        console.info(TAG + 'uri:' + pasteDataUri);
        expect(pasteDataUri).assertEqual(uri);
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0300 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0400
     * @tc.name CreateData_Want
     * @tc.desc Test pasteBoard variety createData Want
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0400', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0400 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_WANT] = object;
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataWant = pasteData.getPrimaryWant();
        console.info(TAG + 'want:' + JSON.stringify(pasteDataWant));
        expect(JSON.stringify(pasteDataWant)).assertContain('"bundleName":"com.example.aafwk.test","abilityName":"com.example.aafwk.test.TwoAbility"');
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0400 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0500
     * @tc.name CreateData_PixelMap
     * @tc.desc Test pasteBoard variety createData PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0500', 0, async () => {
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
          console.info(TAG + 'pixelmap:' + JSON.stringify(imageInfo))
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
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0600
     * @tc.name CreateData_Arraybuffer
     * @tc.desc Test pasteBoard variety createData Arraybuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0600', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0600 start ************')
      let record: Record<string, pasteboard.ValueType> = {};
      record['app/xml'] = new ArrayBuffer(256);
      try {
        let pasteData:pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataType = pasteData.getMimeTypes();
        console.info(TAG + 'type:' + pasteDataType);
        expect(String(pasteDataType)).assertEqual('app/xml');
      } catch (error) {
        console.info(TAG + 'code:' + error.code + ',message:' + error.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0600 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0700
     * @tc.name CreateData_Variety
     * @tc.desc Test pasteBoard variety createData Variety and getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0700', 0, async () => {
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
          console.info(TAG + 'Success to get text/plain value.value is:' + textPlain)
          expect(textPlain).assertEqual('hello')
        })
        await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_HTML).then((value: pasteboard.ValueType) => {
          let htmlData = value as string;
          console.info(TAG + 'Success to get htmlData value.value is:' + htmlData)
          expect(htmlData).assertEqual(html)
        })
        await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_URI).then((value: pasteboard.ValueType) => {
          let uriData = value as string;
          console.info(TAG + 'Success to get uriData value.value is:' + uriData)
          expect(uriData).assertEqual(uri)
        })
        await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_WANT).then((value: pasteboard.ValueType) => {
          let wantData = value as string;
          console.info(TAG + 'Success to get wantData value.value is:' + JSON.stringify(wantData))
          expect(JSON.stringify(wantData)).assertContain('"bundleName":"com.example.aafwk.test","abilityName":"com.example.aafwk.test.TwoAbility"')
        })
        await pasteDataRecord.getData(pasteboard.MIMETYPE_PIXELMAP).then((value: pasteboard.ValueType) => {
          let pixelMap = value as image.PixelMap;
          let imageInfo = pixelMap.getImageInfoSync();
          console.info(TAG + 'Success to get pixelMap value.value is:' + JSON.stringify(imageInfo))
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
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_0800
     * @tc.name CreateData_Variety
     * @tc.desc Test pasteBoard variety createData Variety and getValidTypes
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_PasteboardVariety_0800', 0, async () => {
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
        console.info(TAG + 'addEntry success,getValidTypes success.types:' + types);
        expect(String(types)).assertEqual('text/plain,text/html,text/uri,text/want,pixelMap,app/xml');
      } catch (error) {
        console.info(TAG + ',code:' + error.code + ',message:' + error.message);
        expect().assertFail()
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0800 end ************')
    })
  })
}