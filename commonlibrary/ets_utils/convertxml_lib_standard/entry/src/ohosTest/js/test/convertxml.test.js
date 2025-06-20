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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import  convertxml from '@ohos.convertxml'
export default function XmlTest() {
describe('XmlTest', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_0100
     * @tc.name: testConvert001
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testConvert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_0200
     * @tc.name: testConvert002
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testConvert002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_0300
     * @tc.name: testConvert003
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testConvert003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_0400
     * @tc.name: testConvert004
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testConvert004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_0500
     * @tc.name: testConvert005
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testConvert005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_0600
     * @tc.name: testConvert006
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_0700
     * @tc.name: testConvert007
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_0800
     * @tc.name: testConvert008
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_0900
     * @tc.name: testConvert09
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1000
     * @tc.name: testConvert010
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1100
     * @tc.name: testConvert011
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1200
     * @tc.name: testConvert012
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1300
     * @tc.name: testConvert013
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1400
     * @tc.name: testConvert014
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1500
     * @tc.name: testConvert015
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1600
     * @tc.name: testConvert016
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1700
     * @tc.name: testConvert017
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1800
     * @tc.name: testConvert018
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_1900
     * @tc.name: testConvert019
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2000
     * @tc.name: testConvert020
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2100
     * @tc.name: testConvert021
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2200
     * @tc.name: testConvert022
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2300
     * @tc.name: testConvert023
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2400
     * @tc.name: testConvert024
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2500
     * @tc.name: testConvert025
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2600
     * @tc.name: testConvert026
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2700
     * @tc.name: testConvert027
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2800
     * @tc.name: testConvert028
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let xml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[ \t <foo>\r\n</bar> \t ]]>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = conv.convertToJSObject(xml, options);
        let cdata = result._elements[0]._cdata;
        let str1 = ' \\t <foo>\\r\\n</bar> \\t ';
        expect(cdata).assertEqual(str1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_2900
     * @tc.name: testConvert029
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let xml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[ \t data\n]]><![CDATA[< > " and & \t ]]>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
                       instructionKey : "_instruction", attributesKey : "_attributes",
                       textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
                       commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
                       nameKey : "_name", elementsKey : "_elements"}
        let result = conv.convertToJSObject(xml, options);
        let cdata0 = result._elements[0]._cdata;
        let cdata1 = result._elements[1]._cdata;
        let str0 = ' \\t data\\n';
        let str1 = '< > \" and & \\t ';
        expect(cdata0).assertEqual(str0);
        expect(cdata1).assertEqual(str1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3000
     * @tc.name: testConvert030
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3100
     * @tc.name: testConvert031
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3200
     * @tc.name: testConvert032
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3300
     * @tc.name: testConvert033
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3400
     * @tc.name: testConvert034
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3500
     * @tc.name: testConvert035
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3600
     * @tc.name: testConvert036
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3700
     * @tc.name: testConvert037
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3800
     * @tc.name: testConvert038
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_3900
     * @tc.name: testConvert039
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4000
     * @tc.name: testConvert040
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let xml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note>' +
        '<title>\nHello\\n World\\\n</title>' +
        '<title>\tHello\\t World\\\t</title>' +
        '</note>'
        let conv = new convertxml.ConvertXML();
        let result = JSON.stringify(conv.convertToJSObject(xml));
        let str = '{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}},' +
        '"_elements":[{"_type":"element","_name":"note","_elements":[{"_type":"element",' +
        '"_name":"title","_elements":[{"_type":"text","_text":"\\nHello\\\\n World\\\\\\n"}]},' +
        '{"_type":"element","_name":"title","_elements":[{"_type":"text","_text":"\\tHello\\\\t World\\\\\\t"}]}]}]}';
        expect(result).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4100
     * @tc.name: testConvert041
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let xml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[\nHello\\n World\\\n \tHello\\t World\\\t]]>';
        let conv = new convertxml.ConvertXML();
        let result = conv.convertToJSObject(xml);
        let cdata = result["_elements"][0]._cdata;
        let str = '\\nHello\\\\n World\\\\\\n \\tHello\\\\t World\\\\\\t';
        expect(cdata).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4200
     * @tc.name: testBusinessError001
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBusinessError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4300
     * @tc.name: testBusinessError002
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBusinessError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4400
     * @tc.name: testBusinessError003
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBusinessError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let xml = 111;
            let conv = new convertxml.ConvertXML();
            let options = 123
            conv.convertToJSObject(xml, options);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4500
     * @tc.name: testConvert045
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let result = conv.fastConvertToJSObject(strXml);
        let str = '{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}},'+
            '"_elements":[{"_type":"element","_name":"note","_attributes":{"importance":"high",'+
            '"logged":"true"},"_elements":[{"_type":"element","_name":"title","_elements":[{"_type":"text",'+
            '"_text":"Happy"}]},{"_type":"element","_name":"todo","_elements":[{"_type":"text",'+
            '"_text":"Work"}]},{"_type":"element","_name":"todo","_elements":[{"_type":"text","_text":"Play"}]}]}]}'
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4600
     * @tc.name: testConvert046
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title> Happy </title>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, ignoreDeclaration: true, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_elements":[{"_type":"element","_name":"note","_attributes":{"importance":"high",' +
            '"logged":"true"},"_elements":[{"_type":"element","_name":"title","_elements":[{"_type":"text",' +
            '"_text":" Happy "}]}]}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4700
     * @tc.name: testConvert047
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <?go there?>'+
            '    <title>Happy</title>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, ignoreInstruction: true, ignoreDeclaration: true,
            declarationKey:"_declaration", instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype", commentKey : "_comment",
            parentKey : "_parent", typeKey : "_type", nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_elements":[{"_type":"element","_name":"note","_attributes":{"importance":"high",' +
            '"logged":"true"},"_elements":[{"_type":"element","_name":"title","_elements":[{"_type":"text",' +
            '"_text":"Happy"}]}]}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4800
     * @tc.name: testConvert048
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<!--note-->'+
            '<title>Happy</title>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, ignoreAttributes : true, ignoreComment: true,
            declarationKey:"_declaration", instructionKey : "_instruction",
            attributesKey : "_attributes", textKey : "_text", cdataKey:"_cdata",
            doctypeKey : "_doctype", commentKey : "_comment", parentKey : "_parent",
            typeKey : "_type", nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}},"_elements":[{"_type":' +
            '"element","_name":"note","_elements":[{"_type":"element","_name":"title","_elements":[{"_type":' +
            '"text","_text":"Happy"}]}]}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_4900
     * @tc.name: testConvert049
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<!DOCTYPE foo>'+
            '<note importance="high" logged="true">' +
            '<![CDATA[<foo></bar>]]>'+
            '<title>Happy</title>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, ignoreDoctype: true, ignoreCDATA: true, ignoreText: true,
            declarationKey:"_declaration", instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype", commentKey : "_comment",
            parentKey : "_parent", typeKey : "_type", nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}},"_elements":[{"_type":' +
            '"element","_name":"note","_attributes":{"importance":"high","logged":"true"},"_elements":[{"_type":' +
            '"element","_name":"title"}]}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5000
     * @tc.name: testConvert050
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<?go there?>'+
            '<![CDATA[1 is < 2]]>' +
            '<title>Happy</title>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey: "decl", instructionKey : "inst", attributesKey : "attr",
            textKey : "text", cdataKey:"cdata", doctypeKey : "_doctype", commentKey : "_comment",
            parentKey : "_parent", typeKey : "_type", nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"decl":{"attr":{"version":"1.0","encoding":"utf-8"}},"_elements":[{"_type":"element","_name":' +
           '"note","attr":{"importance":"high","logged":"true"},"_elements":[{"_type":"instruction","_name":"go",' +
           '"inst":"there"},{"_type":"cdata","cdata":"1 is < 2"},{"_type":"element","_name":"title","_elements":' +
           '[{"_type":"text","text":"Happy"}]}]}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5100
     * @tc.name: testConvert051
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<!--note-->'+
            '<note importance="high" logged="true">' +
            '<?go there?>'+
            '<![CDATA[1 is < 2]]>' +
            '<title>Happy</title>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey: "_declaration", instructionKey : "_instruction",
            attributesKey : "_attributes", textKey : "_text", cdataKey:"_cdata", doctypeKey : "doct",
            commentKey : "comm", parentKey : "_parent", typeKey : "type", nameKey : "name", elementsKey : "elem"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}},"elem":[{"type":"comment",' +
            '"comm":"note"},{"type":"element","name":"note","_attributes":{"importance":"high","logged":"true"},' +
            '"elem":[{"type":"instruction","name":"go","_instruction":"there"},{"type":"cdata","_cdata":"1 is < 2' +
            '"},{"type":"element","name":"title","elem":[{"type":"text","_text":"Happy"}]}]}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5200
     * @tc.name: testConvert052
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<?xml?>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_declaration":{}}'
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5300
     * @tc.name: testConvert053
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<?xml version="1.0" encoding="utf-8"?>';
        let conv = new convertxml.ConvertXML();
        let result = conv.fastConvertToJSObject(strXml);
        let str = '{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}}}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5400
     * @tc.name: testConvert054
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<!-- \t Hello World! \t -->';
        let conv = new convertxml.ConvertXML();
        let result = conv.fastConvertToJSObject(strXml);
        let str = '{"_elements":[{"_type":"comment","_comment":" \\t Hello World! \\t "}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5500
     * @tc.name: testConvert055
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<!-- \t Hello \t -->\n<!-- \t World \t -->';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_elements":[{"_type":"comment","_comment":" \\t Hello \\t "},{"_type":"comment",' +
            '"_comment":" \\t World \\t "}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5600
     * @tc.name: testConvert056
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[ \t <foo>\r\n</bar> \t ]]>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let cdata = result._elements[0]._cdata;
        let str = ' \t <foo>\n</bar> \t ';
        expect(cdata).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5700
     * @tc.name: testConvert057
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<a/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_elements":[{"_type":"element","_name":"a"}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5800
     * @tc.name: testConvert058
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<a/>\n<a/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_elements":[{"_type":"element","_name":"a"},'+
            '{"_type":"element","_name":"a"}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_5900
     * @tc.name: testConvert059
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<a x="hello"/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_elements":[{"_type":"element","_name":"a","_attributes":{"x":"hello"}}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_6000
     * @tc.name: testConvert060
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<a x="1.234" y="It\'s"/>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str1 = '{"_elements":[{"_type":"element","_name":"a",' +
            '"_attributes":{"x":"1.234","y":"It\'s"}}]}';
        expect(JSON.stringify(result)).assertEqual(str1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_6100
     * @tc.name: testConvert061
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<a> \t Hi \t </a>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str1 = '{"_elements":[{"_type":"element","_name":"a","_elements":[{"_type":' +
            '"text","_text":" \\t Hi \\t "}]}]}';
        expect(JSON.stringify(result)).assertEqual(str1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_6200
     * @tc.name: testConvert062
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<a>\n<b>\n\<c/>\n\</b>\n</a>';
        let conv = new convertxml.ConvertXML();
        let options = {trim : false, declarationKey:"_declaration",
            instructionKey : "_instruction", attributesKey : "_attributes",
            textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
            commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
            nameKey : "_name", elementsKey : "_elements"}
        let result = conv.fastConvertToJSObject(strXml, options);
        let str = '{"_elements":[{"_type":"element","_name":"a","_elements":[{"_type":"element",'+
            '"_name":"b","_elements":[{"_type":"element","_name":"c"}]}]}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_6300
     * @tc.name: testConvert063
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
            '<note>' +
            '<title>\nHello\\n World\\\n</title>' +
            '<title>\tHello\\t World\\\t</title>' +
            '</note>'
        let conv = new convertxml.ConvertXML();
        let result = conv.fastConvertToJSObject(strXml);
        let str = '{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}},' +
            '"_elements":[{"_type":"element","_name":"note","_elements":[{"_type":"element",' +
            '"_name":"title","_elements":[{"_type":"text","_text":"\\nHello\\\\n World\\\\\\n"}]},' +
            '{"_type":"element","_name":"title","_elements":[{"_type":"text","_text":' +
            '"\\tHello\\\\t World\\\\\\t"}]}]}]}';
        expect(JSON.stringify(result)).assertEqual(str);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONVERTXML_6400
     * @tc.name: testConvert064
     * @tc.desc: To convert XML text to JavaScript object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConvert064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[\nHello\\n World\\\n \tHello\\t World\\\t]]>';
        let conv = new convertxml.ConvertXML();
        let result = conv.fastConvertToJSObject(strXml);
        let cdata = result["_elements"][0]._cdata;
        let str = '\nHello\\n World\\\n \tHello\\t World\\\t';
        expect(cdata).assertEqual(str);
    })
})}
