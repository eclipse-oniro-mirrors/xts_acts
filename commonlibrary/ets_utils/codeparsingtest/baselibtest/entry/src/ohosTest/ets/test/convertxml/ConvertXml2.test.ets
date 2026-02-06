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

export default function ConvertXml2Test() {
  describe('convertXml2Test', () => {
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
     * @tc.name   testConvertXml20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_0100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertXml20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = runTest(`
      <user>
      <name>李四</name>
      <age>30</age>
      <city>上海</city>
      </user>
      `);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "user",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "name",\n' +
        '          "_parent": "user",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "李四"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "age",\n' +
        '          "_parent": "user",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "30"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "city",\n' +
        '          "_parent": "user",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "上海"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_0200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<company>
  <department>
    <name>研发部</name>
    <leader>王工</leader>
  </department>
</company>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "company",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "department",\n' +
        '          "_parent": "company",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "name",\n' +
        '              "_parent": "department",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "研发部"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "leader",\n' +
        '              "_parent": "department",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "王工"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });
    /**
     * @tc.name   testConvertXml20003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_0300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<data>
  <image src="logo.png" />
  <enabled />
</data>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "data",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "image",\n' +
        '          "_parent": "data",\n' +
        '          "_attributes": {\n' +
        '            "src": "logo.png"\n' +
        '          }\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "enabled",\n' +
        '          "_parent": "data"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_0400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<person id="1001" role="admin">
  <name>张三</name>
</person>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "person",\n' +
        '      "_attributes": {\n' +
        '        "id": "1001",\n' +
        '        "role": "admin"\n' +
        '      },\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "name",\n' +
        '          "_parent": "person",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "张三"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_0500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<message>操作成功</message>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "message",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "操作成功"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_0600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<note>你好 😊！今天天气很好~@#￥%</note>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "note",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "你好 😊！今天天气很好~@#￥%"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_0700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<desc>小于号:&lt; 和引号&quot;都转义了</desc>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "desc",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "小于号:< 和引号\\"都转义了"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_0800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result =
        runTest(`<script><![CDATA[ function() { return a < b; } ]]></script>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "script",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "cdata",\n' +
        '          "_cdata": " function() { return a < b; } "\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_0900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<wrapper>前缀文本<child>子内容</child>后缀文本</wrapper>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "wrapper",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "child",\n' +
        '          "_parent": "wrapper",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "子内容"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<list>
  <item>苹果</item>
  <item>香蕉</item>
  <item>橙子</item>
</list>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "list",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "list",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "苹果"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "list",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "香蕉"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "list",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "橙子"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest("");
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(null);
      expect(result).assertEqual(401);
    });

    /**
     * @tc.name   testConvertXml20013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(undefined);
      expect(result).assertEqual(401);
    });

    /**
     * @tc.name   testConvertXml20014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest("   \n\t  ");
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(123);
      expect(result).assertEqual(401);
    });

    /**
     * @tc.name   testConvertXml20016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(true);
      expect(result).assertEqual(401);
    });

    /**
     * @tc.name   testConvertXml20017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest({ a: 1 });
      expect(result).assertEqual(401);
    });

    /**
     * @tc.name   testConvertXml20018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const longXml = `<root>${Array(10).fill("<item>数据</item>").join("")}</root>`;
      let result = runTest(longXml);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "root",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "item",\n' +
        '          "_parent": "root",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "数据"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_1900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<user><name>Tom</name><email>t@x.com</user>`);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<a><b></a></b>`);
      expect(result).assertEqual('{}');
    });


    /**
     * @tc.name   testConvertXml20021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<user><name>张三</name><age>25</age></user>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "user",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "name",\n' +
        '          "_parent": "user",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "张三"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "age",\n' +
        '          "_parent": "user",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "25"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<app><config><debug>true</debug></config></app>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "app",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "config",\n' +
        '          "_parent": "app",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "debug",\n' +
        '              "_parent": "config",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "true"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<data><flag /><value>42</value></data>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "data",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "flag",\n' +
        '          "_parent": "data"\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "value",\n' +
        '          "_parent": "data",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "42"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<msg>操作完成</msg>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "msg",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "操作完成"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<item><title></title><body></body></item>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "item",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "title",\n' +
        '          "_parent": "item"\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "body",\n' +
        '          "_parent": "item"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<p>前文<em>强调</em>后文</p>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "p",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "em",\n' +
        '          "_parent": "p",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "强调"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<fruits><fruit>苹果</fruit><fruit>香蕉</fruit></fruits>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "fruits",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "fruit",\n' +
        '          "_parent": "fruits",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "苹果"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "fruit",\n' +
        '          "_parent": "fruits",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "香蕉"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<root>单一内容</root>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "root",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "单一内容"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_2900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<a><b><c><d>deep</d></c></b></a>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "a",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "b",\n' +
        '          "_parent": "a",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "c",\n' +
        '              "_parent": "b",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "d",\n' +
        '                  "_parent": "c",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "deep"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<user1><id>1001</id></user1>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "user1",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "id",\n' +
        '          "_parent": "user1",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "1001"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<通知>你好世界</通知>`,);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "通知",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "你好世界"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<code>if(a<b && c>d){"hello"}</code>`);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<desc>使用&amp;连接&lt;标签&quot;属性</desc>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "desc",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "使用&连接<标签\\"属性"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<script><![CDATA[for(i=0;i<10;i++){}]]></script>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "script",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "cdata",\n' +
        '          "_cdata": "for(i=0;i<10;i++){}"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<data><![CDATA[<!-- not a comment -->]]></data>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "data",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "cdata",\n' +
        '          "_cdata": "<!-- not a comment -->"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<user>
  <name>
    换行文本
  </name>
</user>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "user",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "name",\n' +
        '          "_parent": "user",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "\\n    换行文本\\n  "\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<log>提交成功 ✅</log>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "log",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "提交成功 ✅"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<name>Señor José ½ €</name>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "name",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "Señor José ½ €"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_3900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<char>&#x4F60;&#x597D;</char>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "char",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "你好"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<char>&#20320;&#22909;</char>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "char",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "你好"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });
    /**
     * @tc.name   testConvertXml20041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<person name="李四" age="30"/>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "person",\n' +
        '      "_attributes": {\n' +
        '        "name": "李四",\n' +
        '        "age": "30"\n' +
        '      }\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<城市 名称="北京" 类型="直辖市"/>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "城市",\n' +
        '      "_attributes": {\n' +
        '        "名称": "北京",\n' +
        '        "类型": "直辖市"\n' +
        '      }\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<tag value="a<b & c>d" enabled="true"/>`);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<file path="/a/b" size="1024" readonly="yes"/>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "file",\n' +
        '      "_attributes": {\n' +
        '        "path": "/a/b",\n' +
        '        "size": "1024",\n' +
        '        "readonly": "yes"\n' +
        '      }\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<img src="" alt=""/>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "img",\n' +
        '      "_attributes": {\n' +
        '        "src": "",\n' +
        '        "alt": ""\n' +
        '      }\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<input disabled required/>`);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<div id="main" class="box"><p>内容</p></div>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "div",\n' +
        '      "_attributes": {\n' +
        '        "id": "main",\n' +
        '        "class": "box"\n' +
        '      },\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "p",\n' +
        '          "_parent": "div",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "内容"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<item id="1">数据</item>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "item",\n' +
        '      "_attributes": {\n' +
        '        "id": "1"\n' +
        '      },\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "text",\n' +
        '          "_text": "数据"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_4900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<tag 1name="invalid">test</tag>`);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`<tag name=test>无效语法</tag>`);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<article>
  本文介绍：
  <code><![CDATA[function hello() { return "Hello!"; }]]></code>
  请参考以上脚本。
</article>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "article",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "code",\n' +
        '          "_parent": "article",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "cdata",\n' +
        '              "_cdata": "function hello() { return \\"Hello!\\"; }"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<doc xmlns:ui="http://schema.openharmony.cn/ui">
  <ui:title>界面标题</ui:title>
  <ui:button enabled="true">确定</ui:button>
</doc>
`);
      expect(result).assertEqual('{\n' +
        '  "_declaration": {\n' +
        '    "_attributes": {\n' +
        '      "version": "1.0"\n' +
        '    }\n' +
        '  },\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "doc",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "title",\n' +
        '          "_parent": "doc",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "界面标题"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "button",\n' +
        '          "_parent": "doc",\n' +
        '          "_attributes": {\n' +
        '            "enabled": "true"\n' +
        '          },\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "确定"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<window id="mainWin" visible="true">
  <layout type="vertical">
    <button id="btnSubmit" disabled="false">提交</button>
    <input placeholder="请输入" required="true"/>
  </layout>
</window>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "window",\n' +
        '      "_attributes": {\n' +
        '        "id": "mainWin",\n' +
        '        "visible": "true"\n' +
        '      },\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "layout",\n' +
        '          "_parent": "window",\n' +
        '          "_attributes": {\n' +
        '            "type": "vertical"\n' +
        '          },\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "button",\n' +
        '              "_parent": "layout",\n' +
        '              "_attributes": {\n' +
        '                "id": "btnSubmit",\n' +
        '                "disabled": "false"\n' +
        '              },\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "提交"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "input",\n' +
        '              "_parent": "layout",\n' +
        '              "_attributes": {\n' +
        '                "placeholder": "请输入",\n' +
        '                "required": "true"\n' +
        '              }\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<app>
  <config>
    <debug>true</debug>
    <log><level>INFO</level></log>
  </config>
  <log>
    <level>ERROR</level>
    <message>启动失败</message>
  </log>
</app>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "app",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "config",\n' +
        '          "_parent": "app",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "debug",\n' +
        '              "_parent": "config",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "true"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "log",\n' +
        '              "_parent": "config",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "level",\n' +
        '                  "_parent": "log",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "INFO"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "log",\n' +
        '          "_parent": "app",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "level",\n' +
        '              "_parent": "log",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "ERROR"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "message",\n' +
        '              "_parent": "log",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "启动失败"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<users>
  <user>
    <name>张三</name>
    <age>28</age>
    <address>
      <city>北京</city>
      <district>朝阳区</district>
    </address>
  </user>
  <user>
    <name>李四</name>
    <age>32</age>
    <address>
      <city>上海</city>
      <district>浦东新区</district>
    </address>
  </user>
</users>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "users",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "user",\n' +
        '          "_parent": "users",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "name",\n' +
        '              "_parent": "user",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "张三"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "age",\n' +
        '              "_parent": "user",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "28"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "address",\n' +
        '              "_parent": "user",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "city",\n' +
        '                  "_parent": "address",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "北京"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                },\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "district",\n' +
        '                  "_parent": "address",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "朝阳区"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "user",\n' +
        '          "_parent": "users",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "name",\n' +
        '              "_parent": "user",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "李四"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "age",\n' +
        '              "_parent": "user",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "32"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "address",\n' +
        '              "_parent": "user",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "city",\n' +
        '                  "_parent": "address",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "上海"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                },\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "district",\n' +
        '                  "_parent": "address",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "浦东新区"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<system>
  <platform>
    <service>
      <module>
        <component>Renderer</component>
      </module>
    </service>
  </platform>
</system>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "system",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "platform",\n' +
        '          "_parent": "system",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "service",\n' +
        '              "_parent": "platform",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "module",\n' +
        '                  "_parent": "service",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "component",\n' +
        '                      "_parent": "module",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "text",\n' +
        '                          "_text": "Renderer"\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(["<a>1</a>", "<b>2</b>"]);
      expect(result).assertEqual(401);
    });

    /**
     * @tc.name   testConvertXml20058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest({ xml: "<a>1</a>" });
      expect(result).assertEqual(401);
    });

    /**
     * @tc.name   testConvertXml20059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_5900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<orders>
  <order>
    <id>1001</id>
    <customer>
      <name>王五</name>
      <phone>13800138000</phone>
    </customer>
    <items>
      <item><name>手机</name><qty>1</qty></item>
      <item><name>耳机</name><qty>2</qty></item>
    </items>
    <total>5999.00</total>
  </order>
  <order>
    <id>1002</id>
    <customer>
      <name>赵六</name>
      <phone>13900139000</phone>
    </customer>
    <items>
      <item><name>平板</name><qty>1</qty></item>
    </items>
    <total>3299.00</total>
  </order>
</orders>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "orders",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "order",\n' +
        '          "_parent": "orders",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "id",\n' +
        '              "_parent": "order",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "1001"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "customer",\n' +
        '              "_parent": "order",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "name",\n' +
        '                  "_parent": "customer",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "王五"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                },\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "phone",\n' +
        '                  "_parent": "customer",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "13800138000"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "items",\n' +
        '              "_parent": "order",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "item",\n' +
        '                  "_parent": "items",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "name",\n' +
        '                      "_parent": "item",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "text",\n' +
        '                          "_text": "手机"\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    },\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "qty",\n' +
        '                      "_parent": "item",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "text",\n' +
        '                          "_text": "1"\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    }\n' +
        '                  ]\n' +
        '                },\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "item",\n' +
        '                  "_parent": "items",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "name",\n' +
        '                      "_parent": "item",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "text",\n' +
        '                          "_text": "耳机"\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    },\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "qty",\n' +
        '                      "_parent": "item",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "text",\n' +
        '                          "_text": "2"\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "total",\n' +
        '              "_parent": "order",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "5999.00"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "order",\n' +
        '          "_parent": "orders",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "id",\n' +
        '              "_parent": "order",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "1002"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "customer",\n' +
        '              "_parent": "order",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "name",\n' +
        '                  "_parent": "customer",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "赵六"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                },\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "phone",\n' +
        '                  "_parent": "customer",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "13900139000"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "items",\n' +
        '              "_parent": "order",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "item",\n' +
        '                  "_parent": "items",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "name",\n' +
        '                      "_parent": "item",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "text",\n' +
        '                          "_text": "平板"\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    },\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "qty",\n' +
        '                      "_parent": "item",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "text",\n' +
        '                          "_text": "1"\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "total",\n' +
        '              "_parent": "order",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "3299.00"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<profile>
  <username>admin</username>
  <email>admin@example.com</email>
  <phone></phone>
  <avatar/>
  <bio>暂无简介</bio>
</profile>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "profile",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "username",\n' +
        '          "_parent": "profile",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "admin"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "email",\n' +
        '          "_parent": "profile",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "admin@example.com"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "phone",\n' +
        '          "_parent": "profile"\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "avatar",\n' +
        '          "_parent": "profile"\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "bio",\n' +
        '          "_parent": "profile",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "暂无简介"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<form>
  <field name="username" type="text"/>
  <field name="password" type="password"/>
  <submit>登录</submit>
  <reset>重置</reset>
</form>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "form",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "field",\n' +
        '          "_parent": "form",\n' +
        '          "_attributes": {\n' +
        '            "name": "username",\n' +
        '            "type": "text"\n' +
        '          }\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "field",\n' +
        '          "_parent": "form",\n' +
        '          "_attributes": {\n' +
        '            "name": "password",\n' +
        '            "type": "password"\n' +
        '          }\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "submit",\n' +
        '          "_parent": "form",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "登录"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "reset",\n' +
        '          "_parent": "form",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "重置"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<meta encoding="utf-8">UTF-8编码</meta>
<version no="2.1.0">最新版本</version>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "meta"\n' +
        '    },\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "version"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<a><b><c><d><e><f><g><h><i><j>deep data</j></i></h></g></f></e></d></c></b></a>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "a",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "b",\n' +
        '          "_parent": "a",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "c",\n' +
        '              "_parent": "b",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "d",\n' +
        '                  "_parent": "c",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "e",\n' +
        '                      "_parent": "d",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "element",\n' +
        '                          "_name": "f",\n' +
        '                          "_parent": "e",\n' +
        '                          "_elements": [\n' +
        '                            {\n' +
        '                              "_type": "element",\n' +
        '                              "_name": "g",\n' +
        '                              "_parent": "f",\n' +
        '                              "_elements": [\n' +
        '                                {\n' +
        '                                  "_type": "element",\n' +
        '                                  "_name": "h",\n' +
        '                                  "_parent": "g",\n' +
        '                                  "_elements": [\n' +
        '                                    {\n' +
        '                                      "_type": "element",\n' +
        '                                      "_name": "i",\n' +
        '                                      "_parent": "h",\n' +
        '                                      "_elements": [\n' +
        '                                        {\n' +
        '                                          "_type": "element",\n' +
        '                                          "_name": "j",\n' +
        '                                          "_parent": "i",\n' +
        '                                          "_elements": [\n' +
        '                                            {\n' +
        '                                              "_type": "text",\n' +
        '                                              "_text": "deep data"\n' +
        '                                            }\n' +
        '                                          ]\n' +
        '                                        }\n' +
        '                                      ]\n' +
        '                                    }\n' +
        '                                  ]\n' +
        '                                }\n' +
        '                              ]\n' +
        '                            }\n' +
        '                          ]\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<应用程序>
  <窗口 标题="主界面">
    <布局>
      <按钮>保存</按钮>
      <输入框 提示="请输入姓名"/>
    </布局>
  </窗口>
</应用程序>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "应用程序",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "窗口",\n' +
        '          "_parent": "应用程序",\n' +
        '          "_attributes": {\n' +
        '            "标题": "主界面"\n' +
        '          },\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "布局",\n' +
        '              "_parent": "窗口",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "按钮",\n' +
        '                  "_parent": "布局",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "保存"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                },\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "输入框",\n' +
        '                  "_parent": "布局",\n' +
        '                  "_attributes": {\n' +
        '                    "提示": "请输入姓名"\n' +
        '                  }\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<config>
  <appName>MyApp</appName>
  <version>1.2.3</version>
  <debug>true</debug>
  <maxRetries>3</maxRetries>
  <autoSave>false</autoSave>
  <timeout>3000</timeout>
</config>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "config",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "appName",\n' +
        '          "_parent": "config",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "MyApp"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "version",\n' +
        '          "_parent": "config",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "1.2.3"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "debug",\n' +
        '          "_parent": "config",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "true"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "maxRetries",\n' +
        '          "_parent": "config",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "3"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "autoSave",\n' +
        '          "_parent": "config",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "false"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "timeout",\n' +
        '          "_parent": "config",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "3000"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<!-- 用户权限配置 -->
<permissions>
  <!-- 管理员权限 -->
  <role name="admin">
    <allow>create</allow>
    <allow>delete</allow>
    <deny>none</deny>
  </role>
  <!-- 普通用户 -->
  <role name="user">
    <allow>read</allow>
    <deny>write</deny>
  </role>
</permissions>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "comment",\n' +
        '      "_comment": " 用户权限配置 "\n' +
        '    },\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "permissions",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "comment",\n' +
        '          "_comment": " 管理员权限 "\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "role",\n' +
        '          "_parent": "permissions",\n' +
        '          "_attributes": {\n' +
        '            "name": "admin"\n' +
        '          },\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "allow",\n' +
        '              "_parent": "role",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "create"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "allow",\n' +
        '              "_parent": "role",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "delete"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "deny",\n' +
        '              "_parent": "role",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "none"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "comment",\n' +
        '          "_comment": " 普通用户 "\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "role",\n' +
        '          "_parent": "permissions",\n' +
        '          "_attributes": {\n' +
        '            "name": "user"\n' +
        '          },\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "allow",\n' +
        '              "_parent": "role",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "read"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "deny",\n' +
        '              "_parent": "role",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "write"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<template>
  <![CDATA[
  <div onclick="alert('click')">
    <p>{{ message }}</p>
    <script>console.log("init");</script>
  </div>
  ]]>
</template>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "template",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "cdata",\n' +
        '          "_cdata": "\\n  <div onclick=\\"alert(\'click\')\\">\\n    <p>{{ message }}</p>\\n    <script>console.log(\\"init\\");</script>\\n  </div>\\n  "\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<books>
  <book>
    <title>JavaScript高级程序设计</title>
    <author>尼古拉斯</author>
  </book>
</books>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "books",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "book",\n' +
        '          "_parent": "books",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "title",\n' +
        '              "_parent": "book",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "JavaScript高级程序设计"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "author",\n' +
        '              "_parent": "book",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "尼古拉斯"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_6900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<通知 id="n_101" 状态="未读" 时间="2025-04-05T10:00:00">
  <标题>系统提醒</标题>
  <内容>
    您有新的消息 &lt;点击查看&gt;
    <![CDATA[点击这里：https://example.com?token=a&b=c]]>
  </内容>
  <操作>
    <按钮 action="read">标记为已读</按钮>
    <按钮 action="delete">删除</按钮>
  </操作>
</通知>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "通知",\n' +
        '      "_attributes": {\n' +
        '        "id": "n_101",\n' +
        '        "状态": "未读",\n' +
        '        "时间": "2025-04-05T10:00:00"\n' +
        '      },\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "标题",\n' +
        '          "_parent": "通知",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "系统提醒"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "内容",\n' +
        '          "_parent": "通知",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "cdata",\n' +
        '              "_cdata": "点击这里：https://example.com?token=a&b=c"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "操作",\n' +
        '          "_parent": "通知",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "按钮",\n' +
        '              "_parent": "操作",\n' +
        '              "_attributes": {\n' +
        '                "action": "read"\n' +
        '              },\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "标记为已读"\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "按钮",\n' +
        '              "_parent": "操作",\n' +
        '              "_attributes": {\n' +
        '                "action": "delete"\n' +
        '              },\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "删除"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const longText = "描述".repeat(1000);
      let result = runTest(`
<document>
  <title>长篇文档</title>
  <body>${longText}</body>
</document>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "document",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "title",\n' +
        '          "_parent": "document",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "长篇文档"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "body",\n' +
        '          "_parent": "document",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<org>
  <dept name="总公司">
    <dept name="研发部">
      <employee>张工</employee>
      <employee>李工</employee>
    </dept>
    <dept name="销售部">
      <employee>王经理</employee>
    </dept>
  </dept>
</org>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "org",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "dept",\n' +
        '          "_parent": "org",\n' +
        '          "_attributes": {\n' +
        '            "name": "总公司"\n' +
        '          },\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "dept",\n' +
        '              "_parent": "dept",\n' +
        '              "_attributes": {\n' +
        '                "name": "研发部"\n' +
        '              },\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "employee",\n' +
        '                  "_parent": "dept",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "张工"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                },\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "employee",\n' +
        '                  "_parent": "dept",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "李工"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "dept",\n' +
        '              "_parent": "dept",\n' +
        '              "_attributes": {\n' +
        '                "name": "销售部"\n' +
        '              },\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "employee",\n' +
        '                  "_parent": "dept",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "text",\n' +
        '                      "_text": "王经理"\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = runTest(`
<application xmlns="http://openharmony.cn/schema/app">
  <module name="entry" type="entry">
    <abilities>
      <ability
        name="MainAbility"
        label="主页面"
        icon="/icon.png"
        exported="true">
        <intent>
          <action name="default"/>
          <category name="launcher"/>
        </intent>
      </ability>
    </abilities>
    <meta-data>
      <param name="api_level" value="12"/>
      <param name="debug" value="true"/>
    </meta-data>
  </module>
  <dependencies>
    <dependency component="logger" version="1.0"/>
  </dependencies>
</application>
`);
      expect(result).assertEqual('{\n' +
        '  "_declaration": {\n' +
        '    "_attributes": {\n' +
        '      "version": "1.0"\n' +
        '    }\n' +
        '  },\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "application",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "module",\n' +
        '          "_parent": "application",\n' +
        '          "_attributes": {\n' +
        '            "name": "entry",\n' +
        '            "type": "entry"\n' +
        '          },\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "abilities",\n' +
        '              "_parent": "module",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "ability",\n' +
        '                  "_parent": "abilities",\n' +
        '                  "_attributes": {\n' +
        '                    "name": "MainAbility",\n' +
        '                    "label": "主页面",\n' +
        '                    "icon": "/icon.png",\n' +
        '                    "exported": "true"\n' +
        '                  },\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "intent",\n' +
        '                      "_parent": "ability",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "element",\n' +
        '                          "_name": "action",\n' +
        '                          "_parent": "intent",\n' +
        '                          "_attributes": {\n' +
        '                            "name": "default"\n' +
        '                          }\n' +
        '                        },\n' +
        '                        {\n' +
        '                          "_type": "element",\n' +
        '                          "_name": "category",\n' +
        '                          "_parent": "intent",\n' +
        '                          "_attributes": {\n' +
        '                            "name": "launcher"\n' +
        '                          }\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            },\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "meta-data",\n' +
        '              "_parent": "module",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "param",\n' +
        '                  "_parent": "meta-data",\n' +
        '                  "_attributes": {\n' +
        '                    "name": "api_level",\n' +
        '                    "value": "12"\n' +
        '                  }\n' +
        '                },\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "param",\n' +
        '                  "_parent": "meta-data",\n' +
        '                  "_attributes": {\n' +
        '                    "name": "debug",\n' +
        '                    "value": "true"\n' +
        '                  }\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "dependencies",\n' +
        '          "_parent": "application",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "dependency",\n' +
        '              "_parent": "dependencies",\n' +
        '              "_attributes": {\n' +
        '                "component": "logger",\n' +
        '                "version": "1.0"\n' +
        '              }\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testCase(`
<person id="1001">
  <name> 张三 </name>
  <script><![CDATA[alert(1);]]></script>
  <mixed>前文<b>加粗</b>后文</mixed>
</person>
`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "person",\n' +
        '      "_attributes": {\n' +
        '        "id": "1001"\n' +
        '      },\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "name",\n' +
        '          "_parent": "person",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "text",\n' +
        '              "_text": " 张三 "\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "script",\n' +
        '          "_parent": "person",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "cdata",\n' +
        '              "_cdata": "alert(1);"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "mixed",\n' +
        '          "_parent": "person",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "b",\n' +
        '              "_parent": "mixed",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "text",\n' +
        '                  "_text": "加粗"\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        trim: true,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      }
      let result = testCase(`
<user>
  <nickname>  李四  </nickname>
  <bio>   爱好旅行     </bio>
</user>
`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": [\n' +
        '            {\n' +
        '              "": "李四"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "": [\n' +
        '            {\n' +
        '              "": "爱好旅行"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = testCase(`
<msg>  Hello World  </msg>
`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "  Hello World  "\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreAttributes: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = testCase(`
<book isbn="978-xxx" price="59.9">
  <title>JavaScript高级</title>
</book>
`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": [\n' +
        '            {\n' +
        '              "": "JavaScript高级"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreAttributes: false,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = testCase(`
<product code="P001" inStock="true">手机</product>
`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "手机"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });
    /**
     * @tc.name   testConvertXml20078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        trim: true,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<name>  张三  </name>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "张三"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_7900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<note>  数据  </note>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "  数据  "\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        trim: true,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<desc>\n  内容开始\n  结束  \n</desc>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "\\n  内容开始\\n  结束  \\n"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        trim: true,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<list><item> 苹果 </item><item> 香蕉 </item></list>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": [\n' +
        '            {\n' +
        '              "": "苹果"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "": [\n' +
        '            {\n' +
        '              "": "香蕉"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDeclaration: false,
        declarationKey: "decl",
        trim: false,
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?xml version="1.0"?><data/>`, options);
      expect(result).assertEqual('{\n' +
        '  "decl": {\n' +
        '    "": {\n' +
        '      "version": "1.0"\n' +
        '    }\n' +
        '  },\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "data"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDeclaration: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?xml version="1.0"?><user>张三</user>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "张三"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDeclaration: false,
        declarationKey: "xmlDecl",
        trim: false,
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?xml version="1.0" encoding="UTF-8"?><app/>`, options);
      expect(result).assertEqual('{\n' +
        '  "xmlDecl": {\n' +
        '    "": {\n' +
        '      "version": "1.0",\n' +
        '      "encoding": "UTF-8"\n' +
        '    }\n' +
        '  },\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "app"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreInstruction: false,
        instructionKey: "instr",
        trim: false,
        declarationKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?php echo 'hi'; ?><p>text</p>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "php",\n' +
        '      "instr": "echo \'hi\'; "\n' +
        '    },\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "text"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreInstruction: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?python run()?>内容`, options);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreInstruction: false,
        instructionKey: "pi",
        trim: false,
        declarationKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?a?><?b?><root/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "a",\n' +
        '      "pi": ""\n' +
        '    },\n' +
        '    {\n' +
        '      "": "b",\n' +
        '      "pi": ""\n' +
        '    },\n' +
        '    {\n' +
        '      "": "root"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreAttributes: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<input type="text" disabled/>`, options);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_8900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreAttributes: false,
        attributesKey: "attrs",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<book isbn="B001">JS指南</book>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "JS指南"\n' +
        '        }\n' +
        '      ],\n' +
        '      "attrs": {\n' +
        '        "isbn": "B001"\n' +
        '      }\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreAttributes: false,
        attributesKey: "props",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<div a="1" b="2" c="3">box</div>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "box"\n' +
        '        }\n' +
        '      ],\n' +
        '      "props": {\n' +
        '        "a": "1",\n' +
        '        "b": "2",\n' +
        '        "c": "3"\n' +
        '      }\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreComment: false,
        commentKey: "comment",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!-- 开始 --><p>内容</p>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "comment",\n' +
        '      "comment": " 开始 "\n' +
        '    },\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "内容"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreComment: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!-- 临时调试 -->数据`, options);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreComment: false,
        commentKey: "note",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!-- A --><!-- B --><root/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "comment",\n' +
        '      "note": " A "\n' +
        '    },\n' +
        '    {\n' +
        '      "": "comment",\n' +
        '      "note": " B "\n' +
        '    },\n' +
        '    {\n' +
        '      "": "root"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreCDATA: false,
        cdataKey: "cdata",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<script><![CDATA[alert(1);]]></script>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "cdata",\n' +
        '          "cdata": "alert(1);"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreCDATA: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<code><![CDATA[x=1;]]></code>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "code"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreCDATA: false,
        cdataKey: "content",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<a><![CDATA[A]]></a><b><![CDATA[B]]></b>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "a"\n' +
        '    },\n' +
        '    {\n' +
        '      "": "b"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDoctype: false,
        doctypeKey: "doctype",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!DOCTYPE html><html/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "doctype",\n' +
        '      "doctype": "html"\n' +
        '    },\n' +
        '    {\n' +
        '      "": "html"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDoctype: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!DOCTYPE note SYSTEM "note.dtd"><note/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "note"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_9900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDoctype: false,
        doctypeKey: "dtd",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0" "http://dtd/">`, options);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreText: false,
        textKey: "text",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<p>这是文本</p>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "text",\n' +
        '          "text": "这是文本"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });
    /**
     * @tc.name   testConvertXml20101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreText: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<span>被忽略</span>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "span"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreText: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<p>忽略<b>加粗</b>文本</p>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "p"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDeclaration: false,
        declarationKey: "xmlHeader",
        trim: false,
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?xml version="1.0"?><data/>`, options);
      expect(result).assertEqual('{\n' +
        '  "xmlHeader": {\n' +
        '    "": {\n' +
        '      "version": "1.0"\n' +
        '    }\n' +
        '  },\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "data"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDeclaration: false,
        declarationKey: "",
        trim: false,
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?xml?>`, options);
      expect(result).assertEqual('{\n' +
        '  "": {}\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDeclaration: false,
        declarationKey: "_decl",
        trim: false,
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?xml encoding="utf-8"?><app/>`, options);
      expect(result).assertEqual('{\n' +
        '  "_decl": {\n' +
        '    "": {\n' +
        '      "encoding": "utf-8"\n' +
        '    }\n' +
        '  },\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "app"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreInstruction: false,
        instructionKey: "processor",
        trim: false,
        declarationKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?php start()?>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "instruction",\n' +
        '      "processor": "start()"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreInstruction: false,
        instructionKey: "pis",
        trim: false,
        declarationKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<?a/><?b/>`, options);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        trim: true,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<tag id="1" class="red"/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "tag"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_10900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreAttributes: false,
        attributesKey: "fields",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<user name="tom" age="25"/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "user",\n' +
        '      "fields": {\n' +
        '        "name": "tom",\n' +
        '        "age": "25"\n' +
        '      }\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreAttributes: false,
        attributesKey: "",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<a href="#"/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "a"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreText: false,
        textKey: "value",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<msg>hello</msg>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "text",\n' +
        '          "value": "hello"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreText: false,
        textKey: "content",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<p>段落内容</p>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "text",\n' +
        '          "content": "段落内容"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreText: false,
        textKey: "",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<t>text</t>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "text"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreCDATA: false,
        cdataKey: "code",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<script><![CDATA[run();]]></script>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "cdata",\n' +
        '          "code": "run();"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreCDATA: false,
        cdataKey: "js",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<inline><![CDATA[func();]]></inline>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "cdata",\n' +
        '          "js": "func();"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreCDATA: false,
        cdataKey: "",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<![CDATA[data]]>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "cdata"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDoctype: false,
        doctypeKey: "schema",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!DOCTYPE html><h1/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "doctype",\n' +
        '      "schema": "html"\n' +
        '    },\n' +
        '    {\n' +
        '      "": "h1"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDoctype: false,
        doctypeKey: "dtd",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!DOCTYPE note SYSTEM "note.dtd"/>`, options);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   testConvertXml20119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_11900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreComment: false,
        commentKey: "remark",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!-- 测试 -->`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "comment",\n' +
        '      "remark": " 测试 "\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreComment: false,
        commentKey: "notes",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!-- A --><!-- B -->`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "comment",\n' +
        '      "notes": " A "\n' +
        '    },\n' +
        '    {\n' +
        '      "": "comment",\n' +
        '      "notes": " B "\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });


    /**
     * @tc.name   testConvertXml20121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        parentKey: "parentRef",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<root><child/></root>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "child",\n' +
        '          "parentRef": "root"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        parentKey: "_parent",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<a><b><c/></b></a>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": [\n' +
        '            {\n' +
        '              "": "c",\n' +
        '              "_parent": "b"\n' +
        '            }\n' +
        '          ],\n' +
        '          "_parent": "a"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        parentKey: "",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<x><y/></x>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "y"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        typeKey: "nodeType",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<p>text</p>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "nodeType": "element",\n' +
        '      "": [\n' +
        '        {\n' +
        '          "nodeType": "text",\n' +
        '          "": "text"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        typeKey: "kind",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<div/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "kind": "element",\n' +
        '      "": "div"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        typeKey: "",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<item/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "item"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        nameKey: "tagName",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        elementsKey: ''
      };
      let result = test(`<user/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "element",\n' +
        '      "tagName": "user"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        nameKey: "tag",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        elementsKey: ''
      };
      let result = test(`<img/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "element",\n' +
        '      "tag": "img"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_12900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        nameKey: "",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        elementsKey: ''
      };
      let result = test(`<box/>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "box"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        elementsKey: "children",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: ''
      };
      let result = test(`<ul><li>1</li><li>2</li></ul>`, options);
      expect(result).assertEqual('{\n' +
        '  "children": [\n' +
        '    {\n' +
        '      "": "ul",\n' +
        '      "children": [\n' +
        '        {\n' +
        '          "": "ul",\n' +
        '          "children": [\n' +
        '            {\n' +
        '              "": "1"\n' +
        '            }\n' +
        '          ]\n' +
        '        },\n' +
        '        {\n' +
        '          "": "ul",\n' +
        '          "children": [\n' +
        '            {\n' +
        '              "": "2"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13100
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        elementsKey: "items",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: ''
      };
      let result = test(`<list><item>A</item></list>`, options);
      expect(result).assertEqual('{\n' +
        '  "items": [\n' +
        '    {\n' +
        '      "": "list",\n' +
        '      "items": [\n' +
        '        {\n' +
        '          "": "list",\n' +
        '          "items": [\n' +
        '            {\n' +
        '              "": "A"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13200
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        elementsKey: "nodes",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: ''
      };
      let result = test(`<tree><node>根</node></tree>`, options);
      expect(result).assertEqual('{\n' +
        '  "nodes": [\n' +
        '    {\n' +
        '      "": "tree",\n' +
        '      "nodes": [\n' +
        '        {\n' +
        '          "": "tree",\n' +
        '          "nodes": [\n' +
        '            {\n' +
        '              "": "根"\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13300
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        elementsKey: "",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: ''
      };
      let result = test(`<root><a/><b/></root>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": [\n' +
        '        {\n' +
        '          "": "a"\n' +
        '        },\n' +
        '        {\n' +
        '          "": "b"\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13400
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDeclaration: true,
        ignoreInstruction: true,
        ignoreAttributes: true,
        ignoreComment: true,
        ignoreCDATA: true,
        ignoreDoctype: true,
        ignoreText: true,
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<p>text</p>`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "p"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13500
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDeclaration: false,
        ignoreInstruction: false,
        ignoreAttributes: false,
        ignoreComment: false,
        ignoreCDATA: false,
        ignoreDoctype: false,
        ignoreText: false,
        trim: true,
        declarationKey: "decl",
        instructionKey: "instr",
        attributesKey: "attrs",
        textKey: "text",
        cdataKey: "cdata",
        doctypeKey: "doctype",
        commentKey: "note",
        parentKey: "parent",
        typeKey: "type",
        nameKey: "name",
        elementsKey: "children"
      };
      let result = test(`<?xml?><!DOCTYPE a?><!-- c --><t a="b"><![CDATA[d]]></t><?pi?>`, options);
      expect(result).assertEqual('{\n' +
        '  "decl": {}\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20136
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13600
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        trim: true,
        ignoreDeclaration: true,
        ignoreInstruction: true,
        ignoreComment: true,
        ignoreCDATA: true,
        ignoreDoctype: true,
        ignoreAttributes: false,
        attributesKey: "attrs",
        textKey: "text",
        elementsKey: "children",
        declarationKey: '',
        instructionKey: '',
        cdataKey: '',
        doctypeKey: '',
        commentKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: ''
      };
      let result = test(`
<?xml version="1.0"?>
<!-- config -->
<app enabled="true">
  初始化
  <script><![CDATA[init();]]></script>
</app>
`, options);

      expect(result).assertEqual('{\n' +
        '  "": {\n' +
        '    "attrs": {\n' +
        '      "version": "1.0"\n' +
        '    }\n' +
        '  },\n' +
        '  "children": [\n' +
        '    {\n' +
        '      "": "comment"\n' +
        '    },\n' +
        '    {\n' +
        '      "": "app"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20137
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13700
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreDeclaration: false,
        ignoreInstruction: false,
        ignoreAttributes: false,
        ignoreComment: false,
        ignoreCDATA: false,
        ignoreDoctype: false,
        ignoreText: false,
        trim: true,

        declarationKey: "decl",
        instructionKey: "instr",
        attributesKey: "attrs",
        textKey: "text",
        cdataKey: "cdata",
        doctypeKey: "doctype",
        commentKey: "note",
        parentKey: "parent",
        typeKey: "type",
        nameKey: "name",
        elementsKey: "children"
      };
      let result = test(`<?xml?><!DOCTYPE a?><!-- c --><t a="b"><![CDATA[d]]></t><?pi?>`, options);
      expect(result).assertEqual('{\n' +
        '  "decl": {}\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20138
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13800
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test(`<a><b><c><d><e><f><g><h><i><j>deep</j></i></h></g></f></e></d></c></b></a>`);
      expect(result).assertEqual('{\n' +
        '  "_elements": [\n' +
        '    {\n' +
        '      "_type": "element",\n' +
        '      "_name": "a",\n' +
        '      "_elements": [\n' +
        '        {\n' +
        '          "_type": "element",\n' +
        '          "_name": "b",\n' +
        '          "_parent": "a",\n' +
        '          "_elements": [\n' +
        '            {\n' +
        '              "_type": "element",\n' +
        '              "_name": "c",\n' +
        '              "_parent": "b",\n' +
        '              "_elements": [\n' +
        '                {\n' +
        '                  "_type": "element",\n' +
        '                  "_name": "d",\n' +
        '                  "_parent": "c",\n' +
        '                  "_elements": [\n' +
        '                    {\n' +
        '                      "_type": "element",\n' +
        '                      "_name": "e",\n' +
        '                      "_parent": "d",\n' +
        '                      "_elements": [\n' +
        '                        {\n' +
        '                          "_type": "element",\n' +
        '                          "_name": "f",\n' +
        '                          "_parent": "e",\n' +
        '                          "_elements": [\n' +
        '                            {\n' +
        '                              "_type": "element",\n' +
        '                              "_name": "g",\n' +
        '                              "_parent": "f",\n' +
        '                              "_elements": [\n' +
        '                                {\n' +
        '                                  "_type": "element",\n' +
        '                                  "_name": "h",\n' +
        '                                  "_parent": "g",\n' +
        '                                  "_elements": [\n' +
        '                                    {\n' +
        '                                      "_type": "element",\n' +
        '                                      "_name": "i",\n' +
        '                                      "_parent": "h",\n' +
        '                                      "_elements": [\n' +
        '                                        {\n' +
        '                                          "_type": "element",\n' +
        '                                          "_name": "j",\n' +
        '                                          "_parent": "i",\n' +
        '                                          "_elements": [\n' +
        '                                            {\n' +
        '                                              "_type": "text",\n' +
        '                                              "_text": "deep"\n' +
        '                                            }\n' +
        '                                          ]\n' +
        '                                        }\n' +
        '                                      ]\n' +
        '                                    }\n' +
        '                                  ]\n' +
        '                                }\n' +
        '                              ]\n' +
        '                            }\n' +
        '                          ]\n' +
        '                        }\n' +
        '                      ]\n' +
        '                    }\n' +
        '                  ]\n' +
        '                }\n' +
        '              ]\n' +
        '            }\n' +
        '          ]\n' +
        '        }\n' +
        '      ]\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20139
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_13900
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        trim: true,
        ignoreDeclaration: false,
        ignoreInstruction: false,
        ignoreComment: false,
        ignoreCDATA: false,
        ignoreAttributes: false,
        ignoreDoctype: false,

        declarationKey: "xml",
        instructionKey: "pi",
        attributesKey: "attrs",
        textKey: "val",
        cdataKey: "code",
        doctypeKey: "dtd",
        commentKey: "cmnt",
        typeKey: "kind",
        nameKey: "tag",
        elementsKey: "kids",
        parentKey: ''
      }
      let result = test(`
<?xml version="1.0"?>
<!DOCTYPE user SYSTEM "user.dtd">
<!-- 用户信息 -->
<user id="1001" status="active">
  欢迎您
  <script><![CDATA[loadUser();]]></script>
  <?sync time="2025"?>
</user>
`, options);
      expect(result).assertEqual('{\n' +
        '  "xml": {\n' +
        '    "attrs": {\n' +
        '      "version": "1.0"\n' +
        '    }\n' +
        '  }\n' +
        '}');
    });

    /**
     * @tc.name   testConvertXml20140
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONVERTXML2_14000
     * @tc.desc   Testing the convertxml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertXml20140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: convertxml.ConvertOptions = {
        ignoreComment: false,
        commentKey: "",
        trim: false,
        declarationKey: '',
        instructionKey: '',
        attributesKey: '',
        textKey: '',
        cdataKey: '',
        doctypeKey: '',
        parentKey: '',
        typeKey: '',
        nameKey: '',
        elementsKey: ''
      };
      let result = test(`<!-- 空键 -->`, options);
      expect(result).assertEqual('{\n' +
        '  "": [\n' +
        '    {\n' +
        '      "": "comment"\n' +
        '    }\n' +
        '  ]\n' +
        '}');
    });
  })
}


function runTest(xml: string | ESObject) {
  let res = ""
  try {
    const conv = new convertxml.ConvertXML();
    const result = conv.fastConvertToJSObject(xml)
    if (result === null || result === undefined) {
      res = "1"
    } else {
      return JSON.stringify(result, null, 2);
    }
  } catch (error) {
    res = (error.code) as string;
  }
  return res;
}


function testCase(xml: string, options?: convertxml.ConvertOptions) {
  let res = "";
  try {
    const conv = new convertxml.ConvertXML();
    const result = conv.fastConvertToJSObject(xml, options);
    return JSON.stringify(result, null, 2);
  } catch (error) {
    res = (error.code) as string;
  }
  return res;
}


function test(xml: string, options?: convertxml.ConvertOptions) {
  let res = "";
  try {
    const conv = new convertxml.ConvertXML();
    const result = conv.fastConvertToJSObject(xml, options);
    return JSON.stringify(result, null, 2)
  } catch (error) {
    res = (error.code) as string;
  }
  return res;
}
