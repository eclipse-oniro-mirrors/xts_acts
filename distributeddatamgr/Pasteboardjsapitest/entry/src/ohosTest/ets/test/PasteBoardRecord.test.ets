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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import pasteboard from '@ohos.pasteboard'
import image from '@ohos.multimedia.image';
import Want from '@ohos.app.ability.Want';


class Sizes {
  height: number = 3;
  width: number = 5;
}


let opt: ESObject = {
  size: new Sizes(),
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

function createData(mimetype: ESObject, valueType: ESObject) {
  pasteboard.createData(mimetype, valueType)
}

function createFunc(func: Function, mimetype: ESObject, valueType: ESObject) {
  func(mimetype)
}

function createRecord(mimetype: ESObject, valueType: ESObject) {
  pasteboard.createRecord(mimetype, valueType)
}

function addRecord(pasteData: pasteboard.PasteData, mimeType: ESObject, valueType: ESObject) {
  pasteData.addRecord(mimeType, valueType);
}

export default function pasteBoardRecordTest() {
  describe('pasteBoardRecordTest', () => {
    console.info('start################################start');

    beforeEach(() => {
      error = undefined;
    })
    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0100
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1000
     * @tc.desc   Test pasteBoard create pixelMap data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0100 start")
      let pasteData: pasteboard.PasteData
      await image.createPixelMap(color, opt).then((pixelMap) => {
        pasteData = pasteboard.createData(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
      })
      let pixelMapRecord = pasteData.getPrimaryPixelMap()
      expect(pixelMapRecord != null).assertTrue();
      expect(pixelMapRecord.getPixelBytesNumber()).assertEqual(60);
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0200
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_2100
     * @tc.desc   Test pasteBoard create want data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0200 start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_WANT, WANT)
      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_WANT)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0300
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_0200
     * @tc.desc   Test pasteBoard create arrayBuffer data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0300 start")
      let pasteData = pasteboard.createData("ArrayBuffer", ARRAY_BUFFER)
      let hasType: boolean = pasteData.hasType("ArrayBuffer")
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0300 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0400
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1200
     * @tc.desc   Test pasteBoard create string data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0400 start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "String")
      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0400 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0500
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_0300
     * @tc.desc   Test pasteBoard create arrayBuffer data success with 1024 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0500 start")
      let mimeType = "x".repeat(1024)
      let pasteData = pasteboard.createData(mimeType, ARRAY_BUFFER)
      let hasType: boolean = pasteData.hasType(mimeType)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0500 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0600
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1500
     * @tc.desc   Test pasteBoard create arrayBuffer data success with 512000 bit valueType<string>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0600 start")
      let valueType: ESObject = undefined
      for (let i = 0; i < 500; i++) {
        valueType = valueType + "x".repeat(1024)
      }
      let pasteData = pasteboard.createData("maxLength", ARRAY_BUFFER)
      let hasType: boolean = pasteData.hasType("maxLength")
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0600 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0700
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1700
     * @tc.desc   Test pasteBoard create uri data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0700 start")
      let uri = "www.baidu.com"
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri)
      expect(pasteData.getRecord(0).uri).assertEqual(uri)
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0700 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0800
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_0400
     * @tc.desc   Test pasteBoard create string data fail with 1025 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0800 start")
      let mimeType = "x".repeat(1025)
      try {
        let pasteData = pasteboard.createData(mimeType, ARRAY_BUFFER)
      } catch (err) {
        console.info("Create data error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0800 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0900
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1400
     * @tc.desc   Test pasteBoard create string data fail,type of mimeType is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0900 start")
      try {
        createData(0, "String")
      } catch (err) {
        console.info("Create data error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_0900 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1000
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1300
     * @tc.desc   Test pasteBoard create string data fail,value of mimeType is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1000 start")
      try {
        let pasteData = pasteboard.createData(null, "String")
      } catch (err) {
        console.info("Create data error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1000 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1100
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1600
     * @tc.desc   Test pasteBoard create string data fail with one parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1100 start")

      try {
        createFunc(pasteboard.createData, "String", "valueType")
      } catch (err) {
        console.info("Create data error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1200
     * @tc.number SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1200
     * @tc.desc   Test pasteBoard create string data fail with one parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1200 start")
      try {
        let pasteData = pasteboard.createData('', "String")
      } catch (err) {
        console.info("Create data error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_1200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0100
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_0900
     * @tc.desc   Test pasteBoard create pixelMap record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0100 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      await image.createPixelMap(color, opt).then((pixelMap) => {
        let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
        pasteData.addRecord(pasteDataRecord)
      })

      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_PIXELMAP)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0200
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_2000
     * @tc.desc   Test pasteBoard create want record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0200 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_WANT, WANT);
      pasteData.addRecord(pasteDataRecord)

      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_WANT)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0300
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_0100
     * @tc.desc   Test pasteBoard create arrayBuffer record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0300 start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_WANT, WANT)
      let pasteDataRecord = pasteboard.createRecord("ArrayBuffer", ARRAY_BUFFER);
      pasteData.addRecord(pasteDataRecord)

      let hasType: boolean = pasteData.hasType("ArrayBuffer")
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0300 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0400
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1100
     * @tc.desc   Test pasteBoard create string record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0400 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, "stringValueType");
      pasteData.addRecord(pasteDataRecord)

      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0400 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0500
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_0700
     * @tc.desc   Test pasteBoard create arrayBuffer record success with 1024 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0500 start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType")
      let pasteDataRecord = pasteboard.createRecord("x".repeat(1024), ARRAY_BUFFER);
      pasteData.addRecord(pasteDataRecord)

      let hasType: boolean = pasteData.hasType("x".repeat(1024))
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0500 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0600
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1800
     * @tc.desc   Test pasteBoard create string record success with 512000 bit valueType<string>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0600 start")
      let pasteData = pasteboard.createData("arrayBuffer", ARRAY_BUFFER)
      console.info("create arraybuffer data success")
      let valueType = "x"
      for (let i = 0; i < 500; i++) {
        valueType = valueType + "x".repeat(1024)
      }
      let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, valueType)
      pasteData.addRecord(pasteDataRecord)

      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0600 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0700
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_0800
     * @tc.desc   Test pasteBoard create string record fail with 1025 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0700 start")
      let mimeType = "x".repeat(1025)
      try {
        let pasteDataRecord = pasteboard.createRecord(mimeType, ARRAY_BUFFER)
      } catch (err) {
        console.info("Create record error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0700 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0800
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_0600
     * @tc.desc   Test pasteBoard create string record fail,type of mimeType is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0800 start")

      try {
        createRecord(1, "String")
      } catch (err) {
        console.info("Create record error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0800 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0900
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_1900
     * @tc.desc   Test pasteBoard create string record fail with 512001 bit valueType<string>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0900 start")
      var valueType = undefined
      for (var i; i < 512001; i++) {
        valueType = valueType + "x"
      }
      try {
        let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, valueType)
      } catch (err) {
        console.info("Create record error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_0900 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1000
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_0500
     * @tc.desc   Test pasteBoard create string record fail,mimeType is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1000 start")
      try {
        let pasteDataRecord = pasteboard.createRecord(null, "String")
      } catch (err) {
        console.info("Create record error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1000 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1100
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_2200
     * @tc.desc   Test pasteBoard create string record fail with one parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1100 start")

      try {
        createFunc(pasteboard.createRecord, "mimeType", "String")
      } catch (err) {
        console.info("Create record error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1200
     * @tc.number SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1200
     * @tc.desc   Test pasteBoard create string record fail with one parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1200 start");
      try {
        let pasteDataRecord = pasteboard.createRecord('', "String");
      } catch (err) {
        console.info("Create record error, err code is: " + err.code);
        error = err;
        expect(err.code).assertEqual("401");
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_1200 end");
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0100
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2500
     * @tc.desc   Test pasteBoard add pixelMap record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0100 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      await image.createPixelMap(color, opt).then((pixelMap) => {
        pasteData.addRecord(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
      })

      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_PIXELMAP)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0200
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2900
     * @tc.desc   Test pasteBoard add want record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0200 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      pasteData.addRecord(pasteboard.MIMETYPE_TEXT_WANT, WANT);

      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_WANT)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0300
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2200
     * @tc.desc   Test pasteBoard add arrayBuffer record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0300 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      pasteData.addRecord("ArrayBuffer", ARRAY_BUFFER);

      let hasType: boolean = pasteData.hasType("ArrayBuffer")
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0300 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0400
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2600
     * @tc.desc   Test pasteBoard add string record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0400 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      pasteData.addRecord(pasteboard.MIMETYPE_TEXT_PLAIN, "stringValueType");

      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0400 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0500
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2300
     * @tc.desc   Test pasteBoard add record success with 1024 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0500 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      pasteData.addRecord("x".repeat(1024), ARRAY_BUFFER);

      let hasType: boolean = pasteData.hasType("x".repeat(1024))
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0500 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0600
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2000
     * @tc.desc   Test pasteBoard add 600th record success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0600 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      for (let i = 0; i < 510; i++) {
        pasteData.addRecord("stringRecord" + i, ARRAY_BUFFER);
      }
      pasteData.addRecord("stringRecord512", ARRAY_BUFFER);
      let result: boolean = pasteData.hasType("stringRecord512")
      expect(result).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0600 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0700
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2800
     * @tc.desc   Test pasteBoard add record success with 512000 bit valueType<string>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0700 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      let valueType = "x"
      for (let i = 0; i < 500; i++) {
        valueType = valueType + "x".repeat(1024)
      }
      pasteData.addRecord(pasteboard.MIMETYPE_TEXT_PLAIN, valueType)

      let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN)
      expect(hasType).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0700 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0800
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2400
     * @tc.desc   Test pasteBoard add record fail with 1025 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0800 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      try {
        pasteData.addRecord("x".repeat(1025), ARRAY_BUFFER);
      } catch (err) {
        console.info("Add record error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      if (error == undefined) {
        console.info("Add record success")
        expect(false).assertTrue()
      }
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0800 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0900
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1900
     * @tc.desc   Test pasteBoard add record fail,type of mimeType is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0900 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)

      try {
        addRecord(pasteData, 1, "string")
      } catch (err) {
        console.info("Add record error, err code is: " + err.code)
        error = err
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_0900 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1000
     * @tc.number SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1000
     * @tc.desc   Test pasteBoard add record fail,type of mimeType is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1000 start");
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
      try {
        pasteData.addRecord('', "string");
      } catch (err) {
        console.info("Add record error, err code is: " + err.code);
        error = err;
        expect(err.code).assertEqual("401");
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1000 end");
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1100
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2100
     * @tc.desc   Test pasteBoard add 613th record successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1100 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      for (let i = 0; i < 511; i++) {
        pasteData.addRecord("stringRecord" + i, ARRAY_BUFFER);
      }
      try {
        pasteData.addRecord("stringRecord513", ARRAY_BUFFER);
      } catch (err) {
        console.info("Add record error, err code is: " + err.code)
        expect(err != undefined).assertFail();
      }
      let hasType: boolean = pasteData.hasType("stringRecord513")
      expect(hasType == true).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1200
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_2700
     * @tc.desc   Test pasteBoard add record fail,mimeType is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1200 start")
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      try {
        pasteData.addRecord(null, "string");
      } catch (err) {
        console.info("Add record error, err code is: " + err.code)
        error = err;
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1300
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_3000
     * @tc.desc   Test pasteBoard add 613th record successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1300 start");
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
      for (let i = 0; i < 998; i++) {
        pasteData.addRecord("stringRecord" + i, ARRAY_BUFFER);
      }
      try {
        pasteData.addRecord("stringRecord1000", ARRAY_BUFFER);
      } catch (err) {
        console.info("Add record error, err code is: " + err.code)
        expect(err != undefined).assertFail();
      }
      let count = pasteData.getRecordCount();
      console.info("RecordCount is:" + count)
      expect(count == 1000).assertTrue();
      let hasType: boolean = pasteData.hasType("stringRecord1000");
      expect(hasType == true).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDRECORD_1300 end");
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0100
     * @tc.number SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0100
     * @tc.desc   Test pasteBoard create arrayBuffer record success with 1024 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0100 start")
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      try {
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry("x".repeat(1024), new ArrayBuffer(256));
        let types: string[] = record.getValidTypes([
          pasteboard.MIMETYPE_TEXT_PLAIN,
          pasteboard.MIMETYPE_TEXT_URI,
          "x".repeat(1024)
        ]);
        expect(types.length).assertEqual(3);
        expect(types).assertDeepEquals(['text/plain','text/uri',"x".repeat(1024)]);
      } catch (error) {
        console.info("Create record error, err code is: " + error.code);
        expect().assertFail();
      }
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0100 end");
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0200
     * @tc.number SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0200
     * @tc.desc   Test pasteBoard create string record fail with 1025 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0200 start");
      let mimeType = "x".repeat(1025);
      try {
        let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, ARRAY_BUFFER);
        pasteDataRecord.addEntry(mimeType, ARRAY_BUFFER);
      } catch (err) {
        console.info("Create record error, err code is: " + err.code);
        error = err;
        expect(err.code).assertEqual("401");
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0200 end");
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0300
     * @tc.number SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0300
     * @tc.desc   Test pasteBoard create string record fail with 0 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0300 start");
      try {
        let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, ARRAY_BUFFER);
        pasteDataRecord.addEntry('', ARRAY_BUFFER);
      } catch (err) {
        console.info("Create record error, err code is: " + err.code);
        error = err
        expect(err.code).assertEqual("401");
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_ADDENTRY_0300 end");
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0100
     * @tc.number SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0100
     * @tc.desc   Test pasteBoard create arrayBuffer record success with 1024 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0100 start");
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      try {
        record.addEntry("x".repeat(1024), ARRAY_BUFFER);
        await record.getData("x".repeat(1024)).then((value: pasteboard.ValueType) => {
          let textPlainContent = value as string;
          console.info('Success to get 1024 value. value is: ' + textPlainContent);
          expect(textPlainContent != null).assertTrue();
        }).catch((err: BusinessError) => {
          console.error('Failed to get text/plain value. Cause: ' + err.message);
        });
      } catch (error) {
        console.info("Create record error, err code is: " + error.code);
        expect().assertFail();
      }
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0100 end");
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0200
     * @tc.number SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0200
     * @tc.desc   Test pasteBoard create string record fail with 1025 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0200 start");
      let mimeType = "x".repeat(1025);
      try {
        let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, ARRAY_BUFFER);
        await pasteDataRecord.getData(mimeType);
      } catch (err) {
        console.info("Create record error, err code is: " + err.code);
        error = err;
        expect(err.code).assertEqual("401");
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0200 end");
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0300
     * @tc.number SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0300
     * @tc.desc   Test pasteBoard create string record fail with 0 bit mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0300 start");
      try {
        let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, ARRAY_BUFFER);
        await pasteDataRecord.getData('');
      } catch (err) {
        console.info("Create record error, err code is: " + err.code);
        error = err;
        expect(err.code).assertEqual("401");
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_0300 end");
      done();
    })
  });
}