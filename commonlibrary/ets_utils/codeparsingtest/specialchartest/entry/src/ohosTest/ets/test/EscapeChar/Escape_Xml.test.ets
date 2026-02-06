/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { xml } from '@kit.ArkTS';
import { util } from '@kit.ArkTS';
export default function EscapeXmlTest() {
  describe('EscapeXmlTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   testXmlSetAttributesEscape0001
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_0100
     * @tc.desc   Testing the XML interface setAttributes with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSetAttributesEscape0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      const TAG = "testXmlSetAttributesEscape0001";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "abc\b");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22abc%08%22/%3E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0002
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_0200
     * @tc.desc   Testing the XML interface setAttributes with input escape \f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSetAttributesEscape0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      const TAG = "testXmlSetAttributesEscape0002";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "abc\f");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22abc%0C%22/%3E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0003
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_0300
     * @tc.desc   Testing the XML interface setAttributes with input escape \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSetAttributesEscape0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      const TAG = "testXmlSetAttributesEscape0003";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "abc\n");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22abc%0A%22/%3E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0004
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_0400
     * @tc.desc   Testing the XML interface setAttributes with input escape \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSetAttributesEscape0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      const TAG = "testXmlSetAttributesEscape0004";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "abc\r");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22abc%0D%22/%3E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0005
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_0500
     * @tc.desc   Testing the XML interface setAttributes with input escape \t
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSetAttributesEscape0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      const TAG = "testXmlSetAttributesEscape0005";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "abc\t");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22abc%09%22/%3E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0006
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_0600
     * @tc.desc   Testing the XML interface setAttributes with input escape \v
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSetAttributesEscape0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      const TAG = "testXmlSetAttributesEscape0006";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "abc\t");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22abc%09%22/%3E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0007
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_0700
     * @tc.desc   Testing the XML interface setAttributes with input escape \x24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSetAttributesEscape0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      const TAG = "testXmlSetAttributesEscape0007";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "abc\x24");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22abc$%22/%3E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0008
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_0800
     * @tc.desc   Testing the XML interface setAttributes with input escape \开
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEscape0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSetAttributesEscape0008";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\开");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22%E5%BC%80%22/%3E%00');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0009
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_0900
     * @tc.desc   Testing the XML interface setAttributes with input escape \😊
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEscape0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSetAttributesEscape0009";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\😊");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22%F0%9F%98%8A%22/%3E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0010
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_1000
     * @tc.desc   Testing the XML interface setAttributes with input escape \0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEscape0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSetAttributesEscape0010";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\0");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22%00%22/%3E%00%00%00');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEscape0011
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_XML_ESCAPE_1100
     * @tc.desc   Testing the XML interface setAttributes with input escape \\b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEscape0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSetAttributesEscape0011";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\\b");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res =encodeURI(result)
        expect(res).assertEqual('%3Cnote%20importance=%22%5Cb%22/%3E%00%00');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_0001
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_1200
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0001';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\b");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C%08/%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_0002
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_1300
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0002';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\f");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C%0C/%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_0003
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_1400
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0003';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\n");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C%0A/%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_0004
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_1500
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0004';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\r");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C%0D/%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_0005
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_1600
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0005';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\t");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C%09/%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_0006
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_1700
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0006';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\v");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C%0B/%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_0007
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_1800
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0007';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\x24");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C$/%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_0008
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_1900
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0008';
      try {
        let arrayBuffer = new ArrayBuffer(8);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\开");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C%E5%BC%80/%3E%00%00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_0009
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_2000
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0009';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\😊");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%00%00%00%00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_00010
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_2100
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_00010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_00010';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\0");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C%00/%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement_00011
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_ADDEMPTYELEMENT_2200
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement_00011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_00011';
      try {
        let arrayBuffer = new ArrayBuffer(4);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\\b");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%00%00%00%00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_0001
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_TREEMAP_2300
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0001';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\b", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
        expect()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_0002
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_2400
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0002';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\f", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_0003
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_2500
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0003';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\n", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
        // .assertEqual("%0D%0A%3C%0A:note%20xmlns:%0A=%22%20%22/%3E%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00%00")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_0004
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_2600
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0004';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\r", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_0005
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_2700
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0005';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\t", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_0006
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_2800
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0006';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\v", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_0007
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_2900
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0007';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\x24", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_0008
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_3000
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0008';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\开", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_0009
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_3100
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_0009';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\😊", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_00010
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_3200
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_00010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_00010';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\0", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetNamespace_00011
     * @tc.number SUB_COMMONLIBRARY_XML_BASE_SETNAMESPACE_3300
     * @tc.desc   Test the function of the Interface setNamespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetNamespace_00011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      let TAG = 'testXmlSerializeraddEmptyElement_00011';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("\\b", "");
        thatSer.startElement("note");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res).assertEqual("")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializersetCommentEscape0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_3400
     * @tc.desc   Testing the Buffer interface setComment with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0001";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\b');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%08-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_3500
     * @tc.desc   Testing the Buffer interface setComment with input escape \f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0002";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\f');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%0C-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_3600
     * @tc.desc   Testing the Buffer interface setComment with input escape \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0003";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\n');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%0A-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_3700
     * @tc.desc   Testing the Buffer interface setComment with input escape \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0004";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\t');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%09-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_3800
     * @tc.desc   Testing the Buffer interface setComment with input escape \t
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0005";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\t');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%09-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_3900
     * @tc.desc   Testing the Buffer interface setComment with input escape \v
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0006";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\v');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%0B-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4000
     * @tc.desc   Testing the Buffer interface setComment with input escape \x24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0007";
      try {
        let arrayBuffer = new ArrayBuffer(23);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\x24');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!$-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4100
     * @tc.desc   Testing the Buffer interface setComment with input escape \开  == 开
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0008";
      try {
        let arrayBuffer = new ArrayBuffer(31);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\开');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%E5%BC%80-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4200
     * @tc.desc   Testing the Buffer interface setComment with input escape \😊 == 😊
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0009";
      try {
        let arrayBuffer = new ArrayBuffer(34);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\😊');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%F0%9F%98%8A-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4300
     * @tc.desc   Testing the Buffer interface setComment with input escape \0  == null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0010";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\0');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%00-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCommentEscape0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4400
     * @tc.desc   Testing the Buffer interface setComment with input escape \\b == \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCommentEscape0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCommentEscape0011";
      try {
        let arrayBuffer = new ArrayBuffer(26);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedComment = encodeURI('Hello, World!\\b');
        thatSer.setComment(encodedComment);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<!--Hello,%20World!%5Cb-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });




    /**
     * @tc.name   testXmlSerializersetCDATAEscape0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4500
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0001";
      try {
        let arrayBuffer = new ArrayBuffer(28);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\b');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%08]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testXmlSerializersetCDATAEscape0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4600
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0002";
      try {
        let arrayBuffer = new ArrayBuffer(28);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\f');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%0C]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCDATAEscape0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4700
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0003";
      try {
        let arrayBuffer = new ArrayBuffer(28);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\n');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%0A]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCDATAEscape0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4800
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0004";
      try {
        let arrayBuffer = new ArrayBuffer(28);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\r');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%0D]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCDATAEscape0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_4900
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0005";
      try {
        let arrayBuffer = new ArrayBuffer(28);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\t');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%09]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCDATAEscape0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5000
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0006";
      try {
        let arrayBuffer = new ArrayBuffer(28);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\v');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%0B]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testXmlSerializersetCDATAEscape0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5100
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0007";
      try {
        let arrayBuffer = new ArrayBuffer(26);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\x24');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM$]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCDATAEscape0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5200
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0008";
      try {
        let arrayBuffer = new ArrayBuffer(37);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\\开');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%5C%E5%BC%80]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCDATAEscape0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5300
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0009";
      try {
        let arrayBuffer = new ArrayBuffer(40);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\\😊');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%5C%F0%9F%98%8A]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCDATAEscape0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5400
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0010";
      try {
        let arrayBuffer = new ArrayBuffer(28);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\0');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%00]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSerializersetCDATAEscape0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5500
     * @tc.desc   Testing the Buffer interface setCDATA with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetCDATAEscape0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetCDATAEscape0011";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        let encodedCDATA = encodeURI('root SYSTEM\\b');
        thatSer.setCDATA(encodedCDATA);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.trim()).assertEqual("<![CDATA[root%20SYSTEM%5Cb]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5600
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0001";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('abc\b');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20abc%08%3E")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5700
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0002";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('abc\f');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20abc%0C%3E")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5800
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0003";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('abc\n');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20abc%0A%3E")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_5900
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0004";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('abc\r');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20abc%0D%3E")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6000
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \t
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0005";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('abc\t');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20abc%09%3E")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6100
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \v
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0006";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('abc\v');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20abc%0B%3E")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6200
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \x24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0007";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('abc\v');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20abc%0B%3E")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6300
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \开
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0008";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('\开');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20%E5%BC%80%3E%00")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6400
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \😊
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0009";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('\😊');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20%F0%9F%98%8A%3E")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6500
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0010";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('\开');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20%E5%BC%80%3E%00")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializersetDoctypeEscape0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6600
     * @tc.desc   Testing the Buffer interface setDoctype with input escape \\b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializersetDoctypeEscape0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testXmlSerializersetDoctypeEscape0011";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('\\b');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result)
        expect(res).assertEqual("%3C!DOCTYPE%20%5Cb%3E%00%00")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6700
     * @tc.desc   Test the XML interface setText with input escape \b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0001",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0001";
      try {
        const escape = "aaa\b";
        let arrayBuffer = new ArrayBuffer(17);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3Eaaa%08%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6800
     * @tc.desc   Test the XML interface setText with input escape \f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0002",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0002";
      try {
        const escape = "aaa\f";
        let arrayBuffer = new ArrayBuffer(17);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3Eaaa%0C%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_6900
     * @tc.desc   Test the XML interface setText with input escape \n.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0003",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0003";
      try {
        const escape = "aaa\n";
        let arrayBuffer = new ArrayBuffer(17);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3Eaaa%0A%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_7000
     * @tc.desc   Test the XML interface setText with input escape \r.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0004",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0004";
      try {
        const escape = "aaa\r";
        let arrayBuffer = new ArrayBuffer(17);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3Eaaa%0D%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_7100
     * @tc.desc   Test the XML interface setText with input escape \t.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0005",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0005";
      try {
        const escape = "aaa\t";
        let arrayBuffer = new ArrayBuffer(17);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3Eaaa%09%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_7200
     * @tc.desc   Test the XML interface setText with input escape \v.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0006",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0006";
      try {
        const escape = "aaa\v";
        let arrayBuffer = new ArrayBuffer(17);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3Eaaa%0B%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_7300
     * @tc.desc   Test the XML interface setText with input escape \x24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0007",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0007";
      try {
        const escape = "aaa\x24";
        let arrayBuffer = new ArrayBuffer(17);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3Eaaa$%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_7400
     * @tc.desc   Test the XML interface setText with input escape \开.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0008",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0008";
      try {
        const escape = "\开";
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3E%E5%BC%80%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_7500
     * @tc.desc   Test the XML interface setText with input escape \😊.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0009",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0009";
      try {
        const escape = "\😊";
        let arrayBuffer = new ArrayBuffer(17);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3E%F0%9F%98%8A%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_7600
     * @tc.desc   Test the XML interface setText with input escape \0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0010",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0010";
      try {
        const escape = "\0";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3E%00%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testsetTextEscape_0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_ESCAPE_7700
     * @tc.desc   Test the XML interface setText with input escape \b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testsetTextEscape_0011",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  () => {
      const TAG = "testsetTextEscape_0011";
      try {
        const escape = "\b";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(escape);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let res = encodeURI(result);
        expect(res.toString()).assertEqual("%3Cnote%3E%08%3C/note%3E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
  })
}