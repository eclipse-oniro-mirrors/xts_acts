/*
* Copyright (C) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import { util, xml } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';

export default function DynamicXmlSerializerTest2() {
  describe('DynamicXmlSerializerTest2', (): void => {
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(10)
    })

    /**
     * @tc.name   testDynamicConstructor001
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_0100
     * @tc.desc   Test XmlDynamicSerializer constructor with encoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer('utf-8');
      expect(serializer != null).assertTrue();
    })

    /**
     * @tc.name   testDynamicConstructor002
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_0200
     * @tc.desc   Test XmlDynamicSerializer constructor without encoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      expect(serializer != null).assertTrue();
    })

    /**
     * @tc.name   testGetOutput001
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_0300
     * @tc.desc   Test getOutput returns ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOutput001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.setText("Happy");
      serializer.endElement();
      let arrayBuffer = serializer.getOutput();
      expect(arrayBuffer != null).assertTrue();
      expect(arrayBuffer instanceof ArrayBuffer).assertTrue();
    })

    /**
     * @tc.name   testGetOutput002
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_0400
     * @tc.desc   Test getOutput with TextDecoder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOutput002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.setText("Happy");
      serializer.endElement();
      let arrayBuffer = serializer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let decoder = util.TextDecoder.create();
      let result = decoder.decodeToString(uint8);
      expect(result).assertEqual('<note>Happy</note>');
    })

    /**
     * @tc.name   testDynamicSetDeclaration002
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_0500
     * @tc.desc   Test setDeclaration at different positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicSetDeclaration002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      try {
        serializer.setDeclaration();
      } catch (e) {
        e = e as BusinessError;
        expect(e.code).assertEqual(10200063)
      }
    })

    /**
     * @tc.name   testDynamicEndElement001
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_0600
     * @tc.desc   Test endElement in XmlDynamicSerializer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicEndElement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.setText("Hello");
      serializer.endElement();
      let arrayBuffer = serializer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let decoder = util.TextDecoder.create();
      let result = decoder.decodeToString(uint8);
      expect(result).assertEqual('<note>Hello</note>');
    })

    /**
     * @tc.name   testDynamicSetAttributes002
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_0700
     * @tc.desc   Test setAttributes with special characters in value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicSetAttributes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.setAttributes("attr", "value<>&\"'");
      serializer.endElement();
      let arrayBuffer = serializer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let decoder = util.TextDecoder.create();
      let result = decoder.decodeToString(uint8);
      expect(result).assertEqual('<note attr="value&lt;&gt;&amp;&quot;&apos;"/>');
    })

    /**
     * @tc.name   testDynamicSetNamespace002
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_0800
     * @tc.desc   Test setNamespace with nested elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicSetNamespace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.setNamespace("h", "http://www.w3.org/TR/html4/");
      serializer.startElement("parent");
      serializer.startElement("child");
      serializer.endElement();
      serializer.endElement();
      let arrayBuffer = serializer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let decoder = util.TextDecoder.create();
      let result = decoder.decodeToString(uint8);
      expect(result.length).assertEqual(77);
    })

    /**
     * @tc.name   testDynamicSetCdata001
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_0900
     * @tc.desc   Test setCdata in XmlDynamicSerializer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicSetCdata001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.setCdata('This is CDATA content with special chars: < & > " \'');
      let arrayBuffer = serializer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let decoder = util.TextDecoder.create();
      let result = decoder.decodeToString(uint8);
      expect(result).assertEqual('<![CDATA[This is CDATA content with special chars: < & > " \']]>');
    })

    /**
     * @tc.name   testDynamicSetText002
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_1000
     * @tc.desc   Test setText with special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicSetText002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.setText("Text with < & > \" \' special chars");
      serializer.endElement();
      let arrayBuffer = serializer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let decoder = util.TextDecoder.create();
      let result = decoder.decodeToString(uint8);
      expect(result).assertEqual('<note>Text with &lt; &amp; &gt; &quot; &apos; special chars</note>');
    })

    /**
     * @tc.name   testDynamicComplexXml001
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_1100
     * @tc.desc   Test complex XML generation with XmlDynamicSerializer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicComplexXml001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.setDeclaration();
      serializer.setComment("Root comment");
      serializer.startElement("root");
      serializer.setAttributes("version", "1.0");
      serializer.startElement("child1");
      serializer.setText("Content 1");
      serializer.endElement();
      serializer.addEmptyElement("emptyChild");
      serializer.startElement("child2");
      serializer.setAttributes("id", "123");
      serializer.setCdata("Data with <special>");
      serializer.endElement();
      serializer.endElement();
      let arrayBuffer = serializer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let decoder = util.TextDecoder.create();
      let result = decoder.decodeToString(uint8);
      let expected = '<?xml version="1.0" encoding="utf-8"?>\r\n<!--Root comment-->' +
        '\r\n<root version="1.0">\r\n  <child1>Content 1</child1>\r\n  ' +
        '<emptyChild/>\r\n  <child2 id="123">\r\n    <![CDATA[Data with <special>]]>\r\n  </child2>\r\n</root>';
      expect(result).assertEqual(expected);
    })

    /**
     * @tc.name   testDynamicError003
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_1200
     * @tc.desc   Test empty string error in addEmptyElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.endElement();
      let value = 10200064;
      try {
        serializer.addEmptyElement("");
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })

    /**
     * @tc.name   testDynamicError004
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_1300
     * @tc.desc   Test empty string error in startElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.endElement();
      let value = 10200064;
      try {
        serializer.startElement("");
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })

    /**
     * @tc.name   testDynamicError005
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_1400
     * @tc.desc   Test empty string error in setText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.endElement();
      let value = 10200064;
      try {
        serializer.setText("");
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })

    /**
     * @tc.name   testDynamicError006
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_1500
     * @tc.desc   Test empty string error in setCdata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.endElement();
      let value = 10200064;
      try {
        serializer.setCdata("");
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })

    /**
     * @tc.name   testDynamicError007
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_1600
     * @tc.desc   Test empty string error in setDocType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.endElement();
      let value = 10200064;
      try {
        serializer.setDocType("");
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })

    /**
     * @tc.name   testDynamicError008
     * @tc.number SUB_COMMONLIBRARY_UTIL_XML_1700
     * @tc.desc   Test empty string error in setNamespace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let serializer = new xml.XmlDynamicSerializer();
      serializer.startElement("note");
      serializer.endElement();
      let value = 10200064;
      try {
        serializer.setNamespace("", "http://www.w3.org");
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })
  })
}
