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
import image from "@ohos.multimedia.image";
import { BusinessError, RecordData } from "@ohos.base"

let domain: int = 0x0000;
let tag: string = 'testTag';
const HTMLTEXT = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" +
           "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" +
           "    <p></p>\n" + "</body>\n" + "</html>";
const ARRAY_BUFFER = new ArrayBuffer(256);

const OPTS: image.InitializationOptions = {
  size:  { height: 480, width: 360},
  editable: true,
};

export default function pasteboardReturnTest() {
  describe("pasteboardReturnTest", (): void => {
    console.info("----------SUB_Pasteboard_Local_Pasteboard_Static_Coverage----------");

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0010
     * @tc.number PasteboardReturnTest_0010
     * @tc.desc   Test getMimeTypes with empty array scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0010----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let mimeTypes: string[] = pasteData.getMimeTypes();
        expect(mimeTypes != null).assertTrue();
        expect(mimeTypes.length > 0).assertTrue();
        expect(Array.isArray(mimeTypes)).assertTrue();
        expect(mimeTypes[0] === "string").assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0010----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0020
     * @tc.number PasteboardReturnTest_0020
     * @tc.desc   Test getMimeTypes with multiple types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0020----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_URI, "file:///test.txt");
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
        let mimeTypes: string[] = pasteData.getMimeTypes();
        expect(mimeTypes != null).assertTrue();
        expect(mimeTypes.length === 3).assertTrue();
        expect(mimeTypes.includes(pasteboard.MIMETYPE_TEXT_PLAIN)).assertTrue();
        expect(mimeTypes.includes(pasteboard.MIMETYPE_TEXT_URI)).assertTrue();
        expect(mimeTypes.includes(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0020----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0030
     * @tc.number PasteboardReturnTest_0030
     * @tc.desc   Test getPrimaryPixelMap with isEditable property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0030----------");
      try {
        const pixelMap = image.createPixelMapSync(OPTS);
        let pasteData: pasteboard.PasteData = pasteboard.createData('pixelMap', pixelMap);
        let resultPixelMap: image.PixelMap = pasteData.getPrimaryPixelMap();
        expect(resultPixelMap != null).assertTrue();
        expect(typeof resultPixelMap.isEditable === 'boolean').assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0030----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0040
     * @tc.number PasteboardReturnTest_0040
     * @tc.desc   Test getPrimaryPixelMap with isStrideAlignment property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0040----------");
      try {
        const pixelMap = image.createPixelMapSync(OPTS);
        let pasteData: pasteboard.PasteData = pasteboard.createData('pixelMap', pixelMap);
        let resultPixelMap: image.PixelMap = pasteData.getPrimaryPixelMap();
        expect(resultPixelMap != null).assertTrue();
        expect(typeof resultPixelMap.isStrideAlignment === 'boolean').assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0040----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0050
     * @tc.number PasteboardReturnTest_0050
     * @tc.desc   Test getProperty with additions property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0050----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(prop != null).assertTrue();
        expect(prop.additions != null).assertTrue();
        expect(typeof prop.additions === 'object').assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0050----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0060
     * @tc.number PasteboardReturnTest_0060
     * @tc.desc   Test getProperty additions is empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0060----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(prop != null).assertTrue();
        expect(prop.additions != null).assertTrue();
        let additionsLength: number = Object.keys(prop.additions).length;
        expect(additionsLength !== 0).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0060----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0070
     * @tc.number PasteboardReturnTest_0070
     * @tc.desc   Test getProperty with custom additions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0070----------");
      try {
        let adConfigData: Record<string, RecordData> = {
          'value': 'test'
        }
        let pJson: Record<string, RecordData> = {
          'customKey': adConfigData
        }
        let pasteData: pasteboard.PasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        prop.additions = pJson;
        pasteData.setProperty(prop);
        let newProp: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(newProp.additions != null).assertTrue();
        expect(newProp.additions['customKey'] != null).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0070----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0080
     * @tc.number PasteboardReturnTest_0080
     * @tc.desc   Test getRecord with negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0080----------");
      let catchFlag: boolean = false;
      let pasteData: pasteboard.PasteData = pasteboard.createData("arraybuffer", ARRAY_BUFFER);
      try {
        pasteData.getRecord(-1);
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code === 12900001).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0080----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0090
     * @tc.number PasteboardReturnTest_0090
     * @tc.desc   Test getRecord with large positive index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0090----------");
      let catchFlag: boolean = false;
      let pasteData: pasteboard.PasteData = pasteboard.createData("arraybuffer", ARRAY_BUFFER);
      try {
        pasteData.getRecord(9999);
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        catchFlag = true;
        expect(err.code === 12900001).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0090----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0100
     * @tc.number PasteboardReturnTest_0100
     * @tc.desc   Test getRecord with zero index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0100----------");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData("arraybuffer", ARRAY_BUFFER);
        let record: pasteboard.PasteDataRecord = pasteData.getRecord(0);
        expect(record != null).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0100----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0110
     * @tc.number PasteboardReturnTest_0110
     * @tc.desc   Test isRemoteData returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0110----------");
      try {
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        await systemPb.setData(pasteData);
        let isRemote: boolean = systemPb.isRemoteData();
        expect(typeof isRemote === 'boolean').assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0110----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0120
     * @tc.number PasteboardReturnTest_0120
     * @tc.desc   Test isRemoteData returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0120----------");
      try {
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        await systemPb.clearData();
        let isRemote: boolean = systemPb.isRemoteData();
        expect(typeof isRemote === 'boolean').assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0120----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0130
     * @tc.number PasteboardReturnTest_0130
     * @tc.desc   Test detectPatterns with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0130----------");
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
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0130----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0140
     * @tc.number PasteboardReturnTest_0140
     * @tc.desc   Test detectPatterns returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0140----------");
      try {
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "not a url or email");
        await systemPb.setData(pasteData);
        let patterns: pasteboard.Pattern[] = [pasteboard.Pattern.URL, pasteboard.Pattern.EMAIL_ADDRESS];
        let detectedPatterns: pasteboard.Pattern[] = await systemPb.detectPatterns(patterns);
        expect(detectedPatterns != null).assertTrue();
        expect(Array.isArray(detectedPatterns)).assertTrue();
        expect(detectedPatterns.length === 0).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0140----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0150
     * @tc.number PasteboardReturnTest_0150
     * @tc.desc   Test detectPatterns with URL pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0150----------");
      try {
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "https://www.example.com");
        await systemPb.setData(pasteData);
        let patterns: pasteboard.Pattern[] = [pasteboard.Pattern.URL];
        let detectedPatterns: pasteboard.Pattern[] = await systemPb.detectPatterns(patterns);
        expect(detectedPatterns != null).assertTrue();
        expect(Array.isArray(detectedPatterns)).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0150----------end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_Return_Static_0160
     * @tc.number PasteboardReturnTest_0160
     * @tc.desc   Test detectPatterns with multiple patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_Return_Static_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0160----------");
      try {
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test@example.com");
        await systemPb.setData(pasteData);
        let patterns: pasteboard.Pattern[] = [pasteboard.Pattern.URL, pasteboard.Pattern.NUMBER, pasteboard.Pattern.EMAIL_ADDRESS];
        let detectedPatterns: pasteboard.Pattern[] = await systemPb.detectPatterns(patterns);
        expect(detectedPatterns != null).assertTrue();
        expect(Array.isArray(detectedPatterns)).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, "SUB_Pasteboard_Local_Pasteboard_Static error is: " + err.message + "; " + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_Return_Static_0160----------end");
      done();
    })

    console.info("----------SUB_Pasteboard_Local_Pasteboard_Static_Coverage----------");
  })
}
