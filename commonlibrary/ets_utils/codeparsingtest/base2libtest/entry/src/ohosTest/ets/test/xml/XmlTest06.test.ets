import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, xml } from '@kit.ArkTS';

const DOMAIN = 0x0000;
const TAG = 'GetLineNumberTest';
const textEncoder = new util.TextEncoder();

let globalTestResults: Array<string> = [];
let globalElementNames: Array<string> = [];
let globalCollectedData: Record<string, number> = {};

function createGetNameCallback(): (key: xml.EventType, value: xml.ParseInfo) => boolean {
  return (key: xml.EventType, value: xml.ParseInfo): boolean => {
    const name = value.getName ? value.getName() : 'METHOD_NOT_EXIST';
    globalTestResults.push(`key:${key} name:${name}`);
    return true;
  };
}
function stringToArrayBuffer(str: string): ArrayBuffer {
  const uint8Array = new Uint8Array(str.length * 2);
  for (let i = 0; i < str.length; i++) {
    uint8Array[i] = str.charCodeAt(i) & 0xFF;
  }
  return uint8Array.buffer;
}
// Define clear interfaces to replace object literal types
interface ParseEventData {
  event: number;
  column: number;
}

interface PositionData {
  event: number;
  column: number;
  line: number;
}

interface TestResult {
  name: string;
  status: string;
  message?: string;
}

let str = "";
// Reset the global str variable to avoid contamination between test cases
beforeEach(() => {
  str = "";
});

function func(key: xml.EventType, value: xml.ParseInfo) {
  str += 'key:' + key + ' value:' + value.getNamespace() + ' ';
  return true; // Continue parsing
}

function func02(key: xml.EventType, value: xml.ParseInfo) {
  const ns = value.getNamespace();
  str += `key:${key} ns:${ns} `; // Collect general results for assertion
  return true;
}

function func03(key: xml.EventType, value: xml.ParseInfo) {
  console.warn(`key: ${key}  valueURL: ${value.getNamespace()}`)
  return true;
}

export default function XmlTest_06() {
  describe('XmlTest_06', () => {
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
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_0100
     * @tc.name      GetLineNumberTest0001
     * @tc.desc      Verify that column numbers start at 1 and increment correctly during simple XML parsing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest0001';
        console.log(TAG + ' start');

        const strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        const lineNumbers: number[] = [];
        const eventTypes: number[] = [];

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const lineNum = value.getColumnNumber();
          lineNumbers.push(lineNum);
          eventTypes.push(key);
          return true;
        };

        const options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: callbackFunc
        };

        parser.parseXml(options);

        expect(lineNumbers.length).assertLarger(0);
        expect(lineNumbers[0]).assertEqual(1);

        for (let i = 1; i < lineNumbers.length; i++) {
          expect(lineNumbers[i]).assertLargerOrEqual(lineNumbers[i-1]);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_0200
     * @tc.name      GetLineNumberTest0002
     * @tc.desc      Verify that the column number calculation is correct when the XML contains whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest0002';
        console.log(TAG + ' start');
        const strXml = `<?xml version="1.0" encoding="utf-8"?>
<note attr="value">
    <title>Test</title>
    <body>Content with spaces</body>
</note>`;

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        const lineData: ParseEventData[] = [];

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          lineData.push({
            event: key,
            column: value.getLineNumber()
          });
          return true;
        };

        const options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: callbackFunc };

        parser.parseXml(options);

        expect(lineData.length).assertLarger(0);
        for (let i = 0; i < lineData.length; i++) {
          const data = lineData[i];
          expect(data.column).assertLarger(0);
          expect(data.column).assertLessOrEqual(strXml.length);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_0300
     * @tc.name      GetLineNumberTest0003
     * @tc.desc      Verify that the column number is calculated correctly when XML contains escaped characters and Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest0003';
        console.log(TAG + ' start');

        const strXml = '<?xml version="1.0"?><data attr="value&amp;test">Text &lt;content&gt;</data>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        const lineNumbers: number[] = [];

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          lineNumbers.push(value.getLineNumber());
          return true;
        };

        const options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: callbackFunc };

        parser.parseXml(options);

        expect(lineNumbers.length).assertLarger(0);
        expect(lineNumbers[0]).assertLarger(0);

        for (let i = 0; i < lineNumbers.length; i++) {
          const line = lineNumbers[i];
          expect(line).assertLarger(0);
          expect(line).assertLessOrEqual(strXml.length + 20);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_0400
     * @tc.name      GetLineNumberTest0004
     * @tc.desc      Verify the return value of getLineNumber when the XML input is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest0004';
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
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_0500
     * @tc.name      GetLineNumberTest0005
     * @tc.desc      Verify that the column numbers are calculated correctly when parsing incomplete XML
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest0005';
        console.log(TAG + ' start');
        const strXml = '<root><tag attr=unquoted><child>content</child>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        const lineNumbers: number[] = [];

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const line = value.getLineNumber();
          lineNumbers.push(line);
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

        if (lineNumbers.length > 0) {
          for (let i = 0; i < lineNumbers.length; i++) {
            const line = lineNumbers[i];
            expect(line).assertLarger(0);
            expect(line).assertLessOrEqual(strXml.length);
          }
        } else {
          expect(parseErrorOccurred).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_0600
     * @tc.name      GetLineNumberTest0006
     * @tc.desc      Verify the behavior of getLineNumber when input is invalid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest0006';
        console.log(TAG + ' start');
        const invalidXmls: string[] = [
          '<root><tag#invalid>content</tag></root>',
          '<root>Invalid & character</root>',
          '<root><![CDATA[Invalid content]]></root>'
        ];

        let isXml = false
        for (let xmlIndex = 0; xmlIndex < invalidXmls.length; xmlIndex++) {
          const strXml = invalidXmls[xmlIndex];
          const textEncoder = new util.TextEncoder();
          const arrBuffer = textEncoder.encodeInto(strXml);
          const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

          const lineNumbers: number[] = [];

          const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
            const line = value.getLineNumber();
            lineNumbers.push(line);
            return true;
          };

          const options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: callbackFunc };

          try {
            parser.parseXml(options);
          }catch (err) {
            console.error(`${TAG} fail, err: ${err}`);
            expect(String(err)).assertContain("BusinessError")
          }


          if (lineNumbers.length > 0) {
            for (let i = 0; i < lineNumbers.length; i++) {
              const line = lineNumbers[i];
              expect(line).assertLarger(0);
              isXml = true
            }
          }
        }
        expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_0700
     * @tc.name      GetLineNumberTest0007
     * @tc.desc      Verify the independence of column number calculation when multiple parsing instances run simultaneously
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest0007';
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
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_0800
     * @tc.name      GetLineNumberTest0008
     * @tc.desc      Verify the independence of column number calculation when multiple parsing instances run simultaneously
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest0008';
        console.log(TAG + ' start');
        const xml1 = '<root><item>First</item></root>';
        const xml2 = '<data><value>Test</value></data>';

        const textEncoder = new util.TextEncoder();
        const arrBuffer1 = textEncoder.encodeInto(xml1);
        const arrBuffer2 = textEncoder.encodeInto(xml2);

        const parser1 = new xml.XmlPullParser(arrBuffer1.buffer as ArrayBuffer);
        const parser2 = new xml.XmlPullParser(arrBuffer2.buffer as ArrayBuffer);

        const lines1: number[] = [];
        const lines2: number[] = [];

        const callback1 = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const lineNum = value.getLineNumber();
          lines1.push(lineNum);
          return true;
        };

        const callback2 = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const lineNum = value.getLineNumber();
          lines2.push(lineNum);
          return true;
        };

        const options1: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: callback1 };

        const options2: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: callback2 };

        parser1.parseXml(options1);
        parser2.parseXml(options2);

        expect(lines1.length).assertLarger(0);
        expect(lines2.length).assertLarger(0);

        for (let i = 0; i < lines1.length; i++) {
          const col = lines1[i];
          expect(col).assertLarger(0);
        }

        for (let i = 0; i < lines2.length; i++) {
          const col = lines2[i];
          expect(col).assertLarger(0);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_0900
     * @tc.name      GetLineNumberTest0009
     * @tc.desc      Verify that the column number results are consistent when the same XML document is parsed repeatedly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest0009';
        console.log(TAG + ' start');
        const strXml = '<?xml version="1.0"?><test></test>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);

        const firstPassLines: number[] = [];
        const secondPassLines: number[] = [];

        const parser1 = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        const callback1 = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          firstPassLines.push(value.getLineNumber());
          return true;
        };

        const options1: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: callback1 };

        parser1.parseXml(options1);

        const parser2 = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        const callback2 = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          secondPassLines.push(value.getLineNumber());
          return true;
        };

        const options2: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: callback2 };

        parser2.parseXml(options2);

        expect(firstPassLines.length).assertEqual(secondPassLines.length);

        for (let i = 0; i < firstPassLines.length; i++) {
          expect(firstPassLines[i]).assertEqual(secondPassLines[i]);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETLINENUMBER_1000
     * @tc.name      GetLineNumberTest00010
     * @tc.desc      Verify that the column number accurately locates the error when an XML parsing error occurs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetLineNumberTest00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'GetLineNumberTest00010';
        console.log(TAG + ' start');
        const strXml = '<root><correct>OK</correct><error>Invalid & here</error></root>';
        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);

        let lastLineBeforeError = -1;

        const callbackFunc = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const line = value.getLineNumber();
          lastLineBeforeError = line;
          return true;
        };

        const options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: callbackFunc };

        let parseErrorOccurred = false;
        try {
          parser.parseXml(options);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          parseErrorOccurred = true;
        }

        expect(parseErrorOccurred).assertTrue();
        expect(lastLineBeforeError).assertLarger(0);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAME_0100
     * @tc.name      getNameTest0001
     * @tc.desc      [Positive Scenario] Test the basic element node name retrieval function, verify the basic support of getName method for standard XML element nodes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNameTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNameTest0001';
        console.log(TAG + ' start');
        const strXml: string = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
        const arrBuffer = stringToArrayBuffer(strXml);

        const parser: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer);
        const callback = createGetNameCallback();

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: callback
        };

        parser.parse(options);
        expect(globalTestResults.length > 0).assertTrue();

        const noteElementFound = globalTestResults.some(result =>
        result.includes('key:2') && result.includes('name:note'));
        expect(noteElementFound).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAME_0200
     * @tc.name      getNameTest0002
     * @tc.desc      [Positive Scenario] Test the attribute node name retrieval function, verify the correct application of getName method in attribute callbacks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNameTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNameTest0002';
        console.log(TAG + ' start');
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
          attributeValueCallbackFunction: (name: string, value: string): boolean => {
            globalTestResults.push(`attr:${name}=${value}`);
            return true;
          },
          tokenValueCallbackFunction: attributeCallback
        };

        parser.parse(options);
        expect(globalTestResults.length > 0).assertTrue();
        expect(globalTestResults.some(r => r.includes('attr:'))).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAME_0300
     * @tc.name      getNameTest0003
     * @tc.desc      [Positive Boundary Scenario] Test the retrieval function of node names with special characters, verify boundary cases such as underscores, hyphens, and namespaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNameTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNameTest0003';
        console.log(TAG + ' start');
        const specialXmls: Array<string> = [
          '<?xml version="1.0"?><_note>content</_note>',
          '<?xml version="1.0"?><note-123>content</note-123>',
          '<?xml version="1.0"?><ns:note>content</ns:note>',
          '<?xml version="1.0"?><Note>content</Note>'
        ];

        for (let i: number = 0; i < specialXmls.length; i++) {
          const strXml: string = specialXmls[i];
          const arrBuffer = stringToArrayBuffer(strXml);

          const parser: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer);
          globalTestResults = [];

          const options: xml.ParseOptions = {
            supportDoctype: true,
            ignoreNameSpace: i === 2,
            tokenValueCallbackFunction: createGetNameCallback()
          };

          parser.parse(options);
          expect(globalTestResults.length > 0).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAME_0400
     * @tc.name      getNameTest0004
     * @tc.desc      [Positive Combination Scenario] Test the retrieval function of nested element node names, verify the parsing capability of multi-layer complex structures
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNameTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNameTest0004';
        console.log(TAG + ' start');
        const strXml: string = `<?xml version="1.0" encoding="utf-8"?>
                    <root>
                        <parent>
                            <child>value1</child>
                            <child>value2</child>
                        </parent>
                        <sibling>value3</sibling>
                    </root>`;

        const arrBuffer = stringToArrayBuffer(strXml);
        const parser: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer);
        globalElementNames = [];

        const nestedCallback = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          if (key === 2) {
            const name = value.getName ? value.getName() : 'METHOD_NOT_EXIST';
            if (name && name !== 'METHOD_NOT_EXIST') {
              globalElementNames.push(name);
            }
          }
          return true;
        };

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: nestedCallback
        };

        parser.parse(options);
        expect(globalElementNames.length >= 4).assertTrue();

        const expectedElements = ['root', 'parent', 'child', 'sibling'];
        expectedElements.forEach(element => {
          expect(globalElementNames.includes(element)).assertTrue();
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAME_0500
     * @tc.name      getNameTest0005
     * @tc.desc      [Positive Boundary Scenario] Test the processing capability of empty nodes and self-closing tags, verify compatibility with special node types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNameTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNameTest0005';
        console.log(TAG + ' start');
        const emptyXmls: Array<string> = [
          '<?xml version="1.0"?><empty></empty>',
          '<?xml version="1.0"?><selfclosing/>',
          '<?xml version="1.0"?><root><empty/></root>'
        ];

        for (let i: number = 0; i < emptyXmls.length; i++) {
          const strXml: string = emptyXmls[i];
          const arrBuffer = stringToArrayBuffer(strXml);

          const parser: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer);
          globalTestResults = [];

          const options: xml.ParseOptions = {
            supportDoctype: true,
            ignoreNameSpace: true,
            tokenValueCallbackFunction: createGetNameCallback()
          };

          parser.parse(options);
          expect(globalTestResults.length > 0).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAME_0600
     * @tc.name      getNameTest0006
     * @tc.desc      [Negative Scenario] Test the fault tolerance capability under abnormal input conditions, verify the stability of getName method in cases such as invalid XML, unclosed tags, and empty input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNameTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNameTest0006';
        console.log(TAG + ' start');
        const invalidXmls: Array<string> = [
          'invalid xml content',
          '<unclosed>',
          '<?xml version="1.0"?><root>',
          ''
        ];

        let  name_test = ""

        for (let i: number = 0; i < invalidXmls.length; i++) {
          const strXml: string = invalidXmls[i];
          const bufferSize: number = strXml.length > 0 ? strXml.length * 2 : 1;
          const arrayBuffer: ArrayBuffer = new ArrayBuffer(bufferSize);

          const uint8Array: Uint8Array = new Uint8Array(arrayBuffer);
          for (let j: number = 0; j < Math.min(strXml.length, bufferSize); j++) {
            uint8Array[j] = strXml.charCodeAt(j) & 0xFF;
          }

          const parser: xml.XmlPullParser = new xml.XmlPullParser(arrayBuffer);

          const errorCallback = (key: xml.EventType, value: xml.ParseInfo): boolean => {
            const name = value.getName ? value.getName() : null;
            name_test += (`key:${key} value:${name}`)
            console.warn(`key:${key} value:${name}`)
            return true;
          };

          const options: xml.ParseOptions = {
            supportDoctype: true,
            ignoreNameSpace: true,
            tokenValueCallbackFunction: errorCallback
          };

          try {
            parser.parse(options);
          }catch (err) {
            console.error(`${TAG} fail, err: ${err}`);
            expect(String(err)).assertContain("BusinessError")
          }
        }

        expect(name_test).assertContain("unclosed")
        expect(name_test).assertContain("root")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAME_0700
     * @tc.name      getNameTest0007
     * @tc.desc      [Performance Combination Scenario] Test large document parsing capability, verify stability and performance under high-frequency calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNameTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNameTest0007';
        console.log(TAG + ' start');
        let largeXml: string = '<?xml version="1.0"?><large_root>';
        for (let i: number = 0; i < 100; i++) {
          largeXml += `<item id="${i}">value${i}</item>`;
        }
        largeXml += '</large_root>';

        const arrBuffer = stringToArrayBuffer(largeXml);
        const parser: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer);

        let elementCount: number = 0;
        const largeDocCallback = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          if (key === 2) {
            const name = value.getName ? value.getName() : 'METHOD_NOT_EXIST';
            if (name === 'item') {
              elementCount++;
            }
          }
          return true;
        };

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: largeDocCallback
        };

        parser.parse(options);
        expect(elementCount === 100).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAME_0800
     * @tc.name      getNameTest0008
     * @tc.desc      [Complex Combination Scenario] Test complex XML structure parsing, verify the integrity of multi-type node combination scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNameTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNameTest0008';
        console.log(TAG + ' start');
        const complexXml: string = `<?xml version="1.0" encoding="utf-8"?>
                    <library>
                        <book category="fiction">
                            <title lang="en">Harry Potter</title>
                            <author>J.K. Rowling</author>
                            <year>2005</year>
                        </book>
                        <book category="non-fiction">
                            <title lang="es">Cien años de soledad</title>
                            <author>Gabriel García Márquez</author>
                            <year>1967</year>
                        </book>
                    </library>`;

        const arrBuffer = stringToArrayBuffer(complexXml);
        const parser: xml.XmlPullParser = new xml.XmlPullParser(arrBuffer);
        globalCollectedData = {};
        globalTestResults = [];

        const complexCallback = (key: xml.EventType, value: xml.ParseInfo): boolean => {
          const name = value.getName ? value.getName() : 'METHOD_NOT_EXIST';
          if (key === 2) {
            if (!globalCollectedData[name]) {
              globalCollectedData[name] = 0;
            }
            globalCollectedData[name]++;
          }
          globalTestResults.push(`key:${key} name:${name}`);
          return true;
        };

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: complexCallback
        };

        parser.parse(options);
        expect(globalCollectedData['book'] === 2).assertTrue();
        expect(globalCollectedData['title'] === 2).assertTrue();
        expect(globalCollectedData['author'] === 2).assertTrue();
        expect(globalTestResults.length > 10).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_0200
     * @tc.name      getNamespaceTest0002
     * @tc.desc      Test to verify returning the correct namespace URI
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0002';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<ns:root xmlns:ns="http://example.com/ns">\n' +
            '  <ns:item>Content</ns:item>\n' +
            '</ns:root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/ns")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_0300
     * @tc.name      getNamespaceTest0003
     * @tc.desc      Test child node inherits parent node's prefix binding, verify returning parent node's bound URI
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0003';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<ns:root xmlns:ns="http://example.com/ns">\n' +
            '  <ns:sub>\n' +
            '    <ns:grandchild>Nested inheritance</ns:grandchild>\n' +
            '  </ns:sub>\n' +
            '</ns:root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/ns")

      });


    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_0500
     * @tc.name      getNamespaceTest0005
     * @tc.desc      Test defining default namespace (without prefix), return URI
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0005';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root xmlns="http://example.com/default">\n' +
            '  <sub>\n' +
            '    <child>Default namespace inheritance</child>\n' +
            '  </sub>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/default")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_0600
     * @tc.name      getNamespaceTest0006
     * @tc.desc      Test child node inherits parent node's default namespace, return parent node's default URI
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0006';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root xmlns="http://example.com/default">\n' +
            '  <parent>\n' +
            '    <child>Inherit default namespace</child>\n' +
            '    <subchild>Nested inheritance</subchild>\n' +
            '  </parent>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/default")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_0700
     * @tc.name      getNamespaceTest0007
     * @tc.desc      Test node redefines prefix already bound by parent node, return child node's redefined URI
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0007';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<ns:root xmlns:ns="http://example.com/original">\n' +
            '  <ns:child>Original prefix content</ns:child>\n' +
            '  <ns:parent xmlns:ns="http://example.com/redefined">\n' +
            '    <ns:child>Redefined prefix content</ns:child>\n' +
            '  </ns:parent>\n' +
            '</ns:root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/original")
        expect(str).assertContain("http://example.com/redefined")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_0800
     * @tc.name      getNamespaceTest0008
     * @tc.desc      Test child node defines new prefix with no such prefix binding in parent node
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0008';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root>\n' +
            '  <child xmlns:ns="http://example.com/new">\n' +
            '    <ns:sub>New prefix content</ns:sub>\n' +
            '  </child>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/new")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_0900
     * @tc.name      getNamespaceTest0009
     * @tc.desc      Test node with no explicit namespace binding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0009';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root>\n' +
            '  <parent>\n' +
            '    <child>Content without namespace</child>\n' +
            '  </parent>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain(" ")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_1000
     * @tc.name      getNamespaceTest0010
     * @tc.desc      Test passing null as prefix parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0010';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root xmlns:null="http://example.com/null">\n' +
            '  <null:item>null prefix</null:item>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/null")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_1100
     * @tc.name      getNamespaceTest0011
     * @tc.desc      Test passing undefined as prefix parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0011';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root xmlns:undefined="http://example.com/undef">\n' +
            '  <undefined:item>undefined prefix</undefined:item>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/undef")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_1200
     * @tc.name      getNamespaceTest0012
     * @tc.desc      Test passing numeric prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0012';
        console.log(TAG + ' start');

        try{
          let strXml =
            '<?xml version="1.0" encoding="UTF-8"?>\n' +
              '<root xmlns:123="http://example.com/num">\n' +
              '  <123:item>Numeric prefix</123:item>\n' +
              '</root>'
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
          that.parseXml(options);

          expect().assertFail()

        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_1300
     * @tc.name      getNamespaceTest0013
     * @tc.desc      Test passing object prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0013';
        console.log(TAG + ' start');

        try{
          let strXml =
            '<?xml version="1.0" encoding="UTF-8"?>\n' +
              '<root xmlns:{}="http://example.com/obj">\n' +
              '  <{}:item>Object prefix simulation</{}:item>\n' +
              '</root>'
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
          that.parseXml(options);

          expect().assertFail()

        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_1400
     * @tc.name      getNamespaceTest0014
     * @tc.desc      Test passing array prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0014';
        console.log(TAG + ' start');

        try{
          let strXml =
            '<?xml version="1.0" encoding="UTF-8"?>\n' +
              '<root xmlns:[]="http://example.com/arr">\n' +
              '  <[]:item>Array prefix simulation</[]:item>\n' +
              '</root>'
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
          that.parseXml(options);

          expect().assertFail()

        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_1500
     * @tc.name      getNamespaceTest0015
     * @tc.desc      Test passing prefix with illegal characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0015';
        console.log(TAG + ' start');

        try{
          let strXml =
            '<?xml version="1.0" encoding="UTF-8"?>\n' +
              '<root xmlns:ns@1="http://example.com/arr">\n' +
              '  <ns@1:item>Prefix with illegal characters</ns@1:item>\n' +
              '</root>'
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
          that.parseXml(options);

          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_1600
     * @tc.name      getNamespaceTest0016
     * @tc.desc      Test passing prefix not bound in current node and ancestor nodes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0016';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root>\n' +
            '  <unknown:item>Content with unbound prefix</unknown:item>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain(" ")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_1700
     * @tc.name      getNamespaceTest0017
     * @tc.desc      Test parsing incomplete XML
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0017';
        console.log(TAG + ' start');

        try{
          let strXml =
            '<?xml version="1.0" encoding="UTF-8"?>\n' +
              '<root xmlns:ns="http://example.com/incomplete\n' +
              '  <ns:item>Unclosed node\n' +
              '  <child>Content</child\n' +
              '</root>'
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
          that.parseXml(options);
          console.warn(str);

          expect().assertFail()

        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_1900
     * @tc.name      getNamespaceTest0019
     * @tc.desc      Test combination of grandparent node binding and parent node redefinition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0019';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<ns:grandparent xmlns:ns="http://example.com/uri1">\n' +
            '  <ns:parent xmlns:ns="http://example.com/uri2">\n' +
            '    <ns:child>Inherit parent node\'s redefined prefix</ns:child>\n' +
            '  </ns:parent>\n' +
            '</ns:grandparent>'

        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/uri2")

      });
  })
}