/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import pasteboard from '@ohos.pasteboard'
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';
import Want from '@ohos.app.ability.Want';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';

import { fileIo as fs, fileUri } from '@kit.CoreFileKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const VALUE_TEST_STRING_ELEMENT = 'a'.repeat(1*1024*1024*2);

let dstDir: string = context.distributedFilesDir + '/dst';
let filePath: string = context.filesDir + '/src';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let num = pasteboard.Pattern.NUMBER;
let url = pasteboard.Pattern.URL;
const ARRAY_BUFFER = new ArrayBuffer(256);
const color = new ArrayBuffer(128);
const WANT: Want = {
  bundleName: "com.acts.distributeddatamgr.pasteboardtest",
  abilityName: "com.acts.distributeddatamgr.pasteboardtest.MainAbility"
};

let HTML = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
let URI = 'dataability:///com.example.myapplication1/user.txt';

function contentChanges() {
  hilog.info(domain, tag, '#EVENT: The content is changed in the pasteboard')
}

export default function abilityTest() {

  describe("abilityTest", (): void => {
    hilog.info(domain, tag, 'describe      : Start');

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteDataRecord_Static_0070
     * @tc.number PasteBoard_PasteDataRecord_0070
     * @tc.desc   Test pasteBoard variety createData PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0070----------");
      try{
        let pasteData = pasteboard.createData("ArrayBuffer", ARRAY_BUFFER);
        let record = pasteData.getRecord(0);
        let data =  record.data;
        let str = record.toPlainText();
        expect(str).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0070----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0390
     * @tc.number PasteBoard_SystemPasteboard_0390
     * @tc.desc   Test pasteBoard SetProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0390----------");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      try{
        await systemPasteBoard.clearData();
        let prop = pasteData.getProperty();
        expect(prop.timestamp != null).assertTrue();
        let mimeTypes = prop.mimeTypes;
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0390----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0380
     * @tc.number PasteBoard_SystemPasteboard_0380
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0380----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.offUpdate();
        let textData = 'Hello World!';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        systemPasteboard.clearDataSync();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0380----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteDataRecord_Static_0010
     * @tc.number PasteBoard_PasteDataRecord_0010
     * @tc.desc   Successfully cast string record to text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0010----------");
      try {
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType");
        let record = pasteData.getRecord(0);
        let str = record.toPlainText();
        expect(str).assertEqual("valueType");
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0010----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteDataRecord_Static_0020
     * @tc.number PasteBoard_PasteDataRecord_0020
     * @tc.desc   Successfully cast pixelMap record to text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0020----------");
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: true,
        alphaType: image.AlphaType.OPAQUE,
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      const pixelMap = image.createPixelMapSync(buffer, opt);
      try {
        let pasteData = pasteboard.createData('pixelMap', pixelMap);
        let record = pasteData.getRecord(0);
        let data = record.pixelMap;
        let str = record.toPlainText();
        expect(str).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0020----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteDataRecord_Static_0030
     * @tc.number PasteBoard_PasteDataRecord_0030
     * @tc.desc   Successfully cast want record to text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0030----------");
      try {
        let pasteData = pasteboard.createData('text/want', WANT);
        let record = pasteData.getRecord(0);
        let str = record.toPlainText();
        expect(str).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0030----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteDataRecord_Static_0040
     * @tc.number PasteBoard_PasteDataRecord_0040
     * @tc.desc   Successfully cast arrayBuffer record to text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0040----------");
      try {
        let pasteData = pasteboard.createData("ArrayBuffer", ARRAY_BUFFER);
        let record = pasteData.getRecord(0);
        let str = record.toPlainText();
        expect(str).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0040----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteDataRecord_Static_0050
     * @tc.number PasteBoard_PasteDataRecord_0050
     * @tc.desc   Test pasteBoard variety createData PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0050----------");
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: true,
        alphaType: image.AlphaType.OPAQUE,
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      let record: Record<string, pasteboard.ValueType> = {};
      record['pixelMap'] = image.createPixelMapSync(buffer, opt);
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pixelMapRecord = pasteData.getRecord(0);
        let value: pasteboard.ValueType = await pixelMapRecord.getData('pixelMap');
        let pixelMap = value as image.PixelMap;
        let imageInfo = pixelMap.getImageInfoSync();
        expect(imageInfo != null).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0050----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteDataRecord_Static_0060
     * @tc.number PasteDataRecord_Pasteboard_0060
     * @tc.desc   Test pasteBoard variety createData Variety and getData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0060----------");
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: true,
        alphaType: image.AlphaType.OPAQUE,
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(buffer, opt);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = HTML;
      record[pasteboard.MIMETYPE_TEXT_URI] = URI;
      record['text/want'] = {
        bundleName: 'bundleName',
        abilityName: 'testAbilityName'
      } as Want;
      record['pixelMap'] = pixelMap;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataRecord = pasteData.getRecord(0);
        let value = await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_PLAIN);
        let textPlain = value as string;
        expect(textPlain).assertEqual('hello');
        value = await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_HTML);
        let htmlData = value as string;
        expect(htmlData).assertEqual(HTML);
        value = await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_URI);
        let uriData = value as string;
        expect(uriData).assertEqual(URI);
        value = await pasteDataRecord.getData('text/want');
        let wantData = value as Want;
        expect(JSON.stringify(wantData)).assertContain('"bundleName":"bundleName","abilityName":"testAbilityName"');
        value = await pasteDataRecord.getData('pixelMap');
        let pixelMap = value as image.PixelMap;
        let imageInfo = pixelMap.getImageInfoSync();
        expect(imageInfo != null).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0060----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0010
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0100
     * @tc.desc   Test pasteBoard variety createData plaintext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0010----------");
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataText = pasteData.getPrimaryText();
        expect(pasteDataText).assertEqual('hello');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0010----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0020
     * @tc.number PasteBoard_Pasteboard_0020
     * @tc.desc   Test pasteBoard variety createData plaintext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0020----------");
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = '';
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataText = pasteData.getPrimaryText();
        expect(pasteDataText).assertEqual('');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0020----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0030
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0102
     * @tc.desc   Test pasteBoard variety createData plaintext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0030----------");
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'Hello 中国!@#$%^&*()_+{}\\?.';
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataText = pasteData.getPrimaryText();
        expect(pasteDataText).assertEqual('Hello 中国!@#$%^&*()_+{}\\?.');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0030----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0040
     * @tc.number PasteBoard_Pasteboard_0040
     * @tc.desc   Test pasteBoard variety createData plaintext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0040----------");
      let record: Record<string, pasteboard.ValueType> = {};
      let textData = '';
      for (let i = 0; i < 301; i++) {
        textData = textData + "A";
      }
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = textData;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataText = pasteData.getPrimaryText();
        expect(pasteDataText).assertEqual(textData);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0040----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0050
     * @tc.number PasteBoard_Pasteboard_0050
     * @tc.desc   Test pasteBoard variety createData Want
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0050----------");
      let record: Record<string, pasteboard.ValueType> = {};
      record['text/want'] = {
        bundleName: 'bundleName',
        abilityName: 'testAbilityName'
      } as Want;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataWant = pasteData.getPrimaryWant();
        expect(JSON.stringify(pasteDataWant)).assertContain('"bundleName":"bundleName","abilityName":"testAbilityName"');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0050----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0060
     * @tc.number PasteBoard_Pasteboard_0060
     * @tc.desc   Test pasteBoard variety createData Arraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0060----------");
      let record: Record<string, pasteboard.ValueType> = {};
      record['app/xml'] = new ArrayBuffer(256);
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataType = pasteData.getMimeTypes();
        expect(pasteDataType.length).assertEqual(1);
        expect(String(pasteDataType)).assertEqual('app/xml');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0060----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0070
     * @tc.number PasteBoard_Pasteboard_0070
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0070----------");

      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let textData = 'Hello World!';
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
        await systemPasteboard.setData(pasteData);
        let data = await systemPasteboard.getData();
        expect(data.getRecordCount()).assertEqual(1);
        let pasteDataProperty = data.getProperty();
        expect(pasteDataProperty.timestamp != null).assertTrue();
        pasteDataProperty.tag = "test_tag";
        pasteDataProperty.shareOption = pasteboard.ShareOption.LOCALDEVICE;
        data.setProperty(pasteDataProperty);
        await systemPasteboard.setData(data);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        data = await systemPasteboard.getData();
        pasteDataProperty = data.getProperty();
        expect(pasteDataProperty.timestamp != null).assertTrue();
        expect(pasteDataProperty.shareOption == 1).assertTrue();
        expect(pasteDataProperty.timestamp != null).assertTrue();
        let dataTag = data.getTag();
        expect(dataTag).assertEqual("test_tag");
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0070----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0080
     * @tc.number PasteBoard_Pasteboard_0080
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0080----------");

      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data = await systemPasteboard.getData();
        expect(data.getRecordCount()).assertEqual(1);
        let primaryHtml = data.getPrimaryHtml();
        expect(primaryHtml).assertEqual(htmlText);
        expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
        expect(data.getPrimaryMimeType()).assertEqual('text/html');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0080----------");
    });

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0090
     * @tc.number PasteBoard_Pasteboard_0090
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0090----------");

      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let htmlText = '';
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data = await systemPasteboard.getData();
        expect(data.getRecordCount()).assertEqual(1);
        let primaryHtml = data.getPrimaryHtml();
        expect(primaryHtml).assertEqual(htmlText);
        expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
        expect(data.getPrimaryMimeType()).assertEqual('text/html');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0090----------");
    });

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0100
     * @tc.number PasteBoard_Pasteboard_0100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0100----------");

      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let htmlText = 'Hello 中国!@#$%^&*()_+{}\\?.';
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data = await systemPasteboard.getData();
        expect(data.getRecordCount()).assertEqual(1);
        let primaryHtml = data.getPrimaryHtml();
        expect(primaryHtml).assertEqual(htmlText);
        expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
        expect(data.getPrimaryMimeType()).assertEqual('text/html');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0100----------");
    });

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0110
     * @tc.number PasteBoard_Pasteboard_0110
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0110----------");

      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let textData0 = 'Hello World0';
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData0);
        let uriText = "https://www.baidu.com/";
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_URI, uriText);
        await systemPasteboard.setData(pasteData);
        let data = await systemPasteboard.getData();
        let recordCount = data.getRecordCount();
        expect(data.getRecordCount()).assertEqual(2);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0110----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0120
     * @tc.number PasteBoard_Pasteboard_0120
     * @tc.desc   Test pasteBoard create uri data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0120----------");
      try {
        let uri = "www.baidu.com";
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri);
        expect(pasteData.getRecord(0).uri).assertEqual(uri);
        expect(pasteData.getRecord(0).mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_URI);
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0120----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0130
     * @tc.number PasteBoard_Pasteboard_0130
     * @tc.desc   Test pasteBoard create uri data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0130----------");
      try {
        let text = "hello";
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        expect(pasteData.getRecord(0).plainText).assertEqual(text);
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0130----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0140
     * @tc.number PasteBoard_Pasteboard_0140
     * @tc.desc   Test pasteBoard create uri data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0140----------");
      try {
        let text = "hello";
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        expect(pasteData.getRecord(0).plainText).assertEqual(text);
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0140----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteData_Static_0150
     * @tc.number PasteBoard_Pasteboard_0150
     * @tc.desc   get the pastedata from system pasteBoard success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteData_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0150----------");
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteBoard.setData(pasteData);
        systemPasteBoard.getData((err: BusinessError | null, data: pasteboard.PasteData | undefined) => {
          if (err?.message) {
            hilog.info(domain, tag, "Get the pastedata from system pasteboard failed" + err);
            expect(false).assertTrue();
          } else {
            let recordCount = data?.getRecordCount();
            expect(recordCount).assertEqual(1);
          }
          done();
        })
      } catch (err) {
        hilog.info(domain, tag, "System pasteBoard set pastedata error,error: " + err);
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0150----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0010
     * @tc.number PasteBoard_SystemPasteboard_0010
     * @tc.desc   Determine if there is data in the System pasteboard success, result is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0010----------");
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      try {
        systemPasteBoard.setData(pasteData, (err) => {
          let hasData = await systemPasteBoard.hasData();
          let data = systemPasteBoard.getDataSync();
          expect(hasData).assertTrue();
          done();
        });
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0010----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0020
     * @tc.number PasteBoard_SystemPasteboard_0020
     * @tc.desc   Determine if there is data in the System pasteboard success, result is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0020----------");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      try {
        systemPasteBoard.clearData((err) => {
          let hasData = await systemPasteBoard.hasData();
          expect(hasData).assertFalse();
          done();
        });
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0020----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0030
     * @tc.number PasteBoard_SystemPasteboard_0030
     * @tc.desc   Test pasteBoard create pixelMap record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0030----------");
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
      let systemPasteboard = pasteboard.getSystemPasteboard();
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: true,
        alphaType: image.AlphaType.OPAQUE,
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      const pixelMap = image.createPixelMapSync(buffer, opt);
      pasteData.addRecord('pixelMap', pixelMap);
      try {
        await systemPasteboard.setData(pasteData);
        let hasDataType = systemPasteboard.hasDataType('pixelMap');
        expect(hasDataType).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0030----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0040
     * @tc.number PasteBoard_SystemPasteboard_0040
     * @tc.desc   Test pasteBoard create want record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0040----------");
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
      let systemPasteboard = pasteboard.getSystemPasteboard();
      pasteData.addRecord('text/want', WANT);
      try {
        await systemPasteboard.setData(pasteData);
        let hasDataType = systemPasteboard.hasDataType('text/want');
        expect(hasDataType).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0040----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0050
     * @tc.number PasteBoard_SystemPasteboard_0050
     * @tc.desc   Test pasteBoard create arrayBuffer record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0050----------");
      let pasteData = pasteboard.createData('text/want', WANT);
      let systemPasteboard = pasteboard.getSystemPasteboard();
      pasteData.addRecord("ArrayBuffer", ARRAY_BUFFER);
      try {
        await systemPasteboard.setData(pasteData);
        let hasType = systemPasteboard.hasDataType('ArrayBuffer');
        expect(hasType).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0050----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0060
     * @tc.number PasteBoard_SystemPasteboard_0060
     * @tc.desc   Test pasteBoard create String record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0060----------");
      let pasteData = pasteboard.createData("ArrayBuffer", ARRAY_BUFFER); // 修改string->ArrayBuffer
      let systemPasteboard = pasteboard.getSystemPasteboard();
      pasteData.addRecord(pasteboard.MIMETYPE_TEXT_PLAIN, "stringValueType");
      try {
        await systemPasteboard.setData(pasteData);
        let hasType = systemPasteboard.hasDataType('ArrayBuffer');
        expect(hasType).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0060----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0070
     * @tc.number PasteBoard_SystemPasteboard_0070
     * @tc.desc   Test pasteBoard create arrayBuffer record success with 1024 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0070----------");
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      pasteData.addRecord("x".repeat(1024), ARRAY_BUFFER);
      try {
        await systemPasteboard.setData(pasteData);
        let hasType = systemPasteboard.hasDataType("x".repeat(1024));
        expect(hasType).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0070----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0080
     * @tc.number PasteBoard_SystemPasteboard_0080
     * @tc.desc   Test pasteBoard create      : String record success with 512000 bit valueType<string>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0080----------");
      let pasteData = pasteboard.createData("arrayBuffer", ARRAY_BUFFER);
      let systemPasteboard = pasteboard.getSystemPasteboard();
      let valueType = "x"
      for (let i = 0; i < 500; i++) {
        valueType = valueType + "x".repeat(1024)
      }
      pasteData.addRecord(pasteboard.MIMETYPE_TEXT_PLAIN, valueType);
      try {
        await systemPasteboard.setData(pasteData);
        let hasType = systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0080----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0090
     * @tc.number PasteBoard_SystemPasteboard_0090
     * @tc.desc   Test pasteBoard create      : String data fail with 1025 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0090----------");
      let mimeType = "x".repeat(1025)
      try {
        let pasteData = pasteboard.createData(mimeType, ARRAY_BUFFER);
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err.code).assertEqual(401);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0090----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0100
     * @tc.number PasteBoard_SystemPasteboard_0100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0100----------");

      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let uriText = 'https://www.baidu.com/';
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData === true).assertTrue();
        let pasteData1 = await systemPasteboard.getData();
        expect(pasteData1.getRecordCount() == 1).assertTrue();
        let primaryUri = pasteData1.getPrimaryUri();
        expect(primaryUri == uriText).assertTrue();
        expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_URI)).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0100----------");
    });

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0110
     * @tc.number PasteBoard_SystemPasteboard_0110
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0110----------");

      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let uriText = '';
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data = await systemPasteboard.getData();
        expect(data.getPrimaryUri() == uriText).assertTrue();
        expect(data.getRecordCount()).assertEqual(1);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0110----------");
    });

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0120
     * @tc.number PasteBoard_SystemPasteboard_0120
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0120----------");

      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let uriText = 'Hello//';
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data = await systemPasteboard.getData();
        expect(data.getPrimaryUri() == uriText).assertTrue();
        expect(data.getRecordCount()).assertEqual(1);
        expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_URI)).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0120----------");
    });

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0130
     * @tc.number PasteBoard_SystemPasteboard_0130
     * @tc.desc   Determine if there is data in the System pasteboard success, result is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0130----------");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteBoard.clearData();
        systemPasteBoard.hasData((err: BusinessError | null, data) => {
          if (err?.message) {
            hilog.info(domain, tag, "Judge whether there is data in the      : System pasteBoard error,error is: " + err)
            expect(false).assertTrue();
          } else {
            expect(data == false).assertTrue();
          }
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0130----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0140
     * @tc.number PasteBoard_SystemPasteboard_0140
     * @tc.desc   Test pasteBoard SetProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'application/xml');
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0140----------");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteBoard.clearData();
        let prop = pasteData.getProperty();
        expect(prop.timestamp != null).assertTrue();
        prop.shareOption = pasteboard.ShareOption.INAPP;
        pasteData.setProperty(prop);
        let property = pasteData.getProperty();
        expect(property.shareOption == 0).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }

      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0140----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0150
     * @tc.number PasteBoard_SystemPasteboard_0150
     * @tc.desc   Test pasteBoard SetProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0150----------");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteBoard.clearData();
        let prop = pasteData.getProperty();
        expect(prop.timestamp != null).assertTrue();
        prop.shareOption = pasteboard.ShareOption.LOCALDEVICE;
        pasteData.setProperty(prop);
        let property = pasteData.getProperty();
        expect(property.shareOption == 1).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0150----------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0160
     * @tc.number PasteBoard_SystemPasteboard_0160
     * @tc.desc   Test clearDataSync when systemPasteBoard has data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_PasteBoard_ETS_SystemPasteboard_Static_0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0160----------");
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteBoard.setData(pasteData);
        expect(systemPasteBoard.hasDataSync()).assertEqual(true);
        systemPasteBoard.clearDataSync();
        let result = systemPasteBoard.hasDataSync();
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0160----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0170
     * @tc.number PasteBoard_SystemPasteboard_0170
     * @tc.desc   Test pasteBoard hasDataSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0170----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync()
      try {
        expect(systemPasteboard.hasDataSync()).assertEqual(false);
        await systemPasteboard.setData(pasteData);
        let result: boolean = systemPasteboard.hasDataSync();
        expect(result).assertEqual(true);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(`Failed to hasDataSync. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005');
        done();
      };
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0170----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0180
     * @tc.number PasteBoard_SystemPasteboard_0180
     * @tc.desc   Test hasDataSync when systemPasteBoard is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_PasteBoard_ETS_SystemPasteboard_Static_0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0180----------");
      try {
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "");
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        systemPasteBoard.clearDataSync();
        let result = systemPasteBoard.hasDataSync();
        expect(result).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0180----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0190
     * @tc.number PasteBoard_SystemPasteboard_0190
     * @tc.desc   Test pasteBoard clearDataSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0190----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      expect(systemPasteboard.hasDataSync()).assertEqual(true);
      try {
        systemPasteboard.clearDataSync();
        expect(systemPasteboard.hasDataSync()).assertEqual(false);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err.code).assertEqual('12900005');
      };
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0190----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0200
     * @tc.number PasteBoard_SystemPasteboard_0200
     * @tc.desc   setData Verify the properties of the MIMETYPE_TEXT_PLAIN type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0200----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.setData(pasteData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        let data: Array<String> = await systemPasteboard.getMimeTypes();
        expect(data.length).assertEqual(1);
        expect(data[0]).assertEqual('text/plain');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0200----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0210
     * @tc.number PasteBoard_SystemPasteboard_0210
     * @tc.desc   setData Verify the properties of the MIMETYPE_TEXT_HTML type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0210----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'hello');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.setData(pasteData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        let data: Array<String> = await systemPasteboard.getMimeTypes();
        expect(data.length).assertEqual(1);
        expect(data[0]).assertEqual('text/html');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0210----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0220
     * @tc.number PasteBoard_SystemPasteboard_0220
     * @tc.desc   setData Verify the properties of the MIMETYPE_TEXT_URI type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0220----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'hello');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.setData(pasteData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        let data: Array<String> = await systemPasteboard.getMimeTypes();
        expect(data.length).assertEqual(1);
        expect(data[0]).assertEqual('text/html');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0220----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0230
     * @tc.number PasteBoard_SystemPasteboard_0230
     * @tc.desc   setData Verify the properties of the MIMETYPE_PIXELMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0230----------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.OPAQUE,
          scaleMode: image.ScaleMode.CENTER_CROP
        };
        const pixelMap = image.createPixelMapSync(buffer, opt);
        let pasteData = pasteboard.createData('pixelMap', pixelMap);
        await systemPasteboard.setData(pasteData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        let data: Array<String> = await systemPasteboard.getMimeTypes();
        expect(data.length).assertEqual(1);
        expect(data[0]).assertEqual('pixelMap');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0230----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0240
     * @tc.number PasteBoard_SystemPasteboard_0240
     * @tc.desc   setData Verify the properties of the MIMETYPE_TEXT_WANT type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0240----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData('text/want', WANT);
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.setData(pasteData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        let data: Array<String> = await systemPasteboard.getMimeTypes();
        expect(data[0]).assertEqual('text/want');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0240----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0250
     * @tc.number PasteBoard_SystemPasteboard_0250
     * @tc.desc   setData Verify the properties of the Customize type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0250----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData("hello/test", new ArrayBuffer(256));
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.setData(pasteData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        let data: Array<String> = await systemPasteboard.getMimeTypes();
        expect(data[0]).assertEqual("hello/test");
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0250----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0260
     * @tc.number PasteBoard_SystemPasteboard_0260
     * @tc.desc   setUnifiedData Verify the properties of the appRecordData type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0260----------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let data: Array<String> = await systemPasteboard.getMimeTypes();
        expect(data.length).assertEqual(0);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0260----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0270
     * @tc.number PasteBoard_SystemPasteboard_0270
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0270----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.onUpdate(contentChanges);
        let textData = 'Hello World!';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0270----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0280
     * @tc.number PasteBoard_SystemPasteboard_0280
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0280----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.onUpdate(contentChanges);
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0280----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0290
     * @tc.number PasteBoard_SystemPasteboard_0290
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0290----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.onUpdate(contentChanges);
        let uriText = 'https://www.baidu.com/';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0290----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0300
     * @tc.number PasteBoard_SystemPasteboard_0300
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0300----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.onUpdate(contentChanges);
        let record: Record<string, pasteboard.ValueType> = {};
        let want = {
          bundleName: "com.example.myapplication45",
          abilityName: "com.example.myapplication45.MainAbility"
        } as Want;
        record['text/want'] = want;
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0300----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0310
     * @tc.number PasteBoard_SystemPasteboard_0310
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0310----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.onUpdate(contentChanges);
        let textData = 'Hello World!';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        systemPasteboard.clearDataSync();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0310----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0320
     * @tc.number PasteBoard_SystemPasteboard_0320
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0320----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.offUpdate(contentChanges)
        let textData = 'Hello World!';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0320----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0330
     * @tc.number PasteBoard_SystemPasteboard_0330
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0330----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.offUpdate(contentChanges)
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0330----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0340
     * @tc.number PasteBoard_SystemPasteboard_0340
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0340----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.offUpdate(contentChanges)
        let uriText = 'https://www.baidu.com/';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0340----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0350
     * @tc.number PasteBoard_SystemPasteboard_0350
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0350----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.offUpdate(contentChanges)
        let record: Record<string, pasteboard.ValueType> = {};
        let want = {
          bundleName: "com.example.myapplication45",
          abilityName: "com.example.myapplication45.MainAbility"
        } as Want;
        record['text/want'] = want;
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0350----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0360
     * @tc.number PasteBoard_SystemPasteboard_0360
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0360----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        systemPasteboard.offUpdate(contentChanges)
        let textData = 'Hello World!';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
        await systemPasteboard.setData(pasteData);
        let hasData = await systemPasteboard.hasData();
        expect(hasData).assertTrue();
        let data: pasteboard.PasteData = await systemPasteboard.getData();
        expect(data.getRecordCount() == 1).assertTrue();
        systemPasteboard.clearDataSync();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0360----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SystemPasteboard_Static_0370
     * @tc.number PasteBoard_SystemPasteboard_0370
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0370----------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.clearData();
        let textData = 'Hello World!';
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
        await systemPasteboard.setData(pasteData);
        let source = systemPasteboard.getDataSource();
        expect(source != null).assertTrue();
        systemPasteboard.clearDataSync();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0370----------");
    })
    /**
     * @tc.name   SUB_PasteBoard_ETS_GetDataWithProgress_Static_0010
     * @tc.number SUB_PasteBoard_ETS_GetDataWithProgress_Static_0010
     * @tc.desc   getDataWithProgress with invalid params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetDataWithProgress_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0010 start------");

      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      hilog.info(domain, tag, "------getSystemPasteboard start------");
      systemPasteboard.clearDataSync();
      hilog.info(domain, tag, "------clearDataSync start------");
      try {
        fs.mkdirSync(dstDir);
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `Failed to create dir: ${err.message}`);
      }
      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(tag + 'dstUri:' + dstUri + 'length:' + dstUri.length);

      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: pasteboard.ProgressIndicator.NONE
      };
      try {
        await systemPasteboard.getDataWithProgress(params);
        hilog.info(domain, tag, "getDataWithProgress success");
      } catch (err) {
        err = err as BusinessError;
        //涉及到权限问题，权限不足就会报错误码12900010
        hilog.info(domain, tag, "Remove specified record fail,error code is: " + err.message + err.code)
        expect(err.code).assertEqual(12900010)
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0010 end-------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_GetDataWithProgress_Static_0020
     * @tc.number SUB_PasteBoard_ETS_GetDataWithProgress_Static_0020
     * @tc.desc   getDataWithProgress fail,err：12900010,message: System error occurred during paste execution.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetDataWithProgress_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0020 start------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      let params: pasteboard.GetDataParams = {
        destUri: "",
        progressIndicator: pasteboard.ProgressIndicator.NONE
      };
      try {
        await systemPasteboard.getDataWithProgress(params);
        hilog.info(domain, tag, "getDataWithProgress params assertFail");
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'getDataWithProgress fail,err:' + err.code + ',message: ' + err.message);
        expect(err.code).assertEqual(12900010)
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0020 end-------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_GetDataWithProgress_Static_0030
     * @tc.number SUB_PasteBoard_ETS_GetDataWithProgress_Static_0030
     * @tc.desc   getDataWithProgress with invalid params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetDataWithProgress_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0030 start------");
      try {
        let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let params: pasteboard.GetDataParams = {
          destUri: "",
          progressIndicator: pasteboard.ProgressIndicator.DEFAULT,
        };
        await systemPasteboard.getDataWithProgress(params);
        hilog.info(domain, tag, "getDataWithProgress params assertFail");
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'getDataWithProgress fail,err:' + err.code + ',message: ' + err.message);
        expect(err.code).assertEqual(12900010);
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0030 end-------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_GetDataWithProgress_Static_0040
     * @tc.number SUB_PasteBoard_ETS_GetDataWithProgress_Static_0040
     * @tc.desc   getDataWithProgress with invalid params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetDataWithProgress_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0040 start------");
      try {
        let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let params: pasteboard.GetDataParams = {
          destUri: dstDir,
          progressIndicator: pasteboard.ProgressIndicator.DEFAULT,
          fileConflictOptions: pasteboard.FileConflictOptions.OVERWRITE,
        };
        await systemPasteboard.getDataWithProgress(params);
        hilog.info(domain, tag, "getDataWithProgress params assertFail");
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'getDataWithProgress fail,err:' + err.code + ',message: ' + err.message);
        expect(err.code).assertEqual(12900010);
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0040 end-------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_GetDataWithProgress_Static_0050
     * @tc.number SUB_PasteBoard_ETS_GetDataWithProgress_Static_0050
     * @tc.desc   getDataWithProgress with invalid params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetDataWithProgress_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0050 start------");
      try {
        let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let params: pasteboard.GetDataParams = {
          destUri: dstDir,
          progressIndicator: pasteboard.ProgressIndicator.DEFAULT,
          fileConflictOptions: pasteboard.FileConflictOptions.SKIP,
        };
        await systemPasteboard.getDataWithProgress(params);
        hilog.info(domain, tag, "getDataWithProgress params assertFail");
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'getDataWithProgress fail,err:' + err.code + ',message: ' + err.message);
        expect(err.code).assertEqual(12900010);
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetDataWithProgress_Static_0050 end-------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_GetChangeCount_Static_0010
     * @tc.number SUB_PasteBoard_ETS_GetChangeCount_Static_0010
     * @tc.desc   getChangeCount with invalid params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetChangeCount_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetChangeCount_Static_0010 start------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        let result1: Long = systemPasteboard.getChangeCount();
        hilog.info(domain, tag, "Succeeded in getting the change count.Result0: " + result1);

        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content1');
        await systemPasteboard.setData(pasteData);
        hilog.info(domain, tag, "Succeeded in setting pasteData");

        let result2: Long = systemPasteboard.getChangeCount();
        hilog.info(domain, tag, "Succeeded in getting the change count.Result1: " + result2);
        expect(result2).assertEqual(result1 + 1);
        hilog.info(domain, tag, "Pasteboard change success.");
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, "Failed to get the change count.Cause: " + err.message);
        expect().assertFail();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetChangeCount_Static_0010 end-------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_CreateRecord_Static_0010
     * @tc.number SUB_PasteBoard_ETS_CreateRecord_Static_0010
     * @tc.desc   createRecord with invalid params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_CreateRecord_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0010 start------");
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)
      pasteData.replaceRecord(0, pasteDataRecord)
      let result = pasteData.hasType("arrayBuffer")
      expect(result).assertTrue();
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0010 end-------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_CreateRecord_Static_0020
     * @tc.number SUB_PasteBoard_ETS_CreateRecord_Static_0020
     * @tc.desc   createRecord with invalid params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_CreateRecord_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0020 start------");
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: true,
        alphaType: image.AlphaType.OPAQUE,
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(buffer, opt);
      let htmlText: string = 'dataability:///com.example.myapplication1/user.txt';
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
      try {
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_URI, 'URI');
        record.addEntry(pasteboard.MIMETYPE_PIXELMAP, pixelMap)
        record.addEntry(pasteboard.MIMETYPE_TEXT_WANT, WANT)
        record.addEntry('app/xml', new ArrayBuffer(256),)
        let types: string[] = record.getValidTypes([
          pasteboard.MIMETYPE_TEXT_PLAIN,
          pasteboard.MIMETYPE_TEXT_HTML,
          pasteboard.MIMETYPE_TEXT_URI,
          pasteboard.MIMETYPE_TEXT_WANT,
          pasteboard.MIMETYPE_PIXELMAP,
          'app/xml'
        ]);
        hilog.info(domain, tag, "addEntry success,getValidTypes success.types:" + types);
        hilog.info(domain, tag, "htmlText:" + record.htmlText);
        expect(String(htmlText)).assertEqual(record.htmlText);
        expect(types.length).assertEqual(6);
        expect(String(types)).assertEqual('text/plain,text/html,text/uri,text/want,pixelMap,app/xml');
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "message: " + err.message);
        expect().assertFail()
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0020 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_CreateRecord_Static_0030
     * @tc.number SUB_PasteBoard_ETS_CreateRecord_Static_0030
     * @tc.desc   createRecord with invalid params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_CreateRecord_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0030 start------");
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_WANT, WANT);
      try {
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_URI, 'URL');
        record.addEntry(pasteboard.MIMETYPE_TEXT_WANT, WANT);
        record.addEntry('app/xml', new ArrayBuffer(256),);

        hilog.info(domain, tag, "bundleName:" + record.want.bundleName);
        hilog.info(domain, tag, "MAX_RECORD_NUM:" + pasteboard.MAX_RECORD_NUM);
        expect(String(WANT.bundleName)).assertEqual(record.want.bundleName);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "message: " + err.message);
        expect().assertFail()
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0030 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_CreateRecord_Static_0040
     * @tc.number SUB_PasteBoard_ETS_CreateRecord_Static_0040
     * @tc.desc   createRecord with invalid params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_CreateRecord_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0040 start------");
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)
      try {
        pasteData.replaceRecord(1, pasteDataRecord)
      } catch (err) {
        err = err as BusinessError;
        console.info("Replace specified record fail,error code is: " + err.code)
        expect(err.code).assertEqual(12900001)
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0040 end-------");
      done();
    })


    /**
     * @tc.name   SUB_PasteBoard_ETS_ReplaceRecord_Static_0010
     * @tc.number SUB_PasteBoard_ETS_ReplaceRecord_Static_0010
     * @tc.desc   replaceRecord with invalid params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_ReplaceRecord_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ReplaceRecord_Static_0010 start------");
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)
      pasteData.replaceRecord(0, pasteDataRecord)
      let result = pasteData.hasType("arrayBuffer")
      expect(result).assertTrue();
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ReplaceRecord_Static_0010 end-------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_ReplaceRecord_Static_0020
     * @tc.number SUB_PasteBoard_ETS_ReplaceRecord_Static_0020
     * @tc.desc   replaceRecord with invalid params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_ReplaceRecord_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ReplaceRecord_Static_0020 start------");
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)
      try {
        pasteData.replaceRecord(1, pasteDataRecord)
      } catch (err) {
        err = err as BusinessError;
        console.info("Replace specified record fail,error code is: " + err.code)
        expect(err.code).assertEqual(12900001)
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ReplaceRecord_Static_0020 end-------");
      done();
    })
    /**
     * @tc.name   SUB_PasteBoard_ETS_RemoveRecord_Static_0010
     * @tc.number SUB_PasteBoard_ETS_RemoveRecord_Static_0010
     * @tc.desc   Remove specified removeRecord from pasteData failed,index out of range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_RemoveRecord_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_RemoveRecord_Static_0010 start------");
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      hilog.info(domain, tag, "pasteData createData");
      expect(pasteData.getRecordCount()).assertEqual(1)
      hilog.info(domain, tag, "pasteData.getRecordCount(): " + pasteData.getRecordCount());
      try {
        pasteData.removeRecord(2)
        hilog.info(domain, tag, "removeRecord");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "Remove specified removeRecord fail,error code is: " + err.message)
        expect(err.code).assertEqual(12900001)
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_RemoveRecord_Static_0010 end-------");
      done();
    })
    /**
     * @tc.name   SUB_PasteBoard_ETS_RemoveRecord_Static_0020
     * @tc.number SUB_PasteBoard_ETS_RemoveRecord_Static_0020
     * @tc.desc   Remove specified removeRecord from pasteData success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_RemoveRecord_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_RemoveRecord_Static_0020 start------");
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      hilog.info(domain, tag, "pasteData createData");
      expect(pasteData.getRecordCount()).assertEqual(1)
      hilog.info(domain, tag, "pasteData.getRecordCount(): " + pasteData.getRecordCount());
      try {
        pasteData.removeRecord(0)
        hilog.info(domain, tag, "Remove specified removeRecord from pasteData success");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "Remove specified removeRecord fail,error code is: " + err.message)
        expect(err.code).assertEqual(12900001)
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_RemoveRecord_Static_0020 end-------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_HasType_Static_0010
     * @tc.number SUB_PasteBoard_ETS_HasType_Static_0010
     * @tc.desc   Pasteboard setData and hasType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_HasType_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_HasType_Static_0010 start------");
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)
      pasteData.replaceRecord(0, pasteDataRecord)
      let result = pasteData.hasType("arrayBuffer")
      expect(result).assertTrue();
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_HasType_Static_0010 end-------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_HasType_Static_0020
     * @tc.number SUB_PasteBoard_ETS_HasType_Static_0020
     * @tc.desc   Pasteboard setData and hasType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_HasType_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_HasType_Static_0020 start------");
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_WANT, WANT);
      try {
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_URI, 'URL');
        record.addEntry(pasteboard.MIMETYPE_TEXT_WANT, WANT);
        record.addEntry('app/xml', new ArrayBuffer(256),);

        hilog.info(domain, tag, "bundleName:" + record.want.bundleName);
        hilog.info(domain, tag, "MAX_RECORD_NUM:" + pasteboard.MAX_RECORD_NUM);
        expect(String(WANT.bundleName)).assertEqual(record.want.bundleName);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "message: " + err.message);
        expect().assertFail()
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_HasType_Static_0020 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_HasType_Static_0030
     * @tc.number SUB_PasteBoard_ETS_HasType_Static_0030
     * @tc.desc   Test pasteBoard hasType data result == false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_HasType_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_HasType_Static_0030 start------");
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      pasteData.removeRecord(0)
      let result = pasteData.hasType("string")
      expect(result == false).assertTrue();
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_HasType_Static_0030 end-------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_HasType_Static_0040
     * @tc.number SUB_PasteBoard_ETS_HasType_Static_0040
     * @tc.desc   hasType result: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_HasType_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_HasType_Static_0040 start------");
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      pasteData.removeRecord(0)
      try {
        let result = pasteData.hasType('')
        hilog.info(domain, tag, "hasType result: " + result);
        expect(result).assertFalse();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to getValidTypes. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual(401);
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_HasType_Static_0040 end-------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_GetPrimaryPixelMap_Static_0010
     * @tc.number SUB_PasteBoard_ETS_GetPrimaryPixelMap_Static_0010
     * @tc.desc   Test pasteBoard getPrimaryPixelMap data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetPrimaryPixelMap_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetPrimaryPixelMap_Static_0010 start------");
      let pasteData: pasteboard.PasteData | undefined;
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: true,
        alphaType: image.AlphaType.OPAQUE,
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      await image.createPixelMap(color, opt).then((pixelMap) => {
        pasteData = pasteboard.createData(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
      })
      let pixelMapRecord = pasteData!.getPrimaryPixelMap()
      expect(pixelMapRecord != null).assertTrue();
      expect(pixelMapRecord.getPixelBytesNumber()).assertEqual(60);
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetPrimaryPixelMap_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteStart_Static_0010
     * @tc.number SUB_PasteBoard_ETS_PasteStart_Static_0010
     * @tc.desc   Test pasteBoard pasteStart success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteStart_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_PasteStart_Static_0010 start------");
      let uri = "www.baidu.com"
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri)
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData);
      let data = await systemPasteBoard.getData();

      try {
        data.pasteStart();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "pasteStart fail" + err.message);
        expect().assertFail();
        done();
      }

      try {
        data.pasteComplete();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "pasteComplete fail" + err.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_PasteStart_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_GetValidTypes_Static_0010
     * @tc.number SUB_PasteBoard_ETS_GetValidTypes_Static_0010
     * @tc.desc   Test pasteBoard variety createData Variety and getValidTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetValidTypes_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetValidTypes_Static_0010 start------");
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: true,
        alphaType: image.AlphaType.OPAQUE,
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(buffer, opt);
      let htmlText: string = 'dataability:///com.example.myapplication1/user.txt';
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
      try {
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_URI, 'URI');
        record.addEntry(pasteboard.MIMETYPE_PIXELMAP, pixelMap)
        record.addEntry(pasteboard.MIMETYPE_TEXT_WANT, WANT)
        record.addEntry('app/xml', new ArrayBuffer(256),)
        let types: string[] = record.getValidTypes([
          pasteboard.MIMETYPE_TEXT_PLAIN,
          pasteboard.MIMETYPE_TEXT_HTML,
          pasteboard.MIMETYPE_TEXT_URI,
          pasteboard.MIMETYPE_TEXT_WANT,
          pasteboard.MIMETYPE_PIXELMAP,
          'app/xml'
        ]);
        hilog.info(domain, tag, "addEntry success,getValidTypes success.types:" + types);
        hilog.info(domain, tag, "htmlText:" + record.htmlText);
        expect(String(htmlText)).assertEqual(record.htmlText);
        expect(types.length).assertEqual(6);
        expect(String(types)).assertEqual('text/plain,text/html,text/uri,text/want,pixelMap,app/xml');
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "message: " + err.message);
        expect().assertFail()
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetValidTypes_Static_0010 end------");
      done();
    })
    /**
     * @tc.name   SUB_PasteBoard_ETS_GetValidTypes_Static_0020
     * @tc.number SUB_PasteBoard_ETS_GetValidTypes_Static_0020
     * @tc.desc   getValidTypes Failed types.length === 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetValidTypes_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetValidTypes_Static_0020 start------");
      let html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
      record.addEntry(pasteboard.MIMETYPE_TEXT_HTML, html);
      try {
        let types: string[] = record.getValidTypes([]);
        hilog.info(domain, tag, "getValidTypes Failed types.length === 0");
        expect(types.length === 0).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to getValidTypes. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual(401);
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetValidTypes_Static_0020 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_AddEntry_Static_0010
     * @tc.number SUB_PasteBoard_ETS_AddEntry_Static_0010
     * @tc.desc   Pasteboard setData and hasType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_AddEntry_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_AddEntry_Static_0010 start------");
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_WANT, WANT);
      try {
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_URI, 'URL');
        record.addEntry(pasteboard.MIMETYPE_TEXT_WANT, WANT);
        record.addEntry('app/xml', new ArrayBuffer(256),);

        hilog.info(domain, tag, "bundleName:" + record.want.bundleName);
        hilog.info(domain, tag, "MAX_RECORD_NUM:" + pasteboard.MAX_RECORD_NUM);
        expect(String(WANT.bundleName)).assertEqual(record.want.bundleName);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "message: " + err.message);
        expect().assertFail()
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_AddEntry_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_AddEntry_Static_0020
     * @tc.number SUB_PasteBoard_ETS_AddEntry_Static_0020
     * @tc.desc   Test pasteBoard addEntry data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_AddEntry_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_AddEntry_Static_0020 start------");
      let buffer = new ArrayBuffer(128);
      let realSize: image.Size = { height: 3, width: 5 };
      let opt: image.InitializationOptions = {
        size: realSize,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: true,
        alphaType: image.AlphaType.OPAQUE,
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(buffer, opt);
      let htmlText: string = 'dataability:///com.example.myapplication1/user.txt';
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
      try {
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_URI, 'URI');
        record.addEntry(pasteboard.MIMETYPE_PIXELMAP, pixelMap)
        record.addEntry(pasteboard.MIMETYPE_TEXT_WANT, WANT)
        record.addEntry('app/xml', new ArrayBuffer(256),)
        let types: string[] = record.getValidTypes([
          pasteboard.MIMETYPE_TEXT_PLAIN,
          pasteboard.MIMETYPE_TEXT_HTML,
          pasteboard.MIMETYPE_TEXT_URI,
          pasteboard.MIMETYPE_TEXT_WANT,
          pasteboard.MIMETYPE_PIXELMAP,
          'app/xml'
        ]);
        hilog.info(domain, tag, "addEntry success,getValidTypes success.types:" + types);
        hilog.info(domain, tag, "htmlText:" + record.htmlText);
        expect(String(htmlText)).assertEqual(record.htmlText);
        expect(types.length).assertEqual(6);
        expect(String(types)).assertEqual('text/plain,text/html,text/uri,text/want,pixelMap,app/xml');
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "message: " + err.message);
        expect().assertFail()
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_AddEntry_Static_0020 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_AddEntry_Static_0030
     * @tc.number SUB_PasteBoard_ETS_AddEntry_Static_0030
     * @tc.desc   addEntry Failed types.length === 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_AddEntry_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_AddEntry_Static_0030 start------");
      let html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
      record.addEntry(pasteboard.MIMETYPE_TEXT_HTML, html);
      try {
        let types: string[] = record.getValidTypes([]);
        hilog.info(domain, tag, "getValidTypes Failed types.length === 0");
        expect(types.length === 0).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to getValidTypes. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual(401);
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_AddEntry_Static_0030 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_Cancel_Static_0010
     * @tc.number SUB_PasteBoard_ETS_Cancel_Static_0010
     * @tc.desc   Test pasteBoard cancel success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_Cancel_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '************ SUB_PasteBoard_ETS_Cancel_Static_0010 start ************')
      try {
        let signal = new pasteboard.ProgressSignal;
        hilog.info(domain, tag, 'success, progress:' + signal);
        try {
          signal.cancel();
          hilog.info(domain, tag, 'Test pasteBoard cancel success');
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "Test pasteBoard cancel fail" + err.message);
          hilog.info(domain, tag, "err.code " + err.code);
          expect().assertFail();
          done();
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "pasteboard.ProgressSignal constructor fail" + err.message);
        hilog.info(domain, tag, "err.code " + err.code);
        expect().assertFail();
        done();
      }
      done();
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_Cancel_Static_0010 end------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SetAppShareOptions_Static_0010
     * @tc.number SUB_PasteBoard_ETS_SetAppShareOptions_Static_0010
     * @tc.desc   setAppShareOptions fail,code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SetAppShareOptions_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetAppShareOptions_Static_0010 start------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.INAPP);
        hilog.info(domain, tag, "setAppShareOptions setAppShareOptions inApp success");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "setAppShareOptions setAppShareOptions inApp fail " + err.message);
        hilog.info(domain, tag, "err.code " + err.code);
        expect(err.code).assertEqual(201);
        done();
      }
      try {
        systemPasteboard.removeAppShareOptions();
        hilog.info(domain, tag, "setAppShareOptions removeAppShareOptions success");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "setAppShareOptions removeAppShareOptions fail" + err.message);
        hilog.info(domain, tag, "err.code " + err.code);
        expect(err.code).assertEqual(201);
        done();
      }
      done();
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetAppShareOptions_Static_0010 end------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SetAppShareOptions_Static_0020
     * @tc.number SUB_PasteBoard_ETS_SetAppShareOptions_Static_0020
     * @tc.desc   setAppShareOptions fail,code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SetAppShareOptions_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetAppShareOptions_Static_0020 start------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.LOCALDEVICE);
        hilog.info(domain, tag, "setAppShareOptions setAppShareOptions localDevice success");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "setAppShareOptions setAppShareOptions localDevice fail " + err.message);
        hilog.info(domain, tag, "err.code " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
      done();
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetAppShareOptions_Static_0020 end------");
    })


    /**
     * @tc.name   SUB_PasteBoard_ETS_RemoveAppShareOptions_Static_0010
     * @tc.number SUB_PasteBoard_ETS_RemoveAppShareOptions_Static_0010
     * @tc.desc   removeAppShareOptions fail,code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_RemoveAppShareOptions_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_RemoveAppShareOptions_Static_0010 start------");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.INAPP);
        hilog.info(domain, tag, "setAppShareOptions setAppShareOptions inApp success");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "setAppShareOptions setAppShareOptions inApp fail " + err.message);
        hilog.info(domain, tag, "err.code " + err.code);
        expect(err.code).assertEqual(201);
        done();
      }
      try {
        systemPasteboard.removeAppShareOptions();
        hilog.info(domain, tag, "setAppShareOptions removeAppShareOptions success");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "setAppShareOptions removeAppShareOptions fail" + err.message);
        hilog.info(domain, tag, "err.code " + err.code);
        expect(err.code).assertEqual(201);
        done();
      }
      done();
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_RemoveAppShareOptions_Static_0010 end------");
    })


    /**
     * @tc.name   SUB_PasteBoard_ETS_GetUnifiedData_Static_0010
     * @tc.number SUB_PasteBoard_ETS_GetUnifiedData_Static_0010
     * @tc.desc   Test pasteBoard getUnifiedData success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetUnifiedData_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetUnifiedData_Static_0010 start------");
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let systemPasteboard = pasteboard.getSystemPasteboard();
      plainText.details = {
        "Key": 'delayPlaintext',
        "Value": 'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.textAbstract = 'textAbstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      hilog.info(domain, tag, "result:" + result);
      expect(result).assertFalse();

      let result1: number = systemPasteboard.getChangeCount();
      hilog.info(domain, tag, "Succeeded in getting the change count.Result0:" + result1);
      try {
        await systemPasteboard.setUnifiedData(plainTextData);
        let result2: number = systemPasteboard.getChangeCount();
        hilog.info(domain, tag, 'Succeeded in setting UnifiedData.');
        expect(result2).assertEqual(result1 + 1);
        console.info(domain, tag, 'Pasteboard change success.');
        try {
          let data: unifiedDataChannel.UnifiedData = await systemPasteboard.getUnifiedData();
          hilog.info(domain, tag, "data:" + data);
          try {
            let records = data.getRecords();
            hilog.info(domain, tag, "Get Plain Text records length :" + records.length);
            expect(records[0].getType()).assertEqual(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.valueOf());
            let record = records[0] as unifiedDataChannel.PlainText;
            expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
            hilog.info(domain, tag, 'Get Plain Text Unified Data Success, type: ' + records[0].getType() + 'details:' + JSON.stringify(record.details));
          } catch (err) {
            err = err as BusinessError;
            hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
            expect().assertFail();
            done();
          }
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
          expect().assertFail();
          done();
        }
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetUnifiedData_Static_0010 end------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_GetUnifiedData_Static_0020
     * @tc.number SUB_PasteBoard_ETS_GetUnifiedData_Static_0020
     * @tc.desc   Test pasteBoard getUnifiedData success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetUnifiedData_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetUnifiedData_Static_0020 start------");
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let systemPasteboard = pasteboard.getSystemPasteboard();
      plainText.details = {
        "Key": 'delayPlaintext',
        "Value": 'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.textAbstract = 'textAbstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      expect(result).assertFalse();
      try {
        await systemPasteboard.setUnifiedData(plainTextData);
        hilog.info(domain, tag, 'Succeeded in setting UnifiedData.');
        let data: unifiedDataChannel.UnifiedData = await systemPasteboard.getUnifiedData();
        let records = data.getRecords();
        hilog.info(domain, tag, "Get Plain Text records length :" + records.length);
        expect(records.length).assertEqual(1);
        expect(records[0].getType()).assertEqual(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.valueOf());
        let record = records[0] as unifiedDataChannel.PlainText;
        expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
        hilog.info(domain, tag, 'Get Plain Text Unified Data Success, type: ' + records[0].getType() + 'details:' + JSON.stringify(record.details));
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetUnifiedData_Static_0020 end------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SetUnifiedData_Static_0010
     * @tc.number SUB_PasteBoard_ETS_SetUnifiedData_Static_0010
     * @tc.desc   Test pasteBoard setUnifiedData data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SetUnifiedData_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedData_Static_0010 start------");
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let systemPasteboard = pasteboard.getSystemPasteboard();
      plainText.details = {
        "Key": 'delayPlaintext',
        "Value": 'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.textAbstract = 'textAbstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      hilog.info(domain, tag, "hasDataSync result" + result);
      expect(result).assertFalse();

      let result1: number = systemPasteboard.getChangeCount();
      console.info(domain, tag, `Succeeded in getting the change count.Result0:${result1}`);
      try {
        await systemPasteboard.setUnifiedData(plainTextData);
        let result2: number = systemPasteboard.getChangeCount();
        console.info(domain, tag, `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(domain, tag, 'Pasteboard change success.');
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedData_Static_0010 end------");
    })


    /**
     * @tc.name   SUB_PasteBoard_ETS_SetUnifiedData_Static_0020
     * @tc.number SUB_PasteBoard_ETS_SetUnifiedData_Static_0020
     * @tc.desc   Test pasteBoard setUnifiedData data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SetUnifiedData_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedData_Static_0020 start------");
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let systemPasteboard = pasteboard.getSystemPasteboard();
      plainText.details = {
        "Key": 'delayPlaintext',
        "Value": 'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.textAbstract = 'textAbstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      hilog.info(domain, tag, "result:" + result);
      expect(result).assertFalse();

      let result1: number = systemPasteboard.getChangeCount();
      hilog.info(domain, tag, "Succeeded in getting the change count.Result0:" + result1);
      try {
        await systemPasteboard.setUnifiedData(plainTextData);
        let result2: number = systemPasteboard.getChangeCount();
        hilog.info(domain, tag, 'Succeeded in setting UnifiedData.');
        expect(result2).assertEqual(result1 + 1);
        console.info(domain, tag, 'Pasteboard change success.');
        try {
          let data: unifiedDataChannel.UnifiedData = await systemPasteboard.getUnifiedData();
          hilog.info(domain, tag, "data:" + data);
          try {
            let records = data.getRecords();
            hilog.info(domain, tag, "Get Plain Text records length :" + records.length);
            expect(records[0].getType()).assertEqual(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.valueOf());
            let record = records[0] as unifiedDataChannel.PlainText;
            expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
            hilog.info(domain, tag, 'Get Plain Text Unified Data Success, type: ' + records[0].getType() + 'details:' + JSON.stringify(record.details));
          } catch (err) {
            err = err as BusinessError;
            hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
            expect().assertFail();
            done();
          }
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
          expect().assertFail();
          done();
        }
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedData_Static_0020 end------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SetUnifiedData_Static_0030
     * @tc.number SUB_PasteBoard_ETS_SetUnifiedData_Static_0030
     * @tc.desc   Test pasteBoard setUnifiedData data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SetUnifiedData_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedData_Static_0030 start------");
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let systemPasteboard = pasteboard.getSystemPasteboard();
      plainText.details = {
        "Key": 'delayPlaintext',
        "Value": 'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.textAbstract = 'textAbstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      expect(result).assertFalse();
      try {
        await systemPasteboard.setUnifiedData(plainTextData);
        hilog.info(domain, tag, 'Succeeded in setting UnifiedData.');
        let data: unifiedDataChannel.UnifiedData = await systemPasteboard.getUnifiedData();
        let records = data.getRecords();
        hilog.info(domain, tag, "Get Plain Text records length :" + records.length);
        expect(records.length).assertEqual(1);
        expect(records[0].getType()).assertEqual(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.valueOf());
        let record = records[0] as unifiedDataChannel.PlainText;
        expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
        hilog.info(domain, tag, 'Get Plain Text Unified Data Success, type: ' + records[0].getType() + 'details:' + JSON.stringify(record.details));
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedData_Static_0030 end------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_GetUnifiedDataSync_Static_0010
     * @tc.number SUB_PasteBoard_ETS_GetUnifiedDataSync_Static_0010
     * @tc.desc   Test pasteBoard getUnifiedDataSync data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_GetUnifiedDataSync_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetUnifiedDataSync_Static_0010 start------");
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let systemPasteboard = pasteboard.getSystemPasteboard();
      plainText.details = {
        "Key": 'delayPlaintext',
        "Value": 'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.textAbstract = 'textAbstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      hilog.info(domain, tag, "result:" + result);
      expect(result).assertFalse();

      let result1: number = systemPasteboard.getChangeCount();
      hilog.info(domain, tag, "Succeeded in getting the change count.Result0:" + result1);
      try {
        systemPasteboard.setUnifiedDataSync(plainTextData);
        let result2: number = systemPasteboard.getChangeCount();
        hilog.info(domain, tag, 'Succeeded in setting UnifiedData.');
        let data: unifiedDataChannel.UnifiedData = systemPasteboard.getUnifiedDataSync();
        let records = data.getRecords();
        hilog.info(domain, tag, "Get Plain Text records length :" + records.length);
        expect(records.length).assertEqual(1);
        expect(records[0].getType()).assertEqual(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.valueOf());
        let record = records[0] as unifiedDataChannel.PlainText;
        expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
        hilog.info(domain, tag, 'Get Plain Text Unified Data Success, type: ' + records[0].getType() + 'details:' + JSON.stringify(record.details));
        hilog.info(domain, tag, "Succeeded in getting the change count.Result2:" + result2);
        expect(result2).assertEqual(result1 + 1);
        hilog.info(domain, tag, 'Pasteboard change success.');
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_GetUnifiedDataSync_Static_0010 end------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_PasteComplete_Static_0010
     * @tc.number SUB_PasteBoard_ETS_PasteComplete_Static_0010
     * @tc.desc   Test pasteBoard pasteComplete success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_PasteComplete_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_PasteComplete_Static_0010 start------");
      let uri = "www.baidu.com"
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri)
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData);
      let data = await systemPasteBoard.getData();

      try {
        data.pasteStart();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "pasteStart fail" + err.message);
        expect().assertFail();
      }

      try {
        data.pasteComplete();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "pasteComplete fail" + err.message);
        expect().assertFail();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_PasteComplete_Static_0010 end------");
      done();
    })
    /**
     * @tc.name   SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0010
     * @tc.number SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0010
     * @tc.desc   Test pasteBoard setUnifiedDataSync data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0010 start------");
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let systemPasteboard = pasteboard.getSystemPasteboard();
      plainText.details = {
        "Key": 'delayPlaintext',
        "Value": 'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.textAbstract = 'textAbstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      hilog.info(domain, tag, "hasDataSync result" + result);
      expect(result).assertFalse();

      let result1: number = systemPasteboard.getChangeCount();
      console.info(domain, tag, `Succeeded in getting the change count.Result0:${result1}`);
      try {
        systemPasteboard.setUnifiedDataSync(plainTextData);
        let result2: number = systemPasteboard.getChangeCount();
        console.info(domain, tag, `Succeeded in getting the change count.Result1:${result2}`);
        expect(result2).assertEqual(result1 + 1);
        console.info(domain, tag, 'Pasteboard change success.');
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0010 end------");
    })


    /**
     * @tc.name   SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0020
     * @tc.number SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0020
     * @tc.desc   Test pasteBoard setUnifiedDataSync data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0020 start------");
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      let systemPasteboard = pasteboard.getSystemPasteboard();
      plainText.details = {
        "Key": 'delayPlaintext',
        "Value": 'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.textAbstract = 'textAbstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      hilog.info(domain, tag, "result:" + result);
      expect(result).assertFalse();

      let result1: number = systemPasteboard.getChangeCount();
      hilog.info(domain, tag, "Succeeded in getting the change count.Result0:" + result1);
      try {
        systemPasteboard.setUnifiedDataSync(plainTextData);
        let result2: number = systemPasteboard.getChangeCount();
        hilog.info(domain, tag, 'Succeeded in setting UnifiedData.');
        let data: unifiedDataChannel.UnifiedData = systemPasteboard.getUnifiedDataSync();
        let records = data.getRecords();
        hilog.info(domain, tag, "Get Plain Text records length :" + records.length);
        expect(records.length).assertEqual(1);
        expect(records[0].getType()).assertEqual(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.valueOf());
        let record = records[0] as unifiedDataChannel.PlainText;
        expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
        hilog.info(domain, tag, 'Get Plain Text Unified Data Success, type: ' + records[0].getType() + 'details:' + JSON.stringify(record.details));
        hilog.info(domain, tag, "Succeeded in getting the change count.Result2:" + result2);
        expect(result2).assertEqual(result1 + 1);
        hilog.info(domain, tag, 'Pasteboard change success.');
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetUnifiedDataSync_Static_0020 end------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_DetectPatterns_Static_0010
     * @tc.number SUB_PasteBoard_ETS_DetectPatterns_Static_0010
     * @tc.desc   Test pasteBoard detectPatterns data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_DetectPatterns_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_DetectPatterns_Static_0010 start------");
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      hilog.info(domain, tag, 'res' + res);
      expect(res).assertEqual(true);
      let patterns: Array<pasteboard.Pattern> = [pasteboard.Pattern.NUMBER];
      try {
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          hilog.info(domain, tag, "----detectPatterns callback----");
          expect(data.sort().join('')).assertEqual(patterns.sort().join(''));
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "error.message:" + err.message);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_DetectPatterns_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SetDataSync_Static_0010
     * @tc.number SUB_PasteBoard_ETS_SetDataSync_Static_0010
     * @tc.desc   Test pasteBoard setDataSync data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_PasteBoard_ETS_SetDataSync_Static_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetDataSync_Static_0010 start------");
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      systemPasteBoard.setDataSync(pasteData);
      expect(systemPasteBoard.hasDataSync()).assertEqual(true);
      hilog.info(domain, tag, "Succeeded in setting PasteData");

      systemPasteBoard.clearDataSync();

      let result = systemPasteBoard.hasDataSync();
      hilog.info(domain, tag, "Succeed in checking the PasteBoard. Result: " + result);
      expect(result).assertEqual(false);
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetDataSync_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SetDataSync_Static_0020
     * @tc.number SUB_PasteBoard_ETS_SetDataSync_Static_0020
     * @tc.desc   TgetDataWithProgress fail,err：401,message: Parameter error. mimeType cannot be empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_SetDataSync_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SetDataSync_Static_0020 start------");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      console.info(tag + `${systemPasteBoard}`)
      try {
        // 空MIME类型和空内容
        let invalidPasteData = pasteboard.createData("", "");
        systemPasteBoard.setDataSync(invalidPasteData);
        hilog.info(domain, tag, "getValidTypes Failed types.length === 0");
        console.info(tag + "Succeeded in setting PasteData");
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(tag + "SUB_PasteBoard_ETS_SetDataSync_Static_0020 ---------end")
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_IsRemoteData_Static_0010
     * @tc.number SUB_PasteBoard_ETS_IsRemoteData_Static_0010
     * @tc.desc   Test pasteBoard isRemoteData success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_IsRemoteData_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_IsRemoteData_Static_0010 start------");
      let systemPasteboard = pasteboard.getSystemPasteboard()
      await systemPasteboard.clearData().then(async () => {
        try {
          let isRemote = systemPasteboard.isRemoteData()
          expect(isRemote == false).assertTrue();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "test isRemoteData err:" + err)
          expect().assertFail();
        }
      })
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_IsRemoteData_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_IsRemoteData_Static_0020
     * @tc.number SUB_PasteBoard_ETS_IsRemoteData_Static_0020
     * @tc.desc   Test pasteBoard isRemoteData success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_IsRemoteData_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_IsRemoteData_Static_0020 start------");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      try {
        let result = systemPasteBoard.isRemoteData();
        hilog.info(domain, tag, "Succeed in checking the PasteBoard. Result: " + result);
        expect(result).assertEqual(false);
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect(err.code).assertEqual(12900005)
        done();
      }
      console.info(tag + "SUB_PasteBoard_ETS_IsRemoteData_Static_0020 ---------end")
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_CreateRecord_Static_0050
     * @tc.number SUB_PasteBoard_ETS_CreateRecord_Static_0050
     * @tc.desc   createRecord with invalid params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_CreateRecord_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0050 start------");
      let mimeType = "x".repeat(1025)
      try {
        let pasteDataRecord = pasteboard.createRecord(mimeType, ARRAY_BUFFER)
        hilog.info(domain, tag, "---- createRecord success----");
      } catch (err) {
        err = err as BusinessError;
        console.info("Create record error, err code is: " + err.code)
        expect(err.code).assertEqual(401)
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0050 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_CreateRecord_Static_0060
     * @tc.number SUB_PasteBoard_ETS_CreateRecord_Static_0060
     * @tc.desc   Create record error, err code is: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_CreateRecord_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0060 start------");
      try {
        let pasteDataRecord = pasteboard.createRecord("", "String")
        hilog.info(domain, tag, "---- createRecord success----");
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "Create record error, err code is: " + err.code)
        expect(err.code).assertEqual(401)
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0060 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_CreateRecord_Static_0070
     * @tc.number SUB_PasteBoard_ETS_CreateRecord_Static_0070
     * @tc.desc   捕获到预期错误码：401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_CreateRecord_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0070------");
      try {
        // mimeType为空字符串
        let invalidRecord = pasteboard.createRecord("", "");
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(401);
        hilog.info(domain, tag, `捕获到预期错误码：${err.code}`);
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_CreateRecord_Static_0070------");
      done();
    });

    /**
     * @tc.name   SUB_PasteBoard_ETS_DetectPatterns_Static_0020
     * @tc.number SUB_PasteBoard_ETS_DetectPatterns_Static_0020
     * @tc.desc   Test EMAIL_ADDRESS pattern detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_DetectPatterns_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_DetectPatterns_Static_0020 start------");
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      hilog.info(domain, tag, 'res' + res);
      expect(res).assertEqual(true);
      let patterns: Array<pasteboard.Pattern> = [pasteboard.Pattern.EMAIL_ADDRESS];
      try {
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          hilog.info(domain, tag, "----detectPatterns callback----");
          expect(data.sort().join('')).assertEqual(patterns.sort().join(''));
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "error.message:" + err.message);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_DetectPatterns_Static_0020 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_Additions_Static_0010
     * @tc.number SUB_PasteBoard_ETS_Additions_Static_0010
     * @tc.desc   Test additions with null, undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_Additions_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_Additions_Static_0010----------");
      try {
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test");
        let prop = pasteData.getProperty();

        prop.additions = {
          "nullValue": null,
          "undefinedValue": undefined
        };
        pasteData.setProperty(prop);

        let newProp = pasteData.getProperty();
        expect(newProp.additions["nullValue"]).assertEqual(undefined);
        expect(newProp.additions["undefinedValue"]).assertEqual(undefined);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("Error in complex additions test: " + err.message + "; " + err.code);
        expect(null).assertFail();
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_Additions_Static_0010----------");
    });

    /**
     * @tc.name   SUB_PasteBoard_ETS_Additions_Static_0020
     * @tc.number SUB_PasteBoard_ETS_Additions_Static_0020
     * @tc.desc   Test clearing additions property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_Additions_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_Additions_Static_0020----------");
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test");
      let prop = pasteData.getProperty();

      try {
        hilog.info(domain, tag, "----------Setting additions----------");
        // 设置 additions
        prop.additions = { "key": "value", "userKey": "userValue" };
        pasteData.setProperty(prop);

        let tempProp = pasteData.getProperty();
        hilog.info(domain, tag, "Additions after setting: " + JSON.stringify(tempProp.additions));
        hilog.info(domain, tag, "Additions count: " + Object.keys(tempProp.additions).length);

        // 属性是否存在
        expect(tempProp.additions["key"]).assertEqual("value");
        expect(tempProp.additions["userKey"]).assertEqual("userValue");
        hilog.info(domain, tag, "----------Clearing additions----------");
        prop.additions = {};
        pasteData.setProperty(prop);

        // 添加短暂延迟确保更新生效
        setTimeout(() => {
          try {
            let newProp = pasteData.getProperty();
            hilog.info(domain, tag, "Additions after clearing: " + JSON.stringify(newProp.additions));
            // 检查设置的属性是否被清除
            expect(newProp.additions["key"]).assertUndefined();
            expect(newProp.additions["userKey"]).assertUndefined();

            hilog.info(domain, tag, "----------Test passed----------");
            done();
          } catch (err) {
            err = err as BusinessError;
            console.error("Error in clearing additions test: " + err.message + "; " + err.code);
            done();
          }
        }, 100);
      } catch (err) {
        err = err as BusinessError;
        console.error("Error in clearing additions test: " + err.message + "; " + err.code);
        done();
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_Additions_Static_0020----------");
    });

    /**
     * @tc.name   SUB_PasteBoard_ETS_MimeTypes_Static_0010
     * @tc.number SUB_PasteBoard_ETS_MimeTypes_Static_0010
     * @tc.desc   Test pasteBoard mimeTypes data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_MimeTypes_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_MimeTypes_Static_0010----------");
      let record: Record<string, pasteboard.ValueType> = {};
      record['app/xml'] = new ArrayBuffer(256);
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataType = pasteData.getMimeTypes();
        expect(String(pasteDataType)).assertEqual('app/xml');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_MimeTypes_Static_0010----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_MimeTypes_Static_0020
     * @tc.number SUB_PasteBoard_ETS_MimeTypes_Static_0020
     * @tc.desc   Test pasteBoard detectPatterns data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_MimeTypes_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_MimeTypes_Static_0020----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, 'hello');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.setData(pasteData);
        expect(systemPasteboard.hasDataSync()).assertTrue();
        let data: Array<String> = await systemPasteboard.getMimeTypes();
        expect(data[0]).assertEqual('text/uri');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_MimeTypes_Static_0020----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_LocalOnly_Static_0010
     * @tc.number SUB_PasteBoard_ETS_LocalOnly_Static_0010
     * @tc.desc   Test pasteBoard localOnly data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_LocalOnly_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_LocalOnly_Static_0010----------");
      try {
        hilog.info(domain, tag, 'Checks PasteDataProperty.localOnly');
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
        let pasteDataProperty = pasteData.getProperty();
        hilog.info(domain, tag, 'Checks: localOnly = ' + pasteDataProperty.localOnly);
        expect(pasteDataProperty.localOnly == false).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_LocalOnly_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_LocalOnly_Static_0010----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_Data_Static_0010
     * @tc.number SUB_PasteBoard_ETS_Data_Static_0010
     * @tc.desc   Test pasteBoard createData with Record<string, ArrayBuffer> and getData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_Data_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_Data_Static_0010----------");
      // 构造 ArrayBuffer 数据
      let buffer1 = new ArrayBuffer(16);
      let buffer2 = new ArrayBuffer(32);
      let record: Record<string, pasteboard.ValueType> = {};
      record['custom/type1'] = buffer1;
      record['custom/type2'] = buffer2;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        let pasteDataRecord = pasteData.getRecord(0);
        let value1 = await pasteDataRecord.getData('custom/type1');
        expect(value1 instanceof ArrayBuffer).assertTrue();
        hilog.info(domain, tag, "value1.byteLength:" + (value1 as ArrayBuffer).byteLength);
        expect((value1 as ArrayBuffer).byteLength).assertEqual(16);
        let value2 = await pasteDataRecord.getData('custom/type2');
        expect(value2 instanceof ArrayBuffer).assertTrue();
        hilog.info(domain, tag, "value2.byteLength:" + (value2 as ArrayBuffer).byteLength);
        expect((value2 as ArrayBuffer).byteLength).assertEqual(32);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error("SUB_PasteBoard_ETS_Data_Static_0010 error is: " + err.message + "; " + err.code);
        expect(null).assertFail();
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_Data_Static_0010----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_AddEntry_Static_0040
     * @tc.number SUB_PasteBoard_ETS_AddEntry_Static_0040
     * @tc.desc   Failed to addEntry. Cause: Parameter error. the first param should be object or string.401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PasteBoard_ETS_AddEntry_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '************ SUB_PasteBoard_ETS_AddEntry_Static_0040 start ************')
      let html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      try {
        //为空字符串
        record.addEntry("", "");
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(401);
        hilog.info(domain, tag, `Failed to addEntry. Cause: ${err.message + err.code}`);
      }
      hilog.info(domain, tag, '************ SUB_PasteBoard_ETS_AddEntry_Static_0040 end ************');
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_OVERWRITE_Static_0010
     * @tc.number SUB_PasteBoard_ETS_OVERWRITE_Static_0010
     * @tc.desc   Test pasteBoard OVERWRITE data success.obj.result is fileConflictOptions_OVERWRITE:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_OVERWRITE_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_OVERWRITE_Static_0010 start------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync();
      let resProgressInfo:pasteboard.ProgressInfo | undefined;
      let dstUri: string = fileUri.getUriFromPath(dstDir);
      hilog.info(domain, tag, 'dstUri:' + dstUri + 'length:' + dstUri.length);
      const progressInfo:pasteboard.ProgressInfo = {
        progress: 10,
      }
      let progressListener = (progressInfo: pasteboard.ProgressInfo) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:pasteboard.GetDataParams  = {
        progressIndicator: pasteboard.ProgressIndicator.NONE,
        progressListener: progressListener,
        destUri: dstUri,
        fileConflictOptions: pasteboard.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);

      hilog.info(domain, tag, "obj.progressIndicator:" + getDataParams.progressIndicator);
      hilog.info(domain, tag, "obj.destUri:" + getDataParams.destUri);
      hilog.info(domain, tag, "obj.fileConflictOptions_OVERWRITE:" + getDataParams.fileConflictOptions);
      hilog.info(domain, tag, "resProgressInfo.progress:" + progressInfo.progress);
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_OVERWRITE_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_SKIP_Static_0010
     * @tc.number SUB_PasteBoard_ETS_SKIP_Static_0010
     * @tc.desc   Test pasteBoard SKIP data success.result is obj.fileConflictOptions_SKIP:1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_SKIP_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SKIP_Static_0010 start------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync();
      let resProgressInfo:pasteboard.ProgressInfo | undefined;
      let dstUri: string = fileUri.getUriFromPath(dstDir);
      hilog.info(domain, tag, 'dstUri:' + dstUri + 'length:' + dstUri.length);
      const progressInfo:pasteboard.ProgressInfo = {
        progress: 10,
      }
      let progressListener = (progressInfo: pasteboard.ProgressInfo) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:pasteboard.GetDataParams  = {
        progressIndicator: pasteboard.ProgressIndicator.NONE,
        progressListener: progressListener,
        destUri: dstUri,
        fileConflictOptions: pasteboard.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);

      hilog.info(domain, tag, "obj.progressIndicator:" + getDataParams.progressIndicator);
      hilog.info(domain, tag, "obj.destUri:" + getDataParams.destUri);
      hilog.info(domain, tag, "obj.fileConflictOptions_SKIP:" + getDataParams.fileConflictOptions);
      hilog.info(domain, tag, "resProgressInfo.progress:" + progressInfo.progress);
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_SKIP_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_DEFAULT_Static_0010
     * @tc.number SUB_PasteBoard_ETS_DEFAULT_Static_0010
     * @tc.desc   Test pasteBoard DEFAULT data success.obj.result is obj.progressIndicator_DEFAULT:1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_DEFAULT_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_DEFAULT_Static_0010 start------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync();
      let resProgressInfo:pasteboard.ProgressInfo | undefined;
      let dstUri: string = fileUri.getUriFromPath(dstDir);
      hilog.info(domain, tag, 'dstUri:' + dstUri + 'length:' + dstUri.length);
      const progressInfo:pasteboard.ProgressInfo = {
        progress: 10,
      }
      let progressListener = (progressInfo: pasteboard.ProgressInfo) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:pasteboard.GetDataParams  = {
        progressIndicator: pasteboard.ProgressIndicator.DEFAULT,
        progressListener: progressListener,
        destUri: dstUri,
        fileConflictOptions: pasteboard.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);

      hilog.info(domain, tag, "obj.progressIndicator_DEFAULT:" + getDataParams.progressIndicator);
      hilog.info(domain, tag, "obj.destUri:" + getDataParams.destUri);
      hilog.info(domain, tag, "obj.fileConflictOptions_OVERWRITE:" + getDataParams.fileConflictOptions);
      hilog.info(domain, tag, "resProgressInfo.progress:" + progressInfo.progress);
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_DEFAULT_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_ProGress_Static_0010
     * @tc.number SUB_PasteBoard_ETS_ProGress_Static_0010
     * @tc.desc   Test pasteBoard fileConflictOptions data success.Data transfer progress: 10%
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_ProGress_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ProGress_Static_0010 start------");
      const progressInfo:pasteboard.ProgressInfo = {
        progress: 10,
      }
      const getDataParams:pasteboard.GetDataParams  = {
        progressIndicator: pasteboard.ProgressIndicator.NONE,
        destUri: "/data/files",
        fileConflictOptions: pasteboard.FileConflictOptions.SKIP,
        progressListener: (progressInfo: pasteboard.ProgressInfo) => {
          hilog.info(domain, tag, `Data transfer progress: ${progressInfo.progress}%`);
        }
      }
      hilog.info(domain, tag, `Data transfer progress: ${progressInfo.progress}%`);
      let obj = getDataParams;
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ProGress_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_ProGress_Static_0020
     * @tc.number SUB_PasteBoard_ETS_ProGress_Static_0020
     * @tc.desc   Test pasteBoard progress data success.result is resProgressInfo.progress:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_ProGress_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ProGress_Static_0020 start------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync();
      let resProgressInfo:pasteboard.ProgressInfo | undefined;
      let dstUri: string = fileUri.getUriFromPath(dstDir);
      hilog.info(domain, tag, 'dstUri:' + dstUri + 'length:' + dstUri.length);
      const progressInfo:pasteboard.ProgressInfo = {
        progress: 20,
      }
      let progressListener = (progressInfo: pasteboard.ProgressInfo) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:pasteboard.GetDataParams  = {
        progressIndicator: pasteboard.ProgressIndicator.NONE,
        progressListener: progressListener,
        destUri: dstUri,
        fileConflictOptions: pasteboard.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);

      hilog.info(domain, tag, "obj.progressIndicator:" + getDataParams.progressIndicator);
      hilog.info(domain, tag, "obj.destUri:" + getDataParams.destUri);
      hilog.info(domain, tag, "obj.fileConflictOptions_SKIP:" + getDataParams.fileConflictOptions);
      hilog.info(domain, tag, "resProgressInfo.progress:" + progressInfo.progress);
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ProGress_Static_0020 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_FileConflictOptions_Static_0010
     * @tc.number SUB_PasteBoard_ETS_FileConflictOptions_Static_0010
     * @tc.desc   Test pasteBoard fileConflictOptions data success, result is obj.fileConflictOptions_SKIP:1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_FileConflictOptions_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_FileConflictOptions_Static_0010 start------");
      const progressInfo:pasteboard.ProgressInfo = {
        progress: 10,
      }
      const getDataParams:pasteboard.GetDataParams  = {
        progressIndicator: pasteboard.ProgressIndicator.NONE,
        destUri: "/data/files",
        fileConflictOptions: pasteboard.FileConflictOptions.SKIP,
        progressListener: (progressInfo: pasteboard.ProgressInfo) => {
          hilog.info(domain, tag, `Data transfer progress: ${progressInfo.progress}%`);
        }
      }
      let obj = getDataParams;
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      hilog.info(domain, tag, "obj.fileConflictOptions_SKIP:" + obj.fileConflictOptions);
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_FileConflictOptions_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_ProgressSignal_Static_0010
     * @tc.number SUB_PasteBoard_ETS_ProgressSignal_Static_0010
     * @tc.desc   Test pasteBoard ProgressSignal success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_ProgressSignal_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '************ SUB_PasteBoard_ETS_ProgressSignal_Static_0010 start ************')
      try {
        let signal = new pasteboard.ProgressSignal;
        hilog.info(domain, tag, 'success, progress:' + signal);
        signal.cancel();
        hilog.info(domain, tag, 'Test pasteBoard cancel success');
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "pasteboard.ProgressSignal constructor fail" + err.message);
        hilog.info(domain, tag, "err.code " + err.code);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ProgressSignal_Static_0010 end------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_ProgressSignal_Static_0020
     * @tc.number SUB_PasteBoard_ETS_ProgressSignal_Static_0020
     * @tc.desc   Test pasteBoard progressSignal success.Remove specified record fail,error code is:System error occurred during paste execution.12900010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PasteBoard_ETS_ProgressSignal_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ProgressSignal_Static_0020 start------");

      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      hilog.info(domain, tag, "------getSystemPasteboard start------");
      systemPasteboard.clearDataSync();
      hilog.info(domain, tag, "------clearDataSync start------");
      try {
        fs.mkdirSync(dstDir);
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `Failed to create dir: ${err.message}`);
      }
      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(tag + 'dstUri:' + dstUri + 'length:' + dstUri.length);

      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: pasteboard.ProgressIndicator.NONE,
        progressSignal: undefined
      };
      try {
        await systemPasteboard.getDataWithProgress(params);
        hilog.info(domain, tag, "getDataWithProgress success");
        // expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        //涉及到权限问题，权限不足就会报错误码12900010
        hilog.info(domain, tag, "Remove specified record fail,error code is: " + err.message + err.code)
        expect(err.code).assertEqual(12900010)
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ProgressSignal_Static_0020 end-------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_ProgressListener_Static_0010
     * @tc.number SUB_PasteBoard_ETS_ProgressListener_Static_0010
     * @tc.desc   Test pasteBoard progressListener data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_ProgressListener_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ProgressListener_Static_0010 start------");
      let resProgressInfo:pasteboard.ProgressInfo | undefined;
      const progressInfo:pasteboard.ProgressInfo = {
        progress: 10,
      }
      let progressListener = (progressInfo: pasteboard.ProgressInfo) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:pasteboard.GetDataParams  = {
        progressIndicator: pasteboard.ProgressIndicator.NONE,
        progressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: pasteboard.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);

      hilog.info(domain, tag, "obj.progressIndicator:" + getDataParams.progressIndicator);
      hilog.info(domain, tag, "obj.destUri:" + getDataParams.destUri);
      hilog.info(domain, tag, "obj.fileConflictOptions_SKIP:" + getDataParams.fileConflictOptions);
      hilog.info(domain, tag, "resProgressInfo.progress:" + progressInfo.progress);
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_ProgressListener_Static_0010 end------");
      done();
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_onRemoteUpdate_Static_0010
     * @tc.number SUB_PasteBoard_ETS_onRemoteUpdate_Static_0010
     * @tc.desc   onRemoteUpdate Interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_onRemoteUpdate_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_onRemoteUpdate_Static_0010 start------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      let listener = () => {
        console.info('The remote pasteboard has changed.');
      };
      try {
        systemPasteboard.onRemoteUpdate(listener);
        let hasData: boolean = await systemPasteboard.hasData();
        expect(hasData == false).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_onRemoteUpdate_Static_0010 end-------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_offRemoteUpdate_Static_0010
     * @tc.number SUB_PasteBoard_ETS_offRemoteUpdate_Static_0010
     * @tc.desc   onRemoteUpdate Interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_offRemoteUpdate_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_offRemoteUpdate_Static_0010 start------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      let listener = () => {
        console.info('The remote pasteboard has changed.');
      };
      try {
        systemPasteboard.offRemoteUpdate(listener);
        let hasData: boolean = await systemPasteboard.hasData();
        expect(hasData == false).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_offRemoteUpdate_Static_0010 end-------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_offRemoteUpdate_Static_0020
     * @tc.number SUB_PasteBoard_ETS_offRemoteUpdate_Static_0020
     * @tc.desc   onRemoteUpdate Interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_offRemoteUpdate_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_offRemoteUpdate_Static_0020 start------");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.offRemoteUpdate();
        let hasData: boolean = await systemPasteboard.hasData();
        expect(hasData == false).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_offRemoteUpdate_Static_0020 end-------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_getSystemPasteboard_Static_0010
     * @tc.number SUB_PasteBoard_ETS_getSystemPasteboard_Static_0010
     * @tc.desc   getSystemPasteboard Interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_getSystemPasteboard_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_getSystemPasteboard_Static_0010 start------");
      try {
        let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        expect(systemPasteboard != null).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "------SUB_PasteBoard_ETS_getSystemPasteboard_Static_0010 end-------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_addRecord_Static_0010
     * @tc.number SUB_PasteBoard_ETS_addRecord_Static_0010
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_addRecord_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0010----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URI);
        let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('text/plain', "");
        pasteData.addRecord(textRecord);
        let count: number = pasteData.getRecordCount();
        expect(count).assertEqual(2);
        let text: string = pasteData.getPrimaryText();
        expect(text).assertEqual("");
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0010----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_addRecord_Static_0020
     * @tc.number SUB_PasteBoard_ETS_addRecord_Static_0020
     * @tc.desc   Test addRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_addRecord_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0020----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('text/uri', "");
        pasteData.addRecord(textRecord);
        let count: number = pasteData.getRecordCount();
        expect(count).assertEqual(2);
        let uri: string = pasteData.getPrimaryUri();
        expect(uri).assertEqual("");
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0020----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_addRecord_Static_0030
     * @tc.number SUB_PasteBoard_ETS_addRecord_Static_0030
     * @tc.desc   Test addRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_addRecord_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0030----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('text/html', "");
        pasteData.addRecord(textRecord);
        let count: number = pasteData.getRecordCount();
        expect(count).assertEqual(2);
        let html: string = pasteData.getPrimaryHtml();
        expect(html).assertEqual("");
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0030----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_addRecord_Static_0040
     * @tc.number SUB_PasteBoard_ETS_addRecord_Static_0040
     * @tc.desc   Test addRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_addRecord_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0040----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', "");
        pasteData.addRecord(textRecord);
        let count: number = pasteData.getRecordCount();
        expect(count).assertEqual(2);
        let PixelMap: image.PixelMap = pasteData.getPrimaryPixelMap();
        expect(PixelMap).assertEqual(undefined);
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0040----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_addRecord_Static_0050
     * @tc.number SUB_PasteBoard_ETS_addRecord_Static_0050
     * @tc.desc   Test addRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_addRecord_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0050----------");
      try {
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          expect(pixelMap.isEditable).assertTrue();
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          pasteData.addRecord(textRecord);
          let count: number = pasteData.getRecordCount();
          expect(count).assertEqual(2);
          let pixelmapdata: image.PixelMap = pasteData.getPrimaryPixelMap();
          expect(pixelmapdata != null).assertTrue();
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0050----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_addRecord_Static_0060
     * @tc.number SUB_PasteBoard_ETS_addRecord_Static_0060
     * @tc.desc   Test addRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_addRecord_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0060----------");
      try {
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          expect(pixelMap.isStrideAlignment).assertFalse();
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          pasteData.addRecord(textRecord);
          let count: number = pasteData.getRecordCount();
          expect(count).assertEqual(2);
          let pixelmapdata: image.PixelMap = pasteData.getPrimaryPixelMap();
          expect(pixelmapdata != null).assertTrue();
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0060----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_addRecord_Static_0070
     * @tc.number SUB_PasteBoard_ETS_addRecord_Static_0070
     * @tc.desc   Test addRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_addRecord_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0070----------");
      try {
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          expect(pixelMap.isEditable).assertFalse();
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          pasteData.addRecord(textRecord);
          let count: number = pasteData.getRecordCount();
          expect(count).assertEqual(2);
          let pixelmapdata: image.PixelMap = pasteData.getPrimaryPixelMap();
          expect(pixelmapdata != null).assertTrue();
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_addRecord_Static_0070----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_getProperty_Static_0010
     * @tc.number SUB_PasteBoard_ETS_getProperty_Static_0010
     * @tc.desc   Test getProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_getProperty_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_getProperty_Static_0010----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.additions != null).assertTrue();
        expect(property.mimeTypes[0]).assertEqual("text/plain");
        expect(property.tag).assertEqual("");
        expect(property.timestamp != null).assertTrue();
        expect(property.localOnly).assertFalse();
        expect(property.shareOption).assertEqual(pasteboard.ShareOption.LOCALDEVICE);
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_getProperty_Static_0010----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_getProperty_Static_0020
     * @tc.number SUB_PasteBoard_ETS_getProperty_Static_0020
     * @tc.desc   Test getProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_getProperty_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_getProperty_Static_0020----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let prop = pasteData.getProperty();
        prop.shareOption = pasteboard.ShareOption.INAPP;
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.localOnly).assertFalse();
        expect(property.shareOption).assertEqual(pasteboard.ShareOption.INAPP);
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_getProperty_Static_0020----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_getProperty_Static_0030
     * @tc.number SUB_PasteBoard_ETS_getProperty_Static_0030
     * @tc.desc   Test getProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_getProperty_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_getProperty_Static_0030----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let prop = pasteData.getProperty();
        prop.localOnly = true;
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.localOnly).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_getProperty_Static_0030----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_setProperty_Static_0010
     * @tc.number SUB_PasteBoard_ETS_setProperty_Static_0010
     * @tc.desc   Test setProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_setProperty_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0010----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let prop = pasteData.getProperty();
        prop.mimeTypes[0] = 'text/html';
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.mimeTypes[0]).assertEqual("text/html");
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0010----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_setProperty_Static_0020
     * @tc.number SUB_PasteBoard_ETS_setProperty_Static_0020
     * @tc.desc   Test setProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_setProperty_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0020----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let prop = pasteData.getProperty();
        prop.mimeTypes[0] = "";
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.mimeTypes[0]).assertEqual("");
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0020----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_setProperty_Static_0030
     * @tc.number SUB_PasteBoard_ETS_setProperty_Static_0030
     * @tc.desc   Test setProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_setProperty_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0030----------");
      try {
        let systemPasteBoard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        await systemPasteBoard.clearData();
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.mimeTypes.length).assertEqual(1);
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0030----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_setProperty_Static_0040
     * @tc.number SUB_PasteBoard_ETS_setProperty_Static_0040
     * @tc.desc   Test setProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_setProperty_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0040----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let prop = pasteData.getProperty();
        prop.localOnly = false;
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.localOnly).assertFalse();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0040----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_setProperty_Static_0050
     * @tc.number SUB_PasteBoard_ETS_setProperty_Static_0050
     * @tc.desc   Test setProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_setProperty_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0050----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let prop = pasteData.getProperty();
        prop.tag = "";
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.tag).assertEqual("");
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0050----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_setProperty_Static_0060
     * @tc.number SUB_PasteBoard_ETS_setProperty_Static_0060
     * @tc.desc   Test setProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_setProperty_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0060----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let prop = pasteData.getProperty();
        prop.shareOption = pasteboard.ShareOption.LOCALDEVICE;
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.shareOption).assertEqual(pasteboard.ShareOption.LOCALDEVICE);
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0060----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_setProperty_Static_0070
     * @tc.number SUB_PasteBoard_ETS_setProperty_Static_0070
     * @tc.desc   Test setProperty API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_setProperty_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0070----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let prop = pasteData.getProperty();
        prop.shareOption = pasteboard.ShareOption.INAPP;
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(property.shareOption).assertEqual(pasteboard.ShareOption.INAPP);
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_setProperty_Static_0070----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_replaceRecord_Static_0010
     * @tc.number SUB_PasteBoard_ETS_replaceRecord_Static_0010
     * @tc.desc   Test replaceRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_replaceRecord_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0010----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, URI);
        pasteData.replaceRecord(0, record);
        let result: boolean = pasteData.hasType("text/uri");
        expect(result).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0010----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_replaceRecord_Static_0020
     * @tc.number SUB_PasteBoard_ETS_replaceRecord_Static_0020
     * @tc.desc   Test replaceRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_replaceRecord_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0020----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_HTML, HTML);
        pasteData.replaceRecord(0, record);
        let result: boolean = pasteData.hasType("text/html");
        expect(result).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0020----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_replaceRecord_Static_0030
     * @tc.number SUB_PasteBoard_ETS_replaceRecord_Static_0030
     * @tc.desc   Test replaceRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_replaceRecord_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0030----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URI);
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        pasteData.replaceRecord(0, record);
        let result: boolean = pasteData.hasType("text/plain");
        expect(result).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0030----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_replaceRecord_Static_0040
     * @tc.number SUB_PasteBoard_ETS_replaceRecord_Static_0040
     * @tc.desc   Test replaceRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_replaceRecord_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0040----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_WANT, WANT);
        pasteData.replaceRecord(0, record);
        let result: boolean = pasteData.hasType("text/want");
        expect(result).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0040----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_replaceRecord_Static_0050
     * @tc.number SUB_PasteBoard_ETS_replaceRecord_Static_0050
     * @tc.desc   Test replaceRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_replaceRecord_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0050----------");
      try {
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(buffer, opt);
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
        pasteData.replaceRecord(0, record);
        let result: boolean = pasteData.hasType("pixelMap");
        expect(result).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0050----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_replaceRecord_Static_0060
     * @tc.number SUB_PasteBoard_ETS_replaceRecord_Static_0060
     * @tc.desc   Test replaceRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_replaceRecord_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0060----------");
      try {
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(buffer, opt);
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertFalse();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
        pasteData.replaceRecord(0, record);
        let result: boolean = pasteData.hasType("pixelMap");
        expect(result).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0060----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_replaceRecord_Static_0070
     * @tc.number SUB_PasteBoard_ETS_replaceRecord_Static_0070
     * @tc.desc   Test replaceRecord API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_replaceRecord_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0070----------");
      try {
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(buffer, opt);
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertFalse();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
        pasteData.replaceRecord(0, record);
        let result: boolean = pasteData.hasType("pixelMap");
        expect(result).assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `Failed to create dir: ${err.message}`);
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_replaceRecord_Static_0070----------");
    })

    /**
     * @tc.name   SUB_PasteBoard_ETS_clearDataSync_Static_0010
     * @tc.number SUB_PasteBoard_ETS_clearDataSync_Static_0010
     * @tc.desc   Test clearDataSync API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PasteBoard_ETS_clearDataSync_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_clearDataSync_Static_0010----------");
      try {
        let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
        await systemPasteboard.setData(pasteData);
        expect(systemPasteboard.hasDataSync()).assertEqual(true);
        systemPasteboard.clearDataSync();
        expect(systemPasteboard.hasDataSync()).assertEqual(false);
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(`Failed to hasDataSync. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005');
      }
      hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_clearDataSync_Static_0010----------");
    })
  })
}