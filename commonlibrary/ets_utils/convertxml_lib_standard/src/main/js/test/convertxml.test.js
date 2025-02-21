/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import  convertxml from '@ohos.convertxml'
export default function XmlTest() {
describe('XmlTest', function () {

    /**
     * @tc.name: testConvert001
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert001', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert002
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert002', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>  Happy  </title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : true, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert003
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert003', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, ignoreDeclaration: true, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert004
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert004', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <?go there?>'+
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, ignoreInstruction: true, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":['+
        '{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert005
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert005', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, ignoreAttributes : true, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert006
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert006', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <!--note-->'+
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration", ignoreComment: true,
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert007
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert007', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<!--note-->'+
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, ignoreComment: true, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert008
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert008', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <![CDATA[<foo></bar>]]>'+
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration", ignoreCDATA: true,
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert09
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert09', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<!DOCTYPE foo>'+
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration", ignoreDoctype: true,
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert010
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert010', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, ignoreText: true, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title"},'+
        '{"_type":"element",'+
        '"_name":"todo"},'+
        '{"_type":"element",'+
        '"_name":"todo"}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert011
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert011', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey: "123",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"123":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert012
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert012', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <?go there?>'+
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "123", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"123":"there",'+
        '"_type":"instruction",'+
        '"_name":"go"},'+
        '{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert013
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert013', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <?go there?>'+
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "123",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"123":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"123":{"importance":"high",'+
        '"logged":"true"},'+
        '"_type":"element",'+
        '"_name":"note",'+
        '"_elements":[{"_type":"instruction",'+
        '"_name":"go",'+
        '"_instruction":"there"},'+
        '{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert014
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert014', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "123", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"123":"Happy",'+
        '"_type":"text"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"123":"Work",'+
        '"_type":"text"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"123":"Play",'+
        '"_type":"text"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert015
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert015', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <![CDATA[1 is < 2]]>'+
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey: "123", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"123":"1 is < 2",'+
        '"_type":"cdata"},'+
        '{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert016
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert016', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<!--note-->'+
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "123", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"123":"note",'+
        '"_type":"comment"},'+
        '{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert017
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert017', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <a><b/></a>'+
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "123", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"a",'+
        '"_elements":[{"_type":"element",'+
        '"_name":"b"}]},'+
        '{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert018
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert018', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "123",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"123":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"123":"element",'+
        '"_name":"title",'+
        '"_elements":[{"123":"text",'+
        '"_text":"Happy"}]},'+
        '{"123":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"123":"text",'+
        '"_text":"Work"}]},'+
        '{"123":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"123":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert019
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert019', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "123", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"123":"note",'+
        '"_type":"element",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"123":"title",'+
        '"_type":"element",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"123":"todo",'+
        '"_type":"element",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"123":"todo",'+
        '"_type":"element",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert020
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert020', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "123"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"123":[{"123":[{"123":[{"_type":"text",'+
        '"_text":"Happy"}],'+
        '"_type":"element",'+
        '"_name":"title"},'+
        '{"123":[{"_type":"text",'+
        '"_text":"Work"}],'+
        '"_type":"element",'+
        '"_name":"todo"},'+
        '{"123":[{"_type":"text",'+
        '"_text":"Play"}],'+
        '"_type":"element",'+
        '"_name":"todo"}],'+
        '"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"}}],'+
        '"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}}}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert021
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert021', 0, function () {
        let xml = '<?xml?>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{}}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert022
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert022', 0, function () {
        let  xml = '<?xml version="1.0" encoding="utf-8"?>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}}}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert023
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert023', 0, function () {
        let  xml = '<?xml?>\n<a/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{},"_elements":[{"_type":"element","_name":"a"}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert024
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert024', 0, function () {
        let  xml = '<?go there?>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"instruction",'+
        '"_name":"go",'+
        '"_instruction":"there"}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert025
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert025', 0, function () {
        let  xml = '<?go there?><?come here?>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"instruction",'+
        '"_name":"go",'+
        '"_instruction":"there"},'+
        '{"_type":"instruction",'+
        '"_name":"come",'+
        '"_instruction":"here"}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert026
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert026', 0, function () {
        let  xml = '<!-- \t Hello World! \t -->';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"comment","_comment":"'+
        ' \\t'+
        ' Hello '+
        'World! '+
        '\\t '+
        '"}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert027
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert027', 0, function () {
        let  xml = '<!-- \t Hello \t -->\n<!-- \t World \t -->';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"comment","_comment":"'+
        ' \\t'+
        ' Hello '+
        '\\t '+
        '"},{"_type":"comment","_comment":"'+
        ' \\t'+
        ' World '+
        '\\t '+
        '"}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert028
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert028', 0, function () {
        let  xml = '<![CDATA[ \t <foo></bar> \t ]]>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"cdata","_cdata":"'+
        ' \\t'+
        ' <foo></bar> '+
        '\\t '+
        '"}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert029
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert029', 0, function () {
        let  xml = '<![CDATA[ \t data]]><![CDATA[< > " and & \t ]]>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        console.log("LHC..." + result);
        let str1 = '{"_elements":[{"_type":"cdata","_cdata":"'+
        ' \\t'+
        ' data"},{"_type":"cdata","_cdata":"< '+
        '> '+
        '\\"'+
        ' and'+
        ' & '+
        '\\t '+
        '"}]}';
        console.log("LHC..." + str1);
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert030
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert030', 0, function () {
        let  xml = '<a/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element",'+
        '"_name":"a"}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert031
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert031', 0, function () {
        let  xml = '<a/>\n<a/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element",'+
        '"_name":"a"},'+
        '{"_type":"element",'+
        '"_name":"a"}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert032
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert032', 0, function () {
        let  xml = '<a/>\n<b/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element",'+
        '"_name":"a"},'+
        '{"_type":"element",'+
        '"_name":"b"}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert033
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert033', 0, function () {
        let  xml = '<a x="hello"/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element",'+
        '"_name":"a",'+
        '"_attributes":{"x":"hello"}}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert034
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert034', 0, function () {
        let  xml = '<a x="1.234" y="It\'s"/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element",'+
        '"_name":"a",'+
        '"_attributes":{"x":"1.234",'+
        '"y":"It\'s"}}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert035
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert035', 0, function () {
        let  xml = '<a> \t Hi \t </a>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element","_name":"a","_elements":[{"_type":"text","_text":"'+
        ' \\t'+
        ' Hi '+
        '\\t '+
        '"}]}]}';
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert036
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert036', 0, function () {
        let  xml = '<a>  Hi  There \t </a>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element","_name":"a","_elements":[{"_type":"text","_text":"'+
        '  Hi '+
        ' There '+
        '\\t '+
        '"}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert037
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert037', 0, function () {
        let  xml = '<a>\n\v<b/>\n</a>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element",'+
        '"_name":"a",'+
        '"_elements":[{"_type":"element",'+
        '"_name":"b"}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert038
     * @tc.desc: To convert XML text to JavaScript object.
     */
    it('testConvert038', 0, function () {
        let  xml = '<a>\n\v<b>\n\v\v<c/>\n\v</b>\n</a>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_elements":[{"_type":"element",'+
        '"_name":"a",'+
        '"_elements":[{"_type":"element",'+
        '"_name":"b",'+
        '"_elements":[{"_type":"element",'+
        '"_name":"c"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testConvert039
     * @tc.desc: To convert XML text to JavaScript object.
     */
        it('testConvert039', 0, function () {
        let xml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<!DOCTYPE foo>'+
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        let str1 = '{"_declaration":{"_attributes":{"version":"1.0",'+
        '"encoding":"utf-8"}},'+
        '"_elements":[{"_type":"doctype","doctype":"foo"},'+
        '{"_type":"element",'+
        '"_name":"note",'+
        '"_attributes":{"importance":"high",'+
        '"logged":"true"},'+
        '"_elements":[{"_type":"element",'+
        '"_name":"title",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Happy"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Work"}]},'+
        '{"_type":"element",'+
        '"_name":"todo",'+
        '"_elements":[{"_type":"text",'+
        '"_text":"Play"}]}]}]}'
        expect(result).assertEqual(str1);
    })

    /**
     * @tc.name: testBusinessError001
     * @tc.desc: To convert XML text to JavaScript object.
     */
        it('testBusinessError001', 0, function () {
            try {
                let xml = 123;
                let conv = new convertxml.ConvertXML();
                let options = {trim : false, declarationKey:"_declaration",
                    instructionKey : "_instruction", attributesKey : "_attributes",
                    textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                    commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                    nameKey : "_name", elementsKey : "_elements"}
                conv.convertToJSObject(xml, options);
            } catch (e) {
                expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be string")
            }
        })

    /**
     * @tc.name: testBusinessError002
     * @tc.desc: To convert XML text to JavaScript object.
     */
        it('testBusinessError002', 0, function () {
            try {
                let xml =
                    '<?xml version="1.0" encoding="utf-8"?>' +
                    '<note importance="high" logged="true">' +
                    '    <title>Happy</title>' +
                    '    <todo>Work</todo>' +
                    '    <todo>Play</todo>' +
                    '</note>';
                let conv = new convertxml.ConvertXML();
                let options = 123
                conv.convertToJSObject(xml, options);
            } catch (e) {
                expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be object")
            }
        })

    /**
     * @tc.name: testBusinessError003
     * @tc.desc: To convert XML text to JavaScript object.
     */
        it('testBusinessError003', 0, function () {
            try {
                let xml = 111;
                let conv = new convertxml.ConvertXML();
                let options = 123
                conv.convertToJSObject(xml, options);
            } catch (e) {
                expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
            }
        })
})}
