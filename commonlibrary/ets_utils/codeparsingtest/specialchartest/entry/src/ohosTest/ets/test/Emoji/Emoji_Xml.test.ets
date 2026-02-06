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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { util, xml } from '@kit.ArkTS';

export default function EmojiXmlTest() {
  describe('EmojiXmlTest', () => {
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
     * @tc.name   testXmlConstructorEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_0100
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlConstructorEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testXmlConstructorEmoji0001";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83d\ude0a");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_0200
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlConstructorEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testXmlConstructorEmoji0002";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83d\udc64");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_0300
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlConstructorEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testXmlConstructorEmoji0003";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83d\udc6b");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_0400
     * @tc.desc   Testing the XML interface constructor with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlConstructorEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testXmlConstructorEmoji0004";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\u260e");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_0500
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlConstructorEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testXmlConstructorEmoji0005";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83d\udc79");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_0600
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlConstructorEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testXmlConstructorEmoji0006";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83d\udd5b");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_0700
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlConstructorEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlConstructorEmoji0007";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83c\udf4f");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_0800
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlConstructorEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlConstructorEmoji0008";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83d\udd03");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_0900
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlConstructorEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlConstructorEmoji0009";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83c\udf41");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_EMOJI_1000
     * @tc.desc   Testing the XML interface constructor with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlConstructorEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlConstructorEmoji0010";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\u2666");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_EMOJI_1100
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlConstructorEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlConstructorEmoji0011";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83d\udc48");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXmlConstructorEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_EMOJI_1200
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlConstructorEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlConstructorEmoji0012";
      try {
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "\ud83e\udd3c\u200d\u2642\ufe0f");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8');
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_1300
     * @tc.desc   Testing the XML interface setAttributes with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0001";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\ude0a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="😊"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetAttributesEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_1400
     * @tc.desc   Testing the XML interface setAttributes with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0002";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udc64");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="👤"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_1500
     * @tc.desc   Testing the XML interface setAttributes with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0003";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udc6b");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="👫"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_1600
     * @tc.desc   Testing the XML interface setAttributes with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0004";
      try {
        let arrayBuffer = new ArrayBuffer(24);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\u260e");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="☎"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_1700
     * @tc.desc   Testing the XML interface setAttributes with input emoji  \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0005";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udc79");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="👹"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_1800
     * @tc.desc   Testing the XML interface setAttributes with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0006";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udd5b");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🕛"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_1900
     * @tc.desc   Testing the XML interface setAttributes with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0007";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83c\udf4f");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🍏"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2000
     * @tc.desc   Testing the XML interface setAttributes with input emoji  \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0008";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udd03");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🔃"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2100
     * @tc.desc   Testing the XML interface setAttributes with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0009";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83c\udf41");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🍁"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2200
     * @tc.desc   Testing the XML interface setAttributes with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0010";
      try {
        let arrayBuffer = new ArrayBuffer(24);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\u2666");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="♦"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2300
     * @tc.desc   Testing the XML interface setAttributes with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0011";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udc48");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="👈"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetAttributesEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2400
     * @tc.desc   Testing the XML interface setAttributes with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSetAttributesEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesEmoji0012";
      try {
        let arrayBuffer = new ArrayBuffer(34);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83e\udd3c\u200d\u2642\ufe0f");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🤼‍♂️"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2500
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement001';
      try {
        let arrayBuffer = new ArrayBuffer(7);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83d\ude0a");
        let uint8 = new Uint8Array(arrayBuffer);
        let result: string = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<😊/>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });

    /**
     * @tc.name   testXmlSerializeraddEmptyElement0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2600
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0002';
      try {
        let arrayBuffer = new ArrayBuffer(7);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83d\udc64");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<👤/>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2700
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0003';
      try {
        let arrayBuffer = new ArrayBuffer(7);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83d\udc6b");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<👫/>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2800
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0004';
      try {
        let arrayBuffer = new ArrayBuffer(6);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\u260e");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<☎/>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_2900
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0005';
      try {
        let arrayBuffer = new ArrayBuffer(7);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83d\udc79");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<👹/>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_3000
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji "\ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0006';
      try {
        let arrayBuffer = new ArrayBuffer(7);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83d\udd5b");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🕛/>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_3100
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0007';
      try {
        let arrayBuffer = new ArrayBuffer(7);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83c\udf4f");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🍏/>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_3200
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0008';
      try {
        let arrayBuffer = new ArrayBuffer(7);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83d\udd03");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🔃/>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_3300
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0009';
      try {
        let arrayBuffer = new ArrayBuffer(7);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83c\udf41");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🍁/>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_3400
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0010';
      try {
        let arrayBuffer = new ArrayBuffer(6);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\u2666");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<♦/>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_3500
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji  \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0011';
      try {
        let arrayBuffer = new ArrayBuffer(7);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83d\udc48");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<👈/>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testXmlSerializeraddEmptyElement0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_3600
     * @tc.desc   Testing the XML interface addEmptyElement with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlSerializeraddEmptyElement0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testXmlSerializeraddEmptyElement0012';
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("\ud83e\udd3c\u200d\u2642\ufe0f");
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🤼‍♂️/>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testStartElementEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_4900
     * @tc.desc   Test the XML interface startElement with input emoji \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0001";
      try {
        const emoji = "\ud83d\ude0a";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<😊>a</😊>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5000
     * @tc.desc   Test the XML interface startElement with input emoji \ud83d\udc64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0002";
      try {
        const emoji = "\ud83d\udc64";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<👤>a</👤>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5100
     * @tc.desc   Test the XML interface startElement with input emoji \ud83d\udc6b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0003";
      try {
        const emoji = "\ud83d\udc6b";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<👫>a</👫>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5200
     * @tc.desc   Test the XML interface startElement with input emoji \u260e.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0004";
      try {
        const emoji = "\u260e";
        let arrayBuffer = new ArrayBuffer(12);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<☎>a</☎>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5300
     * @tc.desc   Test the XML interface startElement with input emoji \ud83d\udc79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0005";
      try {
        const emoji = "\ud83d\udc79";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<👹>a</👹>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5400
     * @tc.desc   Test the XML interface startElement with input emoji \ud83d\udd5b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0006";
      try {
        const emoji = "\ud83d\udd5b";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<🕛>a</🕛>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5500
     * @tc.desc   Test the XML interface startElement with input emoji \ud83c\udf4f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0007";
      try {
        const emoji = "\ud83c\udf4f";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<🍏>a</🍏>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5600
     * @tc.desc   Test the XML interface startElement with input emoji \ud83d\udd03.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0008";
      try {
        const emoji = "\ud83d\udd03";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<🔃>a</🔃>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5700
     * @tc.desc   Test the XML interface startElement with input emoji \ud83c\udf41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0009";
      try {
        const emoji = "\ud83c\udf41";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<🍁>a</🍁>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5800
     * @tc.desc   Test the XML interface startElement with input emoji \u2666.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0010";
      try {
        const emoji = "\u2666";
        let arrayBuffer = new ArrayBuffer(12);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<♦>a</♦>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_5900
     * @tc.desc   Test the XML interface startElement with input emoji \ud83d\udc48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0011";
      try {
        const emoji = "\ud83d\udc48";
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<👈>a</👈>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testStartElementEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_EMOJI_6000
     * @tc.desc   Test the XML interface startElement with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStartElementEmoji0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStartElementEmoji0012";
      try {
        const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
        let arrayBuffer = new ArrayBuffer(32);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(emoji);
        thatSer.setText("a");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result.toString()).assertEqual("<🤼‍♂️>a</🤼‍♂️>")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetCommentEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_6100
     * @tc.desc   Test the function of the Interface emoji  😊  \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0001";
      try {
        const emoji = "\ud83d\ude0a";
        let arrayBuffer = new ArrayBuffer(11);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--😊-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlSetCommentEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_6200
     * @tc.desc   Test the function of the Interface emoji  👤  \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0002";
      try {
        const emoji = "\ud83d\udc64";
        let arrayBuffer = new ArrayBuffer(11);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--👤-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_6300
     * @tc.desc   Test the function of the Interface emoji  👫  \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0003";
      try {
        const emoji = "\ud83d\udc6b";
        let arrayBuffer = new ArrayBuffer(11);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--👫-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_6400
     * @tc.desc   Test the function of the Interface emoji  ☎  \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0004";
      try {
        const emoji = "\u260e";
        let arrayBuffer = new ArrayBuffer(10);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--☎-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_6500
     * @tc.desc   Test the function of the Interface emoji  👹  \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0005";
      try {
        const emoji = "\ud83d\udc79";
        let arrayBuffer = new ArrayBuffer(11);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--👹-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_6600
     * @tc.desc   Test the function of the Interface emoji  🕛  \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0006";
      try {
        const emoji = "\ud83d\udd5b";
        let arrayBuffer = new ArrayBuffer(11);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--🕛-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_6700
     * @tc.desc   Test the function of the Interface emoji  🍏  \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0007";
      try {
        const emoji = "\ud83c\udf4f";
        let arrayBuffer = new ArrayBuffer(11);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--🍏-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_6800
     * @tc.desc   Test the function of the Interface emoji  🔃  \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0008";
      try {
        const emoji = "\ud83d\udd03";
        let arrayBuffer = new ArrayBuffer(11);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--🔃-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_6900
     * @tc.desc   Test the function of the Interface emoji  🍁  \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0009";
      try {
        const emoji = "\ud83c\udf41";
        let arrayBuffer = new ArrayBuffer(11);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--🍁-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_7000
     * @tc.desc   Test the function of the Interface emoji  ♦   \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0010";
      try {
        const emoji = "\u2666";
        let arrayBuffer = new ArrayBuffer(10);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--♦-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_7100
     * @tc.desc   Test the function of the Interface emoji  👈  \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0011";
      try {
        const emoji = "\ud83d\udc48";
        let arrayBuffer = new ArrayBuffer(11);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--👈-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testXmlSetCommentEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SetComment_Emoji_7200
     * @tc.desc   Test the function of the Interface emoji  🤼‍♂️ \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testXmlSetCommentEmoji0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentEmoji0012";
      try {
        const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
        let arrayBuffer = new ArrayBuffer(20);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(emoji);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!--🤼‍♂️-->')
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_7300
     * @tc.desc   Test the function of the interface setCDATA with input emoji \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0001";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('😊');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[😊]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_7400
     * @tc.desc   Test the function of the interface setCDATA with input emoji \ud83d\udc64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0002";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('👤');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[👤]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_7500
     * @tc.desc   Test the function of the interface setCDATA with input emoji \ud83d\udc6b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0003";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('👫');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[👫]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_7600
     * @tc.desc   Test the function of the interface setCDATA with input emoji \u260e.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0004";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('☎');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[☎]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_7700
     * @tc.desc   Test the function of the interface setCDATA with input emoji \ud83d\udc79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0005";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('👹');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[👹]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_7800
     * @tc.desc   Test the function of the interface setCDATA with input emoji \ud83d\udd5b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0006";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('🕛');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[🕛]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_7900
     * @tc.desc   Test the function of the interface setCDATA with input emoji \ud83c\udf4f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0007";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('🍏');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[🍏]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8000
     * @tc.desc   Test the function of the interface setCDATA with input emoji \ud83d\udd03.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0008";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('🔃');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[🔃]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8100
     * @tc.desc   Test the function of the interface setCDATA with input emoji \ud83c\udf41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0009";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('🍁');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[🍁]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8200
     * @tc.desc   Test the function of the interface setCDATA with input emoji \u2666 .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0010";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('♦');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[♦]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8300
     * @tc.desc   Test the function of the interface setCDATA with input emoji \ud83d\udc48 .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0011";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('👈');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[👈]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetCDATAEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8400
     * @tc.desc   Test the function of the interface setCDATA with input emoji  \ud83e\udd3c\u200d\u2642\ufe0f .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetCDATAEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetCDATAEmoji0012";
      try {
        let arrayBuffer = new ArrayBuffer(25);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('🤼‍♂️');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<![CDATA[🤼‍♂️]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8500
     * @tc.desc   Test the function of the interface setText with input emoji \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0001";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("😊");
        thatSer.setAttributes("😊", "😊");
        thatSer.setText("😊");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<😊 😊=\"😊\">😊</😊>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8600
     * @tc.desc   Test the function of the interface setText with input emoji \ud83d\udc64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0002";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("👤");
        thatSer.setAttributes("👤", "👤");
        thatSer.setText("👤");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<👤 👤=\"👤\">👤</👤>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8700
     * @tc.desc   Test the function of the interface setText with input emoji \ud83d\udc6b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0003";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("👫");
        thatSer.setAttributes("👫", "👫");
        thatSer.setText("👫");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<👫 👫=\"👫\">👫</👫>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8800
     * @tc.desc   Test the function of the interface setText with input emoji \u260e.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0004";
      try {
        let arrayBuffer = new ArrayBuffer(24);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("☎");
        thatSer.setAttributes("☎", "☎");
        thatSer.setText("☎");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<☎ ☎=\"☎\">☎</☎>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_8900
     * @tc.desc   Test the function of the interface setText with input emoji \ud83d\udc79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0005";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("👹");
        thatSer.setAttributes("👹", "👹");
        thatSer.setText("👹");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<👹 👹=\"👹\">👹</👹>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_9000
     * @tc.desc   Test the function of the interface setText with input emoji \ud83d\udd5b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0006";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("🕛");
        thatSer.setAttributes("🕛", "🕛");
        thatSer.setText("🕛");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🕛 🕛=\"🕛\">🕛</🕛>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_9100
     * @tc.desc   Test the function of the interface setText with input emoji \ud83c\udf4f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0007";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("🍏");
        thatSer.setAttributes("🍏", "🍏");
        thatSer.setText("🍏");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🍏 🍏=\"🍏\">🍏</🍏>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_9200
     * @tc.desc   Test the function of the interface setText with input emoji \ud83d\udd03.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0008";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("🔃");
        thatSer.setAttributes("🔃", "🔃");
        thatSer.setText("🔃");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🔃 🔃=\"🔃\">🔃</🔃>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_9300
     * @tc.desc   Test the function of the interface setText with input emoji \ud83c\udf41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0009";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("🍁");
        thatSer.setAttributes("🍁", "🍁");
        thatSer.setText("🍁");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🍁 🍁=\"🍁\">🍁</🍁>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_9400
     * @tc.desc   Test the function of the interface setText with input emoji \u2666 .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0010";
      try {
        let arrayBuffer = new ArrayBuffer(24);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("♦");
        thatSer.setAttributes("♦", "♦");
        thatSer.setText("♦");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<♦ ♦=\"♦\">♦</♦>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_9500
     * @tc.desc   Test the function of the interface setText with input emoji \ud83d\udc48 .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0011";
      try {
        let arrayBuffer = new ArrayBuffer(29);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("👈");
        thatSer.setAttributes("👈", "👈");
        thatSer.setText("👈");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<👈 👈=\"👈\">👈</👈>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlXmlSerializersetTextEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_XML_XMLSERIALIZER_EMOJI_9600
     * @tc.desc   Test the function of the interface setText with input emoji  \ud83e\udd3c\u200d\u2642\ufe0f .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlXmlSerializersetTextEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializersetTextEmoji0012";
      try {
        let arrayBuffer = new ArrayBuffer(74);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("🤼‍♂️");
        thatSer.setAttributes("🤼‍♂️", "🤼‍♂️");
        thatSer.setText("🤼‍♂️");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual("<🤼‍♂️ 🤼‍♂️=\"🤼‍♂️\">🤼‍♂️</🤼‍♂️>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testXml_setDocTypeEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_9700
     * @tc.desc   Testing the XML interface setDocType with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0001";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('😊');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 😊>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_9800
     * @tc.desc   Testing the XML interface setDocType with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0002";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('👤');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 👤>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_9900
     * @tc.desc   Testing the XML interface setDocType with input emoji  \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0003";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('👫');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 👫>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_10000
     * @tc.desc   Testing the XML interface setDocType with input emoji   \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0004";
      try {
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('☎');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE ☎>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_10100
     * @tc.desc   Testing the XML interface setDocType with input emoji  \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0005";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('👹');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 👹>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_10200
     * @tc.desc   Testing the XML interface setDocType with input emoji   \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0006";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('🕛');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 🕛>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_10300
     * @tc.desc   Testing the XML interface setDocType with input emoji  \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0007";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('🍏');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 🍏>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_10400
     * @tc.desc   Testing the XML interface setDocType with input emoji  \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0008";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('🔃');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 🔃>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_10500
     * @tc.desc   Testing the XML interface setDocType with input emoji  \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0009";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('🍁');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 🍁>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_10600
     * @tc.desc   Testing the XML interface setDocType with input emoji  \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0010";
      try {
        let arrayBuffer = new ArrayBuffer(14);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('♦');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE ♦>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_10700
     * @tc.desc   Testing the XML interface setDocType with input emoji   \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0011";
      try {
        let arrayBuffer = new ArrayBuffer(15);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('👈');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 👈>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_setDocTypeEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_setDocType_EMOJI_10800
     * @tc.desc   Testing the XML interface setDocType with input emoji   \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_setDocTypeEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_setDocTypeEmoji0012";
      try {
        let arrayBuffer = new ArrayBuffer(24);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('🤼‍♂️');
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result).assertEqual('<!DOCTYPE 🤼‍♂️>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_10900
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0001";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '😊');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_11000
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0002";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '👤');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_11100
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0003";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '👫');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_11200
     * @tc.desc   Testing the XML interface constructor with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0004";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '☎');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_11300
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0005";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '☎');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_11400
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0006";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '🕛');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_11500
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0007";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '🍏');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_11600
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0008";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '🔃');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_11700
     * @tc.desc   Testing the XML interface constructor with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0009";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '🍁');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_constructor_EMOJI_11800
     * @tc.desc   Testing the XML interface constructor with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0010";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '♦');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_Xml_constructor_EMOJI_11900
     * @tc.desc   Testing the XML interface constructor with input emoji  \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXml_constructorEmoji0011";
      try {

        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '👈');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
    /**
     * @tc.name   testXml_constructorEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Xml_constructor_EMOJI_12000
     * @tc.desc   Testing the XML interface constructor with input emoji  \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml_constructorEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "tesTXml_constructorEmoji0012";
      try {
        let strXml: string = '<title>Happy</title>';
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let arrBuffer: Uint8Array = textEncoder.encodeInto(strXml);
        let that: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, '🤼‍♂️');
        expect(that).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error.Just support utf-8')
      }
    });
  })
}