import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, xml } from '@kit.ArkTS';

const DOMAIN = 0x0000

export default function XmlTest_01() {
  describe('XmlTest_01', () => {
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
     * @tc.number    SUB_BASEDATE_SERIALIZER_CONSTRUCTOR_0100
     * @tc.name      ConstructorTest0001
     * @tc.desc      Test valid basic configuration input parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0001';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(8000)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        expect(testConstructor).assertInstanceOf("Object")
        expect(testConstructor instanceof xml.XmlSerializer).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_CONSTRUCTOR_0200
     * @tc.name      ConstructorTest0002
     * @tc.desc      Test single valid parameter initialization
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0002';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(8000)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer)

        expect(testConstructor).assertInstanceOf("Object")
        expect(testConstructor instanceof xml.XmlSerializer).assertTrue()

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_CONSTRUCTOR_0300
     * @tc.name      ConstructorTest0003
     * @tc.desc      Test invalid parameter value input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0003';
        console.log(TAG + ' start');

        try{
          let testArrayBuffer = new ArrayBuffer(8000)
          let testConstructor = new xml.XmlSerializer(testArrayBuffer, "INVALID-CODE")

          expect(testConstructor).assertInstanceOf("Object")
          expect(testConstructor instanceof xml.XmlSerializer).assertTrue()

          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
          expect(String(err)).assertContain("utf-8")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_CONSTRUCTOR_0400
     * @tc.name      ConstructorTest0004
     * @tc.desc      Test passing an overly large ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0004';
        console.log(TAG + ' start');

        try{
          let testArrayBuffer = new ArrayBuffer(80000000000000)
          let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

          expect(testConstructor).assertInstanceOf("Object")
          expect(testConstructor instanceof xml.XmlSerializer).assertTrue()

          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("RangeError")

        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_CONSTRUCTOR_0500
     * @tc.name      ConstructorTest0005
     * @tc.desc      Combined test: passing an overly large ArrayBuffer and an illegal encoding format
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ConstructorTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ConstructorTest0005';
        console.log(TAG + ' start');

        try{
          let testArrayBuffer = new ArrayBuffer(80000000000000)
          let testConstructor = new xml.XmlSerializer(testArrayBuffer, "INVALID-CODE")

          expect(testConstructor).assertInstanceOf("Object")
          expect(testConstructor instanceof xml.XmlSerializer).assertTrue()

          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("RangeError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_0100
     * @tc.name      SetAttributesTest0001
     * @tc.desc      Test adding a single valid parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0001';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setAttributes("xts01", "test")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("div")
        expect(result).assertContain("xts01=\"test\"")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_0200
     * @tc.name      SetAttributesTest0002
     * @tc.desc      Test adding multiple valid parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0002';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setAttributes("id", "114514")
        testConstructor.setAttributes("name", "test")
        testConstructor.setAttributes("age", "18")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("div")
        expect(result).assertContain("id=\"114514\"")
        expect(result).assertContain("name=\"test\"")
        expect(result).assertContain("age=\"18\"")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_0300
     * @tc.name      SetAttributesTest0003
     * @tc.desc      Test adding valid XML special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0003';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("info")
        testConstructor.setAttributes("desc", "Hello & world")
        testConstructor.setAttributes("note", "<test>content</test>")
        testConstructor.setAttributes("link", "https://example.com?a=1&b=2")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        console.warn(result)
        expect(result).assertContain("info")
        expect(result).assertContain("desc=\"Hello &amp; world\"")
        expect(result).assertContain("note=\"&lt;test&gt;content&lt;/test&gt;\"")
        expect(result).assertContain("link=\"https://example.com?a=1&amp;b=2\"")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_0400
     * @tc.name      SetAttributesTest0004
     * @tc.desc      Test passing empty string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0004';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setAttributes("desc", "")
        testConstructor.setAttributes("status", "")
        testConstructor.setAttributes("tag", "")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("div")
        expect(result).assertContain("desc=\"\"")
        expect(result).assertContain("status=\"\"")
        expect(result).assertContain("tag=\"\"")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_0500
     * @tc.name      SetAttributesTest0005
     * @tc.desc      Test passing XML illegal characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0005';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")
        try {
          testConstructor.startElement("div")
          testConstructor.setAttributes("id#001", "value1")
          testConstructor.setAttributes("id&name", "value2")
          testConstructor.setAttributes("123-key", "value3")
          testConstructor.setAttributes("", "emptyKey") // Error location: cannot pass empty key
          testConstructor.endElement()

          let uint8 = new Uint8Array(testArrayBuffer)
          let result = util.TextDecoder.create().decodeToString(uint8)

          expect(result).assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_0600
     * @tc.name      SetAttributesTest0006
     * @tc.desc      Test passing null/undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0006';
        console.log(TAG + ' start');

        try {
          let testArrayBuffer = new ArrayBuffer(2048)
          let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")
          testConstructor.startElement("div1")
          testConstructor.setAttributes("test", null)
          testConstructor.endElement()
          testConstructor.startElement("div2")
          testConstructor.setAttributes("text", undefined)
          testConstructor.endElement()

          let uint8 = new Uint8Array(testArrayBuffer)
          let result = util.TextDecoder.create().decodeToString(uint8)

          expect(result).assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_0700
     * @tc.name      SetAttributesTest0007
     * @tc.desc      Test passing overly long parameters, verify length limit handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0007';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(40000)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")
        testConstructor.startElement("value")
        testConstructor.setAttributes("Over 1000 characters",  "key" + "0".repeat (997))
        testConstructor.endElement()
        testConstructor.startElement("longValue")
        testConstructor.setAttributes("Over 10000 characters",  "key" + "0".repeat (9997))
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        console.warn(result)

        expect(result).assertContain(`Over 1000 characters="key${"0".repeat (997)}"`)
        expect(result).assertContain(`Over 10000 characters="key${"0".repeat (9997)}"`)

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_0800
     * @tc.name      SetAttributesTest0008
     * @tc.desc      Test repeatedly adding valid key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0008';
        console.log(TAG + ' start');

        console.warn("[Test repeatedly adding key-value pairs]")

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")
        testConstructor.startElement("text")
        testConstructor.setAttributes("Zhang San","1")
        testConstructor.setAttributes("Li Si","2")
        testConstructor.setAttributes("Wang Wu","3")
        testConstructor.setAttributes("Zhao Liu","4")
        testConstructor.setAttributes("Zhang San","5")
        testConstructor.setAttributes("Li Si","6")
        testConstructor.setAttributes("Wang Wu","7")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("Zhang San=\"1\"")
        expect(result).assertContain("Li Si=\"2\"")
        expect(result).assertContain("Wang Wu=\"3\"")
        expect(result).assertContain("Zhao Liu=\"4\"")
        expect(result).assertContain("Zhang San=\"5\"")
        expect(result).assertContain("Li Si=\"6\"")
        expect(result).assertContain("Wang Wu=\"7\"")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_0900
     * @tc.name      SetAttributesTest0009
     * @tc.desc      Test mixing valid attributes with XML illegal characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0009';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")
        testConstructor.startElement("text")
        testConstructor.setAttributes("id","user_10") // valid
        testConstructor.setAttributes("name#","gris") // illegal attribute name
        testConstructor.setAttributes("key&val","test") // illegal attribute name
        testConstructor.setAttributes("status","normal")  // valid
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("id=\"user_10\"")
        expect(result).assertContain("name#=\"gris\"")
        expect(result).assertContain("key&val=\"test\"")
        expect(result).assertContain("status=\"normal\"")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_SETATTRIBUTES_1000
     * @tc.name      SetAttributesTest0010
     * @tc.desc      Test adding attributes to the same tag multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetAttributesTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetAttributesTest0010';
        console.log(TAG + ' start');

        console.warn("[Test adding attributes to the same tag multiple times]")

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")
        testConstructor.startElement("text")
        testConstructor.setAttributes("id","user_10")
        testConstructor.endElement()
        testConstructor.startElement("text")
        testConstructor.setAttributes("name","user_10")
        testConstructor.setAttributes("ip","192.156.21.2")
        testConstructor.endElement()
        testConstructor.startElement("text")
        testConstructor.setAttributes("link","http://baidu.com")
        testConstructor.endElement()
        testConstructor.startElement("text")
        testConstructor.setAttributes("key","open")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("id=\"user_10\"")
        expect(result).assertContain("name=\"user_10\"")
        expect(result).assertContain("link=\"http://baidu.com\"")
        expect(result).assertContain("key=\"open\"")

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENT_0100
     * @tc.name      addEmptyElementTest0001
     * @tc.desc      Positive scenario: Basic function test for adding a single empty element using ArrayBuffer method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('addEmptyElementTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'addEmptyElementTest0001';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(2048);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        serializer.addEmptyElement("d");
        const uint8 = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeWithStream(uint8, { stream: false });
        const cleanResult = result.replace(/\0/g, '').trim();

        expect(cleanResult).assertEqual('<d/>');

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENT_0200
     * @tc.name     addEmptyElementTest0002
     * @tc.desc      Positive scenario: Continuously add multiple empty elements using ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('addEmptyElementTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'addEmptyElementTest0002';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(2048);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        serializer.addEmptyElement("book");
        serializer.addEmptyElement("author");
        serializer.addEmptyElement("publisher");

        const uint8 = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeWithStream(uint8, { stream: false });
        const cleanResult = result.replace(/\0/g, '').trim();
        const normalizedResult = cleanResult.replace(/\s+/g, '');
        expect(normalizedResult).assertEqual('<book/><author/><publisher/>');

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENT_0300
     * @tc.name      addEmptyElementTest0003
     * @tc.desc      Negative scenario: Pass empty string as tag name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('addEmptyElementTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'addEmptyElementTest0003';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(2048);
        const serializer = new xml.XmlSerializer(arrayBuffer);

        try {
          serializer.addEmptyElement("");
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENT_0400
     * @tc.name      addEmptyElementTest0004
     * @tc.desc      Negative scenario: Tag name contains XML illegal characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('addEmptyElementTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'addEmptyElementTest0004';
        console.log(TAG + ' start');

        const specialNames = ['book<item', 'book>item', 'book&item'];
        let allSucceeded = 0;

        for (let name of specialNames) {
          const testArrayBuffer = new ArrayBuffer(2048);
          const testSer = new xml.XmlSerializer(testArrayBuffer);
          testSer.addEmptyElement(name);
          let uint8 = new Uint8Array(testArrayBuffer)
          let result = util.TextDecoder.create().decodeToString(uint8)
          expect(result).assertContain(`<${name}/>`)
          allSucceeded += 1;
        }
        expect(allSucceeded).assertEqual(3)

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENT_0500
     * @tc.name      addEmptyElementTest0005
     * @tc.desc      Positive scenario: Test ArrayBuffer of different sizes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('addEmptyElementTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'addEmptyElementTest0005';
        console.log(TAG + ' start');
        const textDecoder = new util.TextDecoder();

        const smallBuffer = new ArrayBuffer(10);
        const smallSer = new xml.XmlSerializer(smallBuffer);
        smallSer.addEmptyElement("test");
        const uint8Small = new Uint8Array(smallBuffer);
        const resultSmall = textDecoder.decodeWithStream(uint8Small, { stream: false });
        const cleanSmall = resultSmall.replace(/\0/g, '').trim();

        const largeBuffer = new ArrayBuffer(4096);
        const largeSer = new xml.XmlSerializer(largeBuffer);
        largeSer.addEmptyElement("test");
        const uint8Large = new Uint8Array(largeBuffer);
        const resultLarge = textDecoder.decodeWithStream(uint8Large, { stream: false });
        const cleanLarge = resultLarge.replace(/\0/g, '').trim();

        expect(cleanSmall).assertEqual('<test/>');
        expect(cleanLarge).assertEqual('<test/>');

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENT_0600
     * @tc.name      addEmptyElementTest0006
     * @tc.desc      Combination scenario: Only use addEmptyElement method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('addEmptyElementTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'addEmptyElementTest0006';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(2048);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        serializer.addEmptyElement("first");
        serializer.addEmptyElement("second");
        serializer.addEmptyElement("third");
        serializer.addEmptyElement("fourth");
        serializer.addEmptyElement("fifth");

        const uint8 = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeWithStream(uint8, { stream: false });
        const nullIndex = result.indexOf('\0');
        const cleanResult = nullIndex === -1 ? result.trim() : result.substring(0, nullIndex).trim();

        console.info('actual result:', JSON.stringify(cleanResult));
        console.info('Result Length:', cleanResult.length);

        const elements = ['first', 'second', 'third', 'fourth', 'fifth'];
        let allElementsPresent = 0;

        for (const element of elements) {
          const elementTag = `<${element}/>`;
          expect(cleanResult.includes(elementTag)).assertTrue();
          allElementsPresent += 1;
        }
        expect(allElementsPresent).assertEqual(elements.length);

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENT_0700
     * @tc.name      addEmptyElementTest0007
     * @tc.desc      Combination scenario: Multiple XmlSerializer instances working simultaneously
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('addEmptyElementTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'addEmptyElementTest0007';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(2048);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        serializer.addEmptyElement("test");

        const uint8 = new Uint8Array(arrayBuffer);
        const result = util.TextDecoder.create().decodeToString(uint8);
        const cleanResult = result.replace(/\0/g, '');

        expect(cleanResult).assertEqual('<test/>');

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENT_0800
     * @tc.name     addEmptyElementTest0008
     * @tc.desc      Combination scenario: Verify the order of empty elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('addEmptyElementTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'addEmptyElementTest0008';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(2048);
        const serializer = new xml.XmlSerializer(arrayBuffer);

        serializer.addEmptyElement("first");
        serializer.addEmptyElement("second");
        serializer.addEmptyElement("third");
        serializer.addEmptyElement("fourth");
        serializer.addEmptyElement("fifth");

        const uint8 = new Uint8Array(arrayBuffer);
        const result = util.TextDecoder.create().decodeToString(uint8);
        const nullIndex = result.indexOf('\0');
        const cleanResult = nullIndex === -1 ? result : result.substring(0, nullIndex);
        const expectedElements = ['<first/>', '<second/>', '<third/>', '<fourth/>', '<fifth/>'];

        for (const element of expectedElements) {
          expect(cleanResult.includes(element)).assertTrue()
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENTSUB_BASEDATE_XMlSERIALIZER_ADDEMPTYELEMENT_0900
     * @tc.name      addEmptyElementTest0009
     * @tc.desc      Performance scenario: Adding a large number of empty elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('addEmptyElementTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'addEmptyElementTest0009';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(4096);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        const textDecoder = new util.TextDecoder();

        const startTime = Date.now();
        for (let i = 0; i < 50; i++) {
          serializer.addEmptyElement("item" + i);
        }
        const endTime = Date.now();
        const executionTime = endTime - startTime;

        const uint8 = new Uint8Array(arrayBuffer);
        const result = textDecoder.decodeWithStream(uint8, { stream: false });
        const cleanResult = result.replace(/\0/g, '').trim();
        const elementCount = (cleanResult.match(/\//g) || []).length;

        expect(executionTime < 1000).assertTrue();
        expect(elementCount).assertEqual(50);

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_SETDECLARATION_0100
     * @tc.name      SetDeclarationTest0001
     * @tc.desc      Test creating an instance with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetDeclarationTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetDeclarationTest0001';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.setDeclaration()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<?xml version=\"1.0\" encoding=\"utf-8\"?>")

      });

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_SETDECLARATION_0200
     * @tc.name      SetDeclarationTest0002
     * @tc.desc      Test calling other methods first and then setDeclaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetDeclarationTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetDeclarationTest0002';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.startElement("div")
        testConstructor.setAttributes("text", "114514")
        testConstructor.endElement()

        testConstructor.setDeclaration()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<?xml version=\"1.0\" encoding=\"utf-8\"?>")

      })

    /**
     * @tc.number    SUB_BASEDATE_XMlSERIALIZER_SETDECLARATION_0300
     * @tc.name      SetDeclarationTest0003
     * @tc.desc      Test calling setDeclaration first and then other methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetDeclarationTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetDeclarationTest0003';
        console.log(TAG + ' start');

        let testArrayBuffer = new ArrayBuffer(2048)
        let testConstructor = new xml.XmlSerializer(testArrayBuffer, "utf-8")

        testConstructor.setDeclaration()

        testConstructor.startElement("div")
        testConstructor.setAttributes("text", "114514")
        testConstructor.endElement()

        let uint8 = new Uint8Array(testArrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('text="114514"')

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_0100
     * @tc.name      StartElementTest0001
     * @tc.desc      Create a basic XML structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0001';
        console.log(TAG + ' start');
        const arrayBuffer1 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer1);
        serializer.startElement('book');
        serializer.setAttributes('category', 'tech');
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer1)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('category="tech"');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_0200
     * @tc.name      StartElementTest0002
     * @tc.desc      Nested Element Structure Validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0002';
        console.log(TAG + ' start');
        const arrayBuffer2 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer2);
        serializer.startElement('library');
        serializer.startElement('book');
        serializer.endElement();
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer2)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<library>');
        expect(result).assertContain('<book/>');
        expect(result).assertContain("</library>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_0300
     * @tc.name      StartElementTest0003
     * @tc.desc      Multi-attribute setting scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0003';
        console.log(TAG + ' start');
        const arrayBuffer3 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer3);
        serializer.startElement('person');
        serializer.setAttributes('name', 'John');
        serializer.setAttributes('age', '30');
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer3)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('name="John"');
        expect(result).assertContain('age="30"');

      });

     /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_0400
     * @tc.name      StartElementTest0004
     * @tc.desc      Empty Tag Name Exception Test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0004';
        console.log(TAG + ' start');
        const arrayBuffer4 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer4);

        try {
          serializer.startElement('');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail,err:${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_0500
     * @tc.name      StartElementTest0005
     * @tc.desc      Illegal character tag test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0005';
        console.log(TAG + ' start');
        const arrayBuffer5 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer5);

        serializer.startElement('1book');

        let uint8 = new Uint8Array(arrayBuffer5)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<1book')

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_0600
     * @tc.name      StartElementTest0006
     * @tc.desc      Unclosed element exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0006';
        console.log(TAG + ' start');
        const arrayBuffer6 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer6);
        serializer.startElement('root');
        serializer.toString();

        let uint8 = new Uint8Array(arrayBuffer6)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<root')

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_0700
     * @tc.name      StartElementTest0007
     * @tc.desc      Mixed elements and text content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0007';
        console.log(TAG + ' start');
        const arrayBuffer7 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer7);
        serializer.startElement('root');
        serializer.startElement('parent');
        serializer.startElement('child');
        serializer.endElement();
        serializer.endElement();
        serializer.endElement();
        let uint8 = new Uint8Array(arrayBuffer7)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<root>');
        expect(result).assertContain('</root>');
        expect(result).assertContain('<parent>');
        expect(result).assertContain('</parent>');
        expect(result).assertContain('<child/>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_0800
     * @tc.name      StartElementTest0008
     * @tc.desc      Continuous Operation Exception Recovery
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0008';
        console.log(TAG + ' start');
        const arrayBuffer8 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer8);
        serializer.startElement("note");
        serializer.setText("Happy");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer8);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result).assertContain('<note>Happy</note>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_0900
     * @tc.name      StartElementTest0009
     * @tc.desc      The parameter 'name' is an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0009';
        console.log(TAG + ' start');
        const arrayBuffer9 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer9);

        try {
          serializer.startElement("");
          serializer.endElement();
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} fail,err:${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_1000
     * @tc.name      StartElementTest0010
     * @tc.desc      The parameter 'name' is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0010';
        console.log(TAG + ' start');
        const arrayBuffer10 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer10);
        try {
          serializer.startElement(undefined);
          serializer.endElement();
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} fail,err:${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_1100
     * @tc.name      StartElementTest0011
     * @tc.desc      The parameter 'name' is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0011';
        console.log(TAG + ' start');
        const arrayBuffer11 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer11);
        try {
          serializer.startElement(null);
          serializer.endElement();
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} fail,err:${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_1200
     * @tc.name      StartElementTest0012
     * @tc.desc      The parameter name contains spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0012';
        console.log(TAG + ' start');
        const arrayBuffer12 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer12);

        serializer.startElement("user  name");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer12)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<user  name/>")

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_1300
     * @tc.name      StartElementTest0013
     * @tc.desc      The parameter 'name' contains special characters (&, <, >)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0013';
        console.log(TAG + ' start');
        const arrayBuffer13 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer13);

        serializer.startElement("user&name");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer13)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<user&name');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_1400
     * @tc.name      StartElementTest0014
     * @tc.desc      The parameter name starts with a number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0014';
        console.log(TAG + ' start');
        const arrayBuffer14 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer14);

        serializer.startElement("123item");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer14)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<123item');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_1500
     * @tc.name      StartElementTest0015
     * @tc.desc      Ended directly without calling endElement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0015';
        console.log(TAG + ' start');
        const arrayBuffer15 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer15);

        serializer.startElement("root");

        let uint8 = new Uint8Array(arrayBuffer15)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<root');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_1600
     * @tc.name      StartElementTest0016
     * @tc.desc      Repeatedly calling startElement without closing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0016';
        console.log(TAG + ' start');
        const arrayBuffer16 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer16);

        serializer.startElement("a");
        serializer.startElement("b");

        let uint8 = new Uint8Array(arrayBuffer16)
        let result = util.TextDecoder.create().decodeToString(uint8)


        expect(result).assertContain("<a>");
        expect(result).assertContain("<b");

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_STARTELEMENT_1700
     * @tc.name      StartElementTest0017
     * @tc.desc      The parameter 'name' is a reserved keyword (starting with xml)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartElementTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'StartElementTest0017';
        console.log(TAG + ' start');
        const arrayBuffer17 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer17);

        serializer.startElement("xml:lang");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer17)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<xml:lang');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_0100
     * @tc.name      EndElementTest0001
     * @tc.desc      Create a basic XML structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0001';
        console.log(TAG + ' start');
        const arrayBuffer1 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer1);
        serializer.startElement('book');
        serializer.setAttributes('category', 'tech');
        serializer.endElement();
        let uint8 = new Uint8Array(arrayBuffer1)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<book category="tech"/>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_0200
     * @tc.name      EndElementTest0002
     * @tc.desc      Nested Element Structure Validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0002';
        console.log(TAG + ' start');
        const arrayBuffer2 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer2);
        serializer.startElement('library');
        serializer.startElement('book');
        serializer.endElement();
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer2)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<library>');
        expect(result).assertContain('<book/>');
        expect(result).assertContain('</library>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_0300
     * @tc.name      EndElementTest0003
     * @tc.desc      Multi-attribute setting scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0003';
        console.log(TAG + ' start');
        const arrayBuffer3 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer3);
        serializer.startElement('person');
        serializer.setAttributes('name', 'John');
        serializer.setAttributes('age', '30');
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer3)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('age="30"');
        expect(result).assertContain('name="John"');

      });

    /**
     /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_0400
     * @tc.name      EndElementTest0004
     * @tc.desc      Empty Tag Name Exception Test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0004';
        console.log(TAG + ' start');
        const arrayBuffer4 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer4);

        try {
          serializer.startElement('');
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} fail,err:${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_0500
     * @tc.name      EndElementTest0005
     * @tc.desc      Illegal character tag test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0005';
        console.log(TAG + ' start');
        const arrayBuffer5 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer5);

        serializer.startElement('1book');

        let uint8 = new Uint8Array(arrayBuffer5)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<1book');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_0600
     * @tc.name      EndElementTest0006
     * @tc.desc      Unclosed element exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0006';
        console.log(TAG + ' start');
        const arrayBuffer6 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer6);

        serializer.startElement('root');
        serializer.toString();

        let uint8 = new Uint8Array(arrayBuffer6)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('root');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_0700
     * @tc.name      EndElementTest0007
     * @tc.desc      Mixed elements and text content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0007';
        console.log(TAG + ' start');
        const arrayBuffer7 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer7);
        serializer.startElement('root');
        serializer.startElement('parent');
        serializer.startElement('child');
        serializer.endElement();
        serializer.endElement();
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer7)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<root>');
        expect(result).assertContain('<parent>');
        expect(result).assertContain('<child/>');
        expect(result).assertContain('</parent>');
        expect(result).assertContain('</root>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_0800
     * @tc.name      EndElementTest0008
     * @tc.desc      Continuous Operation Exception Recovery
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0008';
        console.log(TAG + ' start');
        const arrayBuffer8 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer8);
        serializer.startElement("note");
        serializer.setText("Happy");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer8);
        let result = util.TextDecoder.create().decodeToString(uint8);

        expect(result).assertContain('<note>Happy</note>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_0900
     * @tc.name      EndElementTest0009
     * @tc.desc      The parameter 'name' is an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0009';
        console.log(TAG + ' start');
        const arrayBuffer9 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer9);
        try {
          serializer.startElement("");
          serializer.endElement();
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail,err:${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_1000
     * @tc.name      EndElementTest0010
     * @tc.desc      The parameter 'name' is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0011';
        console.log(TAG + ' start');
        const arrayBuffer10 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer10);

        try {
          serializer.startElement(undefined);
          serializer.endElement();
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} fail,err:${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_1100
     * @tc.name      EndElementTest0011
     * @tc.desc      The parameter 'name' is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0011';
        console.log(TAG + ' start');
        const arrayBuffer11 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer11);

        try {
          serializer.startElement(null);
          serializer.endElement();
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} fail,err:${err}`);
          expect(err).assertContain("BusinessError")
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_1200
     * @tc.name      EndElementTest0012
     * @tc.desc      The parameter name contains spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0012';
        console.log(TAG + ' start');
        const arrayBuffer12 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer12);

        serializer.startElement("user  name");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer12)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain("<user  name/>")

      });
  })
}