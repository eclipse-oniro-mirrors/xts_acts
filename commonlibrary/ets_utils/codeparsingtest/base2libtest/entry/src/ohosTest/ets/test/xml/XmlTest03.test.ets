import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, xml } from '@kit.ArkTS';

const DOMAIN = 0x0000

export default function XmlTest_03() {
  describe('XmlTest_03', () => {
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
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_0100
     * @tc.name      SetCDATATest0001
     * @tc.desc      Test normal text content input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0001';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("root")
        testConstructor.setCDATA("test")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[test]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_0200
     * @tc.name      SetCDATATest0002
     * @tc.desc      Test input containing XML special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0002';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("root")
        testConstructor.setCDATA("a < b & c > d; 'test' \"demo\"")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[a < b & c > d; 'test' \"demo\"]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_0300
     * @tc.name      SetCDATATest0003
     * @tc.desc      Test empty string input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0003';
        console.log(TAG + ' start');

        try {
          let testArrayBuffer = new ArrayBuffer(2048)
          let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

          testConstructor.startElement("root")
          testConstructor.setCDATA("")  //Value cannot be empty
          testConstructor.endElement()

          let uint8 = new Uint8Array(testArrayBuffer)
          let result = util.TextDecoder.create().decodeToString(uint8)

          expect(result).assertFail()
        }catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_0400
     * @tc.name      SetCDATATest0004
     * @tc.desc      Test multi-language and emoji input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0004';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("root")
        testConstructor.setCDATA("中文😊English한국어 日本語")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[中文😊English한국어 日本語]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_0500
     * @tc.name      SetCDATATest0005
     * @tc.desc      Test whitespace character input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0005';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("root")
        testConstructor.setCDATA(" ")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[ ]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_0600
     * @tc.name      SetCDATATest0006
     * @tc.desc      Test multiple calls within the same element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0006';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("root")
        testConstructor.setCDATA("First segment content&")
        testConstructor.setCDATA("Second segment content<")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[First segment content&]]>")
        expect(result).assertContain("<![CDATA[Second segment content<]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_0700
     * @tc.name      SetCDATATest0007
     * @tc.desc      Test calls within nested elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0007';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("root")
        testConstructor.setCDATA("Subcontent 1")
        testConstructor.endElement()
        testConstructor.startElement("test")
        testConstructor.setCDATA("Subcontent 2")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[Subcontent 1]]>")
        expect(result).assertContain("<![CDATA[Subcontent 2]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_0800
     * @tc.name      SetCDATATest0008
     * @tc.desc      Test content containing CDATA termination identifier
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0008';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("root")
        testConstructor.setCDATA("Test]]>nesting")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[Test]]]]>")
        expect(result).assertContain("<![CDATA[>nesting]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_0900
     * @tc.name      SetCDATATest0009
     * @tc.desc      Test calling before document declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0009';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.setCDATA("Call before document declaration")
        testConstructor.startElement("div")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)


        expect(result).assertContain("<![CDATA[Call before document declaration]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_1000
     * @tc.name      SetCDATATest0010
     * @tc.desc      Test calling outside root element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0010';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setCDATA("Call outside root element")

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[Call outside root element]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_1100
     * @tc.name      SetCDATATest0011
     * @tc.desc      Test containing XML prohibited control characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0011';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setCDATA("Illegal character\x00test")
        testConstructor.setCDATA("Test\x01character")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[Illegal character\x00test]]>")
        expect(result).assertContain("<![CDATA[Test\x01character]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_1200
     * @tc.name      SetCDATATest0012
     * @tc.desc      Test extra-long string input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0012';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setCDATA("Extra-long string: " + "0".repeat (997))
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain(`<![CDATA[Extra-long string: ${"0".repeat (997)}]]>`)

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_1300
     * @tc.name      SetCDATATest0013
     * @tc.desc      Test mix of legal characters and illegal control characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0013';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setCDATA("Legal&content\x01illegal character")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        console.warn(result)
        expect(result).assertContain("<![CDATA[Legal&contentillegal character]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_1400
     * @tc.name      SetCDATATest0014
     * @tc.desc      Test mixed calls of CDATA and plain text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0014';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setCDATA("CDATA content 1")
        testConstructor.setText("Plain text")
        testConstructor.setCDATA("CDATA content 2")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[CDATA content 1]]>")
        expect(result).assertContain("Plain text")
        expect(result).assertContain("<![CDATA[CDATA content 2]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_1500
     * @tc.name      SetCDATATest0015
     * @tc.desc      Test recovery call after error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0015';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")

        try{
          testConstructor.setCDATA(null)
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("BusinessError: Parameter error.The type of null must be string")
        }

        testConstructor.setCDATA("Recovery call")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[Recovery call]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_1600
     * @tc.name      SetCDATATest0016
     * @tc.desc      Test combination of whitespace and special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0016';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setCDATA(" \t<a> Test & Content \n")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[ \t<a> Test & Content \n]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_1700
     * @tc.name      SetCDATATest0017
     * @tc.desc      Test cross-encoding character combination
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0017';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setCDATA("ChineseUTF-8©ABC\x09Tab character")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[ChineseUTF-8©ABC\x09Tab character]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETCDATA_1800
     * @tc.name      SetCDATATest0018
     * @tc.desc      Test multiple calls of cross-encoding character combinations in parent/child elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCDATATest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCDATATest0018';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setCDATA("First layer")
        testConstructor.startElement("div1")
        testConstructor.setCDATA("Second layer")
        testConstructor.startElement("div3")
        testConstructor.setCDATA("Third layer")
        testConstructor.endElement()
        testConstructor.endElement()
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<![CDATA[First layer]]>")
        expect(result).assertContain("<![CDATA[Second layer]]>")
        expect(result).assertContain("<![CDATA[Third layer]]>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_0100
     * @tc.name      testSetText0001
     * @tc.desc      Positive scenario: Verification of basic text setting function (consistent with original code API)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0001';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(2048);
        const serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.startElement("note");
        serializer.setText("Happy");
        serializer.endElement();

        const uint8: Uint8Array = new Uint8Array(arrayBuffer);
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
        let result: string = decoder.decodeToString(uint8);
        result = result.replace(/\0/g, '').trim();
        expect(result).assertEqual('<note>Happy</note>');

        const cleanedResult = result.replace(/\0/g, '').trim();
        expect(cleanedResult).assertEqual('<note>Happy</note>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_0200
     * @tc.name      testSetText0002
     * @tc.desc      Combination scenario: Combination of text and attributes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0002';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.startElement("note");
        serializer.setAttributes("importance", "high");
        serializer.setAttributes("id", "123");
        serializer.setText("This is a test note");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result.indexOf('importance="high"') >= 0).assertTrue();
        expect(result.indexOf('This is a test note') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_0300
     * @tc.name      testSetText0003
     * @tc.desc      Positive scenario: Setting text content with minimum length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0003';
        console.log(TAG + ' start');

          const arrayBuffer: ArrayBuffer = new ArrayBuffer(2048);
          const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);

          serializer.startElement("test");
          serializer.setText("a");
          serializer.endElement();
          const uint8: Uint8Array = new Uint8Array(arrayBuffer);
          const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
          let result: string = decoder.decodeToString(uint8);
          result = result.replace(/\0/g, '').trim();
          console.info(`Minimum text actual result: [${result}]`);
          expect(result.includes('<test>') && result.includes('a') && result.includes('</test>')).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_0400
     * @tc.name      testSetText0004
     * @tc.desc      Positive scenario: Setting text containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0004';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.startElement("data");
        serializer.setText("Hello & World <test> 'quote' \"double\"");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        console.info('Special character result: ' + result);

        expect(result.indexOf('Hello') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_0500
     * @tc.name      testSetText0005
     * @tc.desc      Combination scenario: Text setting for multi-level nested elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0005';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.startElement("root");
        serializer.startElement("parent");
        serializer.setText("Parent text");
        serializer.startElement("child");
        serializer.setText("Child text");
        serializer.endElement(); // child
        serializer.endElement(); // parent
        serializer.endElement(); // root

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result.indexOf('Parent text') >= 0).assertTrue();
        expect(result.indexOf('Child text') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_0600
     * @tc.name      testSetText0006
     * @tc.desc      Combination scenario: Combination of text and namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0006';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.setNamespace("ns", "http://example.com");
        serializer.startElement("note");
        serializer.setText("Text with namespace");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result.indexOf('xmlns:ns="http://example.com"') >= 0).assertTrue();
        expect(result.indexOf('Text with namespace') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_0700
     * @tc.name      testSetText0007
     * @tc.desc      Positive scenario: Setting numeric text content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0007';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.startElement("number");
        serializer.setText("12345");
        serializer.endElement();

        const uint8: Uint8Array = new Uint8Array(arrayBuffer);
        const decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
        let result: string = decoder.decodeToString(uint8);
        result = result.replace(/\0/g, '').trim();

        expect(result).assertEqual('<number>12345</number>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_0800
     * @tc.name      testSetText0008
     * @tc.desc      Combination scenario: Calling setText multiple times on the same element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0008';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.startElement("multi");
        serializer.setText("First");
        serializer.setText("Second");
        serializer.setText("Third");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result.indexOf('First') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_0900
     * @tc.name      testSetText0009
     * @tc.desc      Combination scenario: Combination of text and comments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0009';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.setComment("This is a test note");
        serializer.startElement("note");
        serializer.setText("Note content");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result.indexOf('<!--This is a test note-->') >= 0).assertTrue();
        expect(result.indexOf('Note content') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_1000
     * @tc.name      testSetText0010
     * @tc.desc      Combination scenario: Combination of text and CDATA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0010';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.startElement("data");
        serializer.setText("Normal text");
        serializer.setCDATA("CDATA content");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result.indexOf('Normal text') >= 0).assertTrue();
        expect(result.indexOf('<![CDATA[CDATA content]]>') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_1100
     * @tc.name      testSetText0011
     * @tc.desc      Positive scenario: Setting long text content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0011';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(10000);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        let longText = "This is a long text content. ".repeat(50);

        serializer.startElement("content");
        serializer.setText(longText);
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result.indexOf('This is a long text content.') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_1200
     * @tc.name      testSetText0012
     * @tc.desc      Combination scenario: Combination of text and XML declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0012';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.setDeclaration();
        serializer.startElement("note");
        serializer.setText("Content with declaration");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result.indexOf('<?xml version="1.0" encoding="utf-8"?>') >= 0).assertTrue();
        expect(result.indexOf('Content with declaration') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_1300
     * @tc.name      testSetText0013
     * @tc.desc      Negative scenario: Setting text in empty element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText0013';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(2048);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.addEmptyElement("empty");
        serializer.setText("Some text");

        let uint8 = new Uint8Array(arrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("Some text")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_01400
     * @tc.name      testSetText00014
     * @tc.desc      Negative scenario: Buffer overflow test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText00014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText00014';
        console.log(TAG + ' start');

          let smallBuffer = new ArrayBuffer(10);
          let serializer = new xml.XmlSerializer(smallBuffer);

          serializer.startElement("test");
          serializer.setText("This text is too long for the small buffer");
          serializer.endElement();

          let uint8 = new Uint8Array(smallBuffer);
          let result = util.TextDecoder.create().decodeToString(uint8);
          console.info('Small buffer result: ' + result);

          expect(result.length > 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSET_01500
     * @tc.name      testSetText00015
     * @tc.desc      Combination scenario: Text setting in complex XML structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetText00015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetText00015';
        console.log(TAG + ' start');

        let arrayBuffer = new ArrayBuffer(4096);
        let serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.setDeclaration();
        serializer.startElement("root");
        serializer.setAttributes("version", "1.0");

        serializer.startElement("header");
        serializer.setText("Header content");
        serializer.endElement();

        serializer.startElement("body");
        serializer.startElement("section");
        serializer.setAttributes("id", "sec1");
        serializer.setText("Section content");
        serializer.endElement();
        serializer.endElement();

        serializer.startElement("footer");
        serializer.setText("Footer content");
        serializer.endElement();

        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result.indexOf('Header content') >= 0).assertTrue();
        expect(result.indexOf('Section content') >= 0).assertTrue();
        expect(result.indexOf('Footer content') >= 0).assertTrue();
        expect(result.indexOf('version="1.0"') >= 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_0100
     * @tc.name      testSetDocTypeTest0001
     * @tc.desc      Test the basic function of setDocType - Set valid SYSTEM DOCTYPE (positive case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest0001';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_0200
     * @tc.name      testSetDocTypeTest0002
     * @tc.desc      Test setDocType PUBLIC identifier - Use PUBLIC DOCTYPE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest0002';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.setDocType('html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"');
        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_0300
     * @tc.name      testSetDocTypeTest0003
     * @tc.desc      Test setDocType internal subset - DOCTYPE containing internal subset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest0003';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.setDocType('root [<!ELEMENT root (#PCDATA)>]');
        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE root [<!ELEMENT root (#PCDATA)>]>') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_0400
     * @tc.name      testSetDocTypeTest0004
     * @tc.desc      Test setDocType minimum length root element name - Boundary case test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest0004';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.setDocType('a SYSTEM "test.dtd"');
        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE a SYSTEM "test.dtd">') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_0500
     * @tc.name      testSetDocTypeTest0005
     * @tc.desc      Test setDocType invalid format - Negative test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest0005';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.setDocType('INVALID_DOCTYPE_FORMAT');
        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE INVALID_DOCTYPE_FORMAT>') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_0600
     * @tc.name      testSetDocTypeTest0006
     * @tc.desc      Test setDocType special characters - Containing XML special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest0006';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.setDocType('root SYSTEM "http://test.com/test?param=value&other=1"');
        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE root SYSTEM "http://test.com/test?param=value&other=1">') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_0700
     * @tc.name      testSetDocTypeTest0007
     * @tc.desc      Test setDocType ultra-long string - Buffer boundary test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest0007';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        const longUrl = 'http://' + 'a'.repeat(500) + '.com/test.dtd';
        const longDocType = 'root SYSTEM "' + longUrl + '"';
        xmlSerializer.setDocType(longDocType);
        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE ' + longDocType + '>') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_0800
     * @tc.name      testSetDocTypeTest0008
     * @tc.desc      Test setDocType called before startElement - Combination test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest0008';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.setDocType('html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"');
        xmlSerializer.startElement('html');
        xmlSerializer.startElement('head');
        xmlSerializer.endElement();
        xmlSerializer.startElement('body');
        xmlSerializer.endElement();
        xmlSerializer.endElement();

        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE html') !== -1).assertTrue();
        expect(result.indexOf('<html') !== -1).assertTrue();
        expect(result.indexOf('</html>') !== -1 || result.indexOf('/>') !== -1).assertTrue();
        expect(result.indexOf('head') !== -1).assertTrue();
        expect(result.indexOf('body') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_0900
     * @tc.name      testSetDocTypeTest0009
     * @tc.desc      Test setDocType called after startElement - Combination test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest0009';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.startElement('root');
        xmlSerializer.setDocType('root SYSTEM "test.dtd"');
        xmlSerializer.endElement();

        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_01000
     * @tc.name      testSetDocTypeTest00010
     * @tc.desc      Test multiple calls to setDocType - Combination test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest00010';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.setDocType('first SYSTEM "first.dtd"');
        xmlSerializer.setDocType('second SYSTEM "second.dtd"');
        xmlSerializer.setDocType('third SYSTEM "third.dtd"');

        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE third SYSTEM "third.dtd">') !== -1).assertTrue();
        expect(result.indexOf('<!DOCTYPE') !== -1).assertTrue();
        expect(result.indexOf('third.dtd') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_TESTSETDOCTYPE_01100
     * @tc.name      testSetDocTypeTest00011
     * @tc.desc      Test setDocType complete document generation - Combination test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetDocTypeTest00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testSetDocTypeTest00011';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024 * 1024);
        const xmlSerializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        xmlSerializer.setDocType('catalog SYSTEM "catalog.dtd"');
        xmlSerializer.startElement('catalog');
        xmlSerializer.setAttributes('version', '1.0');

        xmlSerializer.startElement('book');
        xmlSerializer.setAttributes('id', '001');
        xmlSerializer.startElement('title');
        xmlSerializer.setText('XML Guide');
        xmlSerializer.endElement();
        xmlSerializer.startElement('author');
        xmlSerializer.setText('John Doe');
        xmlSerializer.endElement();
        xmlSerializer.endElement();

        xmlSerializer.endElement();

        const uint8Array = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeToString(uint8Array);

        expect(result.indexOf('<!DOCTYPE catalog SYSTEM "catalog.dtd">') !== -1).assertTrue();
        expect(result.indexOf('<catalog version="1.0">') !== -1).assertTrue();
        expect(result.indexOf('<book id="001">') !== -1).assertTrue();
        expect(result.indexOf('<title>XML Guide</title>') !== -1).assertTrue();
        expect(result.indexOf('<author>John Doe</author>') !== -1).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_0100
     * @tc.name      ConstructorTest0001
     * @tc.desc      Test XmlPullParser constructor and parsing functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0001';
        console.log(TAG + ' start');
        const xmlData = '<root><item>Test</item></root>';
        const encoder = new util.TextEncoder();
        const buffer = encoder.encodeInto(xmlData);
        const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer, 'utf-8');
        expect(parser instanceof xml.XmlPullParser).assertTrue();
        let startTagCount = 0;
        let endTagCount = 0;
        let textContent = '';
        parser.parse({
          tokenValueCallbackFunction: (eventType, parseInfo) => {
            switch (eventType) {
              case xml.EventType.START_TAG:
                startTagCount++;

                break;
              case xml.EventType.END_TAG:
                endTagCount++;
                break;
              case xml.EventType.TEXT:
                textContent = parseInfo.getText();
                break;
            }
            return true;
          }
        });
        expect(startTagCount).assertEqual(2);
        expect(endTagCount).assertEqual(2);
        expect(textContent.trim()).assertEqual('Test');

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_0200
     * @tc.name      ConstructorTest0002
     * @tc.desc      Attribute Parsing Scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0002';
        console.log(TAG + ' start');
        const xmlStr = '<book category="COOKING" price="29.99"></book>';
        const buffer = new util.TextEncoder().encodeInto(xmlStr);
        const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
        const collectedAttributes: string[] = [];
        let attrCount = 0;
        parser.parse({
          attributeValueCallbackFunction: (name, value) => {
            collectedAttributes.push(`${name}=${value}`);
            attrCount++;
            return true;
          }
        });
        expect(attrCount === 2 && collectedAttributes.join(',') === 'category=COOKING,price=29.99').assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_0300
     * @tc.name      ConstructorTest0003
     * @tc.desc      In-depth Scene Analysis
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0003';
        console.log(TAG + ' start');

        const xmlData = `<root><parent><child></child></parent></root>`;
        const buffer = new util.TextEncoder().encodeInto(xmlData);
        const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
        const depthSequence: number[] = [];
        let maxDepth = 0;
        parser.parse({
          tokenValueCallbackFunction: (eventType, parseInfo) => {
            const currentDepth = parseInfo.getDepth();
            depthSequence.push(currentDepth);
            maxDepth = Math.max(maxDepth, currentDepth);
            return true;
          }
        });

        expect(maxDepth).assertEqual(3);
        expect(depthSequence.join(',')).assertEqual('0,1,2,3,3,2,1,0');

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_0400
     * @tc.name      ConstructorTest0004
     * @tc.desc      Event Type Analysis
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0004';
        console.log(TAG + ' start');
        const xmlContent = '<note>Hello</note>';
        const buffer = new util.TextEncoder().encodeInto(xmlContent);
        const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
        let parsedText = '';

        parser.parse({
          tokenValueCallbackFunction: (eventType, parseInfo) => {
            if (eventType === xml.EventType.TEXT) {
              parsedText = parseInfo.getText();
            }
            return true;
          }
        });

        expect(parsedText).assertEqual('Hello');

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_0500
     * @tc.name      ConstructorTest0005
     * @tc.desc      Namespace resolution
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0005';
        console.log(TAG + ' start');

        const xmlStr = '<ns:book xmlns:ns="http://example.com"></ns:book>';
        const buffer = new util.TextEncoder().encodeInto(xmlStr);
        const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
        let elementName = '';
        let namespaceURI = '';
        parser.parse({
          tokenValueCallbackFunction: (eventType, parseInfo) => {
            if (eventType === xml.EventType.START_TAG) {
              elementName = parseInfo.getName();
              namespaceURI = parseInfo.getNamespace();
            }
            return true;
          }
        });
        expect(elementName).assertEqual('book');
        expect(namespaceURI).assertEqual('http://example.com');

      });
    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_0600
     * @tc.name      ConstructorTest0006
     * @tc.desc      Composite Parsing Scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0006';
        console.log(TAG + ' start');

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

        parser.parse({
          tagValueCallbackFunction: (tag, value) => {
            if (value.trim().length > 0) {
              tagCount++;
            }
            return true;
          },
          attributeValueCallbackFunction: (attr, val) => {
            parsedAttributes.push(`${attr}=${val}`);
            return true;
          }
        });

        expect(tagCount).assertEqual(2);
        expect(parsedAttributes.join(',')).assertEqual('id=101');

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_0700
     * @tc.name      ConstructorTest0007
     * @tc.desc      Large file parsing interrupted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0007';
        console.log(TAG + ' start');
        const bigXml = new ArrayBuffer(1024 * 1024 * 100);

        const parser = new xml.XmlPullParser(bigXml);
        parser.parse({});

        expect(parser instanceof xml.XmlPullParser).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_0800
     * @tc.name      ConstructorTest0008
     * @tc.desc      Document type declaration missing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0008';
        console.log(TAG + ' start');

        const doctypeXml = '<!DOCTYPE><root/>';
        const buffer = new util.TextEncoder().encode(doctypeXml).buffer as ArrayBuffer;

        const parser = new xml.XmlPullParser(buffer);
        parser.parse({ supportDoctype: true });

        expect(parser instanceof xml.XmlPullParser).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_0900
     * @tc.name      ConstructorTest0009
     * @tc.desc      Illegal Character Handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0009';
        console.log(TAG + ' start');

        const specialCharXml = '<data>\\u0000</data>';
        const buffer = new util.TextEncoder().encodeInto(specialCharXml);
        const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
        parser.parse({});

        expect(parser instanceof xml.XmlPullParser).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_1000
     * @tc.name      ConstructorTest0010
     * @tc.desc      Duplicate attribute definition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0010';
        console.log(TAG + ' start');

          const dupAttrXml = '<book id="1" id="2"></book>';
          const buffer = new util.TextEncoder().encodeInto(dupAttrXml);
          const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
          parser.parse({});

        expect(parser instanceof xml.XmlPullParser).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_1100
     * @tc.name      ConstructorTest0011
     * @tc.desc      Illegal namespace definition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0011';
        console.log(TAG + ' start');

          const nsXml = '<xmlns:root>content</xmlns:root>';
          const buffer = new util.TextEncoder().encodeInto(nsXml);
          const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
          parser.parse({ ignoreNameSpace: false });

        expect(parser instanceof xml.XmlPullParser).assertTrue()

      });
    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_1200
     * @tc.name      ConstructorTest0012
     * @tc.desc      Nesting level exceeded
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0012';
        console.log(TAG + ' start');

        let depth = 0;
        const deepXml = '<l1><l2><l3><l4><l5></l5></l4></l3></l2></l1>';
        const buffer = new util.TextEncoder().encodeInto(deepXml);
        const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
        let lastReturn = true;
        parser.parse({
          tokenValueCallbackFunction: (_, info) => {
            depth = info.getDepth();
            lastReturn = depth < 5;
            return lastReturn;
          }
        });
        expect(depth === 5 && !!parser).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_PULLPARSER_CONSTRUCTOR_1300
     * @tc.name      ConstructorTest0013
     * @tc.desc      Format error in XML structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0013';
        console.log(TAG + ' start');
        const invalidXml = '<root><unclosed_tag>';

        const buffer = new util.TextEncoder().encodeInto(invalidXml);
        const parser = new xml.XmlPullParser(buffer.buffer as ArrayBuffer);
        parser.parse({});

        expect(parser instanceof xml.XmlPullParser).assertTrue()

      });
  })
}