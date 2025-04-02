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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import pasteboard from '@ohos.pasteboard'
import image from '@ohos.multimedia.image';
import Want from '@ohos.app.ability.Want';

class Size {
  height: number = 3;
  width: number = 5;
}

let opt: ESObject = {
  size: new Size,
  pixelFormat: 3,
  editable: true,
  alphaType: 1,
  scaleMode: 1
}

let error: ESObject = undefined

const color = new ArrayBuffer(128);

const WANT: Want = {
  bundleName: "com.acts.distributeddatamgr.pasteboardtest",
  abilityName: "com.acts.distributeddatamgr.pasteboardtest.MainAbility"
};

const ARRAY_BUFFER = new ArrayBuffer(256)

function setProperty(pasteData: pasteboard.PasteData, property: ESObject) {
  pasteData.setProperty(property)
}

function setPropertyFunc(func: Function, property: ESObject) {
  func()
}

function getRecord(pasteData: pasteboard.PasteData, index: ESObject) {
  pasteData.getRecord(index)
}

function check(pasteData: pasteboard.PasteData, mimeType: ESObject) {
  pasteData.hasType(mimeType)
}

function checkFunc(func: Function, mimeType: ESObject) {
  func()
}

function remove(pasteData: pasteboard.PasteData, index: ESObject) {
  pasteData.removeRecord(index)
}

function removeFunc(func: Function, index: ESObject) {
  func()
}

function replace(pasteData: pasteboard.PasteData, index: ESObject, record: ESObject) {
  pasteData.replaceRecord(index, record)
}

function replaceFunc(func: Function, index: ESObject, record: ESObject) {
  func()
}

export default function pasteBoardTest() {
  describe('pasteBoardTest', () => {
    console.info('start################################start');

    beforeEach(() => {
      error = undefined;
    })
    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_0900
     * @tc.name Adds one record(s)
     * @tc.desc Test pasteBoard SetProperty API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100', 0, async (done: Function) => {
      let pasteData = pasteboard.createHtmlData('application/xml');
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.clear().then(async () => {
        let prop = pasteData.getProperty();
        prop.shareOption = pasteboard.ShareOption.INAPP;
        pasteData.setProperty(prop);
        let property = pasteData.getProperty();
        expect(0).assertEqual(property.shareOption)
        console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100 end")
      })
      done();
    })
    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_1000
     * @tc.name Adds one record(s)
     * @tc.desc Test pasteBoard SetProperty API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200', 0, async (done: Function) => {
      let pasteData = pasteboard.createPlainTextData("hello");
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.clear().then(async () => {
        let prop = pasteData.getProperty();
        prop.shareOption = pasteboard.ShareOption.LOCALDEVICE;
        pasteData.setProperty(prop);
        let property = pasteData.getProperty();
        expect(1).assertEqual(property.shareOption)
        console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200 end")
      })
      done();
    })
    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_0700
     * @tc.name Adds one record(s)
     * @tc.desc Test pasteBoard SetProperty API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300', 0, async (done: Function) => {
      let pasteData = pasteboard.createPlainTextData("hello");
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.clear().then(async () => {
        let prop = pasteData.getProperty();
        prop.shareOption = pasteboard.ShareOption.CROSSDEVICE;
        pasteData.setProperty(prop);
        let property = pasteData.getProperty();
        expect(2).assertEqual(property.shareOption)
        console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300 end")
      })
      done();
    })
    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_0800
     * @tc.name Adds one record(s)
     * @tc.desc Test pasteBoard SetProperty API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400', 0, async (done: Function) => {
      let pasteData = pasteboard.createPlainTextData("hello");
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.clear().then(async () => {
        let prop = pasteData.getProperty();
        pasteData.setProperty(prop);
        let property = pasteData.getProperty();
        expect(2).assertEqual(property.shareOption)
        console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400 end")
      })
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_0100
     * @tc.name setProperty
     * @tc.desc Test pasteBoard setProperty error,type of parameter "property" is string
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_SETPROPERTY_0100', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETPROPERTY_0100 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)

      try {
        setProperty(pasteData, "property");
      } catch (err) {
        console.info("Set property error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETPROPERTY_0100 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_0400
     * @tc.name setProperty
     * @tc.desc Test pasteBoard setProperty error,parameter "property" is null;
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_SETPROPERTY_0200', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETPROPERTY_0200 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      try {
        pasteData.setProperty(null);
      } catch (err) {
        console.info("Set property error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETPROPERTY_0200 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_0600
     * @tc.name setProperty
     * @tc.desc Test pasteBoard setProperty error without parameters
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_SETPROPERTY_0300', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETPROPERTY_0300 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)

      try {
        setPropertyFunc(pasteData.setProperty, "prop");
      } catch (err) {
        console.info("Set property error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETPROPERTY_0300 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_0300
     * @tc.name toPlainText
     * @tc.desc Successfully cast string record to text
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0100', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0100 start")
      let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let str = await pasteDataRecord.toPlainText();
      expect(str).assertEqual("valueType")
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0100 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_0200
     * @tc.name toPlainText
     * @tc.desc Successfully cast pixelMap record to text
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0200', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0200 start")
      let pasteDataRecord: pasteboard.PasteDataRecord = undefined;
      await image.createPixelMap(color, opt).then((pixelMap) => {
        pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
      })
      let str = await pasteDataRecord.toPlainText();
      expect(str).assertEqual("");
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0200 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_0500
     * @tc.name toPlainText
     * @tc.desc Successfully cast want record to text
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0300', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0300 start")
      let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_WANT, WANT)
      let str = await pasteDataRecord.toPlainText();
      expect(str).assertEqual("");
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0300 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_0100
     * @tc.name toPlainText
     * @tc.desc Successfully cast arrayBuffer record to text
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0400', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0400 start")
      let pasteDataRecord = pasteboard.createRecord("ArrayBuffer", ARRAY_BUFFER)
      let str = await pasteDataRecord.toPlainText();
      expect(str).assertEqual("")
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_0400 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryType_0700
     * @tc.name getRecord
     * @tc.desc Get specified record success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETRECORDAT_0100', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETRECORDAT_0100 start")
      let uri = "www.baidu.com"
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri)
      expect(pasteData.getRecord(0).uri).assertEqual(uri)
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryType_0100
     * @tc.name getRecord
     * @tc.desc Get specified record failed,type of parameter "index" is string.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETRECORDAT_0200', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETRECORDAT_0200 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)

      try {
        getRecord(pasteData, "0")
      } catch (err) {
        console.info("Get specified record failed,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETRECORDAT_0200 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryType_0200
     * @tc.name getRecord
     * @tc.desc Get specified record failed,index out of range
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETRECORDAT_0300', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETRECORDAT_0300 start")
      let pasteData = pasteboard.createData("arraybuffer", ARRAY_BUFFER)
      try {
        pasteData.getRecord(1)
      } catch (err) {
        console.info("Get specified record failed,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("12900001")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETRECORDAT_0300 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryType_0400
     * @tc.name hasType
     * @tc.desc Check whether the pasteData contains the specified data type success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0100', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0100 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      let result = pasteData.hasType("string")
      expect(result).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0100 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryType_0300
     * @tc.name hasType
     * @tc.desc Check whether the pasteData contains the specified data type success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0200', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0200 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      let result = pasteData.hasType("arrayBuffer")
      expect(result).assertEqual(false);
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0200 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryType_0600
     * @tc.name hasType
     * @tc.desc Check whether the pasteData contains the specified data type failed,type of parameter "mimeType" is number
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0300', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0300 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)

      try {
        check(pasteData, 0)
      } catch (err) {
        console.info("Check fail,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0300 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryType_0500
     * @tc.name hasType
     * @tc.desc Check whether the pasteData contains the specified data type failed without parameters
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0400', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0400 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)

      try {
        checkFunc(pasteData.hasType, "string")
      } catch (err) {
        console.info("Check fail,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASTYPE_0400 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1300
     * @tc.name removeRecord
     * @tc.desc Remove specified record from pasteData successful
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0100', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0100 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      pasteData.removeRecord(0)
      let result = pasteData.hasType("string")
      expect(result == false).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0100 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_0300
     * @tc.name removeRecord
     * @tc.desc Remove specified record from pasteData failed,index out of range
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0200', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0200 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      try {
        pasteData.removeRecord(1)
      } catch (err) {
        console.info("Remove specified record fail,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("12900001")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0200 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_0500
     * @tc.name removeRecord
     * @tc.desc Remove specified record from pasteData failed,type of parameter "index" is string
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0300', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0300 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      try {
        remove(pasteData, "0")
      } catch (err) {
        console.info("Remove specified record fail,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0300 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_0100
     * @tc.name removeRecord
     * @tc.desc Remove specified record from pasteData failed without parameters
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0400', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0400 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      try {
        removeFunc(pasteData.removeRecord, 1)
      } catch (err) {
        console.info("Remove specified record fail,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REMOVERECORD_0400 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_2000
     * @tc.name replaceRecord
     * @tc.desc Remove specified record from pasteData failed without parameters
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0100', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0100 start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)
      pasteData.replaceRecord(0, pasteDataRecord)
      let result = pasteData.hasType("arrayBuffer")
      expect(result).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0100 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_0400
     * @tc.name replaceRecord
     * @tc.desc Remove specified record from pasteData failed,index out of range;
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0200', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0200 start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)
      try {
        pasteData.replaceRecord(1, pasteDataRecord)
      } catch (err) {
        console.info("Replace specified record fail,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("12900001")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0200 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_0600
     * @tc.name replaceRecord
     * @tc.desc Remove specified record from pasteData failed,type of parameter "index" is string
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0300', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0300 start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)
      try {
        replace(pasteData, "0", pasteDataRecord)
      } catch (err) {
        console.info("Replace specified record fail,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0300 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1900
     * @tc.name replaceRecord
     * @tc.desc Remove specified record from pasteData failed,type of parameter "record" is string
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0400', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0400 start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)
      try {
        replace(pasteData, 0, "pasteDataRecord")
      } catch (err) {
        console.info("Replace specified record fail,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0400 end")
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_0200
     * @tc.name replaceRecord
     * @tc.desc Remove specified record from pasteData failed without parameters
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0500', 0, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0500 start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("arrayBuffer", ARRAY_BUFFER)

      try {
        replaceFunc(pasteData.replaceRecord, 0, "record")
      } catch (err) {
        console.info("Replace specified record fail,error code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_REPLACERECORD_0500 end")
      done();
    })

  });
}