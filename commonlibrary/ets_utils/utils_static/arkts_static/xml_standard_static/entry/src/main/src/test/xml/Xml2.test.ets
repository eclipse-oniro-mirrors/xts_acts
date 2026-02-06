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

export default function xmlTest2() {
  describe('xmlTest2', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_0100
     * @tc.name: testXmlMethod001
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello>World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&gt;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_0200
     * @tc.name: testXmlMethod002
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello<World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&lt;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_0300
     * @tc.name: testXmlMethod003
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello&World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&amp;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_0400
     * @tc.name: testXmlMethod004
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello'World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&apos;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_0500
     * @tc.name: testXmlMethod005
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello\"World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&quot;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_0600
     * @tc.name: testXmlMethod006
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>' +
            '<note importance="high" logged="true">' +
            '<company>John &amp; Hans</company>' +
            '<tod<xml version="1.0" encoding="UTF-8"?><note importance="high" logged="true"></note>' +
            '</note>';
        let textec = new util.TextEncoder()
        let uint8 = textec.encodeInto(strXml);
        let that = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
        str = ''
        let options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func6 }
        that.parseXml(options);
        expect().assertFail();
      } catch (e : BusinessError | Error) {
        expect(e.toString()).assertEqual("BusinessError: The node name contains invalid characters: <");
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_0700
     * @tc.name: testXmlMethod007
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello>World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&gt;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_0800
     * @tc.name: testXmlMethod008
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello<World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&lt;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_0900
     * @tc.name: testXmlMethod009
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello&World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&amp;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01000
     * @tc.name: testXmlMethod010
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello\'World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&apos;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01100
     * @tc.name: testXmlMethod011
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello"World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&quot;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01200
     * @tc.name: testXmlMethod012
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA(']]>')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[]]]]><![CDATA[>]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01300
     * @tc.name: testXmlMethod013
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA('<![CDATA[]]>')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[<![CDATA[]]]]><![CDATA[>]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01400
     * @tc.name: testXmlMethod014
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA('fun() {if (a < b) return;}')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[fun() {if (a < b) return;}]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01500
     * @tc.name: testXmlMethod015
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA('fun() {if (a && b) return;}')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[fun() {if (a && b) return;}]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01600
     * @tc.name: testXmlMethod016
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA('fun() {if (a == \'xml\') return;}')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[fun() {if (a == \'xml\') return;}]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01700
     * @tc.name: testXmlMethod017
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>' +
          '<note importance="high" logged="true">' +
          '<company><![CDATA[SYSTEM</company>' +
          '<todo>work</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      str = '';
      let options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func17 }
      try {
        pullParse.parseXml(options);
        expect().assertFail();
      } catch (e: BusinessError) {
        expect(e.toString()).assertEqual("BusinessError: Cannot find the ']]>' in xml string.");
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01800
     * @tc.name: testXmlMethod018
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>' +
          '<note importance="high" logged="true">' +
          '<company><![CDATA[';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      str = '';
      let options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func18 }
      try {
        pullParse.parseXml(options);
        expect().assertFail();
      } catch (e: BusinessError) {
        expect(e.toString()).assertEqual("BusinessError: Cannot find the ']]>' in xml string.");
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_01900
     * @tc.name: testXmlMethod019
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '<title>Happy</title>' +
          '<?go there' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      str = '';
      let options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func19 }
      try {
        pullParse.parseXml(options);
        expect().assertFail();
      } catch (e: BusinessError) {
        expect(e.toString()).assertEqual("BusinessError: Cannot find the '?>' in xml string.");
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_02000
     * @tc.name: testXmlMethod020
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '<title>Happy</title>' +
          '<?go there';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      str = '';
      let options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func20 }
      try {
        pullParse.parseXml(options);
        expect().assertFail();
      } catch (e: BusinessError) {
        expect(e.toString()).assertEqual("BusinessError: Cannot find the '?>' in xml string.");
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XMLMETHOD_02100
     * @tc.name: testXmlMethod021
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlMethod021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '<title>Happy</title>' +
          '<!--comment' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      str = '';
      let options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func21 }
      try {
        pullParse.parseXml(options);
        expect().assertFail();
      } catch (e: BusinessError) {
        expect(e.toString()).assertEqual("BusinessError: Cannot find the '--' in xml string.");
        expect(e.code).assertEqual(401);
      }
    })
  })
}


function func6(name: string, value: string): boolean {
  str += name + value;
  return true;
}

function func17(name: string, value: string): boolean {
  str += name + value;
  return true;
}

function func18(name: string, value: string): boolean {
  str += name + value;
  return true;
}

function func19(name: string, value: string): boolean {
  str += name + value;
  return true;
}

function func20(name: string, value: string): boolean {
  str += name + value;
  return true;
}

function func21(name: string, value: string): boolean {
  str += name + value;
  return true;
}
