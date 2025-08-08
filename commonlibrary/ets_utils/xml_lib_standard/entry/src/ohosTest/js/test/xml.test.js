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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import xml from '@ohos.xml'
import util from '@ohos.util'
export default function XmlSerializerXmlPullParserTest() {
describe('XmlSerializerXmlPullParserTest', function () {

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_00100
     * @tc.name: testSetDeclaration001
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDeclaration001', 0, function () {
        var arrayBuffer = new ArrayBuffer(2048);
        var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
        thatSer.setDeclaration();
        var result = '<?xml version="1.0" encoding="utf-8"?>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_00200
     * @tc.name: testSetDeclaration002
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDeclaration002', 0, function () {
        var arrayBuffer = new ArrayBuffer(2048);
        var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
        thatSer.setDeclaration();
        var result = '<?xml version="1.0" encoding="utf-8"?>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_00300
     * @tc.name: testSetDeclaration003
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDeclaration003', 0, function () {
        var arrayBuffer = new ArrayBuffer(2048);
        var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
        thatSer.setDeclaration();
        var result = '<?xml version="1.0" encoding="utf-8"?>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_00400
     * @tc.name: testSetDeclaration004
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDeclaration004', 0, function () {
        var arrayBuffer = new ArrayBuffer(2048);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        var result = '<?xml version="1.0" encoding="utf-8"?>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_00500
     * @tc.name: testSetDeclaration005
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDeclaration005', 0, function () {
        var arrayBuffer = new ArrayBuffer(2048);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        var result = '<?xml version="1.0" encoding="utf-8"?>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_00600
     * @tc.name: testStartElement001
     * @tc.desc: Writes an elemnet start tag with the given name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testStartElement001', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note1");
        thatSer.endElement();
        var result = '<note1/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_00700
     * @tc.name: testStartElement002
     * @tc.desc: Writes an elemnet start tag with the given name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testStartElement002', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note1");
        thatSer.endElement();
        thatSer.startElement("note2");
        thatSer.endElement();
        var result = '<note1/>\r\n<note2/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_00800
     * @tc.name: testStartElement003
     * @tc.desc: Writes an elemnet start tag with the given name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testStartElement003', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note1");
        thatSer.startElement("note2");
        thatSer.endElement();
        thatSer.endElement();
        var result = '<note1>\r\n  <note2/>\r\n</note1>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_00900
     * @tc.name: testStartElement004
     * @tc.desc: Writes an elemnet start tag with the given name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testStartElement004', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note1");
        thatSer.startElement("note2");
        thatSer.startElement("note3");
        thatSer.endElement();
        thatSer.endElement();
        thatSer.endElement();
        var result = '<note1>\r\n  <note2>\r\n    <note3/>\r\n  </note2>\r\n</note1>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01000
     * @tc.name: testStartElement005
     * @tc.desc: Writes an elemnet start tag with the given name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testStartElement005', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note1");
        thatSer.startElement("note2");
        thatSer.endElement();
        thatSer.startElement("note3");
        thatSer.endElement();
        thatSer.endElement();
        var result = '<note1>\r\n  <note2/>\r\n  <note3/>\r\n</note1>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01100
     * @tc.name: testSetAttributes001
     * @tc.desc: Write an attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes001', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance1", "high1");
        thatSer.endElement();
        var result = '<note importance1="high1"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01200
     * @tc.name: testSetAttributes002
     * @tc.desc: Write an attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes002', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance1", "high1");
        thatSer.setAttributes("importance2", "high2");
        thatSer.endElement();
        var result = '<note importance1="high1" importance2="high2"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01300
     * @tc.name: testSetAttributes003
     * @tc.desc: Write an attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes003', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance1", "high1");
        thatSer.setAttributes("importance2", "high2");
        thatSer.setAttributes("importance3", "high3");
        thatSer.endElement();
        var result = '<note importance1="high1" importance2="high2" importance3="high3"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01400
     * @tc.name: testSetAttributes004
     * @tc.desc: Write an attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes004', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance1", "high1");
        thatSer.setAttributes("importance2", "high2");
        thatSer.setAttributes("importance3", "high3");
        thatSer.setAttributes("importance4", "high4");
        thatSer.endElement();
        var result = '<note importance1="high1" importance2="high2" importance3="high3" importance4="high4"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01500
     * @tc.name: testSetAttributes005
     * @tc.desc: Write an attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes005', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance1", "high1");
        thatSer.setAttributes("importance2", "high2");
        thatSer.setAttributes("importance3", "high3");
        thatSer.setAttributes("importance5", "high5");
        thatSer.endElement();
        var result = '<note importance1="high1" importance2="high2" importance3="high3" importance5="high5"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01600
     * @tc.name: testEndElement001
     * @tc.desc: Writes end tag of the element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEndElement001', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.endElement();
        var result = '<note/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01700
     * @tc.name: testEndElement002
     * @tc.desc: Writes end tag of the element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEndElement002', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "high");
        thatSer.endElement();
        var result = '<note importance="high"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01800
     * @tc.name: testEndElement003
     * @tc.desc: Writes end tag of the element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEndElement003', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("impo", "hi");
        thatSer.endElement();
        var result = '<note impo="hi"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_01900
     * @tc.name: testEndElement004
     * @tc.desc: Writes end tag of the element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEndElement004', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note1");
        thatSer.startElement("note2");
        thatSer.endElement();
        thatSer.endElement();
        var result = '<note1>\r\n  <note2/>\r\n</note1>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02000
     * @tc.name: testEndElement005
     * @tc.desc: Writes end tag of the element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEndElement005', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note2");
        thatSer.setAttributes("importance", "high");
        thatSer.endElement();
        var result = '<note2 importance="high"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02100
     * @tc.name: testSetText001
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText001', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "high");
        thatSer.setText("Happy1");
        thatSer.endElement();
        var result = '<note importance="high">Happy1</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02200
     * @tc.name: testSetText002
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText002', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "high");
        thatSer.setText("Happy2");
        thatSer.endElement();
        var result = '<note importance="high">Happy2</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02300
     * @tc.name: testSetText003
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText003', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "high");
        thatSer.setText("Happy3");
        thatSer.endElement();
        var result = '<note importance="high">Happy3</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02400
     * @tc.name: testSetText004
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText004', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "high");
        thatSer.setText("Happy4");
        thatSer.endElement();
        var result = '<note importance="high">Happy4</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02500
     * @tc.name: testSetText005
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText005', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "high");
        thatSer.setText("Happy5");
        thatSer.endElement();
        var result = '<note importance="high">Happy5</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02600
     * @tc.name: testAddEmptyElement001
     * @tc.desc: Add an empty element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAddEmptyElement001', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.addEmptyElement("a");
        thatSer.endElement();
        var result = '<note>\r\n  <a/>\r\n</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02700
     * @tc.name: testAddEmptyElement002
     * @tc.desc: Add an empty element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAddEmptyElement002', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.endElement();
        thatSer.addEmptyElement("b");
        var result = '<note/>\r\n<b/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02800
     * @tc.name: testAddEmptyElement003
     * @tc.desc: Add an empty element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAddEmptyElement003', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("c");
        thatSer.startElement("note");
        thatSer.endElement();
        var result = '<c/>\r\n<note/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_02900
     * @tc.name: testAddEmptyElement004
     * @tc.desc: Add an empty element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAddEmptyElement004', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("d");
        var result = '<d/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03000
     * @tc.name: testAddEmptyElement005
     * @tc.desc: Add an empty element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAddEmptyElement005', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.addEmptyElement("c");
        thatSer.addEmptyElement("d");
        thatSer.endElement();
        var result = '<note>\r\n  <c/>\r\n  <d/>\r\n</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03100
     * @tc.name: testSetNamespace001
     * @tc.desc: Writes the namespace of the current element tag.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetNamespace001', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
        thatSer.startElement("note");
        thatSer.endElement();
        var result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note xmlns:h="http://www.w3.org/TR/html4/"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03200
     * @tc.name: testSetNamespace002
     * @tc.desc: Writes the namespace of the current element tag.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetNamespace002', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        thatSer.setNamespace("b", "http://www.w3.org/TR/html4/");
        thatSer.startElement("note");
        thatSer.endElement();
        var result = '<?xml version="1.0" encoding="utf-8"?>\r\n<b:note xmlns:b="http://www.w3.org/TR/html4/"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03300
     * @tc.name: testSetNamespace003
     * @tc.desc: Writes the namespace of the current element tag.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetNamespace003', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        thatSer.setNamespace("h", "http://www.111/");
        thatSer.startElement("note");
        thatSer.endElement();
        var result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note xmlns:h="http://www.111/"/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03400
     * @tc.name: testSetNamespace004
     * @tc.desc: Writes the namespace of the current element tag.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetNamespace004', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
        thatSer.startElement("note1");
        thatSer.startElement("note2");
        thatSer.endElement();
        thatSer.endElement();
        var result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note1 xmlns:h="http://www.w3.org/TR/html4/">' +
        '\r\n  <h:note2/>\r\n</h:note1>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03500
     * @tc.name: testSetNamespace005
     * @tc.desc: Writes the namespace of the current element tag.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetNamespace005', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
        thatSer.startElement("note1");
        thatSer.startElement("note2");
        thatSer.endElement();
        thatSer.endElement();
        var result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note1 xmlns:h="http://www.w3.org/TR/html4/">' +
        '\r\n  <h:note2/>\r\n</h:note1>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03600
     * @tc.name: testSetComment001
     * @tc.desc: Writes the comment.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetComment001', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setComment("Hi!");
        thatSer.endElement();
        var result = '<note>\r\n  <!--Hi!-->\r\n</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03700
     * @tc.name: testSetComment002
     * @tc.desc: Writes the comment.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetComment002', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setComment("Hello, World!");
        thatSer.endElement();
        var result = '<note>\r\n  <!--Hello, World!-->\r\n</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03800
     * @tc.name: testSetComment003
     * @tc.desc: Writes the comment.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetComment003', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment("Hello, World!");
        var result = '<!--Hello, World!-->';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_03900
     * @tc.name: testSetComment004
     * @tc.desc: Writes the comment.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetComment004', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment("Hello, World!");
        var result = '<!--Hello, World!-->';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04000
     * @tc.name: testSetComment005
     * @tc.desc: Writes the comment.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetComment005', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment("Hello, World!");
        thatSer.startElement("note");
        thatSer.endElement();
        var result = '<!--Hello, World!-->\r\n<note/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04100
     * @tc.name: testSetDocType001
     * @tc.desc: Writes the DOCTYPE.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDocType001', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('root SYSTEM');
        var result = '<!DOCTYPE root SYSTEM>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04200
     * @tc.name: testSetDocType002
     * @tc.desc: Writes the DOCTYPE.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDocType002', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
        var result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04300
     * @tc.name: testSetDocType003
     * @tc.desc: Writes the DOCTYPE.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDocType003', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.endElement();
        thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
        var result = '<note/>\r\n<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04400
     * @tc.name: testSetDocType004
     * @tc.desc: Writes the DOCTYPE.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDocType004', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
        thatSer.startElement("note");
        thatSer.endElement();
        var result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n<note/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04500
     * @tc.name: testSetDocType005
     * @tc.desc: Writes the DOCTYPE.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetDocType005', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
        thatSer.endElement();
        var result = '<note>\r\n  <!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04600
     * @tc.name: testSetCDATA001
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA001', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('root SYSTEM')
        var result = '<![CDATA[root SYSTEM]]>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04700
     * @tc.name: testSetCDATA002
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA002', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
        var result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04800
     * @tc.name: testSetCDATA003
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA003', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.endElement();
        thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
        var result = '<note/>\r\n<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_04900
     * @tc.name: testSetCDATA004
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA004', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
        thatSer.startElement("note");
        thatSer.endElement();
        var result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n<note/>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05000
     * @tc.name: testSetCDATA005
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA005', 0, function () {
        const myMAX = 2048;
        var arrayBuffer = new ArrayBuffer(myMAX);
        var thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
        thatSer.endElement();
        var result = '<note>\r\n  <![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n</note>';
        var view = new Uint8Array(arrayBuffer);
        var view1 = "";
        for (var i = 0; i < result.length; ++i) {
            view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05100
     * @tc.name: testParse001
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse001', 0, function () {
        var strXml =
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
        let that = new xml.XmlPullParser(arrbuffer.buffer, 'UTF-8');
        var str = '';
        function func2(name, value){
            str += name+':'+value;
            return true;
        }
        var options = {supportDoctype:true, ignoreNameSpace:true, attributeValueCallbackFunction:func2}
        that.parse(options);
        var str1= 'importance:highlogged:truexmlns:h:http://www.w3.org/TR/html4/';
        expect(str).assertEqual(str1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05200
     * @tc.name: testParse002
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse002', 0, function () {
        var strXml =
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
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        var str1 = '';
        function func1(name, value){
            str1 += name + value + ' ';
            return true;
        }
        var options = {supportDoctype:true, ignoreNameSpace:true, tagValueCallbackFunction:func1}
        that.parse(options);
        var str3 = '  note [\n<!ENTITY foo "baa">] note      ' +
            '\\r\\nfuncrion matchwo(a,6)\\r\\n{\\r\\nreturn 1;\\r\\n}\\r\\n      Hello, World!      company John ' +
            '& Hans company      title Happy title      title Happy title      lens Work lens      ' + 
            'lens Play lens      go there      a b b a      h:table          h:tr              h:td Apples h:td' + 
            '              h:td Bananas h:td          h:tr      h:table note  ';
        expect(str1).assertEqual(str3);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05300
     * @tc.name: testParse003
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse003', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:' + key + ' value:'+ value.getColumnNumber() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:1  key:2 value:77  key:10 value:81  key:2 value:88  key:4 value:93  ' +
        'key:3 value:101  key:10 value:105  key:2 value:111  key:4 value:115  key:3 value:122  key:10 value:126  ' +
        'key:2 value:132  key:4 value:136  key:3 value:143  key:3 value:150  key:1 value:150  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05400
     * @tc.name: testParse004
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse004', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:' + key + ' value:'+ value.getDepth() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:0  key:2 value:1  key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  ' +
        'key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  key:10 value:1  key:2 value:2  ' +
        'key:4 value:2  key:3 value:2  key:3 value:1  key:1 value:0  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05500
     * @tc.name: testParse005
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse005', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:'+ key + ' value:' + value.getLineNumber() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:1  key:2 value:1  key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  ' +
        'key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  key:10 value:1  key:2 value:1  ' +
        'key:4 value:1  key:3 value:1  key:3 value:1  key:1 value:1  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05600
     * @tc.name: testParse006
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse006', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:' + key + ' value:' + value.getName() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:  key:2 value:note  key:10 value:  key:2 value:title  key:4 value:  ' +
        'key:3 value:title  key:10 value:  key:2 value:todo  key:4 value:  key:3 value:todo  key:10 value:  ' +
        'key:2 value:todo  key:4 value:  key:3 value:todo  key:3 value:note  key:1 value:  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05700
     * @tc.name: testParse007
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse007', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:' + key + ' value:'+ value.getNamespace() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:  key:2 value:  key:10 value:  key:2 value:  key:4 value:  key:3 value:  ' +
        'key:10 value:  key:2 value:  key:4 value:  key:3 value:  key:10 value:  key:2 value:  key:4 value:  ' +
        'key:3 value:  key:3 value:  key:1 value:  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05800
     * @tc.name: testParse008
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse008', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:'+key+' value:'+ value.getPrefix() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:  key:2 value:  key:10 value:  key:2 value:  key:4 value:  key:3 value:  ' +
        'key:10 value:  key:2 value:  key:4 value:  key:3 value:  key:10 value:  key:2 value:  key:4 value:  ' +
        'key:3 value:  key:3 value:  key:1 value:  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_05900
     * @tc.name: testParse009
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse009', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:' + key +' value:' + value.getText() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:  key:2 value:  key:10 value:      key:2 value:  key:4 value:Happy  ' +
        'key:3 value:  key:10 value:      key:2 value:  key:4 value:Work  key:3 value:  key:10 value:      ' +
        'key:2 value:  key:4 value:Play  key:3 value:  key:3 value:  key:1 value:  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06000
     * @tc.name: testParse010
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse010', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:' + key +' value:' + value.isEmptyElementTag() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:false  key:2 value:false  key:10 value:false  key:2 value:false  ' +
        'key:4 value:false  key:3 value:false  key:10 value:false  key:2 value:false  key:4 value:false  ' +
        'key:3 value:false  key:10 value:false  key:2 value:false  key:4 value:false  key:3 value:false  ' +
        'key:3 value:false  key:1 value:false  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06100
     * @tc.name: testParse011
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse011', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:' + key +' value:' + value.isWhitespace() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:true  key:2 value:false  key:10 value:true  key:2 value:true  ' +
        'key:4 value:false  key:3 value:true  key:10 value:true  key:2 value:true  key:4 value:false  ' +
        'key:3 value:true  key:10 value:true  key:2 value:true  key:4 value:false  key:3 value:true  ' +
        'key:3 value:true  key:1 value:true  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06200
     * @tc.name: testParse012
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse012', 0, function () {
        let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          str += 'key:' + key +' value:' + value.getAttributeCount() + '  ';
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'key:0 value:0  key:2 value:2  key:10 value:0  key:2 value:0  key:4 value:0  ' +
        'key:3 value:0  key:10 value:0  key:2 value:0  key:4 value:0  key:3 value:0  key:10 value:0  ' +
        'key:2 value:0  key:4 value:0  key:3 value:0  key:3 value:0  key:1 value:0  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06300
     * @tc.name: testParse013
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse013', 0, function () {
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
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value){
          if ( key === 5) {
            str += value.getText();
          }
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'This is a \\r CDATA\\n section';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06400
     * @tc.name: testParse014
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse014', 0, function () {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <title>Hello\rWorld\n</title>' +
          '    <todo>Work\r\n</todo>' +
          '    <mess><![CDATA[This is a \r\n CDATA section]]></mess>' +
          '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let str = "";
        function func(key, value) {
          if (key === 4 || key === 5) {
            str += value.getText();
          }
          return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parse(options);
        let result = 'Hello\nWorld\nWork\nThis is a \\r\\n CDATA section';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06500
     * @tc.name: testParse015
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParse015', 0, function () {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="hi&amp;gh" logged="&lt;true">' +
          '    <title>Hello&gt;World&apos;</title>' +
          '    <todo>Wo&quot;rk</todo>' +
          '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer);
        let strAttr = "";
        let str = "";
        function funcAttr(name, value) {
            strAttr += name + ', ' + value + ' ';
            return true;
        }
        function func(name, value) {
            str += name + value + ' ';
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, attributeValueCallbackFunction: funcAttr,
          tagValueCallbackFunction:func}
        that.parse(options);
        let result = ' note      title Hello>World\' title      todo Wo"rk todo note  ';
        let resAttr = 'importance, hi&gh logged, <true ';
        expect(str).assertEqual(result);
        expect(strAttr).assertEqual(resAttr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06600
     * @tc.name: testEventType001
     * @tc.desc: Gets the START_DOCUMENT of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType001', 0, function () {
        var event = xml.EventType.START_DOCUMENT;
        expect(event).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06700
     * @tc.name: testEventType002
     * @tc.desc: Gets the END_DOCUMENT of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType002', 0, function () {
        var event = xml.EventType.END_DOCUMENT;
        expect(event).assertEqual(1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06800
     * @tc.name: testEventType003
     * @tc.desc: Gets the START_TAG of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType003', 0, function () {
        var event = xml.EventType.START_TAG;
        expect(event).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_06900
     * @tc.name: testEventType004
     * @tc.desc: Gets the END_TAG of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType004', 0, function () {
        var event = xml.EventType.END_TAG;
        expect(event).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07000
     * @tc.name: testEventType005
     * @tc.desc: Gets the TEXT of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType005', 0, function () {
        var event = xml.EventType.TEXT;
        expect(event).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07100
     * @tc.name: testEventType006
     * @tc.desc: Gets the CDSECT of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType006', 0, function () {
        var event = xml.EventType.CDSECT;
        expect(event).assertEqual(5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07200
     * @tc.name: testEventType007
     * @tc.desc: Gets the COMMENT of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType007', 0, function () {
        var event = xml.EventType.COMMENT;
        expect(event).assertEqual(6)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07300
     * @tc.name: testEventType008
     * @tc.desc: Gets the DOCDECL of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType008', 0, function () {
        var event = xml.EventType.DOCDECL;
        expect(event).assertEqual(7)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07400
     * @tc.name: testEventType009
     * @tc.desc: Gets the INSTRUCTION of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType009', 0, function () {
        var event = xml.EventType.INSTRUCTION;
        expect(event).assertEqual(8)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07500
     * @tc.name: testEventType010
     * @tc.desc: Gets the ENTITY_REFERENCE of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType010', 0, function () {
        var event = xml.EventType.ENTITY_REFERENCE;
        expect(event).assertEqual(9)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07600
     * @tc.name: testEventType011
     * @tc.desc: Gets the WHITESPACE of EventType.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEventType011', 0, function () {
        var event = xml.EventType.WHITESPACE;
        expect(event).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07700
     * @tc.name: testXmlBusinessError001
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
     it('testXmlBusinessError001', 0, function () {
        try {
            new xml.XmlSerializer(123,"utf-8");
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be object")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07800
     * @tc.name: testXmlBusinessError002
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError002', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            new xml.XmlSerializer(arrayBuffer,123);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_07900
     * @tc.name: testXmlBusinessError003
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError003', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.startElement(111);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08000
     * @tc.name: testXmlBusinessError004
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError004', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.startElement("note");
            thatSer.setAttributes(111, "high1");
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08100
     * @tc.name: testXmlBusinessError005
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError005', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.startElement("note");
            thatSer.setAttributes("importance1", 111);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08200
     * @tc.name: testXmlBusinessError006
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError006', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.startElement("note");
            thatSer.setAttributes("importance", "high");
            thatSer.setText(111);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08300
     * @tc.name: testXmlBusinessError007
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError007', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.startElement("note");
            thatSer.addEmptyElement(111);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08400
     * @tc.name: testXmlBusinessError008
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError008', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.setDeclaration();
            thatSer.setNamespace(111, "http://www.w3.org/TR/html4/");
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08500
     * @tc.name: testXmlBusinessError009
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError009', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.setDeclaration();
            thatSer.setNamespace("h", 111);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08600
     * @tc.name: testXmlBusinessError010
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError010', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.startElement("note");
            thatSer.setComment(111);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08700
     * @tc.name: testXmlBusinessError011
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError011', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.setDocType(111);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08800
     * @tc.name: testXmlBusinessError012
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError012', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            var thatSer = new xml.XmlSerializer(arrayBuffer,"utf-8");
            thatSer.setCDATA(111)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_08900
     * @tc.name: testXmlBusinessError013
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError013', 0, function () {
        try {
            new xml.XmlPullParser(111, 'UTF-8');
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be object")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09000
     * @tc.name: testXmlBusinessError014
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError014', 0, function () {
        try {
            var arrayBuffer = new ArrayBuffer(2048);
            new xml.XmlPullParser(arrayBuffer, 111);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09100
     * @tc.name: testXmlBusinessError015
     * @tc.desc: To XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError015', 0, function () {
        try {
            var strXml =
                '<?xml version="1.0" encoding="utf-8"?>' +
                '<!DOCTYPE note [\n<!ENTITY foo "baa">]>' +
                '<note importance="high" logged="true">' +
                '    <![CDATA[\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n]]>' +
                '    <!--Hello, World!-->' +
                '    <company>John &amp; Hans</company>' +
                '    <title>Happy</title>' +
                '    <title>Happy</title>' +
                '    <todo>Work</todo>' +
                '    <todo>Play</todo>' +
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
            let that = new xml.XmlPullParser(arrbuffer.buffer, 'UTF-8');
            var str1 = '';
            function func1(name, value){
                str1 += name+':'+value;
                return true;
            }
            var options = 111
            that.parse(options);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be object")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09200
     * @tc.name: testXmlBusinessError016
     * @tc.desc: Parsing XML files.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError016', 0, function () {
        try {
            let strXml =
                '<?xml version="1.0" encoding="utf-8"?>' +
                '<note importance="high" logged="true">' +
                '    <!--Hello, World!-->' +
                '    <company>John &amp; Hans</company>' +
                '    <title>Happy</title>' +
                '    <todo>Work</todo>' +
                '</note>';
            let textEncoder = new util.TextEncoder();
            let uint8 = textEncoder.encodeInto(strXml);
            let that = new xml.XmlPullParser(uint8, 'UTF-8');
            expect().assertFail();
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be ArrayBuffer or " +
                                             "DataView.");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09300
     * @tc.name: testXmlBusinessError017
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testXmlBusinessError017', 0, function () {
        try {
            const myMAX = 1024;
            let arrayBuffer = new ArrayBuffer(myMAX);
            let uint = new Uint8Array(arrayBuffer);
            let thatSer = new xml.XmlSerializer(uint);
            expect().assertFail();
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be ArrayBuffer or " +
                                             "DataView.");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09400
     * @tc.name: testSetText006
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText006', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09500
     * @tc.name: testSetText007
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText007', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09600
     * @tc.name: testSetText008
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText008', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09700
     * @tc.name: testSetText009
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText009', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09800
     * @tc.name: testSetText010
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetText010', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_09900
     * @tc.name: testNodeName001
     * @tc.desc: Writes a wrong node name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testNodeName001', 0, function () {
        try {
            let strXml =
              '<?xml version="1.0" encoding="UTF-8"?>' +
              '<note importance="high" logged="true">' +
              '<company>John &amp; Hans</company>' +
              '<tod<xml version="1.0" encoding="UTF-8"?><note importance="high" logged="true"></note>' +
              '</note>';
            let textec = new util.TextEncoder()
            let uint8 = textec.encodeInto(strXml);
            let that = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
            let str = '';
            function func(name, value) {
              str += name + value;
              return true;
            }
            let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
            that.parse(options);
            expect().assertFail();
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: The node name contains invalid characters: <");
            expect(e.code).assertEqual(401);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10000
     * @tc.name: testNodeName002
     * @tc.desc: Writes a wrong node name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testNodeName002', 0, function () {
        try {
            let strXml =
              '<?xml version="1.0" encoding="UTF-8"?>' +
              '<note importance="high" logged="true">' +
              '<company>John &amp; Hans</company>' +
              '<2todo>work</2todo>' +
              '</note>';
            let textec = new util.TextEncoder()
            let uint8 = textec.encodeInto(strXml);
            let that = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
            let str = '';
            function func(name, value) {
              str += name + value;
              return true;
            }
            let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
            that.parse(options);
            expect().assertFail();
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: The node name contains invalid characters: 2");
            expect(e.code).assertEqual(401);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10100
     * @tc.name: testParseXml001
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml001', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <!--Hello, World!-->' +
            '    <company>John &amp; Hans</company>' +
            '    <lens>Work</lens>' +
            '    <h:table xmlns:h="http://www.w3.org/TR/html4/">' +
            '        <h:tr>' +
            '            <h:td>Apples</h:td>' +
            '        </h:tr>' +
            '    </h:table>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
        let result = '';
        function func(name, value) {
            result += name + ':' + value + ' ';
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, attributeValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'importance:high logged:true xmlns:h:http://www.w3.org/TR/html4/';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10200
     * @tc.name: testParseXml002
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml002', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <![CDATA[funcrion \n matchwo(a,6)]]>' +
            '    <!--Hello, World!-->' +
            '    <company>John &amp; Hans</company>' +
            '    <title>Happy</title>' +
            '    <lens>Play</lens>' +
            '    <?go there?>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(name, value) {
            result += name + value;
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tagValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'note    funcrion \n matchwo(a,6)    Hello, World!    companyJohn & Hanscompany    ' +
                  'titleHappytitle    lensPlaylens    go therenote';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10300
     * @tc.name: testParseXml003
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml003', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(key, value) {
            result += 'key:' + key + ' value:'+ value.getColumnNumber() + '  ';
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'key:0 value:1  key:2 value:63  key:10 value:67  key:2 value:74  key:4 value:79  ' +
                  'key:3 value:87  key:10 value:91  key:2 value:97  key:4 value:101  key:3 value:108  ' +
                  'key:3 value:115  key:1 value:115';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10400
     * @tc.name: testParseXml004
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml004', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(key, value) {
            result += 'key:' + key + ' value:'+ value.getDepth() + '  ';
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'key:0 value:0  key:2 value:1  key:10 value:1  key:2 value:2  key:4 value:2  ' +
                  'key:3 value:2  key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  ' +
                  'key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  key:3 value:1  key:1 value:0';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10500
     * @tc.name: testParseXml005
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml005', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uin8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uin8.buffer);
        let result = '';
        function func(key, value) {
            result += 'key:'+ key + ' value:' + value.getLineNumber() + '  ';
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'key:0 value:1  key:2 value:1  key:10 value:1  key:2 value:1  key:4 value:1  ' +
                  'key:3 value:1  key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  ' +
                  'key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  key:3 value:1  key:1 value:1';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10600
     * @tc.name: testParseXml006
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml006', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(key, value) {
            if (key == xml.EventType.START_TAG || key == xml.EventType.END_TAG) {
                result += 'key:' + key + ' value:' + value.getName() + '  ';
            }
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'key:2 value:note  key:2 value:title  key:3 value:title  ' +
                  'key:2 value:todo  key:3 value:todo  key:3 value:note';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10700
     * @tc.name: testParseXml007
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml007', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '<h:table xmlns:h="html4">' +
            '<h:tr><h:td>Bananas</h:td></h:tr>' +
            '</h:table>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(key, value) {
            if (key == xml.EventType.START_TAG || key == xml.EventType.END_TAG) {
                result += 'key:' + key + ' value:' + value.getNamespace() + '  ';
            }
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'key:2 value:  key:2 value:html4  key:2 value:html4  key:2 value:html4  ' +
                  'key:3 value:html4  key:3 value:html4  key:3 value:html4  key:3 value:';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10800
     * @tc.name: testParseXml008
     * @tc.desc: Starts parsing the XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml008', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '<h:table xmlns:h="html4">' +
            '<h:tr><h:td>Bananas</h:td></h:tr>' +
            '</h:table>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(key, value) {
            if (key == xml.EventType.START_TAG || key == xml.EventType.END_TAG) {
                result += 'key:' + key + ' value:' + value.getPrefix() + '  ';
            }
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'key:2 value:  key:2 value:h  key:2 value:h  key:2 value:h  ' +
                  'key:3 value:h  key:3 value:h  key:3 value:h  key:3 value:';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_10900
     * @tc.name: testParseXml009
     * @tc.desc: Starts parsing he XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml009', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(key, value) {
            if (key == xml.EventType.TEXT) {
                result += 'key:' + key + ' value:' + value.getText() + '  ';
            }
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'key:4 value:Happy  key:4 value:Work  key:4 value:Play';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11000
     * @tc.name: testParseXml010
     * @tc.desc: Starts parsing he XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml010', 0, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '<title/>' +
            '<todo>Work</todo>' +
            '<todo/>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(key, value) {
            if (key == xml.EventType.START_TAG) {
                result += 'key:' + key + ' value:' + value.isEmptyElementTag() + '  ';
            }
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'key:2 value:false  key:2 value:true  key:2 value:false  key:2 value:true';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11100
     * @tc.name: testParseXml011
     * @tc.desc: Starts parsing he XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(key, value) {
            if (key == xml.EventType.START_TAG) {
                result += 'key:' + key + ' value:' + value.getAttributeCount() + '  ';
            }
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'key:2 value:2  key:2 value:0  key:2 value:0  key:2 value:0';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11200
     * @tc.name: testParseXml012
     * @tc.desc: Starts parsing he XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Hello\nWorld</title>' +
            '    <todo>Work\n</todo>' +
            '    <mess><![CDATA[This is a \n CDATA section]]></mess>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let result = '';
        function func(key, value) {
            if (key === xml.EventType.TEXT || key === xml.EventType.CDSECT) {
                result += value.getText() + ' ';
            }
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'Hello\nWorld Work\n This is a \n CDATA section';
        expect(result.trim()).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11300
     * @tc.name: testParseXml013
     * @tc.desc: Starts parsing he XML file.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testParseXml013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="hi&amp;gh" logged="&lt;true">' +
            '    <title>Hello&gt;World&apos;</title>' +
            '    <todo>Wo&quot;rk</todo>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer);
        let resAttr = '';
        let result = '';
        function funcAttr(name, value) {
            resAttr += name + ', ' + value + ' ';
            return true;
        }
        function func(name, value) {
            if (name == xml.EventType.TEXT) {
                result += value.getText() + ' ';
            }
            return true;
        }
        let options = {supportDoctype:true, ignoreNameSpace:true, attributeValueCallbackFunction: funcAttr,
            tokenValueCallbackFunction:func}
        pullParse.parseXml(options);
        let str = 'Hello>World\' Wo"rk';
        let strAttr = 'importance, hi&gh logged, <true';
        expect(result.trim()).assertEqual(str);
        expect(resAttr.trim()).assertEqual(strAttr);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11400
     * @tc.name: testSetAttributes006
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11500
     * @tc.name: testSetAttributes007
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11600
     * @tc.name: testSetAttributes008
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11700
     * @tc.name: testSetAttributes009
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11800
     * @tc.name: testSetAttributes010
     * @tc.desc: Writes the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetAttributes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_11900
     * @tc.name: testSetCDATA006
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_12000
     * @tc.name: testSetCDATA007
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_12100
     * @tc.name: testSetCDATA008
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_12200
     * @tc.name: testSetCDATA009
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_XML_12300
     * @tc.name: testSetCDATA0010
     * @tc.desc: Writes the CDATA.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSetCDATA0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
})}