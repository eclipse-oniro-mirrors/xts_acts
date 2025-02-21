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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import xml from '@ohos.xml'
import util from '@ohos.util'
export default function XmlSerializerXmlPullParserTest() {
describe('XmlSerializerXmlPullParserTest', function () {

    /**
     * @tc.name: testSetDeclaration001
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
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
     * @tc.name: testSetDeclaration002
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
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
     * @tc.name: testSetDeclaration003
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
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
     * @tc.name: testSetDeclaration004
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
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
     * @tc.name: testSetDeclaration005
     * @tc.desc: Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
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
     * @tc.name: testStartElement001
     * @tc.desc: Writes an elemnet start tag with the given name.
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
     * @tc.name: testStartElement002
     * @tc.desc: Writes an elemnet start tag with the given name.
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
     * @tc.name: testStartElement003
     * @tc.desc: Writes an elemnet start tag with the given name.
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
     * @tc.name: testStartElement004
     * @tc.desc: Writes an elemnet start tag with the given name.
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
     * @tc.name: testStartElement005
     * @tc.desc: Writes an elemnet start tag with the given name.
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
     * @tc.name: testSetAttributes001
     * @tc.desc: Write an attribute.
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
     * @tc.name: testSetAttributes002
     * @tc.desc: Write an attribute.
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
     * @tc.name: testSetAttributes003
     * @tc.desc: Write an attribute.
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
     * @tc.name: testSetAttributes004
     * @tc.desc: Write an attribute.
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
     * @tc.name: testSetAttributes005
     * @tc.desc: Write an attribute.
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
     * @tc.name: testEndElement001
     * @tc.desc: Writes end tag of the element.
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
     * @tc.name: testEndElement002
     * @tc.desc: Writes end tag of the element.
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
     * @tc.name: testEndElement003
     * @tc.desc: Writes end tag of the element.
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
     * @tc.name: testEndElement004
     * @tc.desc: Writes end tag of the element.
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
     * @tc.name: testEndElement005
     * @tc.desc: Writes end tag of the element.
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
     * @tc.name: testSetText001
     * @tc.desc: Writes the text.
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
     * @tc.name: testSetText002
     * @tc.desc: Writes the text.
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
     * @tc.name: testSetText003
     * @tc.desc: Writes the text.
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
     * @tc.name: testSetText004
     * @tc.desc: Writes the text.
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
     * @tc.name: testSetText005
     * @tc.desc: Writes the text.
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
     * @tc.name: testAddEmptyElement001
     * @tc.desc: Add an empty element.
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
     * @tc.name: testAddEmptyElement002
     * @tc.desc: Add an empty element.
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
     * @tc.name: testAddEmptyElement003
     * @tc.desc: Add an empty element.
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
     * @tc.name: testAddEmptyElement004
     * @tc.desc: Add an empty element.
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
     * @tc.name: testAddEmptyElement005
     * @tc.desc: Add an empty element.
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
     * @tc.name: testSetNamespace001
     * @tc.desc: Writes the namespace of the current element tag.
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
     * @tc.name: testSetNamespace002
     * @tc.desc: Writes the namespace of the current element tag.
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
     * @tc.name: testSetNamespace003
     * @tc.desc: Writes the namespace of the current element tag.
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
     * @tc.name: testSetNamespace004
     * @tc.desc: Writes the namespace of the current element tag.
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
     * @tc.name: testSetNamespace005
     * @tc.desc: Writes the namespace of the current element tag.
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
     * @tc.name: testSetComment001
     * @tc.desc: Writes the comment.
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
     * @tc.name: testSetComment002
     * @tc.desc: Writes the comment.
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
     * @tc.name: testSetComment003
     * @tc.desc: Writes the comment.
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
     * @tc.name: testSetComment004
     * @tc.desc: Writes the comment.
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
     * @tc.name: testSetComment005
     * @tc.desc: Writes the comment.
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
     * @tc.name: testSetDocType001
     * @tc.desc: Writes the DOCTYPE.
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
     * @tc.name: testSetDocType002
     * @tc.desc: Writes the DOCTYPE.
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
     * @tc.name: testSetDocType003
     * @tc.desc: Writes the DOCTYPE.
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
     * @tc.name: testSetDocType004
     * @tc.desc: Writes the DOCTYPE.
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
     * @tc.name: testSetDocType005
     * @tc.desc: Writes the DOCTYPE.
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
     * @tc.name: testSetCDATA001
     * @tc.desc: Writes the CDATA.
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
     * @tc.name: testSetCDATA002
     * @tc.desc: Writes the CDATA.
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
     * @tc.name: testSetCDATA003
     * @tc.desc: Writes the CDATA.
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
     * @tc.name: testSetCDATA004
     * @tc.desc: Writes the CDATA.
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
     * @tc.name: testSetCDATA005
     * @tc.desc: Writes the CDATA.
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
     * @tc.name: testParse001
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse002
     * @tc.desc: Starts parsing the XML file.
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
            '\\r\\nfuncrion matchwo(a,6)\\r\\n{\\r\\nreturn 1;\\r\\n}\\r\\n      Hello, World!      company John  ' +
            'amp;amp;  Hans company      title Happy title      title Happy title      lens Work lens      ' + 
            'lens Play lens      go there      a b b a      h:table          h:tr              h:td Apples h:td' + 
            '              h:td Bananas h:td          h:tr      h:table note  ';
        expect(str1).assertEqual(str3);
    })

    /**
     * @tc.name: testParse003
     * @tc.desc: Starts parsing the XML file.
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
        'key:2 value:132  key:4 value:136  key:3 value:143  key:3 value:150  key:1 value:299  ';
        expect(str).assertEqual(result);
    })

    /**
     * @tc.name: testParse004
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse005
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse006
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse007
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse008
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse009
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse010
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse011
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse012
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse013
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testParse014
     * @tc.desc: Starts parsing the XML file.
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
     * @tc.name: testEventType001
     * @tc.desc: Gets the START_DOCUMENT of EventType.
     */
    it('testEventType001', 0, function () {
        var event = xml.EventType.START_DOCUMENT;
        expect(event).assertEqual(0)
    })

    /**
     * @tc.name: testEventType002
     * @tc.desc: Gets the END_DOCUMENT of EventType.
     */
    it('testEventType002', 0, function () {
        var event = xml.EventType.END_DOCUMENT;
        expect(event).assertEqual(1)
    })

    /**
     * @tc.name: testEventType003
     * @tc.desc: Gets the START_TAG of EventType.
     */
    it('testEventType003', 0, function () {
        var event = xml.EventType.START_TAG;
        expect(event).assertEqual(2)
    })

    /**
     * @tc.name: testEventType004
     * @tc.desc: Gets the END_TAG of EventType.
     */
    it('testEventType004', 0, function () {
        var event = xml.EventType.END_TAG;
        expect(event).assertEqual(3)
    })

    /**
     * @tc.name: testEventType005
     * @tc.desc: Gets the TEXT of EventType.
     */
    it('testEventType005', 0, function () {
        var event = xml.EventType.TEXT;
        expect(event).assertEqual(4)
    })

    /**
     * @tc.name: testEventType006
     * @tc.desc: Gets the CDSECT of EventType.
     */
    it('testEventType006', 0, function () {
        var event = xml.EventType.CDSECT;
        expect(event).assertEqual(5)
    })

    /**
     * @tc.name: testEventType007
     * @tc.desc: Gets the COMMENT of EventType.
     */
    it('testEventType007', 0, function () {
        var event = xml.EventType.COMMENT;
        expect(event).assertEqual(6)
    })

    /**
     * @tc.name: testEventType008
     * @tc.desc: Gets the DOCDECL of EventType.
     */
    it('testEventType008', 0, function () {
        var event = xml.EventType.DOCDECL;
        expect(event).assertEqual(7)
    })

    /**
     * @tc.name: testEventType009
     * @tc.desc: Gets the INSTRUCTION of EventType.
     */
    it('testEventType009', 0, function () {
        var event = xml.EventType.INSTRUCTION;
        expect(event).assertEqual(8)
    })

    /**
     * @tc.name: testEventType010
     * @tc.desc: Gets the ENTITY_REFERENCE of EventType.
     */
    it('testEventType010', 0, function () {
        var event = xml.EventType.ENTITY_REFERENCE;
        expect(event).assertEqual(9)
    })

    /**
     * @tc.name: testEventType011
     * @tc.desc: Gets the WHITESPACE of EventType.
     */
    it('testEventType011', 0, function () {
        var event = xml.EventType.WHITESPACE;
        expect(event).assertEqual(10)
    })

    /**
     * @tc.name: testXmlBusinessError001
     * @tc.desc: To XML text to JavaScript object.
     */
     it('testXmlBusinessError001', 0, function () {
        try {
            new xml.XmlSerializer(123,"utf-8");
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be object")
        }
    })

    /**
     * @tc.name: testXmlBusinessError002
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError003
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError004
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError005
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError006
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError007
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError008
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError009
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError010
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError011
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError012
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError013
     * @tc.desc: To XML text to JavaScript object.
     */
    it('testXmlBusinessError013', 0, function () {
        try {
            new xml.XmlPullParser(111, 'UTF-8');
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be object")
        }
    })

    /**
     * @tc.name: testXmlBusinessError014
     * @tc.desc: To XML text to JavaScript object.
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
     * @tc.name: testXmlBusinessError015
     * @tc.desc: To XML text to JavaScript object.
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
})}
