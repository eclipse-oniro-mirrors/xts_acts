/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import pasteboard from '@ohos.pasteboard';
import { BusinessError } from "@ohos.base"

let domain: int = 0x0000;
let tag: string = 'testTag';
const HTMLTEXT = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" +
           "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" +
           "    <p></p>\n" + "</body>\n" + "</html>";
const ARRAY_BUFFER = new ArrayBuffer(256);

export default function pasteboardParametersTest() {
  describe("pasteboardParametersTest", (): void => {
    console.info("----------SUB_Pasteboard_Local_Parameters_Static_SpecCheck_Complete----------");

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0020
     * @tc.number PasteboardParametersTest_0020
     * @tc.desc   Test createData with missing or empty mimeType parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0020----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("", ARRAY_BUFFER);
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code === 401).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0020----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0030
     * @tc.number PasteboardParametersTest_0030
     * @tc.desc   Test createRecord with missing or empty mimeType parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0030----------");
      let catchFlag: boolean = false;
      try {
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("", ARRAY_BUFFER);
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code === 401).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0030----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0040
     * @tc.number PasteboardParametersTest_0040
     * @tc.desc   Test addEntry with missing or empty type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0040----------");
      let catchFlag: boolean = false;
      try {
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("text/plain", "hello");
        record.addEntry("", ARRAY_BUFFER);
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code === 401).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0040----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0050
     * @tc.number PasteboardParametersTest_0050
     * @tc.desc   Test getData with missing or empty type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0050----------");
      let catchFlag: boolean = false;
      try {
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("text/plain", "hello");
        record.getData('').then((value: pasteboard.ValueType) => {
          let textPlainContent = value as string;
          console.info(domain, tag, 'Success to get text/plain value. value is: ' + textPlainContent);
          expect(textPlainContent != null).assertTrue();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code === 401).assertTrue();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0050----------end");
      done();
    })
    
    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0060
     * @tc.number PasteboardParametersTest_0060
     * @tc.desc   Test addRecord with record having empty htmlText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0060----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("text/html", "");
        pasteData.addRecord(record);
        let hasType: boolean = pasteData.hasType("text/html");
        expect(hasType).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0060----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0070
     * @tc.number PasteboardParametersTest_0070
     * @tc.desc   Test addRecord with record having empty plainText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0070----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/html", HTMLTEXT);
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("text/plain", "");
        pasteData.addRecord(record);
        let hasType: boolean = pasteData.hasType("text/plain");
        expect(hasType).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0070----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0080
     * @tc.number PasteboardParametersTest_0080
     * @tc.desc   Test addRecord with record having empty uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0080----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("text/uri", "");
        pasteData.addRecord(record);
        let hasType: boolean = pasteData.hasType("text/uri");
        expect(hasType).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0080----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0090
     * @tc.number PasteboardParametersTest_0090
     * @tc.desc   Test addRecord with record having empty mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0090----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("", "hello");
        pasteData.addRecord(record);
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code === 401).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0090----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0100
     * @tc.number PasteboardParametersTest_0100
     * @tc.desc   Test addRecord with missing or empty mimeType parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0100----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        pasteData.addRecord("", ARRAY_BUFFER);
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code === 401).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0100----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0110
     * @tc.number PasteboardParametersTest_0110
     * @tc.desc   Test setProperty with property mimeTypes array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0110----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(prop.mimeTypes != null).assertTrue();
        expect(Array.isArray(prop.mimeTypes)).assertTrue();
        expect(prop.mimeTypes.length > 0).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0110----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0120
     * @tc.number PasteboardParametersTest_0120
     * @tc.desc   Test setProperty with missing or empty tag string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0120----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        prop.tag = "";
        pasteData.setProperty(prop);
        let newProp: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(newProp.tag === "").assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0120----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0130
     * @tc.number PasteboardParametersTest_0130
     * @tc.desc   Test setProperty with localOnly true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0130----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        prop.localOnly = true;
        pasteData.setProperty(prop);
        let newProp: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(newProp.localOnly === true).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0130----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0140
     * @tc.number PasteboardParametersTest_0140
     * @tc.desc   Test setProperty with localOnly false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0140----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        prop.localOnly = false;
        pasteData.setProperty(prop);
        let newProp: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(newProp.localOnly === false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0140----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0150
     * @tc.number PasteboardParametersTest_0150
     * @tc.desc   Test setProperty with shareOption enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0150----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        prop.shareOption = pasteboard.ShareOption.INAPP;
        pasteData.setProperty(prop);
        let newProp: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(newProp.shareOption === pasteboard.ShareOption.INAPP).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0150----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0160
     * @tc.number PasteboardParametersTest_0160
     * @tc.desc   Test hasType with missing or empty mimeType parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0160----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let hasType: boolean = pasteData.hasType("");
        expect(hasType).assertFalse();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0160----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0170
     * @tc.number PasteboardParametersTest_0170
     * @tc.desc   Test replaceRecord with record having empty htmlText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0170----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("text/html", "");
        pasteData.replaceRecord(0, record);
        let hasType: boolean = pasteData.hasType("text/html");
        expect(hasType).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0170----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0180
     * @tc.number PasteboardParametersTest_0180
     * @tc.desc   Test replaceRecord with record having empty plainText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0180----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/html", HTMLTEXT);
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("text/plain", "");
        pasteData.replaceRecord(0, record);
        let hasType: boolean = pasteData.hasType("text/plain");
        expect(hasType).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0180----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0190
     * @tc.number PasteboardParametersTest_0190
     * @tc.desc   Test replaceRecord with record having empty uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0190----------");
      let catchFlag: boolean = false;
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("text/plain", "hello");
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord("text/uri", "");
        pasteData.replaceRecord(0, record);
        let hasType: boolean = pasteData.hasType("text/uri");
        expect(hasType).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0190----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0200
     * @tc.number PasteboardParametersTest_0200
     * @tc.desc   Test hasDataType with missing or empty mimeType parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0200----------");
      let catchFlag: boolean = false;
      try {
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        systemPb.hasDataType("");
        let hasdata: boolean = systemPb.hasDataType("");
        expect(hasdata).assertFalse();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0200----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Parameters_Static_0210
     * @tc.number PasteboardParametersTest_0210
     * @tc.desc   Test detectPatterns with missing or empty patterns array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Parameters_Static_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0210----------");
      try {
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        await systemPb.setData(pasteData);
        let patterns: pasteboard.Pattern[] = [];
        let detectedPatterns: pasteboard.Pattern[] = await systemPb.detectPatterns(patterns);
        expect(detectedPatterns != null).assertTrue();
        expect(Array.isArray(detectedPatterns)).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Parameters_Static_0210----------end");
      done();
    })
    console.info("----------SUB_Pasteboard_Local_Parameters_Static_SpecCheck_Complete----------");
  })
}
