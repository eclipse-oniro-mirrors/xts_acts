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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import xml from '@ohos.xml'
import util from '@ohos.util'
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';


let str = "";
let strAttr = "";

export default function xmlTest1() {
  describe('xmlTest1', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testXml0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_0100
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_0200
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_0300
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_0400
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_0500
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_0600
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.endElement();
      let result = '<note1/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_0700
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.endElement();
      thatSer.startElement("note2");
      thatSer.endElement();
      let result = '<note1/>\r\n<note2/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_0800
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<note1>\r\n  <note2/>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_0900
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.startElement("note3");
      thatSer.endElement();
      thatSer.endElement();
      thatSer.endElement();
      let result = '<note1>\r\n  <note2>\r\n    <note3/>\r\n  </note2>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01000
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXml0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.startElement("note3");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<note1>\r\n  <note2/>\r\n  <note3/>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01100
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.endElement();
      let result = '<note importance1="high1"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01200
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.endElement();
      let result = '<note importance1="high1" importance2="high2"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01300
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.setAttributes("importance3", "high3");
      thatSer.endElement();
      let result = '<note importance1="high1" importance2="high2" importance3="high3"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01400
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.setAttributes("importance3", "high3");
      thatSer.setAttributes("importance4", "high4");
      thatSer.endElement();
      let result = '<note importance1="high1" importance2="high2" importance3="high3" importance4="high4"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01500
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.setAttributes("importance3", "high3");
      thatSer.setAttributes("importance5", "high5");
      thatSer.endElement();
      let result = '<note importance1="high1" importance2="high2" importance3="high3" importance5="high5"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01600
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01700
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.endElement();
      let result = '<note importance="high"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01800
     * @tc.desc   test xml method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("impo", "hi");
      thatSer.endElement();
      let result = '<note impo="hi"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01900
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<note1>\r\n  <note2/>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02000
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note2");
      thatSer.setAttributes("importance", "high");
      thatSer.endElement();
      let result = '<note2 importance="high"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02100
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy1");
      thatSer.endElement();
      let result = '<note importance="high">Happy1</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })


    /**
     * @tc.name   testXml0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02200
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy2");
      thatSer.endElement();
      let result = '<note importance="high">Happy2</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02300
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy3");
      thatSer.endElement();
      let result = '<note importance="high">Happy3</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02400
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy4");
      thatSer.endElement();
      let result = '<note importance="high">Happy4</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02500
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy5");
      thatSer.endElement();
      let result = '<note importance="high">Happy5</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02600
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.addEmptyElement("a");
      thatSer.endElement();
      let result = '<note>\r\n  <a/>\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02700
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.addEmptyElement("b");
      let result = '<note/>\r\n<b/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02800
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.addEmptyElement("c");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<c/>\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02900
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.addEmptyElement("d");
      let result = '<d/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03000
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.addEmptyElement("c");
      thatSer.addEmptyElement("d");
      thatSer.endElement();
      let result = '<note>\r\n  <c/>\r\n  <d/>\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03100
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note xmlns:h="http://www.w3.org/TR/html4/"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03200
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("b", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<b:note xmlns:b="http://www.w3.org/TR/html4/"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03300
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.111/");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note xmlns:h="http://www.111/"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03400
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note1 xmlns:h="http://www.w3.org/TR/html4/">' +
        '\r\n  <h:note2/>\r\n</h:note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03500
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note1 xmlns:h="http://www.w3.org/TR/html4/">' +
        '\r\n  <h:note2/>\r\n</h:note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03600
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setComment("Hi!");
      thatSer.endElement();
      let result = '<note>\r\n  <!--Hi!-->\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03700
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setComment("Hello, World!");
      thatSer.endElement();
      let result = '<note>\r\n  <!--Hello, World!-->\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03800
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setComment("Hello, World!");
      let result = '<!--Hello, World!-->';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03900
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setComment("Hello, World!");
      let result = '<!--Hello, World!-->';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04000
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setComment("Hello, World!");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<!--Hello, World!-->\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04100
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDocType('root SYSTEM');
      let result = '<!DOCTYPE root SYSTEM>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04200
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      let result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04300
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      let result = '<note/>\r\n<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04400
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04500
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.endElement();
      let result = '<note>\r\n  <!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04600
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setCDATA('root SYSTEM')
      let result = '<![CDATA[root SYSTEM]]>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04700
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
      let result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04800
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
      let result = '<note/>\r\n<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04900
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05000
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
      thatSer.endElement();
      let result = '<note>\r\n  <![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXml0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05100
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<!DOCTYPE note [\n<!ENTITY foo "baa">]>' +
          '<note importance="high" logged="true">' +
          '    <![CDATA[\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n]]>' +
          '    <!--Hello, World!-->' +
          '    <company>John &amp; Hans</company>' +
          '    <title>Happy</title>' +
          '    <title>Happy</title>' +
          '    <lens>Work</lens>' +
          '    <lens>Play</lens>' +
          '    <?go there?>' +
          '    <a><b/></a>' +
          '    <h:table xmlns:h="http://www.w3.org/TR/html4/">' +
          '        <h:tr>' +
          '            <h:td>Apples</h:td>' +
          '            <h:td>Bananas</h:td>' +
          '        </h:tr>' +
          '    </h:table>' +
          '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        str = ''
        let options: xml.ParseOptions =
          { supportDoctype: true, ignoreNameSpace: true, attributeValueCallbackFunction: func51 }
        that.parseXml(options);
        let str1 = 'importance:highlogged:truexmlns:h:http://www.w3.org/TR/html4/';
        expect(str).assertEqual(str1);
    })


    /**
     * @tc.name   testXml0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05200
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<!DOCTYPE note [\n<!ENTITY foo "baa">]>' +
          '<note importance="high" logged="true">' +
          '    <![CDATA[\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n]]>' +
          '    <!--Hello, World!-->' +
          '    <company>John &amp; Hans</company>' +
          '    <title>Happy</title>' +
          '    <title>Happy</title>' +
          '    <lens>Work</lens>' +
          '    <lens>Play</lens>' +
          '    <?go there?>' +
          '    <a><b/></a>' +
          '    <h:table xmlns:h="http://www.w3.org/TR/html4/">' +
          '        <h:tr>' +
          '            <h:td>Apples</h:td>' +
          '            <h:td>Bananas</h:td>' +
          '        </h:tr>' +
          '    </h:table>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = '';
      let options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func52 }
      that.parseXml(options);
      let str3 = '  note [\n<!ENTITY foo "baa">] note      ' +
        '\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n      Hello, World!      company John ' +
        '& Hans company      title Happy title      title Happy title      lens Work lens      ' +
        'lens Play lens      go there      a b b a      h:table          h:tr              h:td Apples h:td' +
        '              h:td Bananas h:td          h:tr      h:table note  ';
      expect(str).assertEqual(str3);
    })


    /**
     * @tc.name   testXml0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05300
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";
      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func53 }
      that.parseXml(options);
      let result = 'key:0 value:1  key:2 value:77  key:10 value:81  key:2 value:88  key:4 value:93  ' +
        'key:3 value:101  key:10 value:105  key:2 value:111  key:4 value:115  key:3 value:122  key:10 value:126  ' +
        'key:2 value:132  key:4 value:136  key:3 value:143  key:3 value:150  key:1 value:150  ';
      expect(str).assertEqual(result);
    })

    /**
     * @tc.name   testXml0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05400
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";
      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func54 }
      that.parseXml(options);
      let result = 'key:0 value:0  key:2 value:1  key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  ' +
        'key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  key:10 value:1  key:2 value:2  ' +
        'key:4 value:2  key:3 value:2  key:3 value:1  key:1 value:0  ';
      expect(str).assertEqual(result);
    })

    /**
     * @tc.name   testXml0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05500
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";
      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func55 }
      that.parseXml(options);
      let result = 'key:0 value:1  key:2 value:1  key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  ' +
        'key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  key:10 value:1  key:2 value:1  ' +
        'key:4 value:1  key:3 value:1  key:3 value:1  key:1 value:1  ';
      expect(str).assertEqual(result);
    })


    /**
     * @tc.name   testXml0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05600
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";
      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func56 }
      that.parseXml(options);
      let result = 'key:0 value:  key:2 value:note  key:10 value:  key:2 value:title  key:4 value:  ' +
        'key:3 value:title  key:10 value:  key:2 value:todo  key:4 value:  key:3 value:todo  key:10 value:  ' +
        'key:2 value:todo  key:4 value:  key:3 value:todo  key:3 value:note  key:1 value:  ';
      expect(str).assertEqual(result);
    })
    /**
     * @tc.name   testXml0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05700
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";

      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func57 }
      that.parseXml(options);
      let result = 'key:0 value:  key:2 value:  key:10 value:  key:2 value:  key:4 value:  key:3 value:  ' +
        'key:10 value:  key:2 value:  key:4 value:  key:3 value:  key:10 value:  key:2 value:  key:4 value:  ' +
        'key:3 value:  key:3 value:  key:1 value:  ';
      expect(str).assertEqual(result);
    })
    /**
     * @tc.name   testXml0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05800
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";
      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func58 }
      that.parseXml(options);
      let result = 'key:0 value:  key:2 value:  key:10 value:  key:2 value:  key:4 value:  key:3 value:  ' +
        'key:10 value:  key:2 value:  key:4 value:  key:3 value:  key:10 value:  key:2 value:  key:4 value:  ' +
        'key:3 value:  key:3 value:  key:1 value:  ';
      expect(str).assertEqual(result);
    })

    /**
     * @tc.name   testXml0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05900
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";
      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func59 }
      that.parseXml(options);
      let result = 'key:0 value:  key:2 value:  key:10 value:      key:2 value:  key:4 value:Happy  ' +
        'key:3 value:  key:10 value:      key:2 value:  key:4 value:Work  key:3 value:  key:10 value:      ' +
        'key:2 value:  key:4 value:Play  key:3 value:  key:3 value:  key:1 value:  ';
      expect(str).assertEqual(result);
    })
    /**
     * @tc.name   testXml0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06000
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";
      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func60 }
      that.parseXml(options);
      let result = 'key:0 value:false  key:2 value:false  key:10 value:false  key:2 value:false  ' +
        'key:4 value:false  key:3 value:false  key:10 value:false  key:2 value:false  key:4 value:false  ' +
        'key:3 value:false  key:10 value:false  key:2 value:false  key:4 value:false  key:3 value:false  ' +
        'key:3 value:false  key:1 value:false  ';
      expect(str).assertEqual(result);
    })
    /**
     * @tc.name   testXml0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06100
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";
      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func61 }
      that.parseXml(options);
      let result = 'key:0 value:true  key:2 value:false  key:10 value:true  key:2 value:true  ' +
        'key:4 value:false  key:3 value:true  key:10 value:true  key:2 value:true  key:4 value:false  ' +
        'key:3 value:true  key:10 value:true  key:2 value:true  key:4 value:false  key:3 value:true  ' +
        'key:3 value:true  key:1 value:true  ';
      expect(str).assertEqual(result);
    })
    /**
     * @tc.name   testXml0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06200
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";

      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func62 }
      that.parseXml(options);
      let result = 'key:0 value:0  key:2 value:2  key:10 value:0  key:2 value:0  key:4 value:0  ' +
        'key:3 value:0  key:10 value:0  key:2 value:0  key:4 value:0  key:3 value:0  key:10 value:0  ' +
        'key:2 value:0  key:4 value:0  key:3 value:0  key:3 value:0  key:1 value:0  ';
      expect(str).assertEqual(result);
    })
    /**
     * @tc.name   testXml0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06300
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Happy</title>' +
          '    <todo>Work</todo>' +
          '    <mess><![CDATA[This is a \r CDATA\n section]]></mess>' +
          '    <todo>Play</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";
      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func63 }
      that.parseXml(options);
      let result = 'This is a \r CDATA\n section';
      expect(str).assertEqual(result);
    })
    /**
     * @tc.name   testXml0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06400
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Hello\rWorld\n</title>' +
          '    <todo>Work\r\n</todo>' +
          '    <mess><![CDATA[This is a \r\n CDATA section]]></mess>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      str = "";

      let options: xml.ParseOptions =
        { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func64 }
      that.parseXml(options);
      let result = 'Hello\nWorld\nWork\nThis is a \r\n CDATA section';
      expect(str).assertEqual(result);
    })

    /**
     * @tc.name   testXml0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06500
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="hi&amp;gh" logged="&lt;true">' +
          '    <title>Hello&gt;World&apos;</title>' +
          '    <todo>Wo&quot;rk</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      strAttr = "";
      str = "";
      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeValueCallbackFunction: funcAttr65,
        tagValueCallbackFunction: func65
      }
      that.parseXml(options);
      let result = ' note      title Hello>World\' title      todo Wo"rk todo note  ';
      let resAttr = 'importance, hi&gh logged, <true ';
      expect(str).assertEqual(result);
      expect(strAttr).assertEqual(resAttr);
    })


    /**
     * @tc.name   testXml0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06600
     * @tc.desc   Gets the START_DOCUMENT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.START_DOCUMENT;
      expect(event).assertEqual(0)
    })

    /**
     * @tc.name   testXml0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06700
     * @tc.desc   Gets the END_DOCUMENT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.END_DOCUMENT;
      expect(event).assertEqual(1)
    })

    /**
     * @tc.name   testXml0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06800
     * @tc.desc   Gets the START_TAG of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.START_TAG;
      expect(event).assertEqual(2)
    })

    /**
     * @tc.name   testXml0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_06900
     * @tc.desc   Gets the END_TAG of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.END_TAG;
      expect(event).assertEqual(3)
    })

    /**
     * @tc.name   testXml0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_07000
     * @tc.desc   Gets the TEXT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.TEXT;
      expect(event).assertEqual(4)
    })

    /**
     * @tc.name   testXml0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_07100
     * @tc.desc   Gets the CDSECT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.CDSECT;
      expect(event).assertEqual(5)
    })

    /**
     * @tc.name   testXml0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_07200
     * @tc.desc   Gets the COMMENT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.COMMENT;
      expect(event).assertEqual(6)
    })

    /**
     * @tc.name   testXml0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_07300
     * @tc.desc   Gets the DOCDECL of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.DOCDECL;
      expect(event).assertEqual(7)
    })

    /**
     * @tc.name   testXml0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_07400
     * @tc.desc   Gets the INSTRUCTION of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.INSTRUCTION;
      expect(event).assertEqual(8)
    })

    /**
     * @tc.name   testXml0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_07500
     * @tc.desc   Gets the ENTITY_REFERENCE of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.ENTITY_REFERENCE;
      expect(event).assertEqual(9)
    })

    /**
     * @tc.name   testXml0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_07600
     * @tc.desc   Gets the WHITESPACE of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXml0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let event = xml.EventType.WHITESPACE;
      expect(event).assertEqual(10)
    })

  })
}


function func51(name: string, value: string): boolean {
  str += name + ':' + value;
  return true;
}

function func52(name: string, value: string): boolean {
  str += name + value + ' ';
  return true;
}

function func53(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key.valueOf() + ' value:' + value.getColumnNumber() + '  ';
  return true;
}

function func54(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key + ' value:' + value.getDepth() + '  ';
  return true;
}

function func55(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key + ' value:' + value.getLineNumber() + '  ';
  return true;
}

function func56(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key + ' value:' + value.getName() + '  ';
  return true;
}

function func57(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key + ' value:' + value.getNamespace() + '  ';
  return true;
}

function func58(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key + ' value:' + value.getPrefix() + '  ';
  return true;
}

function func59(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key + ' value:' + value.getText() + '  ';
  return true;
}

function func60(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key + ' value:' + value.isEmptyElementTag() + '  ';
  return true;
}

function func61(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key + ' value:' + value.isWhitespace() + '  ';
  return true;
}

function func62(key: xml.EventType, value: xml.ParseInfo): boolean {
  str += 'key:' + key + ' value:' + value.getAttributeCount() + '  ';
  return true;
}

function func63(key: xml.EventType, value: xml.ParseInfo): boolean {
  if (key === 5) {
    str += value.getText();
  }
  return true;
}

function func64(key: xml.EventType, value: xml.ParseInfo): boolean {
  if (key === 4 || key === 5) {
    str += value.getText();
  }
  return true;
}

function funcAttr65(name: string, value: string): boolean {
  strAttr += name + ', ' + value + ' ';
  return true;
}

function func65(name: string, value: string): boolean {
  str += name + value + ' ';
  return true;
}



