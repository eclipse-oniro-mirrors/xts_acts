/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import pasteboard from '@ohos.pasteboard';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

let error: ESObject = undefined
let tag = "PASTEBOARDSYNC--------------------"

export default function pasteboardSyncTest() {
  describe("pasteboardSyncTest", () => {
    console.info("start#############################start")
    beforeEach(() => {
      error = undefined
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0100
     * @tc.name clearDataSync interface test
     * @tc.desc Test clearDataSync when systemPasteBoard has data
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0100 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      systemPasteBoard.setDataSync(pasteData);
      expect(systemPasteBoard.hasDataSync()).assertEqual(true);
      console.info(tag + "Succeeded in setting PasteData");

      systemPasteBoard.clearDataSync();

      let result = systemPasteBoard.hasDataSync();
      console.info(tag + `Succeed in checking the PasteBoard. Result: ${result}`)
      expect(result).assertEqual(false);
      console.info(tag + "Clear the data in the system PasteBoard finished")

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0100 ---------end")
    })


    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0200
     * @tc.name setDataSync interface test
     * @tc.desc Test setDataSync in systemPasteBoard
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0200 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      console.info(tag + `${systemPasteBoard}`);
      systemPasteBoard.setDataSync(pasteData);
      console.info(tag + "Succeeded in setting PasteData");
      let result = systemPasteBoard.getDataSync();

      console.info(tag + `Get the pasteboard from system PasteBoard success. Result: ${result}`)
      expect(result.getPrimaryText()).assertEqual("pasteboard");

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0200 ---------end")
    })


    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0300
     * @tc.name setDataSync interface test
     * @tc.desc Test setDataSync when parameter is null
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0300 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      console.info(tag + `${systemPasteBoard}`)
      try {
        systemPasteBoard.setDataSync(null);
        expect().assertFail()
        console.info(tag + "Succeeded in setting PasteData");
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0300 ---------end")
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0400
     * @tc.name setDataSync interface test
     * @tc.desc Test setDataSync parameter is undefined
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0400 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      console.info(tag + `${systemPasteBoard}`);
      try {
        systemPasteBoard.setDataSync(undefined);
        expect().assertFail()
        console.info(tag + "Succeeded in setting PasteData");
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0400 ---------end")
    })


    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0500
     * @tc.name getDataSync interface test
     * @tc.desc Test getDataSync when setDataSync in systemPasteBoard
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0500 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      systemPasteBoard.setData(pasteData);
      console.info(tag + "Succeeded in setting PasteData");

      let resultFlg = systemPasteBoard.hasDataSync();
      expect(resultFlg).assertTrue();

      let resultText = systemPasteBoard.getDataSync().getPrimaryText();
      expect(resultText).assertEqual("pasteboard");
      console.info(tag + `Get the pasteboard from system PasteBoard success. Result: ${resultText}`)

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0500 ---------end")
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0600
     * @tc.name hasDataSync interface test
     * @tc.desc Test hasDataSync when systemPasteBoard has parameter
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0600 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      systemPasteBoard.setDataSync(pasteData);
      console.info(tag + "Succeeded in setting PasteData");
      let result = systemPasteBoard.hasDataSync();
      expect(result).assertTrue();
      console.info(tag + `Succeed in checking the PasteBoard. Result: ${result}`);
      ;

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0600 ---------end");

    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0700
     * @tc.name hasDataSync interface test
     * @tc.desc Test hasDataSync when systemPasteBoard is null
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0700 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      systemPasteBoard.clearDataSync();
      let result = systemPasteBoard.hasDataSync();
      expect(result).assertEqual(false);
      console.info(tag + `Succeed in checking the PasteBoard. Result: ${result}`)

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0700 ---------end")

    })

  })
}