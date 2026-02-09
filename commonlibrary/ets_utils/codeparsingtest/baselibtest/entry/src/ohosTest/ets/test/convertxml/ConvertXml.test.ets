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
import { convertxml } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

let jsonStr = "{\"_declaration\":{\"_attributes\":{\"version\":\"1.0\",\"encoding\":\"utf-8\"}}," +
  "\"_elements\":[{\"_type\":\"element\",\"_name\":\"note\",\"_attributes\":{\"importance\":\"high\"," +
  "\"logged\":\"true\"},\"_elements\":[{\"_type\":\"element\",\"_name\":\"title\",\"_parent\":\"note\",\"_elements\":" +
  "[{\"_type\":\"text\",\"_text\":\"Happy\"}]},{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":" +
  "[{\"_type\":\"text\",\"_text\":\"Work\"}]},{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":" +
  "[{\"_type\":\"text\",\"_text\":\"Play\"}]}]}]}"

export default function ConvertXmlTest() {
  describe('convertXmlTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   testConvertXmlConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_0100
     * @tc.desc   Testing the convertxml convertToJSObject with trim is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertXmlConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testConvertXmlConstructor0001';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML()
        let options: convertxml.ConvertOptions = {
          trim: true,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements"
        }
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual(jsonStr)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_0200
     * @tc.desc   Testing the convertxml convertToJSObject with trim is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertXmlConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testConvertXmlConstructor0002';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML()
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements"
        }
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual(jsonStr)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_0300
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreDeclaration is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertXmlConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testConvertXmlConstructor0003';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: true,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result)
          .assertEqual('{"_elements":[{"_type":"element","_name":"note","_attributes":{"importance":"high",' +
            '"logged":"true"},"_elements":[{"_type":"element","_name":"title","_parent":"note","_elements":' +
            '[{"_type":"text","_text":"Happy"}]},{"_type":"element","_name":"todo","_parent":"note","_elements":' +
            '[{"_type":"text","_text":"Work"}]},{"_type":"element","_name":"todo","_parent":"note","_elements":' +
            '[{"_type":"text","_text":"Play"}]}]}]}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_0400
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreDeclaration is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0004';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual(jsonStr);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_0500
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreAttributes is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0005';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: true,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual('{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}},"_elements":' +
          '[{"_type":"element","_name":"note","_elements":[{"_type":"element","_name":"title","_parent":"note","_elements":' +
          '[{"_type":"text","_text":"Happy"}]},{"_type":"element","_name":"todo","_parent":"note","_elements":' +
          '[{"_type":"text","_text":"Work"}]},{"_type":"element","_name":"todo","_parent":"note","_elements":' +
          '[{"_type":"text","_text":"Play"}]}]}]}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_0600
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreAttributes is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0006';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: false,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual(jsonStr);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_0700
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreComment is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0007';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<!-- This is a comment -->' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: false,
          ignoreComment: true,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual("{\"_declaration\":{\"_attributes\":{\"version\":\"1.0\",\"encoding\":\"utf-8\"}}," +
          "\"_elements\":[{\"_type\":\"element\",\"_name\":\"note\",\"_attributes\":{\"importance\":\"high\"," +
          "\"logged\":\"true\"},\"_elements\":[{\"_type\":\"element\",\"_name\":\"title\",\"_parent\":\"note\"," +
          "\"_elements\":[{\"_type\":\"text\",\"_text\":\"Happy\"}]},{\"_type\":\"element\",\"_name\":\"todo\"," +
          "\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Work\"}]},{\"_type\":\"element\"," +
          "\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Play\"}]}]}]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_0800
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreComment is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0008';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<!-- This is a comment -->' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: false,
          ignoreComment: false,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual("{\"_declaration\":{\"_attributes\":{\"version\":\"1.0\",\"encoding\":\"utf-8\"}}," +
          "\"_elements\":[{\"_type\":\"comment\",\"_comment\":\" This is a comment \"},{\"_type\":\"element\",\"_name\"" +
          ":\"note\",\"_attributes\":{\"importance\":\"high\",\"logged\":\"true\"},\"_elements\":[{\"_type\":" +
          "\"element\",\"_name\":\"title\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Happy\"" +
          "}]},{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\"," +
          "\"_text\":\"Work\"}]},{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":" +
          "[{\"_type\":\"text\",\"_text\":\"Play\"}]}]}]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_0900
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreCDATA is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0009';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title><![CDATA[Happy]]></title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: false,
          ignoreComment: false,
          ignoreCDATA: true,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual("{\"_declaration\":{\"_attributes\":{\"version\":\"1.0\",\"encoding\":\"utf-8\"}}," +
          "\"_elements\":[{\"_type\":\"element\",\"_name\":\"note\",\"_attributes\":{\"importance\":\"high\"," +
          "\"logged\":\"true\"},\"_elements\":[{\"_type\":\"element\",\"_name\":\"title\",\"_parent\":\"note\"}," +
          "{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\"," +
          "\"_text\":\"Work\"}]},{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":" +
          "[{\"_type\":\"text\",\"_text\":\"Play\"}]}]}]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_1000
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreCDATA is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0010';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title><![CDATA[Happy]]></title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: false,
          ignoreComment: false,
          ignoreCDATA: false,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual("{\"_declaration\":{\"_attributes\":{\"version\":\"1.0\",\"encoding\":\"utf-8\"}}," +
          "\"_elements\":[{\"_type\":\"element\",\"_name\":\"note\",\"_attributes\":{\"importance\":\"high\"," +
          "\"logged\":\"true\"},\"_elements\":[{\"_type\":\"element\",\"_name\":\"title\",\"_parent\":\"note\"," +
          "\"_elements\":[{\"_type\":\"cdata\",\"_cdata\":\"Happy\"}]},{\"_type\":\"element\",\"_name\":\"todo\"," +
          "\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Work\"}]},{\"_type\":\"element\"," +
          "\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Play\"}]}]}]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_1100
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreDoctype is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0011';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<!DOCTYPE note SYSTEM "notes.dtd">' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: false,
          ignoreComment: false,
          ignoreCDATA: false,
          ignoreDoctype: true,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual("{\"_declaration\":{\"_attributes\":{\"version\":\"1.0\",\"encoding\":\"utf-8\"}}," +
          "\"_elements\":[{\"_type\":\"element\",\"_name\":\"note\",\"_attributes\":{\"importance\":\"high\"," +
          "\"logged\":\"true\"},\"_elements\":[{\"_type\":\"element\",\"_name\":\"title\",\"_parent\":\"note\"," +
          "\"_elements\":[{\"_type\":\"text\",\"_text\":\"Happy\"}]},{\"_type\":\"element\",\"_name\":\"todo\"," +
          "\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Work\"}]},{\"_type\":\"element\"," +
          "\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Play\"}]}]}]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_1200
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreDoctype is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0012';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<!DOCTYPE note SYSTEM "notes.dtd">' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: false,
          ignoreComment: false,
          ignoreCDATA: false,
          ignoreDoctype: false,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual("{\"_declaration\":{\"_attributes\":{\"version\":\"1.0\",\"encoding\":\"utf-8\"}}," +
          "\"_elements\":[{\"_type\":\"doctype\",\"_doctype\":\"note\"},{\"_type\":\"element\",\"_name\":\"note\"," +
          "\"_attributes\":{\"importance\":\"high\",\"logged\":\"true\"},\"_elements\":[{\"_type\":\"element\"," +
          "\"_name\":\"title\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Happy\"}]}," +
          "{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\"," +
          "\"_text\":\"Work\"}]},{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":" +
          "[{\"_type\":\"text\",\"_text\":\"Play\"}]}]}]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_1300
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreText is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0013';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: false,
          ignoreComment: false,
          ignoreCDATA: false,
          ignoreDoctype: false,
          ignoreText: true,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual("{\"_declaration\":{\"_attributes\":{\"version\":\"1.0\",\"encoding\":\"utf-8\"}}" +
          ",\"_elements\":[{\"_type\":\"element\",\"_name\":\"note\",\"_attributes\":{\"importance\":\"high\"," +
          "\"logged\":\"true\"},\"_elements\":[{\"_type\":\"element\",\"_name\":\"title\",\"_parent\":\"note\"}," +
          "{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\"},{\"_type\":\"element\",\"_name\":" +
          "\"todo\",\"_parent\":\"note\"}]}]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_1400
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreText is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0014';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements",
          ignoreDeclaration: false,
          ignoreAttributes: false,
          ignoreComment: false,
          ignoreCDATA: false,
          ignoreDoctype: false,
          ignoreText: false,
        };
        let result = JSON.stringify(conv.convertToJSObject(xml, options));
        expect(result).assertEqual("{\"_declaration\":{\"_attributes\":{\"version\":\"1.0\",\"encoding\":\"utf-8\"}}," +
          "\"_elements\":[{\"_type\":\"element\",\"_name\":\"note\",\"_attributes\":{\"importance\":\"high\"," +
          "\"logged\":\"true\"},\"_elements\":[{\"_type\":\"element\",\"_name\":\"title\",\"_parent\":\"note\"," +
          "\"_elements\":[{\"_type\":\"text\",\"_text\":\"Happy\"}]},{\"_type\":\"element\",\"_name\":\"todo\"," +
          "\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Work\"}]},{\"_type\":\"element\"," +
          "\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Play\"}]}]}]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConvertXmlConstructor0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML_CONSTRUCTOR_1500
     * @tc.desc   Testing the convertxml convertToJSObject with ignoreText is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXmlConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConvertXmlConstructor0015';
      try {
        let xml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let conv = new convertxml.ConvertXML();
        let options: convertxml.ConvertOptions = {trim : false, declarationKey:"_declaration",
          instructionKey : "_instruction", attributesKey : "_attributes",
          textKey : "_text", cdataKey:"_cdata", doctypeKey : "_doctype",
          commentKey : "_comment", parentKey : "_parent", typeKey : "_type",
          nameKey : "_name", elementsKey : "_elements"}
        let result = JSON.stringify(conv.convert(xml, options));
        expect(result).assertEqual("{\"_declaration\":{\"_attributes\":{\"version\":\"" +
          "1.0\",\"encoding\":\"utf-8\"}},\"_elements\":[{\"_type\":\"element\",\"_name\":\"note\"," +
          "\"_attributes\":{\"importance\":\"high\",\"logged\":\"true\"},\"_elements\":[{\"_type\":" +
          "\"element\",\"_name\":\"title\",\"_parent\":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":" +
          "\"Happy\"}]},{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\":\"note\",\"_elements\":" +
          "[{\"_type\":\"text\",\"_text\":\"Work\"}]},{\"_type\":\"element\",\"_name\":\"todo\",\"_parent\"" +
          ":\"note\",\"_elements\":[{\"_type\":\"text\",\"_text\":\"Play\"}]}]}]}")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFastConvertToJSObject0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0100
     * @tc.desc   Test the function of the interface fastConvertToJSObject.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFastConvertToJSObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastConvertToJSObject0001';
      try {
        const xml = `<?xml version="1.0" encoding="utf-8"?>
                      <note importance="high" logged="true">
                          <title>Hello\r\nWorld</title>
                          <todo><![CDATA[Work\r\n]]></todo>
                      </note>`;
        const conv = new convertxml.ConvertXML();
        const options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements"
        };
        const result = JSON.stringify(conv.fastConvertToJSObject(xml, options));
        console.log(`${TAG}+${result}`);
        const equal =
          '{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}},"_elements":[{"_type":"element","_name":"note","_attributes":{"importance":"high","logged":"true"},"_elements":[{"_type":"element","_name":"title","_parent":"note","_elements":[{"_type":"text","_text":"Hello\\nWorld"}]},{"_type":"element","_name":"todo","_parent":"note","_elements":[{"_type":"cdata","_cdata":"Work\\n"}]}]}]}';
        expect(result.toString()).assertEqual(equal);
      } catch (e) {
        console.log((e as Error).toString());
        console.error(`${TAG} failed: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testLargeConvertToJSObject0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0101
     * @tc.desc   Test the function of the interface largeConvertToJSObject.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLargeConvertToJSObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLargeConvertToJSObject0001';
      try {
        const xml = `<?xml version="1.0" encoding="utf-8"?>
                      <note importance="high" logged="true">
                          <title>Hello\r\nWorld</title>
                          <todo><![CDATA[Work\r\n]]></todo>
                      </note>`;
        const conv = new convertxml.ConvertXML();
        const options: convertxml.ConvertOptions = {
          trim: false,
          declarationKey: "_declaration",
          instructionKey: "_instruction",
          attributesKey: "_attributes",
          textKey: "_text",
          cdataKey: "_cdata",
          doctypeKey: "_doctype",
          commentKey: "_comment",
          parentKey: "_parent",
          typeKey: "_type",
          nameKey: "_name",
          elementsKey: "_elements"
        };
        const result = JSON.stringify(conv.largeConvertToJSObject(xml, options));
        console.log(`${TAG}+${result}`);
        const equal =
          '{"_declaration":{"_attributes":{"version":"1.0","encoding":"utf-8"}},"_elements":[{"_type":"element","_name":"note","_attributes":{"importance":"high","logged":"true"},"_elements":[{"_type":"element","_name":"title","_parent":"note","_elements":[{"_type":"text","_text":"Hello\\nWorld"}]},{"_type":"element","_name":"todo","_parent":"note","_elements":[{"_type":"cdata","_cdata":"Work\\n"}]}]}]}';
        expect(result.toString()).assertEqual(equal);
      } catch (e) {
        console.log((e as Error).toString());
        console.error(`${TAG} failed: ${e.message}`);
        expect().assertFail();
      }
    });
  })
}