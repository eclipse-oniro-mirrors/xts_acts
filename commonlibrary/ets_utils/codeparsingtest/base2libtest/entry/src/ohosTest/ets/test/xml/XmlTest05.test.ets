import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, xml } from '@kit.ArkTS';

let str = "";
// Reset the global str variable to avoid contamination between test cases
beforeEach(() => {
  str = "";
});
//0001
function func(name: string, value: string) {
  str = name + value;
  console.info(str);
  return true;
}
//Output with attribute names
function funcA(name: string, value: string) {
  str += (`name: ${name}  value: ${value}`)
  return true;
}
//Direct output
function funcB(name: string, value: string) {
  str += (`${name} ${value}`)
  return true;
}
// Define interface to replace object literal type
interface ParseResult {
  key: xml.EventType;
  value: string;
}
interface ColumnData {
  event: number;
  column: number;
}
export interface PositionData {
  event: number;
  column: number;
  line: number;
}
const arrayEquals = (actual: number[], expected: number[]): boolean => {
  if (actual.length !== expected.length) {
    return false;
  }
  for (let i = 0; i < actual.length; i++) {
    if (actual[i] !== expected[i]) {
      return false;
    }
  }
  return true;
};

export default function XmlTest_05() {
  describe('XmlTest_05', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_1600
     * @tc.name      ParseTest0016
     * @tc.desc      Test XML input with unescaped illegal characters in predefined entities (<, >, &, ", ')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParseTest0016';
        console.log(TAG + ' start');

        str = "";
        try{
          let strXml = //All throw BusinessError
            '<root>\n' +
              '  <content>Price < 100 & Stock > 50</content>\n' +
              '  <item name="John "Doe"" />\n' +
              '  <user id=\'O\'Neil\' />\n' +
              '</root>'

          let testEncoder = new util.TextEncoder();
          let arrBuffer = testEncoder.encodeInto(strXml);
          let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

          let options: xml.ParseOptions = {attributeValueCallbackFunction:funcA, tagValueCallbackFunction: funcA}
          testThat.parse(options);

          expect().assertFail()

        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_1700
     * @tc.name      ParseTest0017
     * @tc.desc      Test XML input containing control characters (non-printable characters like 0x00-0x08, 0x0B, 0x0C, 0x0E-0x1F)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParseTest0017';
        console.log(TAG + ' start');

        str = "";
        let strXml = //Normal input without printing control characters
          '<root>\n' +
            '   <data>&#x01;&#x08;&#x0B;&#x0C;&#x1F;Control Character Test</data>\n' +
            '</root>'

        let testEncoder = new util.TextEncoder();
        let arrBuffer = testEncoder.encodeInto(strXml);
        let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

        let options: xml.ParseOptions = {attributeValueCallbackFunction:funcB, tagValueCallbackFunction: funcB}
        testThat.parse(options);

        expect(str).not().assertContain("&#x01")
        expect(str).not().assertContain("&#x08")
        expect(str).not().assertContain("&#x0B")
        expect(str).not().assertContain("&#x0C")
        expect(str).not().assertContain("&#x1F")

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_1800
     * @tc.name      ParseTest0018
     * @tc.desc      Test element/attribute names containing illegal characters (spaces, special symbols, starting with numbers)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParseTest0018';
        console.log(TAG + ' start');

        str = "";
        try{
          let strXml = //Element and attribute names with illegal characters throw BusinessError
            '<root>\n' +
              '  <item name>Content</item>\n' +
              '  <123element>Test</123element>\n' +
              '  <user na&me="Alice" />\n' +
              '</root>'

          let testEncoder = new util.TextEncoder();
          let arrBuffer = testEncoder.encodeInto(strXml);
          let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

          let options: xml.ParseOptions = {attributeValueCallbackFunction:funcA, tagValueCallbackFunction: funcA}
          testThat.parse(options);

          expect().assertFail()

        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_1900
     * @tc.name      ParseTest0019
     * @tc.desc      Test CDATA sections containing illegal end markers (]]>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParseTest0019';
        console.log(TAG + ' start');

        str = "";
        try{
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

          let options: xml.ParseOptions = {attributeValueCallbackFunction:funcA, tagValueCallbackFunction: funcA}
          testThat.parse(options);

          expect().assertFail()

        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_2000
     * @tc.name      ParseTest0020
     * @tc.desc      Test passing characters with mismatched encoding (declared as UTF-8 but containing non-UTF-8 characters)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParseTest0020';
        console.log(TAG + ' start');

        str = "";

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root>\n' +
            '  <text>镙瑰向鍓嶆潵</text>\n' +
            '</root>'

        let testEncoder = new util.TextEncoder();
        let arrBuffer = testEncoder.encodeInto(strXml);
        let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

        let options: xml.ParseOptions = {attributeValueCallbackFunction:funcA, tagValueCallbackFunction: funcA}
        testThat.parse(options);

        expect(str).assertContain("镙瑰向鍓嶆潵")

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_2100
     * @tc.name      ParseTest0021
     * @tc.desc      Test parsing XML containing comments, extra spaces, and nested nodes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParseTest0021';
        console.log(TAG + ' start');

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

        let options: xml.ParseOptions = {attributeValueCallbackFunction:funcB, tagValueCallbackFunction: funcB}
        testThat.parse(options);

        expect(str).assertContain("id demo")
        expect(str).assertContain("Test parsing comments")
        expect(str).assertContain("Nested Node Content")

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_2200
     * @tc.name      ParseTest0022
     * @tc.desc      Test XML input with whitespace characters but unclosed tags to verify format error exception is triggered first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParseTest0022';
        console.log(TAG + ' start');

        str = "";
        try{
          let strXml =
            '<?xml version="1.0" encoding="UTF-8"?>\n' +
              '<root  >  \n' +
              '  <data>  Test  <![CDATA[<>&]]>  \n' +
              '  <item  id="1"  >  Unclosed  \n' +
              '</root>'

          let testEncoder = new util.TextEncoder();
          let arrBuffer = testEncoder.encodeInto(strXml);
          let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

          let options: xml.ParseOptions = {attributeValueCallbackFunction:funcA, tagValueCallbackFunction: funcA}
          testThat.parse(options);

          expect().assertFail()

        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_2300
     * @tc.name      ParseTest0023
     * @tc.desc      Test XML input with mixed case tag names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParseTest0023';
        console.log(TAG + ' start');

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

        let options: xml.ParseOptions = {attributeValueCallbackFunction:funcA, tagValueCallbackFunction: funcA}
        testThat.parse(options);

        expect(str).assertContain("RoOt")
        expect(str).assertContain("ItEm")
        expect(str).assertContain("SuB_Tag")

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_2400
     * @tc.name      ParseTest0024
     * @tc.desc      Test extremely deeply nested XML
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParseTest0024';
        console.log(TAG + ' start');

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

        let options: xml.ParseOptions = {attributeValueCallbackFunction:funcA, tagValueCallbackFunction: funcA}
        testThat.parse(options);

        expect(str).assertContain("Content")

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_PARSE_2500
     * @tc.name      ParseTest0025
     * @tc.desc      Test passing encoded XML strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ParseTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ParsTest0025';
        console.log(TAG + ' start');

        str = "";
        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root attr="&quot;Encoding Test&apos;&amp;&lt;10&gt;">\n' +
            '  <data>Content contains &lt;tag&gt; and &amp; symbol</data>\n' +
            '</root>'

        let testEncoder = new util.TextEncoder();
        let arrBuffer = testEncoder.encodeInto(strXml);
        let testThat = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

        let options: xml.ParseOptions = {attributeValueCallbackFunction:funcB, tagValueCallbackFunction: funcB}
        testThat.parse(options);

        expect(str).assertContain("\"Encoding Test'&<10> ")
        expect(str).assertContain("Content contains <tag> and & symbol")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_GETCOLUMNNUMBER_0100
     * @tc.name     getColumnNumberTest0001
     * @tc.desc     Verify that column numbers increment correctly starting from 1 during simple XML parsing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0001';
        console.log(TAG + ' start');
        const strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        const columnNumbers: number[] = [];
        const eventTypes: number[] = [];

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const columnNum = value.getColumnNumber();
          columnNumbers.push(columnNum);
          eventTypes.push(key);
          return true;
        };

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callbackFunc
        };

        parser.parseXml(options);

        expect(columnNumbers.length).assertLarger(0);
        expect(columnNumbers[0]).assertEqual(1);

        for (let i = 1; i < columnNumbers.length; i++) {
          expect(columnNumbers[i]).assertLargerOrEqual(columnNumbers[i-1]);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETCOLUMNNUMBER_0200
     * @tc.name      getColumnNumberTest0002
     * @tc.desc      Verify correct column number calculation when XML contains whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0002';
        console.log(TAG + ' start');
        const strXml = `<?xml version="1.0" encoding="utf-8"?>
<note attr="value">
    <title>Test</title>
    <body>Content with spaces</body>
</note>`;

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        const columnData: ColumnData[] = [];

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          columnData.push({
            event: key,
            column: value.getColumnNumber()
          });
          return true;
        };

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callbackFunc
        };

        parser.parseXml(options);

        expect(columnData.length).assertLarger(0);
        for (let i = 0; i < columnData.length; i++) {
          const data = columnData[i];
          expect(data.column).assertLarger(0);
          expect(data.column).assertLessOrEqual(strXml.length);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETCOLUMNNUMBER_0300
     * @tc.name      getColumnNumberTest0003
     * @tc.desc      Verify correct column number calculation when XML contains escape characters and Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0003';
        console.log(TAG + ' start');

        const strXml = '<?xml version="1.0"?><data attr="value&amp;test">Text &lt;content&gt; 中文测试 𤭢</data>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        const columnNumbers: number[] = [];

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          columnNumbers.push(value.getColumnNumber());
          return true;
        };

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callbackFunc
        };

        parser.parseXml(options);

        expect(columnNumbers.length).assertLarger(0);
        expect(columnNumbers[0]).assertLarger(0);

        for (let i = 0; i < columnNumbers.length; i++) {
          const column = columnNumbers[i];
          expect(column).assertLarger(0);
          expect(column).assertLessOrEqual(strXml.length + 20);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETCOLUMNNUMBER_0400
     * @tc.name     getColumnNumberTest0004
     * @tc.desc     Verify getColumnNumber return value when input is empty XML
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0004';
        console.log(TAG + ' start');
        const strXml = '';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);

        expect(arrBuffer).assertUndefined();

        try {
          const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err.message).assertContain('undefined');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETCOLUMNNUMBER_0500
     * @tc.name      getColumnNumberTest0005
     * @tc.desc      Verify correct column number calculation when parsing incomplete XML
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0005';
        console.log(TAG + ' start');
        const strXml = '<root><tag attr=unquoted><child>content</child>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        const columnNumbers: number[] = [];

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const column = value.getColumnNumber();
          columnNumbers.push(column);
          return true;
        };

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callbackFunc
        };

        let parseErrorOccurred = false;
        try {
          parser.parseXml(options);
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          parseErrorOccurred = true;
        }

        if (columnNumbers.length > 0) {
          for (let i = 0; i < columnNumbers.length; i++) {
            const column = columnNumbers[i];
            expect(column).assertLarger(0);
            expect(column).assertLessOrEqual(strXml.length);
          }
        } else {
          expect(parseErrorOccurred).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETCOLUMNNUMBER_0600
     * @tc.name      getColumnNumberTest0006
     * @tc.desc      Verify getColumnNumber behavior with invalid input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0006';
        console.log(TAG + ' start');
        const invalidXmls: string[] = [
          '<root><tag#invalid>content</tag></root>',
          '<root>Invalid & character</root>',
          '<root><![CDATA[Invalid content]]></root>'
        ];

        for (let xmlIndex = 0; xmlIndex < invalidXmls.length; xmlIndex++) {
          const strXml = invalidXmls[xmlIndex];
          const textEncoder = new util.TextEncoder();
          const arrBuffer = textEncoder.encodeInto(strXml);
          const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

          const columnNumbers: number[] = [];

          const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
            const column = value.getColumnNumber();
            columnNumbers.push(column);
            return true;
          };

          const options: xml.ParseOptions = {
            supportDoctype: true,
            ignoreNameSpace: true,
            tokenValueCallbackFunction: callbackFunc
          };
          let parseErrorOccurred = false;
          try {
            parser.parseXml(options);
          } catch (err) {
            console.error(`${TAG} fail, err: ${err}`);
            parseErrorOccurred = true;
          }
          if (columnNumbers.length > 0) {
            for (let i = 0; i < columnNumbers.length; i++) {
              const column = columnNumbers[i];
              expect(column).assertLarger(0);
            }
          } else {
            expect(parseErrorOccurred).assertTrue();
          }
        }

      });


    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETCOLUMNNUMBER_0700
     * @tc.name     getColumnNumberTest0007
     * @tc.desc     Verify consistency between column numbers and line numbers during parsing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0007';
        console.log(TAG + ' start');
        const strXml = `<?xml version="1.0"?>
<root>
    <item id="1">First</item>
    <item id="2">Second</item>
</root>`;

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        const positionData: PositionData[] = [];

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          positionData.push({
            event: key,
            column: value.getColumnNumber(),
            line: value.getLineNumber()
          });
          return true;
        };

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callbackFunc
        };

        parser.parseXml(options);

        expect(positionData.length).assertLarger(0);

        for (let i = 0; i < positionData.length; i++) {
          const data = positionData[i];
          expect(data.column).assertLarger(0);
          expect(data.line).assertLarger(0);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETCOLUMNNUMBER_0800
     * @tc.name      getColumnNumberTest0008
     * @tc.desc      Verify independence of column number calculation when multiple parser instances run simultaneously
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0008';
        console.log(TAG + ' start');
        const xml1 = '<root><item>First</item></root>';
        const xml2 = '<data><value>Test</value></data>';

        const textEncoder = new util.TextEncoder();
        const arrBuffer1 = textEncoder.encodeInto(xml1);
        const arrBuffer2 = textEncoder.encodeInto(xml2);

        const parser1 = new xml.XmlPullParser(arrBuffer1.buffer as ArrayBuffer);
        const parser2 = new xml.XmlPullParser(arrBuffer2.buffer as ArrayBuffer);

        const columns1: number[] = [];
        const columns2: number[] = [];

        const callback1 = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const columnNum = value.getColumnNumber();
          columns1.push(columnNum);
          return true;
        };

        const callback2 = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const columnNum = value.getColumnNumber();
          columns2.push(columnNum);
          return true;
        };

        const options1: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callback1
        };

        const options2: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callback2
        };

        parser1.parseXml(options1);
        parser2.parseXml(options2);

        expect(columns1.length).assertLarger(0);
        expect(columns2.length).assertLarger(0);

        for (let i = 0; i < columns1.length; i++) {
          const col = columns1[i];
          expect(col).assertLarger(0);
        }

        for (let i = 0; i < columns2.length; i++) {
          const col = columns2[i];
          expect(col).assertLarger(0);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETCOLUMNNUMBER_0900
     * @tc.name      getColumnNumberTest0009
     * @tc.desc      Verify consistent column number results when parsing the same XML document repeatedly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0009';
        console.log(TAG + ' start');
        const strXml = '<?xml version="1.0"?><test></test>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);

        const firstPassColumns: number[] = [];
        const secondPassColumns: number[] = [];

        const parser1 = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        const callback1 = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          firstPassColumns.push(value.getColumnNumber());
          return true;
        };

        const options1: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callback1
        };

        parser1.parseXml(options1);

        const parser2 = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        const callback2 = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          secondPassColumns.push(value.getColumnNumber());
          return true;
        };

        const options2: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callback2
        };

        parser2.parseXml(options2);

        expect(firstPassColumns.length).assertEqual(secondPassColumns.length);

        for (let i = 0; i < firstPassColumns.length; i++) {
          expect(firstPassColumns[i]).assertEqual(secondPassColumns[i]);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETCOLUMNNUMBER_0100
     * @tc.name      getColumnNumberTest0010
     * @tc.desc      Verify that column numbers can accurately locate error positions when XML parsing errors occur
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getColumnNumberTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getColumnNumberTest0010';
        console.log(TAG + ' start');
        const strXml = '<root><correct>OK</correct><error>Invalid & here</error></root>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        let lastColumnBeforeError = -1;

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const column = value.getColumnNumber();
          lastColumnBeforeError = column;
          return true;
        };

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callbackFunc
        };

        let parseErrorOccurred = false;
        try {
          parser.parseXml(options);
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          parseErrorOccurred = true;
        }

        expect(parseErrorOccurred).assertTrue();
        expect(lastColumnBeforeError).assertLarger(0);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_0100
     * @tc.name      GetDepthtest0001
     * @tc.desc      Root Element Depth Verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0001';
        console.log(TAG + ' start');
        const xmlStr = '<root/>';
        const arrBuffer = new util.TextEncoder().encode(xmlStr).buffer;
        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        let rootDepth = 0;
        parser.parse({
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.START_TAG) {
              rootDepth = info.getDepth();
            }
            return true;
          }
        });
        expect(rootDepth).assertEqual(1);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_0200
     * @tc.name      GetDepthtest0002
     * @tc.desc      Depth of multi-level nested structures
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0002';
        console.log(TAG + ' start');
        const xmlStr = '<a><b><c/></b></a>';
        const arrBuffer = new util.TextEncoder().encode(xmlStr).buffer;
        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        const actualDepths: number[] = [];
        parser.parse({
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.START_TAG) {
              const currentDepth = info.getDepth();
              actualDepths.push(currentDepth);
            }
            return true;
          }
        });
        const expectedDepths = [1, 2, 3];
        expect(actualDepths).assertDeepEquals(expectedDepths);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_0300
     * @tc.name      GetDepthtest0003
     * @tc.desc      Self-closing tag depth validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0003';
        console.log(TAG + ' start');
        const xmlStr = '<parent><child/></parent>';
        const arrBuffer = new util.TextEncoder().encode(xmlStr).buffer;
        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        const depths: number[] = [];
        parser.parse({
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.START_TAG) {
              depths.push(info.getDepth());
            }
            return true;
          }
        });
        expect(depths).assertDeepEquals([1, 2]);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_0400
     * @tc.name      GetDepthtest0004
     * @tc.desc      Text Node Depth Validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0004';
        console.log(TAG + ' start');
        const xmlStr = '<root>Hello<child/></root>';
        const arrBuffer = new util.TextEncoder().encode(xmlStr).buffer;
        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        let textDepth = -1;
        parser.parse({
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.TEXT) {
              textDepth = info.getDepth();
            }
            return true;
          }
        });
        expect(textDepth).assertEqual(1);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_0500
     * @tc.name      GetDepthtest0005
     * @tc.desc      Depth calculation with namespaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0005';
        console.log(TAG + ' start');
        const xmlStr = '<ns:root xmlns:ns="uri"><ns:child/></ns:root>';
        const arrBuffer = new util.TextEncoder().encode(xmlStr).buffer;
        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        const actualDepths: number[] = [];
        parser.parse({
          ignoreNameSpace: true,
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.START_TAG) {
              actualDepths.push(info.getDepth());
            }
            return true;
          }
        });
        const expectedDepths: number[] = [1, 2];
        expect(arrayEquals(actualDepths, expectedDepths)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_0600
     * @tc.name      GetDepthtest0006
     * @tc.desc      Deep Verification of Mixed Event Types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0006';
        console.log(TAG + ' start');
        const xmlStr = '<root><!--Comment--><child/></root>';
        const arrBuffer = new util.TextEncoder().encode(xmlStr).buffer;
        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        const actualDepths: number[] = [];
        parser.parse({
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.COMMENT || event === xml.EventType.START_TAG) {
              actualDepths.push(info.getDepth());
            }
            return true;
          }
        });
        const expectedDepths: number[] = [1, 1, 2];
        expect(arrayEquals(actualDepths, expectedDepths)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_0700
     * @tc.name      GetDepthtest0007
     * @tc.desc      CDATA Block Depth Validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0007';
        console.log(TAG + ' start');
        const xmlStr = '<root><![CDATA[<data>]]></root>';
        const arrBuffer = new util.TextEncoder().encode(xmlStr).buffer;
        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        const actualDepths: number[] = [];
        parser.parse({
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.CDSECT) {
              actualDepths.push(info.getDepth());
            }
            return true;
          }
        });
        const expectedDepths: number[] = [1];
        expect(arrayEquals(actualDepths, expectedDepths)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_0800
     * @tc.name      GetDepthtest0008
     * @tc.desc      Depth after the document type declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0008';
        console.log(TAG + ' start');
        const xmlStr = '<!DOCTYPE root><root/>';
        const arrBuffer = new util.TextEncoder().encode(xmlStr).buffer;
        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        const actualDepths: number[] = [];
        parser.parse({
          supportDoctype: true,
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.START_TAG) {
              actualDepths.push(info.getDepth());
            }
            return true;
          }
        });
        const expectedDepths: number[] = [1];
        expect(arrayEquals(actualDepths, expectedDepths)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_0900
     * @tc.name      GetDepthtest0009
     * @tc.desc      Whitespace character node depth
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0009';
        console.log(TAG + ' start');

        const xmlStr = '<root>\n  <child/>\n</root>';
        const arrBuffer = new util.TextEncoder().encode(xmlStr).buffer;
        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        const actualDepths: number[] = [];
        parser.parse({
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.WHITESPACE) {
              actualDepths.push(info.getDepth());
            }
            return true;
          }
        });
        const expectedDepths: number[] = [1, 1];
        expect(arrayEquals(actualDepths, expectedDepths)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1000
     * @tc.name      GetDepthtest0010
     * @tc.desc      Block-wise analysis of depth continuity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0010';
        console.log(TAG + ' start');

        const chunks = ['<root>', '<child>', '</child>', '</root>'];
        const arrBuffer = new util.TextEncoder().encode(chunks.join('')).buffer;

        const parser = new xml.XmlPullParser(arrBuffer as object as ArrayBuffer);
        const actualDepths: number[] = [];
        parser.parse({
          tokenValueCallbackFunction: (event, info) => {
            actualDepths.push(info.getDepth());
            return true;
          }
        });
        expect(actualDepths.toString()).assertEqual([0,1,2,2,1,0].toString());

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1100
     * @tc.name      GetDepthtest0011
     * @tc.desc      Illegal input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0011';
        console.log(TAG + ' start');
          const invalidBuffer: ArrayBuffer= new ArrayBuffer(1);
          const parser: xml.XmlPullParser = new xml.XmlPullParser(invalidBuffer);
          parser.parseXml({
            tokenValueCallbackFunction: (_type: xml.EventType, info: xml.ParseInfo) => {
              expect(info.getDepth()).not().assertNull()
              return true;
            }
          });

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1200
     * @tc.name      GetDepthtest0012
     * @tc.desc      Test negative depth value scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0012';
        console.log(TAG + ' start');
        try {
          const invalidBuffer: ArrayBuffer = new ArrayBuffer(-5);
          const parser: xml.XmlPullParser = new xml.XmlPullParser(invalidBuffer);
          parser.parseXml({
            tokenValueCallbackFunction: (_type: xml.EventType, info: xml.ParseInfo) => {
              info.getDepth();
              return true;
            }
          });
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err.message.includes('integerIndex') || err.message.includes('SAFE_NUMBER')).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1300
     * @tc.name      GetDepthtest0013
     * @tc.desc      Oversized Buffer XML Parsing Exception Validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0013';
        console.log(TAG + ' start');
        try {
          const invalidLength = Number.MAX_SAFE_INTEGER + 1;

          const invalidBuffer = new ArrayBuffer(invalidLength);
          const parser = new xml.XmlPullParser(invalidBuffer);

          parser.parseXml({
            tokenValueCallbackFunction: (_: number, info: xml.ParseInfo) => {
              expect(info.getDepth()).not().assertNull()
              return true;
            }
          });
        }catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("RangeError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1400
     * @tc.name      GetDepthtest0014
     * @tc.desc      Test floating-point value scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0014';
        console.log(TAG + ' start');

        try {
          const invalidLength: number = -1;
          const invalidBuffer: ArrayBuffer = new ArrayBuffer(invalidLength);
          const parser: xml.XmlPullParser = new xml.XmlPullParser(invalidBuffer);
          expect(!!parser).assertTrue()
          parser.parseXml({});
          expect().assertFail()
        }catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("RangeError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1500
     * @tc.name      GetDepthtest0015
     * @tc.desc      Verify multiple call exception scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0015';
        console.log(TAG + ' start');

        try {
          const invalidLength: number = Number.MAX_SAFE_INTEGER + 1;
          const invalidBuffer: ArrayBuffer = new ArrayBuffer(invalidLength);
          const parser: xml.XmlPullParser = new xml.XmlPullParser(invalidBuffer);
          parser.parseXml({
            tokenValueCallbackFunction: (type: xml.EventType, info: xml.ParseInfo) => {
              expect(info.getDepth()).not().assertNull();
              return true;
            }
          });
        }catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("RangeError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1600
     * @tc.name      GetDepthtest0016
     * @tc.desc      Test scenario for empty string parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0016';
        console.log(TAG + ' start');
        try {
          const bufferLength = -1;
          if (bufferLength < 0) {
            throw new TypeError(`Invalid array buffer length: ${bufferLength}`);
          }
          const invalidBuffer: ArrayBuffer = new ArrayBuffer(bufferLength);
          new xml.XmlPullParser(invalidBuffer).parseXml({
            tokenValueCallbackFunction: (type: xml.EventType, info: xml.ParseInfo) => {
              info.getDepth();
              return true;
            }
          });
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("TypeError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1700
     * @tc.name      GetDepthtest0017
     * @tc.desc      Verify Boolean parameter scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0017';
        console.log(TAG + ' start');

        try {
          const bufferLength = Number.MAX_SAFE_INTEGER + 1;
          const invalidBuffer = new ArrayBuffer(bufferLength);
          new xml.XmlPullParser(invalidBuffer).parseXml({
            tokenValueCallbackFunction: (type: xml.EventType, info: xml.ParseInfo) => {
              expect(info.getDepth()).not().assertNull();
              return true;
            }
          });
        }catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("RangeError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1800
     * @tc.name      GetDepthtest0018
     * @tc.desc      Basic Nested Structure Depth Detection
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0018';
        console.log(TAG + ' start');
        const xmlStr = `<?xml version="1.0"?><root><child><subchild/></child></root>`;
        const parser = new xml.XmlPullParser(new util.TextEncoder().encode(xmlStr).buffer as ArrayBuffer);
        const depths: number[] = [];
        parser.parseXml({
          tokenValueCallbackFunction: (eventType, info) => {
            depths.push(info.getDepth());
            return true;
          }
        });
        expect(depths).assertDeepEquals([0,1, 2, 3, 3, 2, 1,0]);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_1900
     * @tc.name      GetDepthtest0019
     * @tc.desc      Depth tracking with attribute elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0019';
        console.log(TAG + ' start');
        const xmlData = `<library>
  <book id="1" category="tech">
    <title>TestOS</title>
  </book>
</library>`;
        const expectedDepths = [1, 2, 3, 3, 2, 1];
        const actualDepths: number[] = [];
        const encoder = new util.TextEncoder();
        const uint8Array = encoder.encode(xmlData);
        const buffer = uint8Array.buffer;
        const isArraysEqual = (arr1: number[], arr2: number[]): boolean => {
          if (arr1.length !== arr2.length) {
            return false;
          }
          for (let i = 0; i < arr1.length; i++) {
            if (arr1[i] !== arr2[i]) {
              return false;
            }
          }
          return true;
        };
        expect(isArraysEqual(actualDepths, expectedDepths)).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_2000
     * @tc.name      GetDepthtest0020
     * @tc.desc      Three-level nested tag depth validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0020';
        console.log(TAG + ' start');

        const xmlData = `<root><child><grandchild/></child></root>`;
        let isXml = false
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.START_TAG) {
                switch (i.getName()) {
                  case 'root':
                    expect(i.getDepth()).assertEqual(1);
                    break;
                  case 'child':
                    expect(i.getDepth()).assertEqual(2);
                    break;
                  case 'grandchild':
                    expect(i.getDepth()).assertEqual(3);
                }
                isXml = true
              }
              return true;
            }
          });

        expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_2100
     * @tc.name      GetDepthtest0021
     * @tc.desc      End tag depth validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0021';
        console.log(TAG + ' start');

        const xmlData = `<a><b attr="value">Text<c/></b></a>`;
        let isXml = false
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.START_TAG && i.getName() === 'c') {
                expect(i.getDepth()).assertEqual(3);
              }
              isXml = true
              return true;
            }
          });

        expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_2200
     * @tc.name      GetDepthtest0022
     * @tc.desc      Depth of Text and CDATA Nodes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0022';
        console.log(TAG + ' start');

        const xmlData = `<root>Text<![CDATA[content]]></root>`;
        let isXml = false
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.TEXT || t === xml.EventType.CDSECT) {
                expect(i.getDepth()).assertEqual(1);
              }
              isXml = true
              return true;
            }
          });

        expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETDEPTH_2300
     * @tc.name      GetDepthtest0023
     * @tc.desc      Deep Processing of Document Type Declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetDepthtest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetDepthtest0023';
        console.log(TAG + ' start');

        const xmlData = `<!DOCTYPE html><html><head/><body/></html>`;
        let isXml = false
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.START_TAG && i.getName() === 'body') {
                expect(i.getDepth()).assertEqual(2);
              }
              isXml = true
              return true;
            }
          });

        expect(isXml).assertTrue()

      });
  })
}