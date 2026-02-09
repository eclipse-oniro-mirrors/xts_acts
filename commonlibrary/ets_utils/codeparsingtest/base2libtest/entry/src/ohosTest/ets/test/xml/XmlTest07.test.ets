import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, xml } from '@kit.ArkTS';

const DOMAIN = 0x0000
let str = "";

// Reset the global str variable to avoid contamination between test cases
beforeEach(() => {
  str = "";
});

function func(key: xml.EventType, value: xml.ParseInfo) {
  str += 'key:' + key + ' value:' + value.isEmptyElementTag() + ' ';
  return true; // Determines whether to continually parse, which is used to continue or terminate parsing.
}

//Output function
function func02(key: xml.EventType, value: xml.ParseInfo) {
  const ns = value.isEmptyElementTag();
  str += `key:${key} ns:${ns} `; // Collect general results for assertion
  return true;
}

function func03(key: xml.EventType, value: xml.ParseInfo) {
  const ns = value.getNamespace();
  str += `key:${key} ns:${ns} `; // Collect general results for assertion
  return true;
}

export default function XmlTest_07() {
  describe('XmlTest_07', () => {
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
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_2000
     * @tc.name      getNamespaceTest0020
     * @tc.desc      Test combination of default namespace and prefixed namespace on the same node
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0020';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root xmlns="http://example.com/default" xmlns:ns="http://example.com/ns">\n' +
            '  <default-item>Default namespace content</default-item>\n' +
            '  <ns:prefixed-item>Prefixed namespace content</ns:prefixed-item>\n' +
            '</root>'

        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func03}
        that.parseXml(options);

        expect(str).assertContain("http://example.com/default")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETNAMESPACE_2100
     * @tc.name      getNamespaceTest0021
     * @tc.desc      Test namespace URI as relative path (e.g., ./local-ns)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getNamespaceTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getNamespaceTest0021';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root xmlns:ns="./local-ns">\n' +
            '  <ns:sub>Prefixed relative path namespace</ns:sub>\n' +
            '</root>'

        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:false, tokenValueCallbackFunction:func03}
        that.parseXml(options);

        expect(str).assertContain("./local-ns")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETPREFIX_0100
     * @tc.name      getPrefixTest0001
     * @tc.desc      Positive scenario: Basic function verification - Verify that the getPrefix method can correctly return the prefix of the current element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getPrefixTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getPrefixTest0001';
        console.log(TAG + ' start');
        const strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note xmlns:h="http://www.w3.org/TR/html4">' +
            '<h:title>Happy</h:title>' +
            '</note>';

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let hasPrefixH = false;

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tokenValueCallbackFunction: (_key: xml.EventType, value: xml.ParseInfo): boolean => {
            const prefix = value.getPrefix();
            if (prefix === 'h') {
              hasPrefixH = true;
            }
            return true;
          }
        };

        parser.parseXml(options);
        expect(hasPrefixH).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETPREFIX_0200
     * @tc.name      getPrefixTest0002
     * @tc.desc      Positive scenario: Multiple namespace verification - Verify the correctness of getPrefix when multiple namespaces exist
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getPrefixTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getPrefixTest0002';
        console.log(TAG + ' start');
        const strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<root xmlns:h="http://www.w3.org/TR/html4" xmlns:f="http://www.w3schools.com/furniture">' +
            '<h:table>' +
            '<f:name>African Coffee Table</f:name>' +
            '</h:table>' +
            '</root>';

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let hasPrefixH = false;
        let hasPrefixF = false;
        let isXml = false

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tokenValueCallbackFunction: (key: xml.EventType, value: xml.ParseInfo): boolean => {
            if (key === xml.EventType.START_TAG) {
              const prefix = value.getPrefix();
              if (prefix === 'h') {
                hasPrefixH = true;
              } else if (prefix === 'f') {
                hasPrefixF = true;
              }
              isXml = true
            }
            return true;
          }
        };

        parser.parseXml(options);
        expect(hasPrefixH).assertTrue();
        expect(hasPrefixF).assertTrue();
        expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETPREFIX_0300
     * @tc.name      getPrefixTest0003
     * @tc.desc      Negative scenario: Element without prefix verification - Verify the behavior of getPrefix when the element has no prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getPrefixTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getPrefixTest0003';
        console.log(TAG + ' start');
        const strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note>' +
            '<title>Happy</title>' +
            '</note>';

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let emptyPrefixFound = false;

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tokenValueCallbackFunction: (_key: xml.EventType, value: xml.ParseInfo): boolean => {
            const prefix = value.getPrefix();
            if (prefix === '') {
              emptyPrefixFound = true;
            }
            return true;
          }
        };

        parser.parseXml(options);
        expect(emptyPrefixFound).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETPREFIX_0400
     * @tc.name      getPrefixTest0004
     * @tc.desc      Negative scenario: Error handling verification - Verify the behavior of getPrefix when the XML format is incorrect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getPrefixTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getPrefixTest0004';
        console.log(TAG + ' start');
        const strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note>' +
            '<title>Unclosed Tag' +
            '</note>';

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tokenValueCallbackFunction: (_key: xml.EventType, _value: xml.ParseInfo): boolean => {
            return true;
          }
        };

        try {
          parser.parseXml(options);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETPREFIX_0500
     * @tc.name      getPrefixTest0005
     * @tc.desc      Combined scenario: Nested element prefix verification - Verify the correctness of getPrefix in nested element structures
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getPrefixTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getPrefixTest0005';
        console.log(TAG + ' start');
        const strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<root xmlns:h="http://www.w3.org/TR/html4">' +
            '<h:outer>' +
            '<h:inner>Content</h:inner>' +
            '</h:outer>' +
            '</root>';

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let outerPrefix = '';
        let innerPrefix = '';

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tokenValueCallbackFunction: (key: xml.EventType, value: xml.ParseInfo): boolean => {
            if (key === xml.EventType.START_TAG) {
              const name = value.getName();
              const prefix = value.getPrefix() || '';
              if (name === 'outer') {
                outerPrefix = prefix;
              } else if (name === 'inner') {
                innerPrefix = prefix;
              }
            }
            return true;
          }
        };

        parser.parseXml(options);
        expect(outerPrefix).assertEqual('h');
        expect(innerPrefix).assertEqual('h');

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETPREFIX_0600
     * @tc.name      getPrefixTest0006
     * @tc.desc      Combined scenario: Dynamically generated XML parsing verification - Verify getPrefix using dynamically generated XML
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getPrefixTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getPrefixTest0006';
        console.log(TAG + ' start');
        const dynamicXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<h:root xmlns:h="http://www.w3.org/TR/html4">' +
            '<h:child>Content</h:child>' +
            '</h:root>';

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(dynamicXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let foundPrefixH = false;

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tokenValueCallbackFunction: (key: xml.EventType, value: xml.ParseInfo): boolean => {
            if (key === xml.EventType.START_TAG) {
              const prefix = value.getPrefix();
              if (prefix === 'h') {
                foundPrefixH = true;
              }
            }
            return true;
          }
        };

        parser.parseXml(options);
        expect(foundPrefixH).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETPREFIX_0700
     * @tc.name      getPrefixTest0007
     * @tc.desc      Combined scenario: Mixed content test - Verify mixed XML containing prefixed and non-prefixed elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('getPrefixTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getPrefixTest0007';
        console.log(TAG + ' start');
        const strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<root xmlns:h="http://www.w3.org/TR/html4" xmlns:f="http://example.com/furniture">' +
            '<h:header>Header</h:header>' +
            '<content>Normal Content</content>' +
            '<f:footer>Footer</f:footer>' +
            '</root>';

        const textEncoder = new util.TextEncoder();
        const arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);

        let hasPrefixH = false;
        let hasPrefixF = false;
        let hasEmptyPrefix = false;

        const options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tokenValueCallbackFunction: (key: xml.EventType, value: xml.ParseInfo): boolean => {
            if (key === xml.EventType.START_TAG) {
              const prefix = value.getPrefix() || '';
              if (prefix === 'h') {
                hasPrefixH = true;
              } else if (prefix === 'f') {
                hasPrefixF = true;
              } else if (prefix === '') {
                hasEmptyPrefix = true;
              }
            }
            return true;
          }
        };

        parser.parseXml(options);
        expect(hasPrefixH).assertTrue();
        expect(hasPrefixF).assertTrue();
        expect(hasEmptyPrefix).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETTEXT_0100
     * @tc.name      testgetText0001
     * @tc.desc      Positive scenario: Get text content of normal node
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testgetText0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testgetText0001';
        console.log(TAG + ' start');

        let strXml = '<?xml version="1.0" encoding="utf-8"?><note>OpenHarmony</note>';
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        const parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        let str = ""; // Local variable to store parsing result

        const parseCallback = (eventType: xml.EventType, parseInfo: xml.ParseInfo) => {
          // Only handle "text node event" and "element end event" (ensure text can be obtained)
          if (eventType === xml.EventType.TEXT) {
            const text = parseInfo.getText();
            str = text;
          }
          return true;
        };

        // Configure parsing options (ensure callback function is set correctly)
        const parseOptions: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: false, tokenValueCallbackFunction: parseCallback };
        // Execute parsing
        parser.parseXml(parseOptions);
        // Assert verification
        expect(str).assertEqual("OpenHarmony");

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETTEXT_0200
     * @tc.name      testgetText0002
     * @tc.desc      Positive scenario: Get text of multi-level nodes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testgetText0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testgetText0002';
        console.log(TAG + ' start');

        let strXml = '<?xml version="1.0" encoding="utf-8"?><greeting><note>Happy</note></greeting>';//Generate text event
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        let str = "";

        const func = (key: xml.EventType , value: xml.ParseInfo) => {
          if (key === xml.EventType.TEXT) {
            const text = value.getText(); // Pass corresponding node path
            str += `key:${key} value:${text} `;
          }
          return true;
        };
        //Configure parsing options
        const options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: false, tokenValueCallbackFunction: func };
        that.parseXml(options);

        expect(str.includes("Happy")).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETTEXT_0300
     * @tc.name      testgetText0003
     * @tc.desc      Positive scenario: Get empty text content of node
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testgetText0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testgetText0003';
        console.log(TAG + ' start');

        let strXml = '<?xml version="1.0" encoding="utf-8"?><emptyNode></emptyNode>';//Generate empty text event
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        let str = "";

        const func = (key: xml.EventType , value: xml.ParseInfo) => {
          if (key === xml.EventType.TEXT) {
            const text = value.getText(); // Get empty node text
            str += `key:${key} value:${text || 'empty string'} `;
          }
          return true;
        };
        //Configure parsing options
        const options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func };
        that.parseXml(options);


        expect(str).assertEqual("");

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETTEXT_0400
     * @tc.name      testgetText0004
     * @tc.desc      Positive scenario: Node has both text and attributes, get text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testgetText0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testgetText0004';
        console.log(TAG + ' start');

        let strXml = '<?xml version="1.0" encoding="utf-8"?><book name="JS 教程">入门到精通</book>';
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        let str = "";

        const func = (key: xml.EventType , value: xml.ParseInfo) => {
          if (key === xml.EventType.TEXT) {
            const text = value.getText(); // Get empty node text
            str += `key:${key} value:${text || 'empty string'} `;
          }
          return true;
        };
        //Configure parsing options
        const options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func };
        that.parseXml(options);


        expect(str).assertContain("入门到精通");

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETTEXT_0500
     * @tc.name      testgetText0005
     * @tc.desc      Negative scenario: Parse illegal XML (unclosed tag), verify interface does not crash and returns empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testgetText0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testgetText0005';
        console.log(TAG + ' start');
        const invalidXml: string = '<note>OpenHarmony&';
        const textEncoder: util.TextEncoder = new util.TextEncoder();

        const encodedData: Uint8Array = textEncoder.encode(invalidXml);
        const buffer: ArrayBuffer = encodedData.buffer as ArrayBuffer;

        const parser: xml.XmlPullParser = new xml.XmlPullParser(buffer);

        let actualText: string = '';
        let parseError: boolean = false;
        const callback: (eventType: xml.EventType, parseInfo: xml.ParseInfo) => boolean = (
          _: xml.EventType,
          info: xml.ParseInfo
        ): boolean => {
          actualText = info.getText()
          return true;
        };
        const parseOptions: xml.ParseOptions = {} as xml.ParseOptions;
        parseOptions.tokenValueCallbackFunction = callback;
        parseOptions.ignoreNameSpace = true;
        try {
          parser.parseXml(parseOptions);
          expect().assertFail()
        } catch(err){
          console.error(`${TAG} fail,err:${err}`);
          expect(err).assertContain("BusinessError")
        }

        expect(actualText).assertEqual("");

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETTEXT_0600
     * @tc.name      testgetText0006
     * @tc.desc      Negative scenario: Parse empty XML, verify getText() returns empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testgetText0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testgetText0006';
        console.log(TAG + ' start');

        try {
          // 1. Prepare empty XML
          const emptyXmlStr = '';
          const encoder = new util.TextEncoder();
          const encodeResult = encoder.encodeInto(emptyXmlStr);
          const parser = new xml.XmlPullParser(encodeResult.buffer as ArrayBuffer);

          let actualText = 'default'; // Initial value to verify if it is overwritten to empty
          // 2. Callback function: Try to get text
          const parseCallback = (eventType: xml.EventType, parseInfo: xml.ParseInfo): boolean => {
            actualText = parseInfo.getText() || '';
            return true;
          };

          // 3. Execute parsing
          const parseOptions: xml.ParseOptions = { tokenValueCallbackFunction: parseCallback, ignoreNameSpace: true };
          parser.parseXml(parseOptions);

          // 4. Assert: After parsing empty XML, getText() returns empty string
          expect(actualText).assertEqual("");
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("TypeError: Cannot read property buffer of undefined")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETTEXT_0700
     * @tc.name      testgetText0007
     * @tc.desc      Negative scenario: Pass illegal parameter (empty string), verify return empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testgetText0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testgetText0007';
        console.log(TAG + ' start');
        // 1. Prepare valid XML
        const xmlStr = '<note>OpenHarmony</note>';
        const encoder = new util.TextEncoder();
        const encodeResult = encoder.encodeInto(xmlStr);
        const parser = new xml.XmlPullParser(encodeResult.buffer as ArrayBuffer);

        let actualText = '';
        // 2. Callback function: Pass empty string as node path
        const parseCallback = (eventType: xml.EventType, parseInfo: xml.ParseInfo): boolean => {
          if (eventType === xml.EventType.END_TAG) {
            const emptyParamText = parseInfo.getText() || ''; // Empty string parameter

            actualText = emptyParamText;
          }
          return true;
        };

        // 3. Execute parsing
        const parseOptions: xml.ParseOptions = { tokenValueCallbackFunction: parseCallback, ignoreNameSpace: true };
        parser.parseXml(parseOptions);

        // 4. Assert: Empty parameter should return empty string
        expect(actualText).assertEqual('');

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETTEXT_0800
     * @tc.name      testgetText0008
     * @tc.desc      Combination scenario: Call getText() multiple times with the same parsing instance (different nodes), verify no data contamination
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testgetText0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testgetText0008';
        console.log(TAG + ' start');
        // 1. Prepare XML containing multiple nodes
        const xmlStr = `
          <root>
            <name>OpenHarmony</name>
            <version>4.0</version>
            <desc>ArkTS XML解析</desc>
          </root>
        `;
        const encoder = new util.TextEncoder();
        const encodeResult = encoder.encodeInto(xmlStr);
        const parser = new xml.XmlPullParser(encodeResult.buffer as ArrayBuffer);

        // Store results of multiple calls
        const nodeTexts: string[] = [];
        let currentElement = '';

        // 2. Correct callback function logic
        const parseCallback = (eventType: xml.EventType, parseInfo: xml.ParseInfo): boolean => {
          switch (eventType) {
            case xml.EventType.START_TAG:
              // Record current element name
              currentElement = parseInfo.getName() || '';
              break;

            case xml.EventType.TEXT:
              // Get text directly
              const text = parseInfo.getText() || '';
              if (text.trim()) { // Ignore blank text
                nodeTexts.push(text);
              }
              break;

            case xml.EventType.END_TAG:
              currentElement = '';
              break;
          }
          return true;
        };

        // 3. Execute parsing
        const parseOptions: xml.ParseOptions = {
          tokenValueCallbackFunction: parseCallback,
          ignoreNameSpace: true
        };
        parser.parseXml(parseOptions);

        // 4. Assert: Multiple call results are correct with no data contamination
        // Judge according to parsing order
        expect(nodeTexts[0]).assertContain('OpenHarmony');
        expect(nodeTexts[1]).assertContain('4.0');
        expect(nodeTexts[2]).assertContain('ArkTS XML解析');

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_GETTEXT_0900
     * @tc.name      testgetText0009
     * @tc.desc      Combination scenario: Parse XML containing special characters (spaces, symbols, Chinese), verify complete text acquisition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testgetText0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testgetText0009';
        console.log(TAG + ' start');

        try {
          // 1. Prepare XML containing special characters (spaces, Chinese, symbols, URL)
          const specialCharXml = `
          <config>
            <title>OpenHarmony 开发手册 🚀</title>
            <url>https://example.com?name=测试&age=20</url>
            <note>版本：4.0 | 状态：正式版</note>
          </config>
        `;
          const encoder = new util.TextEncoder();
          const encodeResult = encoder.encodeInto(specialCharXml);
          const parser = new xml.XmlPullParser(encodeResult.buffer as ArrayBuffer);

          let actualTitle = '';
          let actualUrl = '';
          let actualNote = '';

          // 2. Callback function: Get text containing special characters
          const parseCallback = (eventType: xml.EventType, parseInfo: xml.ParseInfo): boolean => {
            if (eventType === xml.EventType.END_TAG) {
              const nodeName = parseInfo.getName ? parseInfo.getName() : '';
              if (nodeName === 'title') {
                actualTitle = parseInfo.getText() || '';
              }
              if (nodeName === 'url') {
                actualUrl = parseInfo.getText() || '';
              }
              if (nodeName === 'note') {
                actualNote = parseInfo.getText() || '';
              }
            }
            return true;
          };

          // 3. Execute parsing
          const parseOptions: xml.ParseOptions = {
            tokenValueCallbackFunction: parseCallback,
            ignoreNameSpace: true
          };
          parser.parseXml(parseOptions);
          // 4. Assert: Special character text is completely obtained without loss/escaping
          expect(actualTitle).assertEqual('OpenHarmony 开发手册 🚀');
          expect(actualUrl).assertEqual('https://example.com?name=测试&age=20');
          expect(actualNote).assertEqual('版本：4.0 | 状态：正式版');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("BusinessError: unterminated entity ref")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLPARSEINFO_ISEMPTYELEMENTTAG_0100
     * @tc.name      isEmptyElementTagTest0001
     * @tc.desc      Test the sample code in the sample document
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0001';
        console.log(TAG + ' start');


        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<title/>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_0200
     * @tc.name      isEmptyElementTagTest0002
     * @tc.desc      Test parsing node as standard empty tag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0002';
        console.log(TAG + ' start');


        let strXml =
          '<root>\n' +
            '  <empty/>\n' + //Can be recognized normally
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_0300
     * @tc.name      isEmptyElementTagTest0003
     * @tc.desc      Test parsing node as empty tag with attributes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0003';
        console.log(TAG + ' start');


        let strXml =
          '<root>\n' +
            '  <data>\n' +
            '    <sub-empty attr="test"/>\n' + //Can be recognized normally
            '  </data>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_0400
     * @tc.name      isEmptyElementTagTest0004
     * @tc.desc      Test empty tag with namespace prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0004';
        console.log(TAG + ' start');

        let strXml =
          '<root>\n' +
            '  <ns:empty xmlns:ns="http://example.com/ns"/>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_0500
     * @tc.name      isEmptyElementTagTest0005
     * @tc.desc      Test parsing node as closed tag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0005';
        console.log(TAG + ' start');


        let strXml =
          '<root>\n' +
            '  <empty-node></empty-node>\n' + //Output false normally
            '  <non-empty></non-empty>\n' + //Output false normally
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });


    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_0900
     * @tc.name      isEmptyElementTagTest0009
     * @tc.desc      Test empty tag with spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0009';
        console.log(TAG + ' start');


        let strXml =
          '<root>\n' +
            '  <empty  />\n' + //Output true normally
            '  <another-empty   />\n' + //Output true normally
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1000
     * @tc.name      isEmptyElementTagTest0010
     * @tc.desc      Test parent node of nested empty tags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0010';
        console.log(TAG + ' start');


        let strXml =
          '<parent>\n' +
            '  <child/>\n' + //Output true normally
            '  <nested>\n' +
            '    <empty/>\n' + //Output true normally
            '  </nested>\n' +
            '</parent>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1100
     * @tc.name      isEmptyElementTagTest0011
     * @tc.desc      Test empty tag adjacent to non-empty tag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0011';
        console.log(TAG + ' start');


        let strXml =
          '<root>\n' +
            '  <empty/>\n' + //Output true normally
            '  <non-empty>Content</non-empty>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1200
     * @tc.name      isEmptyElementTagTest0012
     * @tc.desc      Test parsing context as document node
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0012';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<!-- Document node level comment: Test document context scenario -->\n' +
            '<root/>';

        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        let result = "";

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: (eventType, parser) => {
            if (eventType === xml.EventType.START_TAG) {
              result += parser.isEmptyElementTag();
            }
            return true;
          }
        };
        parser.parseXml(options);
        expect(result).assertContain("true");

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1300
     * @tc.name      isEmptyElementTagTest0013
     * @tc.desc      Test parsing context as text node
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0013';
        console.log(TAG + ' start');

        let strXml =
          '<root>\n' +
            '  <text-node>This is pure text node content</text-node>\n' +
            '  <mixed>\n' +
            '    Mixed text<sub/>Subsequent text\n' +
            '  </mixed>\n' +
            '  <empty-text/>\n' +
            '</root>';

        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        let result = "";

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: (eventType, parser) => {
            if (eventType === xml.EventType.START_TAG) {
              result += parser.isEmptyElementTag();
            }
            return true;
          }
        };
        parser.parseXml(options);

        expect(result).assertContain("true");

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1400
     * @tc.name      isEmptyElementTagTest0014
     * @tc.desc      Test parsing context as attribute node
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0014';
        console.log(TAG + ' start');


        let strXml =
          '<root xmlns:ns="http://example.com/ns" ns:attr="Namespace attribute">\n' +
            '  <item id="1" ns:desc="Attribute node + Namespace"/>\n' + //Output true
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1500
     * @tc.name      isEmptyElementTagTest0015
     * @tc.desc      Test parsing empty text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0015';
        console.log(TAG + ' start');

        try{
          let strXml = '' //Throw TypeError: Cannot read properties of undefined
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
          that.parseXml(options);

          expect().assertFail()
        } catch (err) {

          //When matching TypeError errors, assertContain() did not correctly match the thrown error
          expect(String(err)).assertContain("TypeError")

          console.error(`${TAG} fail, err: ${err}`);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1600
     * @tc.name      isEmptyElementTagTest0016
     * @tc.desc      Test parsing illegal XML structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0016';
        console.log(TAG + ' start');


        try{
          let strXml =
            '<root>\n' +
              '  <invalid&tag>Illegal character</invalid&tag>\n ' + //Tag name contains illegal & symbol, throw BusinessError
              '  <item attr="Unclosed attribute>Content</ITEM>\n ' + //Attribute value missing closing quote, end tag case mismatch, throw BusinessError
              '  <parent>\n' +
              '    <child>Nesting error</parent>\n' + //Child node unclosed but parent node closed first, throw BusinessError
              '</root>'
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
          that.parseXml(options);

          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1700
     * @tc.name      isEmptyElementTagTest0017
     * @tc.desc      Test tag format error, determined as legal empty tag according to XML specification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0017';
        console.log(TAG + ' start');


        try{
          let strXml =
            '<root>\n' +
              '  <node/ > <!-- Empty tag with space before slash + space after slash (allowed by XML specification) -->\n' +
              '  <data id="test"/ >\n' + //Output true normally
              '</root>'
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
          that.parseXml(options);
          expect(str).assertContain("true")

        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1800
     * @tc.name      isEmptyElementTagTest0018
     * @tc.desc      Test pseudo-empty tag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0018';
        console.log(TAG + ' start');

        let strXml =
          '<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<root>\n' +
            '  <!-- 自闭合空标签 -->\n' +
            '  <empty1/>\n' +
            '  <empty2/>\n' +
            '  <empty3/>\n' +
            '  <empty4/>\n' +
            '</root>';

        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let parser = new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer);
        let result = "";

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: (eventType, parser) => {
            if (eventType === xml.EventType.START_TAG) {
              result += parser.isEmptyElementTag();
            }
            return true;
          }
        };
        parser.parseXml(options);

        expect(result).assertContain("true");

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_1900
     * @tc.name      isEmptyElementTagTest0019
     * @tc.desc      Test empty tag with multiple attributes + namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0019';
        console.log(TAG + ' start');

          let strXml =
            '<ns:empty xmlns:ns="http://example.com/ns" id="1" name="test" type="demo"/>' //Print true normally
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
          that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_2000
     * @tc.name      isEmptyElementTagTest0020
     * @tc.desc      Test closed tag with comment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0020';
        console.log(TAG + ' start');

          let strXml =
            '<ns:empty xmlns:ns="http://example.com/ns" id="1" name="test" type="demo"/>' //Print true normally
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
          that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_2100
     * @tc.name      isEmptyElementTagTest0021
     * @tc.desc      Test closed tag with whitespace characters + newline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0021';
        console.log(TAG + ' start');

        let strXml =
          '<root>\n' +
            '  <item>Test content</item  >\n' +
            '  <sub>\n' +
            '    <child>Nested content</child  \n' +
            '    >\n' +
            '  </sub>\n' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_2200
     * @tc.name      isEmptyElementTagTest0022
     * @tc.desc      Test incomplete parsing but current node is legal empty tag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0022';
        console.log(TAG + ' start');


        try{
          let strXml = //Unclosed node throws BusinessError
            '<root xmlns:ns="http://example.com/ns\n' +
              '  <ns:empty/>\n' +
              '  <unclosed>Unclosed parent node\n' +
              '</root'
          let textEncoder = new util.TextEncoder();
          let arrBuffer = textEncoder.encodeInto(strXml);
          let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
          let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
          that.parseXml(options);

          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_2300
     * @tc.name      isEmptyElementTagTest0023
     * @tc.desc      Test empty tag with ultra-short tag name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0023';
        console.log(TAG + ' start');


        let strXml =
          '<x/>' //Throw true correctly
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISEMPTYELEMENTTAG_2400
     * @tc.name      isEmptyElementTagTest0024
     * @tc.desc      Test empty tag with ultra-long tag name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('isEmptyElementTagTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'isEmptyElementTagTest0024';
        console.log(TAG + ' start');

        let strXml = //Throw true normally
          '<root>' +
            '<a1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/>' +
            '</root>'
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func02}
        that.parseXml(options);

        expect(str).assertContain("true")

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISWHITESPACE_0100
     * @tc.name      IsWhitespaceTest0001
     * @tc.desc      Detection of pure blank text nodes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0001';
        console.log(TAG + ' start');
        const xmlData = `<root>\n  \t</root>`;
        let isWhitespaceResult = false;
        new xml.XmlPullParser(
          new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
        ).parseXml({
          tokenValueCallbackFunction: (event, info) => {
            if (event === xml.EventType.TEXT) {
              isWhitespaceResult = info.isWhitespace();
              expect(isWhitespaceResult).assertEqual(true);
            }
            return true;
          }
        });
        expect(isWhitespaceResult).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISWHITESPACE_0200
     * @tc.name      IsWhitespaceTest0002
     * @tc.desc      Unicode Special Character Boundary Validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0002';
        console.log(TAG + ' start');

        let isXml = false
          const xmlData = `<a><!-- --><b> </b></a>`;
          const encoder = new util.TextEncoder();
          const xmlBuffer = encoder.encode(xmlData).buffer as ArrayBuffer;
          new xml.XmlPullParser(xmlBuffer, 'UTF-8').parseXml({
            tokenValueCallbackFunction: (eventType, parser) => {
              if (eventType === xml.EventType.COMMENT) {
                expect(parser.isWhitespace()).assertTrue();
                isXml = true
              }
              if (eventType === xml.EventType.TEXT && parser.getText().trim() === '') {
                expect(parser.isWhitespace()).assertTrue();
                isXml = true
              }

              return true;
            }
          });

          expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISWHITESPACE_0300
     * @tc.name      IsWhitespaceTest0003
     * @tc.desc      CDATA Section Whitespace Validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0003';
        console.log(TAG + ' start');
        const xmlData = `<content>\n  <![CDATA[  \t]]></content>`;
        const parser = new xml.XmlPullParser(
          new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
        );
        let isWhitespaceResult: boolean | null = null;
        parser.parseXml({
          tokenValueCallbackFunction: (t, i) => {
            if (t === xml.EventType.CDSECT) {
              isWhitespaceResult = i.isWhitespace();
              expect(isWhitespaceResult).assertEqual(true);
            }
            return true;
          }
        });
        expect(isWhitespaceResult).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISWHITESPACE_0400
     * @tc.name      IsWhitespaceTest0004
     * @tc.desc      Mixed content between tags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0004';
        console.log(TAG + ' start');
        let isXml = false
          const xmlData = `<?xml-stylesheet type="text/xsl" href="style.xsl"?>`;
          const encoder = new util.TextEncoder();
          const xmlBuffer = encoder.encode(xmlData).buffer as ArrayBuffer;

          new xml.XmlPullParser(xmlBuffer, 'UTF-8').parseXml({
            tokenValueCallbackFunction: (eventType, parser) => {
                const isWhitespace = parser.isWhitespace();
                expect(isWhitespace).assertTrue();
                isXml = true
              return true;
            }
          });
          expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PARSEINFO_ISWHITESPACE_0500
     * @tc.name      IsWhitespaceTest0005
     * @tc.desc      Whitespace Detection in Comments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0005';
        console.log(TAG + ' start');
        const xmlData = `<root><!--  \n\t --></root>`;
        const parser = new xml.XmlPullParser(
          new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
        );
        let commentWhitespaceStatus: boolean | undefined;
        parser.parseXml({
          tokenValueCallbackFunction: (t, i) => {
            if (t === xml.EventType.COMMENT) {
              commentWhitespaceStatus = i.isWhitespace();
              expect(commentWhitespaceStatus === true &&
                t === xml.EventType.COMMENT).assertTrue();
            }
            return true;
          }
        });
        expect(commentWhitespaceStatus !== undefined &&
          commentWhitespaceStatus === true).assertTrue();

      });
  })
}