/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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


export default function XmlDynamicSerializerTest() {
  describe('XmlDynamicSerializerTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testSetDeclaration001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_00100
     * @tc.desc   Writes xml declaration with encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDeclaration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer('utf-8');
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDeclaration002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_00200
     * @tc.desc   Writes xml declaration with encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDeclaration002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer('utf-8');
      thatSer.setDeclaration();
      thatSer.startElement("note1");
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<note1/>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDeclaration003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_00300
     * @tc.desc   Writes xml declaration with encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDeclaration003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer('utf-8');
      thatSer.setDeclaration();
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<note importance1="high1"/>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDeclaration004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_00400
     * @tc.desc   Writes xml declaration with encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDeclaration004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer('utf-8');
      thatSer.setDeclaration();
      thatSer.setDocType('root SYSTEM');
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<!DOCTYPE root SYSTEM>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDeclaration005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_00500
     * @tc.desc   Writes xml declaration with encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDeclaration005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer('utf-8');
      thatSer.setDeclaration();
      thatSer.setComment("Hello, World!");
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<!--Hello, World!-->';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_00600
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartElement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note1");
      thatSer.endElement();
      let result = '<note1/>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_00700
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartElement002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note1");
      thatSer.endElement();
      thatSer.startElement("note2");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<note1/>\r\n<note2/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_00800
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartElement003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<note1>\r\n  <note2/>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_00900
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartElement004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.startElement("note3");
      thatSer.endElement();
      thatSer.endElement();
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<note1>\r\n  <note2>\r\n    <note3/>\r\n  </note2>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01000
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartElement005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.startElement("note3");
      thatSer.endElement();
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<note1>\r\n  <note2/>\r\n  <note3/>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01100
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.endElement();
      let result = '<note importance1="high1"/>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01200
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDeclaration();
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<note importance1="high1" importance2="high2"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01300
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setText("cat");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<note importance1="high1">cat</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01400
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDocType('root SYSTEM');
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setText("cat");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<!DOCTYPE root SYSTEM>\r\n<note importance1="high1">cat</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01500
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.endElement();
      thatSer.startElement("app");
      thatSer.setAttributes("importance1", "high1");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<note importance1="high1"/>\r\n<app importance1="high1"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01600
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.addEmptyElement("a");
      thatSer.endElement();
      let result = '<note>\r\n  <a/>\r\n</note>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01700
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.addEmptyElement("b");
      let arrayBuffer = thatSer.getOutput()
      let result = '<note/>\r\n<b/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01800
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.addEmptyElement("c");
      thatSer.startElement("note");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<c/>\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_01900
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.addEmptyElement("d");
      let arrayBuffer = thatSer.getOutput()
      let result = '<d/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02000
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.addEmptyElement("c");
      thatSer.addEmptyElement("d");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<note>\r\n  <c/>\r\n  <d/>\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetNamespace001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02100
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note xmlns:h="http://www.w3.org/TR/html4/"/>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetNamespace002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02200
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDeclaration();
      thatSer.setNamespace("b", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.setAttributes("a", "1")
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<b:note a="1" xmlns:b="http://www.w3.org/TR/html4/"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetNamespace003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02300
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDeclaration();
      thatSer.setNamespace("b", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.setAttributes("a", "1")
      thatSer.setText("cat")
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result =
        '<?xml version="1.0" encoding="utf-8"?>\r\n<b:note a="1" xmlns:b="http://www.w3.org/TR/html4/">cat</b:note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetNamespace004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02400
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
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
     * @tc.name   testSetNamespace005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02500
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setComment("Hello, World!");
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<!--Hello, World!-->\r\n<h:note xmlns:h="http://www.w3.org/TR/html4/"/>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02600
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setComment("Hi!");
      thatSer.endElement();
      let result = '<note>\r\n  <!--Hi!-->\r\n</note>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02700
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.setComment("Hello, World!");
      thatSer.startElement("cat");
      thatSer.endElement();
      let result = '<note/>\r\n<!--Hello, World!-->\r\n<cat/>';
      let arrayBuffer = thatSer.getOutput()
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02800
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setComment("Hello, World!");
      let arrayBuffer = thatSer.getOutput()
      let result = '<!--Hello, World!-->';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_02900
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setComment("Hello, World!");
      thatSer.startElement("note");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<!--Hello, World!-->\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03000
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDocType('root SYSTEM');
      thatSer.setComment("Hello, World!");
      let arrayBuffer = thatSer.getOutput()
      let result = '<!DOCTYPE root SYSTEM>\r\n<!--Hello, World!-->';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03100
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDocType('root SYSTEM');
      let result = '<!DOCTYPE root SYSTEM>';
      let arrayBuffer = thatSer.getOutput()
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03200
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      let arrayBuffer = thatSer.getOutput()
      let result = '<note/>\r\n<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03300
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput()
      let result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03400
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let result = '<note>\r\n  <!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03500
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.setAttributes("name", "cat");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n<note name="cat"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testsetCdata001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03600
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetCdata001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setCdata('root SYSTEM');
      let result = '<![CDATA[root SYSTEM]]>';
      let arrayBuffer = thatSer.getOutput();
      let view1 = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testsetCdata002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03700
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetCdata002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.setCdata('root SYSTEM "http://www.test.org/test.dtd"');
      let arrayBuffer = thatSer.getOutput();
      let result = '<note/>\r\n<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testsetCdata003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03800
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetCdata003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setCdata('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testsetCdata004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_03900
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetCdata004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setCdata('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let result = '<note>\r\n  <![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testsetCdata005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04000
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetCdata005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setCdata('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.setAttributes("name", "cat");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n<note name="cat"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04100
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setText("Happy1");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let result = '<note>Happy1</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04200
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy2");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let result = '<note importance="high">Happy2</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04300
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setComment("Hello, World!");
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy3");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let result = '<!--Hello, World!-->\r\n<note importance="high">Happy3</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04400
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setCdata('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.setText("Happy");
      thatSer.endElement()
      let arrayBuffer = thatSer.getOutput();
      let result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n<note>Happy</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04500
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.setText("Happy");
      thatSer.endElement()
      let arrayBuffer = thatSer.getOutput();
      let result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n<note>Happy</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXMLBoundaryValue001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04600
     * @tc.desc   set xml length with 0 and check serializer string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXMLBoundaryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      let arrayBuffer = thatSer.getOutput();
      let view1 = "";
      let result = "";
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < view.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testXMLBoundaryValue002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04700
     * @tc.desc   set xml length with max length and check serializer string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXMLBoundaryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      let max = 3000;
      let view1 = '';
      let result = '';
      for (let i = 0; i < max / 25; ++i) {
        thatSer.setNamespace("h", "aaa");
        thatSer.startElement("note");
        thatSer.endElement();
        result += '\r\n<h:note xmlns:h="aaa"/>'
      }
      let arrayBuffer = thatSer.getOutput();
      let view = new Uint8Array(arrayBuffer);
      for (let i = 0; i < view.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i].toInt());
      }
      let m = 0;
      for (let i = 0; i < max; ++i) {
        if (view1.charAt(i) == result.charAt(i)) {
          m++;
        }
      }
      expect(m).assertEqual(max);
    })


    /**
     * @tc.name   testXMLBoundaryValue003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04800
     * @tc.desc   set xml length over max length then check error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXMLBoundaryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      let max = 100000;
      let value = 10200062;
      let result = 0;
      for (let i = 0; i < max / 25; ++i) {
        thatSer.setNamespace("h", "aaa");
        thatSer.startElement("note");
        thatSer.endElement();
      }
      try {
        thatSer.startElement("note1");
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }

    })

    /**
     * @tc.name   testXmlBusinessError001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_04900
     * @tc.desc   the start element and the end element not match.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      let value = 10200065;
      thatSer.startElement("note");
      thatSer.endElement();
      try {
        thatSer.endElement();
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })

    /**
     * @tc.name   testXmlBusinessError002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05000
     * @tc.desc   the illegal position to set attributes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      let value = 10200063;
      thatSer.startElement("note");
      thatSer.endElement();
      try {
        thatSer.setAttributes("a", "b");
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })

    /**
     * @tc.name   testXmlBusinessError003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05100
     * @tc.desc   set empty name to attributes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let thatSer = new xml.XmlDynamicSerializer();
      let value = 10200064;
      thatSer.startElement("note");
      thatSer.endElement();
      try {
        thatSer.setAttributes("", "b");
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })

    /**
     * @tc.name   testXmlBusinessError004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XML_05200
     * @tc.desc   set error encode to xml.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let value = 10200066;
      try {
        let thatSer = new xml.XmlDynamicSerializer('utf-16');
      } catch (e) {
        e = e as BusinessError;
        expect(value).assertEqual(e.code);
      }
    })
  })
}