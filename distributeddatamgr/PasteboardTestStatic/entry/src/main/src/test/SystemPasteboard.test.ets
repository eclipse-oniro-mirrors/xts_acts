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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fileUri from "@ohos.file.fileuri";
import pasteboard from '@ohos.pasteboard';
import Want from "@ohos.app.ability.Want";
import image from "@ohos.multimedia.image";
import { BusinessError } from "@ohos.base"

let domain: int = 0x0000; // The log tag 0x0000 acts as the business ID for the test framework.
// The log identifier string is used as a tag to identify the test behavior under the current runner class.
let tag: string = 'testTag';
let error = undefined
const URITEXT = "file:///C:/Users/Documents/report.pdf";
const HTMLTEXT = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" +
  "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" +
  "    <p></p>\n" + "</body>\n" + "</html>";
const ARRAY_BUFFER = new ArrayBuffer(256)
const OBJECTWANT: Want = {
  bundleName: "com.example.aafwk.test",
  abilityName: "com.example.aafwk.test.TwoAbility"
};
const OPTS: image.InitializationOptions = {
  size:  { height: 480, width: 360},
  editable: true,
};

export default function systemPasteBoardTest() {
  describe("SystemPasteBoardTest", (): void => {
    console.info("----------SUB_Pasteboard_Local_SystemPasteboard_Static----------");
    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0010
     * @tc.number Pasteboard_test_001
     * @tc.desc   set data than check the data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0010----------');
      let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPb.clearData().then(async () => {
        let dataText: string = 'hello';
        let PasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
        await systemPb.setData(PasteData).then(async () => {
          try {
            let bHasType: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
            expect(bHasType).assertTrue();
            done();
          } catch (err) {
            hilog.error(domain, tag, `test hasDataType err    ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          }
        })
      })
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0010----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0020
     * @tc.number Pasteboard_test_002
     * @tc.desc   set data than check the data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0020----------');
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        await systemPb.clearData().then(async () => {
          let dataText: string = 'hello';
          let PasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
          await systemPb.setData(PasteData).then(async () => {
            try {
              let bHasType: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
              expect(bHasType == false).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, tag, `test hasDataType err    ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
            }
          })
        })
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0020----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0030
     * @tc.number Pasteboard_test_003
     * @tc.desc   Test setDataSync in systemPb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Pasteboard_Local_SystemPasteboard_Static_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0030----------');
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf");
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        hilog.info(domain, tag, `${systemPb}`);
        await systemPb.setData(pasteData).then<void, void>((): void => {
        });
        let result: pasteboard.PasteData = systemPb.getDataSync();
        hilog.info(domain, tag, `Get the pasteboard from system PasteBoard success. Result: ${result}`);
        expect(result.getRecord(0).uri).assertEqual("file:///C:/Users/Documents/report.pdf");
      } catch (err) {
        console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0030----------');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0040
     * @tc.number Pasteboard_test_004
     * @tc.desc   Test pasteBoard getDataSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0040----------');
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf");
      let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPb.setData(pasteData);
      try {
        let result: pasteboard.PasteData = systemPb.getDataSync();
        expect(result.getRecord(0).uri).assertEqual("file:///C:/Users/Documents/report.pdf");
        hilog.info(domain, tag, '----------Succeeded in getting PasteData.');
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect(err.code == 12900005).assertTrue();
        done();
      };
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0040----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0050
     * @tc.number Pasteboard_test_005
     * @tc.desc   get the pastedata from system pasteBoard success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0050----------');
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
      let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPb.setData(pasteData).then(async () => {
        try {
          let result: pasteboard.PasteData = systemPb.getDataSync();
          let recordCount: number = result.getRecordCount();
          expect(recordCount).assertEqual(1);
          hilog.info(domain, tag, '----------Succeeded in getting recordCount.');
          done();
        } catch (err) {
        err = err as BusinessError;
          hilog.info(domain, tag, `catch error ${err.code}`);
          expect(err.code == 12900005).assertTrue();
          done();
        };
      }).catch((err) => {
        hilog.info(domain, tag, '----------System pasteBoard set pastedata error.');
        expect().assertFail();
        done();
      })

      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0050----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0060
     * @tc.number Pasteboard_test_006
     * @tc.desc   Test pasteBoard getDataSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_SystemPasteboard_Static_0060----------");
      let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPb.clearData().then(async () => {
        let dataText: string = 'hello';
        let PasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
        await systemPb.setData(PasteData).then(async () => {
          try {
            let result: string = systemPb.getDataSource();
            hilog.info(domain, tag, "bundle name :" + result);
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            hilog.error(domain, tag, "test getDataSource err:" + err);
            expect().assertFail();
            done();
          }
        })
      })
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_SystemPasteboard_Static_0060----------");
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0070
     * @tc.number Pasteboard_test_007
     * @tc.desc   Test pasteBoard getDataSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '----------SUB_Pasteboard_getDataSource_ErrTest_01000----------');
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPb.setData(pasteData);
      try {
        let result: string = systemPb.getDataSource();
        hilog.info(domain, tag, `Succeeded in checking the RemoteData. Result: ${result}`);
        expect(result == 'label').assertTrue();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `Failed to getDataSource. Cause: ${err.message + err.code}`);
        expect(err.code == 12900005).assertTrue();
        done();
      };
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0070----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0080
     * @tc.number Pasteboard_test_008
     * @tc.desc   Test pasteBoard progress single level path and no fileConflictOption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
    async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0080----------');
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        await systemPb.setData(pasteData);
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        pasteData.setProperty(prop);
        hilog.info(domain, tag, '----------PasteDataProperty shareOption is: ' + prop.shareOption);
        expect(prop.shareOption == 1).assertTrue();
      } catch (err) {
        console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0080----------');
      done(); 
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0090
     * @tc.number Pasteboard_test_009
     * @tc.desc   Clear the data in the system pasteBoard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
    async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_SystemPasteboard_Static_0090----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPb.setData(pasteData);
      await systemPb.clearData().then(async () => {
        hilog.info(domain, tag, "Clear the data in the system pasteBoard finished");
        try {
          let bHasType: boolean = systemPb.hasDataType('string');
          expect(bHasType).assertFalse();
          done();
        } catch (err) {
          hilog.error(domain, tag, `test hasDataType err    ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_SystemPasteboard_Static_0090----------");
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0100
     * @tc.number Pasteboard_test_010
     * @tc.desc   Put pastedata to system pasteBoard success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_SystemPasteboard_Static_0100----------");
      let pasteData: pasteboard.PasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPb.setData(pasteData).then(async () => {
        hilog.info(domain, tag, "set the data in the system pasteBoard finished");
        try {
          let bHasType: boolean = systemPb.hasDataType('string');
          expect(bHasType).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, tag, `test hasDataType err    ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
      hilog.info(domain, tag, "----------SUB_Pasteboard_Local_SystemPasteboard_Static_0100----------");
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0110
     * @tc.number Pasteboard_test_011
     * @tc.desc   Clear the data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0110----------');
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData('string', ARRAY_BUFFER);
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        await systemPb.setData(pasteData);
        await systemPb.clearData().then<void, void>((): void => {
          hilog.info(0, 'testTag', `promise => test clearData`);
        });
        let bool_ret: boolean = systemPb.hasDataType('string');
        expect(bool_ret == false).assertTrue();
      } catch (err) {
        console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0110----------');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0120
     * @tc.number Pasteboard_test_012
     * @tc.desc   set data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0120----------');
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData('text/want', OBJECTWANT);
        let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
        await systemPb.setData(pasteData);
        let bool_ret: boolean = systemPb.hasDataType('text/want');
        expect(bool_ret == true).assertTrue();
      } catch (err) {
        console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
        expect(err).assertEqual(null);
      }
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0120----------');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0130
     * @tc.number Pasteboard_test_013
     * @tc.desc   set data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0130----------');
          const pixelMap = image.createPixelMapSync(OPTS);
          let pasteData: pasteboard.PasteData = pasteboard.createData('pixelMap', pixelMap);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_ret: boolean = systemPb.hasDataType('pixelMap');
          expect(bool_ret == true).assertTrue();
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0130----------');
        done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0140
     * @tc.number Pasteboard_test_014
     * @tc.desc   set data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0140----------');
        try {
          const pixelMap = image.createPixelMapSync(OPTS);
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
          pasteData.addRecord("selfDefined", ARRAY_BUFFER);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_ret: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          let bool_ret1: boolean = systemPb.hasDataType('selfDefined');
          expect(bool_ret == true && bool_ret1 == true).assertTrue();
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0140----------');
        done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0150
     * @tc.number Pasteboard_test_015
     * @tc.desc   set data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0150----------');
        try {
          const pixelMap = image.createPixelMapSync(OPTS);
          let pasteData: pasteboard.PasteData = pasteboard.createData('pixelMap', pixelMap);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          systemPb.setData(pasteData, () => {
            let bool_ret: boolean = systemPb.hasDataType('pixelMap');
            expect(bool_ret == true).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0150----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0160
     * @tc.number Pasteboard_test_016
     * @tc.desc   set data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0160----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData('text/want', OBJECTWANT);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          systemPb.setData(pasteData, () => {
            let bool_ret: boolean = systemPb.hasDataType('text/want');
            expect(bool_ret == true).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
      hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0160----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0170
     * @tc.number Pasteboard_test_017
     * @tc.desc   set data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0170----------');
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "content");
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          systemPb.setData(pasteData, () => {
            let bool_ret: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
            expect(bool_ret == true).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0170----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0180
     * @tc.number Pasteboard_test_018
     * @tc.desc   set data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0180----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, "content");
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          systemPb.setData(pasteData, () => {
            let bool_ret: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
            expect(bool_ret == true).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0180----------');
      })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0190
     * @tc.number Pasteboard_test_019
     * @tc.desc   set data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0190----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          systemPb.setData(pasteData, () => {
            let bool_ret: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
            expect(bool_ret == true).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0190----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0200
     * @tc.number Pasteboard_test_020
     * @tc.desc   set data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0200----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData("selfDefined", ARRAY_BUFFER);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          systemPb.setData(pasteData, () => {
            let bool_ret: boolean = systemPb.hasDataType("selfDefined");
            expect(bool_ret == true).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0200----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0210
     * @tc.number Pasteboard_test_021
     * @tc.desc   set data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0210----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData("selfDefined", ARRAY_BUFFER);
          pasteData.addRecord("selfDefined1", ARRAY_BUFFER);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          systemPb.setData(pasteData, () => {
          let bool_ret: boolean = systemPb.hasDataType("selfDefined");
          let bool_ret1: boolean = systemPb.hasDataType("selfDefined1");
          expect(bool_ret == true && bool_ret1 == true).assertTrue();
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0210----------');
          done();
        })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        
      })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0220
     * @tc.number Pasteboard_test_022
     * @tc.desc   Clear data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0220----------');
          let pasteData: pasteboard.PasteData = pasteboard.createData("selfDefined", ARRAY_BUFFER);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType("selfDefined");
          systemPb.clearData(() => {
            let bool_clear: boolean = systemPb.hasDataType("selfDefined");
            expect(bool_set == true && bool_clear == false).assertTrue();
            hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0220----------');
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0230
     * @tc.number Pasteboard_test_023
     * @tc.desc   Clear data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0230----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          systemPb.clearData(() => {
            let bool_clear: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
            expect(bool_set == true && bool_clear == false).assertTrue();
            hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0230----------');
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0240
     * @tc.number Pasteboard_test_024
     * @tc.desc   Clear data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0240----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
          systemPb.clearData(() => {
            let bool_clear: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
            expect(bool_set == true && bool_clear == false).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0240----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0250
     * @tc.number Pasteboard_test_025
     * @tc.desc   Clear data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0250----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
          systemPb.clearData(() => {
            let bool_clear: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
            expect(bool_set == true && bool_clear == false).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0250----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0260
     * @tc.number Pasteboard_test_026
     * @tc.desc   Clear data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0260----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData('text/want', OBJECTWANT);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType('text/want');
          systemPb.clearData(() => {
            let bool_clear: boolean = systemPb.hasDataType('text/want');
            expect(bool_set == true && bool_clear == false).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0260----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0270
     * @tc.number Pasteboard_test_027
     * @tc.desc   Clear data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0270----------');
        try {
          const pixelMap = image.createPixelMapSync(OPTS);
          let pasteData: pasteboard.PasteData = pasteboard.createData('pixelMap', pixelMap);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType('pixelMap');
          systemPb.clearData(() => {
            let bool_clear: boolean = systemPb.hasDataType('pixelMap');
            expect(bool_set == true && bool_clear == false).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0270----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0280
     * @tc.number Pasteboard_test_028
     * @tc.desc   Clear data in the system pasteBoard by callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0280----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
          pasteData.addRecord("selfDefined", ARRAY_BUFFER);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          let bool_set1: boolean = systemPb.hasDataType("selfDefined");
          systemPb.clearData(() => {
            let bool_clear: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
            let bool_clear1: boolean = systemPb.hasDataType("selfDefined");
            expect(bool_set == true && bool_set1 && bool_clear == false && bool_clear1 == false).assertTrue();
            done();
          })
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0280----------');
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0290
     * @tc.number Pasteboard_test_029
     * @tc.desc   Clear data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0290----------');
        try {
          const pixelMap = image.createPixelMapSync(OPTS);
          let pasteData: pasteboard.PasteData = pasteboard.createData('pixelMap', pixelMap);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType('pixelMap');
          await systemPb.clearData();
          let bool_clear: boolean = systemPb.hasDataType('pixelMap');
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0290----------');
          done();
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0300
     * @tc.number Pasteboard_test_030
     * @tc.desc   Clear data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0300----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData('text/want', OBJECTWANT);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType('text/want');
          await systemPb.clearData();
          let bool_clear: boolean = systemPb.hasDataType('text/want');
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0300----------');
          done();
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0310
     * @tc.number Pasteboard_test_031
     * @tc.desc   Clear data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0310----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
          await systemPb.clearData();
          let bool_clear: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0310----------');
          done();
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0320
     * @tc.number Pasteboard_test_032
     * @tc.desc   Clear data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0320----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
          await systemPb.clearData();
          let bool_clear: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0320----------');
          done();
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0330
     * @tc.number Pasteboard_test_033
     * @tc.desc   Clear data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0330----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          await systemPb.clearData();
          let bool_clear: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0330----------');
          done();
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0340
     * @tc.number Pasteboard_test_034
     * @tc.desc   Clear data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0340----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData("selfdefined", ARRAY_BUFFER );
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType("selfdefined");
          await systemPb.clearData();
          let bool_clear: boolean = systemPb.hasDataType("selfdefined");
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0340----------');
          done();
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SystemPasteboard_Static_0350
     * @tc.number Pasteboard_test_035
     * @tc.desc   Clear data in the system pasteBoard by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Local_SystemPasteboard_Static_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0350----------');
        try {
          let pasteData: pasteboard.PasteData = pasteboard.createData("selfdefined", ARRAY_BUFFER);
          pasteData.addRecord(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
          let systemPb: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          await systemPb.setData(pasteData);
          let bool_set: boolean = systemPb.hasDataType("selfdefined");
          let bool_set1: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          await systemPb.clearData();
          let bool_clear: boolean = systemPb.hasDataType("selfdefined");
          let bool_clear1: boolean = systemPb.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          expect(bool_set == true && bool_set1 == true && bool_clear == false && bool_clear1 == false).assertTrue();
          hilog.info(domain, tag, '----------SUB_Pasteboard_Local_SystemPasteboard_Static_0350----------');
          done();
        } catch (err) {
          console.error("SUB_Pasteboard_Local_SystemPasteboard_Static error is: " + err.message + "; " + err.code);
          expect(err).assertEqual(null);
        }
    })
    console.info("----------SUB_Pasteboard_Local_SystemPasteboard_Static----------");
  })
}