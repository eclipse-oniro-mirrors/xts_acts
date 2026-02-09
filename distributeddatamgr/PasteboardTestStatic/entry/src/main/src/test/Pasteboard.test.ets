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

import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import pasteboard from '@ohos.pasteboard';
import Want from "@ohos.app.ability.Want";
import image from "@ohos.multimedia.image";
import { BusinessError } from "@ohos.base"

let domain: int = 0x0000; // The log tag 0x0000 acts as the business ID for the test framework.
// The log identifier string is used as a tag to identify the test behavior under the current runner class.
let tag: string = 'testTag';
let error = undefined;
const HTMLTEXT = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" +
           "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" +
           "    <p></p>\n" + "</body>\n" + "</html>";
const ARRAY_BUFFER = new ArrayBuffer(256);
const OBJECTWANT: Want = {
  bundleName: "com.example.aafwk.test",
  abilityName: "com.example.aafwk.test.TwoAbility"
};
const OPTS: image.InitializationOptions = {
  size:  { height: 480, width: 360},
  editable: true,
};

export default function pasteBoardTest() {
  describe("pasteBoardTest", (): void => {
    console.info("----------SUB_Pasteboard_Local_Pasteboard_Static----------");

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0010
     * @tc.number Pasteboard_test_0010
     * @tc.desc   Test pasteBoard add record fail with 1025 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0010----------");
      hilog.info(domain, tag, "x".repeat(1025));
      let pasteData: pasteboard.PasteData = pasteboard.createData("string", ARRAY_BUFFER);
      let catchFlag: boolean = false;
      try {
        pasteData.addRecord("x".repeat(1025), ARRAY_BUFFER);
        expect().assertFail();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, "Add record success");
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0010----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0020
     * @tc.number Pasteboard_test_0020
     * @tc.desc   Test pasteBoard add 613th record successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0020----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData("string", ARRAY_BUFFER);
      for (let i: number = 0; i < 998; i++) {
        pasteData.addRecord("stringRecord" + i, ARRAY_BUFFER);
      }
      try {
        pasteData.addRecord("stringRecord1000", ARRAY_BUFFER);
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect(err != undefined).assertFail();
      }
      let count: number = pasteData.getRecordCount();
      hilog.info(domain, tag, 'RecordCount is: %{public}d', count);
      expect(count == 1000).assertTrue();
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0020----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0030
     * @tc.number Pasteboard_test_0030
     * @tc.desc   Test pasteBoard SetProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0030----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData("string", ARRAY_BUFFER);
      try {
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        prop.shareOption = pasteboard.ShareOption.INAPP;
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(pasteboard.ShareOption.INAPP).assertEqual(property.shareOption);
      } catch (err: BusinessError) {
          console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0030----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0040
     * @tc.number Pasteboard_test_0040
     * @tc.desc   Get specified record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0040----------");
      try {
        let uri = "file:///C:/Users/username/Documents/report.pdf";
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri);
        expect(pasteData.getRecord(0).uri).assertEqual(uri);
      } catch (err: BusinessError) {
          console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0040----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0050
     * @tc.number Pasteboard_test_0050
     * @tc.desc   Get specified record failed,index out of range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0050----------");
      let catchFlag: boolean = false;
      let pasteData: pasteboard.PasteData = pasteboard.createData("arraybuffer", ARRAY_BUFFER);
      try {
        pasteData.getRecord(1);
        expect().assertFail();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code == 12900001).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0050----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0060
     * @tc.number Pasteboard_test_0060
     * @tc.desc   Test pasteBoard create data fail with 1025 bytes mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0060----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("x".repeat(1025), ARRAY_BUFFER);
        expect().assertFail();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, "CreateData success");
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0060----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0070
     * @tc.number Pasteboard_test_0070
     * @tc.desc   Test pasteBoard create data fail with 0 bytes mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0070----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("", ARRAY_BUFFER);
        expect().assertFail();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, "CreateData success");
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0070----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0080
     * @tc.number Pasteboard_test_0080
     * @tc.desc   Test pasteBoard create data success with self defined type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0080----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData('selfdefined', ARRAY_BUFFER);
        let count: number = pasteData.getRecordCount();
        expect(count).assertEqual(1);
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0080----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0090
     * @tc.number Pasteboard_test_0090
     * @tc.desc   Test pasteBoard create data success with uri type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0090----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf");
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0090----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0100
     * @tc.number Pasteboard_test_01000
     * @tc.desc   Test pasteBoard create data success with pasteboard.MIMETYPE_TEXT_PLAIN type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0100----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0100----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0110
     * @tc.number Pasteboard_test_0110
     * @tc.desc   Test pasteBoard create data success with pasteboard.MIMETYPE_TEXT_HTML type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0110----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0110----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0120
     * @tc.number Pasteboard_test_0120
     * @tc.desc   Test pasteBoard create data success with pasteboard.MIMETYPE_TEXT_WANT type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0120----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData('text/want', OBJECTWANT);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0120----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0130
     * @tc.number Pasteboard_test_0130
     * @tc.desc   Test pasteBoard create data success with pasteboard.MIMETYPE_PIXELMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0130----------");
      const pixelMap = image.createPixelMapSync(OPTS);
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData('pixelMap', pixelMap);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0130----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0140
     * @tc.number Pasteboard_test_0140
     * @tc.desc   Test pasteBoard create data success with record<> parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0140----------");
      const pixelMap = image.createPixelMapSync(OPTS);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = HTMLTEXT;
      record['selfdefined'] = ARRAY_BUFFER;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0140----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0150
     * @tc.number Pasteboard_test_0150
     * @tc.desc   Test pasteBoard create data fail with record<> parameter, length of self defined type is more than 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0150----------");
      const pixelMap = image.createPixelMapSync(OPTS);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = HTMLTEXT;
      record["x".repeat(1025)] = ARRAY_BUFFER;
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        expect().assertFail();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, "CreateData success");
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0150----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0160
     * @tc.number Pasteboard_test_0160
     * @tc.desc   Test pasteBoard create data fail with record<> parameter, length of self defined type is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0160----------");
      const pixelMap = image.createPixelMapSync(OPTS);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = HTMLTEXT;
      record[''] = ARRAY_BUFFER;
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        expect().assertFail();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, "CreateData success");
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0160----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0170
     * @tc.number Pasteboard_test_0170
     * @tc.desc   Test pasteBoard create data fail with record<> parameter, length of self defined type is 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0170----------");
      const pixelMap = image.createPixelMapSync(OPTS);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = HTMLTEXT;
      record["x".repeat(1023)] = ARRAY_BUFFER;
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(record);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0170----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0180
     * @tc.number Pasteboard_test_0180
     * @tc.desc   Test pasteBoard create data fail with record<> parameter, length of self defined type is 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0180----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("x".repeat(1023), ARRAY_BUFFER);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0180----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0190
     * @tc.number Pasteboard_test_0190
     * @tc.desc   Test pasteBoard add record fail with empty mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0190----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf")
      try {
        pasteData.addRecord('', ARRAY_BUFFER);
        expect().assertFail();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect(err.code == 401).assertTrue();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0190----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0200
     * @tc.number Pasteboard_test_0200
     * @tc.desc   Test pasteBoard add record success with all kinds of type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0200----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf")
      const pixelMap = image.createPixelMapSync(OPTS);
      try {
        pasteData.addRecord('selfdefined', ARRAY_BUFFER);
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf");
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
        let count: number = pasteData.getRecordCount();
        expect(count == 5).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0200----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0210
     * @tc.number Pasteboard_test_0210
     * @tc.desc   Test pasteBoard add record success with pastedataRecord parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0210----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf")
      const pixelMap = image.createPixelMapSync(OPTS);
      let record = pasteData.getRecord(0);
      try {
        pasteData.addRecord(record);
        let count: number = pasteData.getRecordCount();
        expect(count == 2).assertTrue();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0210----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0220
     * @tc.number Pasteboard_test_0220
     * @tc.desc   Test pasteBoard add record fail with empty mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0220----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf");
      try {
        pasteData.addRecord('x'.repeat(1023), ARRAY_BUFFER);
        expect(pasteData.getRecordCount()).assertEqual(2);
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0220----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0230
     * @tc.number Pasteboard_test_0230
     * @tc.desc   Get specified record failed,index out of range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0230----------");
      let catchFlag: boolean = false;
      let pasteData: pasteboard.PasteData = pasteboard.createData("arraybuffer", ARRAY_BUFFER);
      try {
        pasteData.getRecord(-1);
        expect().assertFail();
      } catch (err: BusinessError) {
        console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code == 12900001).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0230----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Pasteboard_Static_0240
     * @tc.number Pasteboard_test_0240
     * @tc.desc   Test pasteBoard SetProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Pasteboard_Static_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0240----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData("string", ARRAY_BUFFER);
      try {
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        prop.shareOption = pasteboard.ShareOption.LOCALDEVICE;
        pasteData.setProperty(prop);
        let property: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(pasteboard.ShareOption.LOCALDEVICE).assertEqual(property.shareOption);
      } catch (err: BusinessError) {
          console.error("SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Pasteboard_Static_0240----------end");
      done();
    })
    console.info("----------SUB_Pasteboard_Local_Pasteboard_Static----------");
  })
}