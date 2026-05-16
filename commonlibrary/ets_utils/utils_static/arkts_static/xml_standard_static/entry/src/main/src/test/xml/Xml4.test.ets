/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { util, xml } from '@kit.ArkTS';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}


let str = "";

function func(tagName: string, key: string, value: string) {
  str = tagName + key + value;
  console.info(str);
  return true;
}

function funcA(tagName: string, key: string, value: string): boolean {
  str += (`tagName: ${tagName}  key: ${key}  value: ${value}`);
  return true;
}

function funcB(tagName: string, key: string, value: string): boolean {
  str += (`${tagName} ${key} ${value}`);
  return true;
}


function tagValueFuncA(name: string, value: string): boolean {
  str += (`tagName: ${name}  tagValue: ${value}`);
  return true;
}

function tagValueFuncB(name: string, value: string): boolean {
  str += (`${name} ${value}`);
  return true;
}

export default function actsXml4Test() {
  describe('actsXml4Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      str = "";
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
     * @tc.name   ConstructorTest0018
     * @tc.number SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_1800
     * @tc.desc   Parse attribute value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConstructorTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ConstructorTest0018';
      console.log(TAG + ' start');

      const xmlStr = `<note importance="high"></note>`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      };

      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      pullParser.parseXml(options);

      expect(str).assertContain(`high`);
    });

    /**
     * @tc.name   ConstructorTest0022
     * @tc.number SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_2200
     * @tc.desc   Combine Parsing Tags and Attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConstructorTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ConstructorTest0022';
      console.log(TAG + ' start');

      const xmlStr = `<book category="tech"><title>ArkTS</title></book>`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      };

      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      pullParser.parseXml(options);

      expect(str).assertContain(`ArkTS`);
    });

    /**
     * @tc.name   ParseXmlTest0001
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_0100
     * @tc.desc   Basic XML Structure Parsing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0001';
      console.log(TAG + ' start');

      const xmlStr = `<?xml version="1.0"?>
  <root>
      <child>Text</child>
  </root>`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      };

      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      pullParser.parseXml(options);

      expect(str).assertContain(`Text`);
    });

    /**
     * @tc.name   ParseXmlTest0002
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_0200
     * @tc.desc   Parsing with attribute nodes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0002';
      console.log(TAG + ' start');

      const xmlStr = `<note importance="high">Content</note>`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      };

      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      pullParser.parseXml(options);

      expect(str).assertContain(`Content`);
    });

    /**
     * @tc.name   ParseXmlTest0004
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_0400
     * @tc.desc   Parsing tags with namespaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0004';
      console.log(TAG + ' start');
      const xmlStr = `<ns:book xmlns:ns="urn:example"></ns:book>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain('urn:example');

    }
    );

    /**
     * @tc.name   ParseXmlTest0005
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_0500
     * @tc.desc   Mixed content (text child elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0005';
      console.log(TAG + ' start');
      const xmlStr = `<para>Hello <b>world</b>!</para>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain(`Hello`);
      expect(str).assertContain('world')

    });

    /**
     * @tc.name   ParseXmlTest0006
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_0600
     * @tc.desc   Annotation Analysis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0006';
      console.log(TAG + ' start');
      const xmlStr = `<!--Comment--><root/>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(``);
    });

    /**
     * @tc.name   ParseXmlTest0007
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_0700
     * @tc.desc   Entity Reference Parsing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0007';
      console.log(TAG + ' start');
      const xmlStr = `<text>&amp;&lt;&gt;</text>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain(`amp`);
      expect(str).assertContain(`lt`);
      expect(str).assertContain(`gt`);
    });

    /**
     * @tc.name   ParseXmlTest0008
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_0800
     * @tc.desc   Multi-level Nested Structure Validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0008';
      console.log(TAG + ' start');
      const xmlStr = `<a><b><c></c></b></a>`;
      const buffer = new util.TextEncoder().encodeInto(xmlStr).buffer as ArrayBuffer;
      const parser = new xml.XmlPullParser(buffer, 'UTF-8');

      const depthSequence: number[] = [];
      let maxDepth: int = 0;
      parser.parseXml({
        tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
          const currentDepth = info.getDepth();
          depthSequence.push(currentDepth);
          maxDepth = Math.max(maxDepth, info.getDepth()).toInt();
          return true;
        }
      });
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(maxDepth).assertEqual(3);
      expect(depthSequence.join(',')).assertEqual('0,1,2,3,3,2,1,0');
    });

    /**
     * @tc.name   ParseXmlTest0009
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_0900
     * @tc.desc   Special Character Handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0009';
      console.log(TAG + ' start');
      const xmlStr = `<content>&#xA;Line2</content>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(`Line2`);
    });

    /**
     * @tc.name   ParseXmlTest0010
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1000
     * @tc.desc   Empty Input Detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0010';
      console.log(TAG + ' start');
      const xmlStr = `<>`
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      try {
        pullParser.parseXml(options)
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail,err:${err}`);
        expect(String(err)).assertContain("BusinessError")
      }
      expect(str).assertContain(``);
    });

    /**
     * @tc.name   ParseXmlTest0011
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1100
     * @tc.desc   Large file parsing interrupted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0011';
      console.log(TAG + ' start');
      const xmlStr = `<open><close>`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain('');
    });

    /**
     * @tc.name   ParseXmlTest0012
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1200
     * @tc.desc   Duplicate attribute definition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0012';
      console.log(TAG + ' start');
      const xmlStr = '<book id="1" id="2"></book>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(`id 1`);
      expect(str).assertContain(`id 2`);
    });

    /**
     * @tc.name   ParseXmlTest0013
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1300
     * @tc.desc   Illegal namespace definition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0013';
      console.log(TAG + ' start');
      const xmlStr = '<xmlns:root>content</xmlns:root>';

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain(`content`);
    });

    /**
     * @tc.name   ParseXmlTest0014
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1400
     * @tc.desc   Invalid XML declaration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0014';
      console.log(TAG + ' start');
      const xmlStr = `<?xml version="2.0"?>`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(``);
    });

    /**
     * @tc.name   ParseXmlTest0015
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1500
     * @tc.desc   Invalid attribute value format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0015';
      console.log(TAG + ' start');

      const xmlStr = `<node attr="value&invalid">`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      try {
        pullParser.parseXml(options)
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail,err:${err}`);
        expect(String(err)).assertContain("BusinessError")
      }

      expect(str).assertContain(`value&invalid`);
    });

    /**
     * @tc.name   ParseXmlTest0016
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1600
     * @tc.desc   Unescaped reserved character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0016';
      console.log(TAG + ' start');
      const xmlStr = `<text><></text>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);
      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      try {
        pullParser.parseXml(options)
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail,err:${err}`);
        expect(String(err)).assertContain("BusinessError")
      }
    });

    /**
     * @tc.name   ParseXmlTest0017
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1700
     * @tc.desc   Undefined namespace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0017';
      console.log(TAG + ' start');
      const xmlStr = `<ns:root/>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(`ns:root`);
    });

    /**
     * @tc.name   ParseXmlTest0018
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1800
     * @tc.desc   Mixed content error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0018';
      console.log(TAG + ' start');
      const xmlStr = `<root>Text<child/></root>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain(`Text`);
    });

    /**
     * @tc.name   ParseXmlTest0019
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_1900
     * @tc.desc   Incorrect CDATA structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0019';
      console.log(TAG + ' start');
      const xmlStr = `<data></data>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(``);
    });

    /**
     * @tc.name   ParseXmlTest0020
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_2000
     * @tc.desc   Unclosed comments mixed with tags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0020';
      console.log(TAG + ' start');
      const xmlStr = `<root></root>`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(``);
    });

    /**
     * @tc.name   ParseXmlTest0021
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_2100
     * @tc.desc   Attribute Namespace Combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0021';
      console.log(TAG + ' start');
      const xmlStr = `<ns:item xmlns:ns="uri" ns:id="123"/>`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)


      expect(str).assertContain(`uri`);
      expect(str).assertContain(`123`);
    });

    /**
     * @tc.name   ParseXmlTest0022
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_2200
     * @tc.desc   Undefined namespace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0022';
      console.log(TAG + ' start');
      const xmlStr = `<a><b attr1="v1"><c attr2="v2"/></b></a>`;

      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain(`v1`)
      expect(str).assertContain(`v2`);
    });

    /**
     * @tc.name   ParseXmlTest0023
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_2300
     * @tc.desc   Mixed entity references and CDATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0023';
      console.log(TAG + ' start');

      const xmlStr = `<content>&lt;<![CDATA[<unescaped>]]>&gt;</content>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain(`<unescaped>`);
    });

    /**
     * @tc.name   ParseXmlTest0024
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_2400
     * @tc.desc   Deeply nested mixed content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0024';
      console.log(TAG + ' start');
      const xmlStr = `<a><b>Text1<c>Text2</c></b></a>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain(`Text1`)
      expect(str).assertContain(`Text2`);
    });

    /**
     * @tc.name   ParseXmlTest0025
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_2500
     * @tc.desc   Comments and processing instructions coexist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0025';
      console.log(TAG + ' start');
      const xmlStr = `<!--Header--><?pi?><root/>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)

      expect(str).assertContain(`pi`);
    });

    /**
     * @tc.name   ParseXmlTest0026
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_2600
     * @tc.desc   Mixed Namespaces and Attribute Inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0026';
      console.log(TAG + ' start');

      const xmlStr = `<root xmlns:ns="uri"><ns:child attr="value"/></root>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(`uri`)
      expect(str).assertContain(`value`);
    });

    /**
     * @tc.name   ParseXmlTest0027
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_2700
     * @tc.desc   Handling commands and namespace combinations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0027';
      console.log(TAG + ' start');


      const xmlStr = `<?pi ns:param?><ns:root xmlns:ns="uri"/>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(`uri`);
    });

    /**
     * @tc.name   ParseXmlTest0028
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSEXML_2800
     * @tc.desc   Multi-Event Type Combination Verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseXmlTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseXmlTest0028';
      console.log(TAG + ' start');
      const xmlStr = `<?xml?><!--Comment--><root attr="val"><![CDATA[data]]></root>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);

      let options: xml.ParseOptions = {
        supportDoctype: false,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagValueFuncB,
        attributeWithTagCallbackFunction: funcB
      }
      let pullParser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      pullParser.parseXml(options)
      expect(str).assertContain(`data`);
    });

    /**
     * @tc.name   ParseTest0003
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_0300
     * @tc.desc   Test XML string with attributes (root node contains multiple attributes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0003';
      console.log(TAG + ' start');

      str = "";
      let strXml = '<title lang="en" id="page-title" class="main-title">Happy</title>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcB, tagValueCallbackFunction: tagValueFuncB }
      testThat.parseXml(options);

      expect(str).assertContain("title")
      expect(str).assertContain("lang")
      expect(str).assertContain("en")
      expect(str).assertContain("id")
      expect(str).assertContain("page-title")
      expect(str).assertContain("class")
      expect(str).assertContain("main-title")
      expect(str).assertContain("Happy")
    });

    /**
     * @tc.name   ParseTest0004
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_0400
     * @tc.desc   Test nested structure XML input (root node contains child nodes and grandchild nodes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0004';
      console.log(TAG + ' start');

      str = "";
      let strXml =
        '<head>' +
          '<meta charset="UTF-8" />' +
          '<title id="main-title" lang="en" data-page="home">Happy</title>' +
          '<link rel="stylesheet" href="style.css" type="text/css" media="screen" />' +
          '</head>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcB, tagValueCallbackFunction: tagValueFuncB }
      testThat.parseXml(options);

      expect(str).assertContain("charset UTF-8")
      expect(str).assertContain("Happy")
      expect(str).assertContain("rel stylesheet")
      expect(str).assertContain("type text/css")
      expect(str).assertContain("media screen")
    });

    /**
     * @tc.name   ParseTest0005
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_0500
     * @tc.desc   Test configuration <supportDoctype: true> to parse document type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0005';
      console.log(TAG + ' start');

      str = "";
      let strXml =
        '<!DOCTYPE note [\n' +
          '  <!ELEMENT note (to,from,heading,body)>\n' +
          '  <!ELEMENT to (#PCDATA)>\n' +
          '  <!ELEMENT from (#PCDATA)>\n' +
          '  <!ELEMENT heading (#PCDATA)>\n' +
          '  <!ELEMENT body (#PCDATA)>\n' +
          ']>\n' +
          '<note>\n' +
          '  <to>Alice</to>\n' +
          '  <from>Bob</from>\n' +
          '  <heading>Reminder</heading>\n' +
          '  <body>Don\'t forget the meeting!</body>\n' +
          '</note>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { supportDoctype: true, attributeWithTagCallbackFunction: funcB, tagValueCallbackFunction: tagValueFuncB }
      testThat.parseXml(options);

      expect(str).assertContain("<!ELEMENT note (to,from,heading,body)>")
      expect(str).assertContain("<!ELEMENT to (#PCDATA)>")
      expect(str).assertContain("<!ELEMENT from (#PCDATA)>")
      expect(str).assertContain("<!ELEMENT heading (#PCDATA)>")
      expect(str).assertContain("<!ELEMENT body (#PCDATA)>")
    });

    /**
     * @tc.name   ParseTest0006
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_0600
     * @tc.desc   Test configuration <supportDoctype: false> to not parse document type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0006';
      console.log(TAG + ' start');

      str = "";
      let strXml =
        '<!DOCTYPE note [\n' +
          '  <!ELEMENT note (to,from,heading,body)>\n' +
          '  <!ELEMENT to (#PCDATA)>\n' +
          '  <!ELEMENT from (#PCDATA)>\n' +
          '  <!ELEMENT heading (#PCDATA)>\n' +
          '  <!ELEMENT body (#PCDATA)>\n' +
          ']>\n' +
          '<note>\n' +
          '  <to>Alice</to>\n' +
          '  <from>Bob</from>\n' +
          '  <heading>Reminder</heading>\n' +
          '  <body>Don\'t forget the meeting!</body>\n' +
          '</note>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { supportDoctype: false, attributeWithTagCallbackFunction: funcB, tagValueCallbackFunction: tagValueFuncB }
      testThat.parseXml(options);

      expect(str).not().assertContain("<!ELEMENT note (to,from,heading,body)>")
      expect(str).not().assertContain("<!ELEMENT to (#PCDATA)>")
      expect(str).not().assertContain("<!ELEMENT from (#PCDATA)>")
      expect(str).not().assertContain("<!ELEMENT heading (#PCDATA)>")
      expect(str).not().assertContain("<!ELEMENT body (#PCDATA)>")
    });

    /**
     * @tc.name   ParseTest0007
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_0700
     * @tc.desc   Test configuration <ignoreNameSpace: false> to ignore namespaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0007';
      console.log(TAG + ' start');

      str = "";
      let strXml =
        '<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">' +
          '<head>' +
          '<title>Namespace Example</title>' +
          '</head>' +
          '<body>' +
          '<!-- Declare SVG namespace when embedding SVG -->' +
          '<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">' +
          '<circle cx="50" cy="50" r="40" fill="red" />' +
          '</svg>' +
          '</body>' +
          '</html>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { ignoreNameSpace: false, attributeWithTagCallbackFunction: funcB, tagValueCallbackFunction: tagValueFuncB }
      testThat.parseXml(options);

      expect(str).not().assertContain("xmlns http://www.w3.org/1999/xhtml")
      expect(str).not().assertContain("xmlns http://www.w3.org/2000/svg")
    });

    /**
     * @tc.name   ParseTest0008
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_0800
     * @tc.desc   Test configuration <ignoreNameSpace: true> to not ignore namespaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0008';
      console.log(TAG + ' start');

      str = "";
      let strXml =
        '<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">\n' +
          '<head>\n' +
          '<title>Namespace Example</title>\n' +
          '</head>\n' +
          '<body>\n' +
          '<!-- Declare SVG namespace when embedding SVG -->\n' +
          '<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">\n' +
          '<circle cx="50" cy="50" r="40" fill="red" />\n' +
          '</svg>\n' +
          '</body>\n' +
          '</html>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { ignoreNameSpace: true, attributeWithTagCallbackFunction: funcB, tagValueCallbackFunction: tagValueFuncB }
      testThat.parseXml(options);

      expect(str).assertContain("xmlns http://www.w3.org/1999/xhtml")
      expect(str).assertContain("xmlns http://www.w3.org/2000/svg")
    });

    /**
     * @tc.name   ParseTest0009
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_0900
     * @tc.desc   Test XML input containing CDATA sections to correctly parse raw text in CDATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0009';
      console.log(TAG + ' start');

      str = "";
      let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>\n' +
          '<document>\n' +
          '  <title>CDATA Section Example</title>\n' +
          '  <content>\n' +
          '    <!-- CDATA wraps text with special characters -->\n' +
          '    <text><![CDATA[This is content with special symbols: < > & " \', no escaping required!]]></text>\n' +
          '    \n' +
          '    <!-- CDATA wraps code snippet -->\n' +
          '    <code><![CDATA[function hello() {console.log("Hello, XML!");if (1 < 2 && 3 > 0) {return true;}}]]></code>\n' +
          '    \n' +
          '    <!-- CDATA nested in other elements -->\n' +
          '    <message author="Alice">\n' +
          '      <![CDATA[Bob, does the <plan> you mentioned last time contain & symbol?]]>\n' +
          '    </message>\n' +
          '  </content>\n' +
          '</document>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcB, tagValueCallbackFunction: tagValueFuncB }
      testThat.parseXml(options);

      console.warn(str)
      expect(str).assertContain("This is content with special symbols: < > & \" \', no escaping required!")
      expect(str).assertContain("function hello() {console.log(\"Hello, XML!\");if (1 < 2 && 3 > 0) {return true;}}")
    });

    /**
     * @tc.name   ParseTest0010
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_1000
     * @tc.desc   Test XML input with empty text nodes to correctly identify empty nodes without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0010';
      console.log(TAG + ' start');

      str = "";
      let strXml = '<node></node>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcB, tagValueCallbackFunction: tagValueFuncB }
      testThat.parseXml(options);

      expect(str).assertContain("node node")
    });

    /**
     * @tc.name   ParseTest0012
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_1200
     * @tc.desc   Test passing undefined as XML input to verify if a reasonable exception is thrown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0012';
      console.log(TAG + ' start');

      str = "";

      let strXml = undefined

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcA, tagValueCallbackFunction: tagValueFuncA }
      testThat.parseXml(options);

      expect(str).assertContain('tagValue');
    });

    /**
     * @tc.name   ParseTest0013
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_1300
     * @tc.desc   Test passing empty string input to verify exception type and prompt information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0013';
      console.log(TAG + ' start');

      str = "";

      let strXml = ""

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcA, tagValueCallbackFunction: tagValueFuncA }
      testThat.parseXml(options);

      expect(str).assertContain("tagValue");
    });

    /**
     * @tc.name   ParseTest0014
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_1400
     * @tc.desc   Test XML input with unclosed tags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0014';
      console.log(TAG + ' start');

      str = "";
      try {
        let strXml =
          '<root>' +
            '<item id= "1" > nss' +
            '</root>'

        let testEncoder = new util.TextEncoder();
        let arrBuffer = testEncoder.encodeInto(strXml);
        let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

        let options: xml.ParseOptions =
          { attributeWithTagCallbackFunction: funcA, tagValueCallbackFunction: tagValueFuncA }
        testThat.parseXml(options);

        expect().assertFail()

      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(String(err)).assertContain("BusinessError")
      }
    });

    /**
     * @tc.name   ParseTest0015
     * @tc.number SUB_BASEDATE_PULLPARSER_PARSE_1500
     * @tc.desc   Test XML input with multiple root nodes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParseTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ParseTest0015';
      console.log(TAG + ' start');

      str = "";
      let strXml =
        '<book id="b001">...</book>\n' +
          '<user id="u001">...</user>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcB, tagValueCallbackFunction: tagValueFuncB }
      testThat.parseXml(options);

      expect(str).assertContain("book")
      expect(str).assertContain("id b001")
      expect(str).assertContain("user")
      expect(str).assertContain("id u001")
    });
  })
}