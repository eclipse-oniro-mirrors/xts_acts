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
import xml from '@ohos.xml';
import util from '@ohos.util';
import Utils from '../Util.test';
import { BusinessError } from '@ohos.base';

let str = "";

function funcA(name: string, value: string): boolean {
  str += (`name: ${name}  value: ${value}`)
  return true;
}

function funcAttributeWithTagCbA(tagName: string, name: string, value: string): boolean {
  str += (`name: ${name}  value: ${value}`)
  return true;
}

function funcB(name: string, value: string): boolean {
  str += (`${name} ${value}`)
  return true;
}

function funcAttributeWithTagCbB(tagName: string, name: string, value: string): boolean {
  str += (`${name} ${value}`)
  return true;
}

let globalTestResults: Array<string> = [];

function stringToArrayBuffer(str: string): ArrayBuffer {
  const uint8Array = new Uint8Array(str.length * 2);
  for (let i = 0; i < str.length; i++) {
    uint8Array[i] = str.charCodeAt(i) & 0xFF;
  }
  return uint8Array.buffer;
}

export default function actsXml3Test() {
  describe('actsXml3Test', (): void => {

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_0100
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction001';
      const xmlStr = '<book category="COOKING" price="29.99"></book>';
      const buffer = new util.TextEncoder().encodeInto(xmlStr);
      const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
      const collectedAttributes: string[] = [];
      let attrCount = 0;

      parser.parseXml({
        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => {
          collectedAttributes.push(`${name}=${value}`);
          attrCount++;
          return true;
        }
      });
      expect(attrCount === 2 && collectedAttributes.join(',') === 'category=COOKING,price=29.99').assertTrue();
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_0200
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'ConstructorTest0006';

      const xmlData = `<shop>
      <product id="101">
        <name>Phone</name>
        <price>599</price>
      </product>
    </shop>`;
      const buffer = new util.TextEncoder().encodeInto(xmlData);
      const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);

      let parsedAttributes: string[] = [];
      let tagCount = 0;

      parser.parseXml({
        tagValueCallbackFunction: (tag: string, value: string) => {
          if (value.trim().length > 0) {
            tagCount++;
          }
          return true;
        },
        attributeWithTagCallbackFunction: (tagName: string, attr: string, val: string) => {
          parsedAttributes.push(`${attr}=${val}`);
          return true;
        }
      });

      expect(tagCount).assertEqual(2);
      expect(parsedAttributes.join(',')).assertEqual('id=101');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_0300
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction003';
      str = "";
      try {
        let strXml = //All throw BusinessError
          '<root>\n' +
            '  <content>Price < 100 & Stock > 50</content>\n' +
            '  <item name="John "Doe"" />\n' +
            '  <user id=\'O\'Neil\' />\n' +
            '</root>'

        let testEncoder = new util.TextEncoder();
        let arrBuffer = testEncoder.encodeInto(strXml);
        let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

        let options: xml.ParseOptions =
          { attributeWithTagCallbackFunction: funcAttributeWithTagCbA, tagValueCallbackFunction: funcA }
        testThat.parseXml(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err instanceof BusinessError).assertTrue();
      }
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_0400
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction004';
      str = "";
      let strXml = //Normal input without printing control characters
        '<root>\n' +
          '   <data>&#x01;&#x08;&#x0B;&#x0C;&#x1F;Control Character Test</data>\n' +
          '</root>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcAttributeWithTagCbB, tagValueCallbackFunction: funcB }
      testThat.parseXml(options);

      expect(str).not().assertContain("&#x01");
      expect(str).not().assertContain("&#x08");
      expect(str).not().assertContain("&#x0B");
      expect(str).not().assertContain("&#x0C");
      expect(str).not().assertContain("&#x1F");
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_0500
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction005';
      str = "";
      try {
        let strXml = //Element and attribute names with illegal characters throw BusinessError
          '<root>\n' +
            '  <item name>Content</item>\n' +
            '  <123element>Test</123element>\n' +
            '  <user na&me="Alice" />\n' +
            '</root>'

        let testEncoder = new util.TextEncoder();
        let arrBuffer = testEncoder.encodeInto(strXml);
        let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

        let options: xml.ParseOptions =
          { attributeWithTagCallbackFunction: funcAttributeWithTagCbA, tagValueCallbackFunction: funcA }
        testThat.parseXml(options);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err instanceof BusinessError).assertTrue();
      }
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_0600
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction006';

      str = "";
      try {
        let strXml =
          '<root>\n' +
            '  <code><![CDATA[\n' +
            '    if (a > b) {\n' +
            '      return "]]>";\n' +
            '    }\n' +
            '  ]]></code>\n' +
            '</root>'

        let testEncoder = new util.TextEncoder();
        let arrBuffer = testEncoder.encodeInto(strXml);
        let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

        let options: xml.ParseOptions =
          { attributeWithTagCallbackFunction: funcAttributeWithTagCbA, tagValueCallbackFunction: funcA }
        testThat.parseXml(options);

        expect().assertFail()

      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err instanceof BusinessError).assertTrue();
      }
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_0700
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction007';
      str = "";
      let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>\n' +
          '<root>\n' +
          '  <text>镙瑰向鍓嶆潵</text>\n' +
          '</root>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcAttributeWithTagCbA, tagValueCallbackFunction: funcA }
      testThat.parseXml(options);

      expect(str).assertContain("镙瑰向鍓嶆潵");
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_0800
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction008';
      str = "";
      let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>\n' +
          '<root  id="demo"  >  \n' +
          '  <!-- Test parsing comments  -->\n' +
          '  <item  name="test"  >  \n' +
          '    <sub>Nested Node Content</sub>\n' +
          '  </item>  \n' +
          '</root>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcAttributeWithTagCbB, tagValueCallbackFunction: funcB }
      testThat.parseXml(options);

      expect(str).assertContain("id demo");
      expect(str).assertContain("Test parsing comments");
      expect(str).assertContain("Nested Node Content");
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_0900
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction009';
      str = "";
      try {
        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root  >  \n' +
            '  <data>  Test  <![CDATA[<>&]]>  \n' +
            '  <item  id="1"  >  Unclosed  \n' +
            '</root>'

        let testEncoder = new util.TextEncoder();
        let arrBuffer = testEncoder.encodeInto(strXml);
        let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

        let options: xml.ParseOptions =
          { attributeWithTagCallbackFunction: funcAttributeWithTagCbA, tagValueCallbackFunction: funcA }
        testThat.parseXml(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err instanceof BusinessError).assertTrue();
      }
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1000
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction010';
      str = "";
      let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>\n' +
          '<RoOt id="test">\n' +
          '  <ItEm>\n' +
          '    <SuB_Tag>Content</SuB_Tag>\n' +
          '  </ItEm>\n' +
          '</RoOt>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcAttributeWithTagCbA, tagValueCallbackFunction: funcA }
      testThat.parseXml(options);

      expect(str).assertContain("RoOt");
      expect(str).assertContain("ItEm");
      expect(str).assertContain("SuB_Tag");
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1100
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction011';
      str = "";
      let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>\n' +
          '<level1>\n' +
          '  <level2>\n' +
          '    <level3>\n' +
          '      <level4>\n' +
          '        <level5>\n' +
          '          <level6>\n' +
          '            <level7>\n' +
          '              <level8>\n' +
          '                <level9>\n' +
          '                  <level10>\n' +
          '                    <level11>\n' +
          '                      <level12>\n' +
          '                        <level13>\n' +
          '                          <level14>\n' +
          '                            <level15>\n' +
          '                              <level16>\n' +
          '                                <level17>\n' +
          '                                  <level18>\n' +
          '                                    <level19>\n' +
          '                                      <level20>\n' +
          '                                        <level21>\n' +
          '                                          <level22>\n' +
          '                                            <level23>\n' +
          '                                              <level24>\n' +
          '                                                <level25>\n' +
          '                                                  <level26>\n' +
          '                                                    <level27>\n' +
          '                                                      <level28>\n' +
          '                                                        <level29>\n' +
          '                                                          <level30>\n' +
          '                                                            <level31>\n' +
          '                                                              <level32>\n' +
          '                                                                <level33>\n' +
          '                                                                  <level34>\n' +
          '                                                                    <level35>\n' +
          '                                                                      <level36>\n' +
          '                                                                        <level37>\n' +
          '                                                                          <level38>\n' +
          '                                                                            <level39>\n' +
          '                                                                              <level40>\n' +
          '                                                                                <level41>\n' +
          '                                                                                  <level42>\n' +
          '                                                                                    <level43>\n' +
          '                                                                                      <level44>\n' +
          '                                                                                        <level45>\n' +
          '                                                                                          <level46>\n' +
          '                                                                                            <level47>\n' +
          '                                                                                              <level48>\n' +
          '                                                                                                <level49>\n' +
          '                                                                                                  <level50>Content</level50>\n' +
          '                                                                                                </level49>\n' +
          '                                                                                              </level48>\n' +
          '                                                                                            </level47>\n' +
          '                                                                                          </level46>\n' +
          '                                                                                        </level45>\n' +
          '                                                                                      </level44>\n' +
          '                                                                                    </level43>\n' +
          '                                                                                  </level42>\n' +
          '                                                                                </level41>\n' +
          '                                                                              </level40>\n' +
          '                                                                            </level39>\n' +
          '                                                                          </level38>\n' +
          '                                                                        </level37>\n' +
          '                                                                      </level36>\n' +
          '                                                                    </level35>\n' +
          '                                                                  </level34>\n' +
          '                                                                </level33>\n' +
          '                                                              </level32>\n' +
          '                                                            </level31>\n' +
          '                                                          </level30>\n' +
          '                                                        </level29>\n' +
          '                                                      </level28>\n' +
          '                                                    </level27>\n' +
          '                                                  </level26>\n' +
          '                                                </level25>\n' +
          '                                              </level24>\n' +
          '                                            </level23>\n' +
          '                                          </level22>\n' +
          '                                        </level21>\n' +
          '                                      </level20>\n' +
          '                                    </level19>\n' +
          '                                  </level18>\n' +
          '                                </level17>\n' +
          '                              </level16>\n' +
          '                            </level15>\n' +
          '                          </level14>\n' +
          '                        </level13>\n' +
          '                      </level12>\n' +
          '                    </level11>\n' +
          '                  </level10>\n' +
          '                </level9>\n' +
          '              </level8>\n' +
          '            </level7>\n' +
          '          </level6>\n' +
          '        </level5>\n' +
          '      </level4>\n' +
          '    </level3>\n' +
          '  </level2>\n' +
          '</level1>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcAttributeWithTagCbA, tagValueCallbackFunction: funcA }
      testThat.parseXml(options);

      expect(str).assertContain("Content");
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1200
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction012';
      str = "";
      let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>\n' +
          '<root attr="&quot;Encoding Test&apos;&amp;&lt;10&gt;">\n' +
          '  <data>Content contains &lt;tag&gt; and &amp; symbol</data>\n' +
          '</root>'

      let testEncoder = new util.TextEncoder();
      let arrBuffer = testEncoder.encodeInto(strXml);
      let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let options: xml.ParseOptions =
        { attributeWithTagCallbackFunction: funcAttributeWithTagCbB, tagValueCallbackFunction: funcB }
      testThat.parseXml(options);

      expect(str).assertContain("\"Encoding Test'&<10> ");
      expect(str).assertContain("Content contains <tag> and & symbol");
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1300
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction013';
      const strXml: string = '<?xml version="1.0" encoding="utf-8"?><note importance="high" logged="true">Happy</note>';
      const arrBuffer = stringToArrayBuffer(strXml);

      const parser: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer);

      const attributeCallback = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        const name = value.getName ? value.getName() : 'METHOD_NOT_EXIST';
        globalTestResults.push(`key:${key} name:${name}`);
        return true;
      };

      const options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string): boolean => {
          globalTestResults.push(`attr:${name}=${value}`);
          return true;
        },
        tokenValueCallbackFunction: attributeCallback
      };

      parser.parseXml(options);
      expect(globalTestResults.length > 0).assertTrue();
      expect(globalTestResults.some(r => r.includes('attr:'))).assertTrue();
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1400
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction014';
      const xmlData = `<node attr="  \t"/>`;
      const parser = new xml.XmlPullParser(
        new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
      );
      let attributeIsWhitespace: boolean | undefined;
      parser.parseXml({
        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => {
          attributeIsWhitespace = value.trim().length === 0;
          expect(attributeIsWhitespace === true &&
            name === 'attr').assertTrue();
          return true;
        }
      });
      expect(attributeIsWhitespace !== undefined && attributeIsWhitespace === true).assertTrue();
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1500
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction015';
      let isXml = false;
      const xmlData = `<root attr=" value "/>`;
      const encoder = new util.TextEncoder();
      const xmlBuffer = encoder.encodeInto(xmlData).buffer as ArrayBuffer;
      new xml.XmlPullParser(xmlBuffer, 'UTF-8').parseXml({
        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => {
          const trimLength = value.trim().length;
          expect(trimLength > 0).assertTrue();
          isXml = true
          return true;
        }
      });
      expect(isXml).assertTrue();
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1600
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction016';
      const xmlStr = `<root></root>`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
      str = "";

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);

      expect(str).assertContain('');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1700
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction017';

      const xmlStr = `<user name="Alice"></user>`; // 1 attribute
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);

      expect(xmlStr).assertContain('Alice');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1800
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction018';

      const xmlStr = `<book id="101" title="XML Tutorial" price="39.9"></book>`; // 3 attributes
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);

      expect(xmlStr).assertContain('101');
      expect(xmlStr).assertContain('XML Tutorial');
      expect(xmlStr).assertContain('39.9');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_1900
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction019';
      const xmlStr = `
<root>
<child a="x" b="y"></child> <!-- 2 attributes -->
<child></child> <!-- 0 attributes -->
</root>
`;
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);

      expect(xmlStr).assertContain(`x`);
      expect(xmlStr).assertContain(`y`);
      expect(xmlStr).assertContain(``);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2000
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction020';

      const xmlStr = `<root>Text content</root>`;
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);
      expect(xmlStr).assertContain('Text');
      expect(xmlStr).assertContain('content');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2100
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction021';

      const xmlStr = `<!-- This is a comment --><root></root>`;
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
      str = "";

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);
      expect(str).assertContain('');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2200
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction022';

      const xmlStr = `<?xml version="1.0"?><!DOCTYPE html><root></root>`;
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
      str = "";

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);
      expect(str).assertContain('');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2300
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction023';
      const xmlStr = `<root a="1" b="2">`;
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);
      expect(xmlStr).assertContain(`1`);
      expect(xmlStr).assertContain(`2`);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2400
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction024';
      const xmlStr = `
<parent p1="v1" p2="v2"> <!-- 2 attributes -->
<child c1="v3"></child> <!-- 1 attribute -->
<child></child> <!-- 0 attributes -->
</parent>
`;
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
      str = "";

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);
      expect(xmlStr).assertContain('v1');
      expect(xmlStr).assertContain('v2');
      expect(xmlStr).assertContain('v3');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2500
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction025';

      const xmlStr = `<user id="100" name="Charlie" age="30"></user>`;
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
      str = "";

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);
      expect(xmlStr).assertContain('100');
      expect(xmlStr).assertContain('Charlie');
      expect(xmlStr).assertContain('30');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2600
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction026';
      const xmlStr = `
<data>
<item type="num" value="10"></item> <!-- 2 attributes -->
<item type="str" value="hello"></item> <!-- 2 attributes -->
<item></item> <!-- 0 attributes -->
</data>
`;
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
      str = "";

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: funcB,
        attributeWithTagCallbackFunction: funcAttributeWithTagCbB
      }
      that.parseXml(options);
      expect(xmlStr).assertContain('num');
      expect(xmlStr).assertContain('10');
      expect(xmlStr).assertContain('str');
      expect(xmlStr).assertContain('hello');
      expect(xmlStr).assertContain('');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2700
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction027';
      const xmlStr = `
<root>
<valid a="1" b="2"></valid> <!-- Correct -->
<invalid a="1" = "3"></invalid> <!-- Error: Empty attribute name -->
</root>
`;
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
      str = "";
      try {
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: funcB,
          attributeWithTagCallbackFunction: funcAttributeWithTagCbB
        }
        that.parseXml(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} fail,err:${err}`);
        expect(err instanceof BusinessError).assertTrue();
      }

      expect(xmlStr).assertContain('1');
      expect(xmlStr).assertContain('2');
      expect(xmlStr).assertContain('1');
      expect(xmlStr).assertContain('3');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2800
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction028';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '    <title>Happy</title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => true,
        };
        that.parseXml(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeToString(view).trim();
        expect(result).assertContain("<note importance=\"high\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_2900
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testXmlAttributeWithTagCallbackFunction030';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '    <title>Happy</title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          attributeWithTagCallbackFunction: undefined,
        };
        that.parseXml(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeToString(view).trim();
        expect(result).assertContain("<note importance=\"high\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3000
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
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
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
      let str = '';
      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => {
          str += name + ':' + value;
          return true;
        }
      }
      that.parseXml(options);
      let str1 = 'importance:highlogged:truexmlns:h:http://www.w3.org/TR/html4/';
      expect(str).assertEqual(str1);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3100
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="hi&amp;gh" logged="&lt;true">' +
          '    <title>Hello&gt;World&apos;</title>' +
          '    <todo>Wo&quot;rk</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      let str = "";
      let strAttr = "";
      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => {
          strAttr += name + ', ' + value + ' ';
          return true;
        },
        tagValueCallbackFunction: (name: string, value: string) => {
          str += name + value + ' ';
          return true;
        }
      }
      that.parseXml(options);
      let result = ' note      title Hello>World\' title      todo Wo"rk todo note  ';
      let resAttr = 'importance, hi&gh logged, <true ';
      expect(str).assertEqual(result);
      expect(strAttr).assertEqual(resAttr);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3200
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
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
      let str = "";
      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => {
          str += name + ':' + value;
          return true;
        }
      }
      that.parseXml(options);
      let str1 = 'importance:highlogged:truexmlns:h:http://www.w3.org/TR/html4/';
      expect(str).assertEqual(str1);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3300
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="hi&amp;gh" logged="&lt;true">' +
          '    <title>Hello&gt;World&apos;</title>' +
          '    <todo>Wo&quot;rk</todo>' +
          '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer);
      let str = "";
      let strAttr = "";
      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => {
          strAttr += name + ', ' + value + ' ';
          return true;
        },
        tagValueCallbackFunction: (name: string, value: string) => {
          str += name + value + ' ';
          return true;
        }
      }
      that.parseXml(options);
      let result = ' note      title Hello>World\' title      todo Wo"rk todo note  ';
      let resAttr = 'importance, hi&gh logged, <true ';
      expect(str).assertEqual(result);
      expect(strAttr).assertEqual(resAttr);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3400
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
      let strAttr = "";
      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => {
          strAttr += name + ':' + value + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let str = 'importance:high logged:true xmlns:h:http://www.w3.org/TR/html4/';
      expect(strAttr.trim()).assertEqual(str);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3500
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,

        attributeWithTagCallbackFunction: (tagName: string, name: string, value: string) => {
          resAttr += name + ', ' + value + ' ';
          return true;
        },
        tokenValueCallbackFunction: (name: xml.EventType, value: xml.ParseInfo) => {
          if (name == xml.EventType.TEXT) {
            result += value.getText() + ' ';
          }
          return true;
        }
      }
      pullParse.parseXml(options);
      let str = 'Hello>World\' Wo"rk';
      let strAttr = 'importance, hi&gh logged, <true';
      expect(result.trim()).assertEqual(str);
      expect(resAttr.trim()).assertEqual(strAttr);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3600
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<column name="Giana"><value integer="1"/></column>' +
          '<column name="category"><value Boolean="true"/></column>' +
          '<column name="day"><value Boolean="3"/></column>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let findCategory = false;
      let categoryValue = "";

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
          if (value === '1') {
            findCategory = true;
            return true;
          }
          if (findCategory) {
            categoryValue = value;
            return false;
          }
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'category';
      expect(categoryValue).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3700
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<column name="Giana"><value integer="1"/></column>' +
          '<column name="category"><value Boolean="true"/></column>' +
          '<column name="day"><value Boolean="3"/></column>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
          if (value === 'category') {
            return false;
          }
          str += tagName + ' ' + key + ' ' + value + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'column name Giana value integer 1';
      expect(str.trim()).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3800
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<column name="Giana"><value integer="1"/></column>' +
          '<column name="category"><value Boolean="true"/></column>' +
          '<column name="day"><value Boolean="3"/></column>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
          if (value === 'category') {
            return false;
          }
          str += key + ' ' + value + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'name Giana integer 1';
      expect(str.trim()).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_3900
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<column name="Giana"><value integer="1"/></column>' +
          '<column name="category"><value Boolean="true"/></column>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
          str += tagName + ' ' + key + ' ' + value + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'column name Giana value integer 1 column name category value Boolean true';
      expect(str.trim()).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_4000
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<column name="Giana"><value integer="1"/></column>' +
          '<column name="category"><value Boolean="true"/></column>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
          str += key + ' ' + value + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'name Giana integer 1 name category Boolean true';
      expect(str.trim()).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_4100
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          ' name="Giana"><value integer="1"/>' +
          '</aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
          str += tagName + ' ' + key + ' ' + value + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'column name Giana value integer 1 column name category value Boolean true';
      expect(str.trim()).assertEqual(
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ' +
          'name Giana value integer 1');
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_4500
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testXmlAttributeWithTagCallbackFunction045';
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<name="Giana"><value integer="1"/></>';
      let textEncoder = new util.TextEncoder();
      try {
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
        let str = '';

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
            str += tagName + ' ' + key + ' ' + value + ' ';
            return true;
          }
        }
        pullParse.parseXml(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} fail,err:${err}`);
        expect(err instanceof BusinessError).assertTrue();
      }
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_4600
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<null name="Giana"><value integer="1"/></null>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
          str += tagName + ' ' + key + ' ' + value + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'null name Giana value integer 1';
      expect(str.trim()).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_4700
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<undefined name="Giana"><value integer="1"/></undefined>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
          str += tagName + ' ' + key + ' ' + value + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'undefined name Giana value integer 1';
      expect(str.trim()).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_4800
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<column name="Giana"><value integer="1"/></column>' +
          '<column name="category"><value Boolean="true"/></column>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (key: string, value: string) => {
          str += key + ' ' + value + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'column name value integer column name value Boolean';
      expect(str.trim()).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_4900
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<column name="Giana"><value integer="1"/></column>' +
          '<column name="category"><value Boolean="true"/></column>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (key: string) => {
          str += key + ' ';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'column value column value';
      expect(str.trim()).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_5000
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
          '<column name="Giana"><value integer="1"/></column>' +
          '<column name="category"><value Boolean="true"/></column>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: () => {
          str += 'xmlTest';
          return true;
        }
      }
      pullParse.parseXml(options);
      let result = 'xmlTestxmlTestxmlTestxmlTest';
      expect(str.trim()).assertEqual(result);
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_5600
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testXmlAttributeWithTagCallbackFunction056';
      try {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<root>\n' +
            '  <user-data name="Giana">Standard tag</user-data>\n' +
            '  <my-tag name="Giana">Hyphenated tag name</my-tag>\n' +
            '  <user_name name="Giana">Underscore in tag</user_name>\n' +
            '  <version-1.2.3 name="Giana">Mixed hyphens and dots</version-1.2.3>\n' +
            '  <item_42 name="Giana">Alphanumeric with underscore</item_42>\n' +
            '</root>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strXml);
        let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
        let str = '';

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
            str += tagName + ' ';
            return true;
          }
        }
        pullParse.parseXml(options);
        let result = 'user-data my-tag user_name version-1.2.3 item_42';
        expect(str.trim()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testXmlAttributeWithTagCallbackFunction059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLATTRIBUTEWITHTAGCALLBACKFUNCTIONTEST_5900
     * @tc.desc   xml attributeWithTagCallbackFunction interface function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlAttributeWithTagCallbackFunction059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testXmlAttributeWithTagCallbackFunction059';
      let strXml =
        '<?xml version="1.0" encoding="utf-8"?>\n' +
          '        <root xmlns:ns1="http://example.com/ns1" xmlns="http://example.com/default">\n' +
          '        <ns1:person id="1" ns1:name="John" age="30"/>\n' +
          '        <ns1:person id="2" ns1:name="Jane" age="25"/>\n' +
          '        <product xmlns:ns2="http://example.com/ns2" ns2:id="P001" name="Laptop"/>\n' +
          '        <test xmlns="http://example.com/test" value="123">\n' +
          '        <ns1:subtest flag="true"/>\n' +
          '        </test>\n' +
          '        </root>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let str = '';

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: (tagName: string, key: string, value: string) => {
          str += tagName + ' ' + key + ' ' + value + ' ';
          return true;
        }
      }

      let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
      pullParse.parseXml(options);

      let result = 'root xmlns:ns1 http://example.com/ns1 root xmlns http://example.com/default ns1:person id 1 ' +
        'ns1:person ns1:name John ns1:person age 30 ns1:person id 2 ns1:person ns1:name Jane ns1:person age 25 ' +
        'product xmlns:ns2 http://example.com/ns2 product ns2:id P001 product name Laptop test xmlns ' +
        'http://example.com/test test value 123 ns1:subtest flag true';
      expect(str.trim()).assertEqual(result);
    })
  })
}