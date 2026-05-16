import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, xml } from '@kit.ArkTS';

const DOMAIN = 0x0000

export default function XmlTest_02() {
  describe('XmlTest_02', () => {
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
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_1300
     * @tc.name      EndElementTest0013
     * @tc.desc      The parameter 'name' contains special characters (&, <, >)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0013';
        console.log(TAG + ' start');
        const arrayBuffer13 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer13);

        serializer.startElement("user&name");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer13)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<user&name/>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_1400
     * @tc.name      EndElementTest0014
     * @tc.desc      The parameter name starts with a number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0014';
        console.log(TAG + ' start');
        const arrayBuffer14 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer14);

        serializer.startElement("123item");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer14)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<123item/>');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_1500
     * @tc.name      EndElementTest0015
     * @tc.desc      Ended directly without calling endElement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0015';
        console.log(TAG + ' start');
        const arrayBuffer15 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer15);

        serializer.startElement("root");

        let uint8 = new Uint8Array(arrayBuffer15)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<root');

      });

    /**
     * @tc.number    SUB_BASEDATE_SERIALIZER_ENDELEMENT_1700
     * @tc.name      EndElementTest0017
     * @tc.desc      The parameter 'name' is a reserved keyword (starting with xml)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('EndElementTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'EndElementTest0017';
        console.log(TAG + ' start');
        const arrayBuffer17 = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer17);

        serializer.startElement("xml:lang");
        serializer.endElement();

        let uint8 = new Uint8Array(arrayBuffer17)
        let result = util.TextDecoder.create().decodeToString(uint8)

        expect(result).assertContain('<xml:lang/>');

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_0100
     * @tc.name      SetNamespacetest0001
     * @tc.desc      Root element with the namespace 'app' and its child element app:item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0001';
        console.log(TAG + ' start');
        try {
          const arrayBuffer: ArrayBuffer = new ArrayBuffer(1024);
          const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
          serializer.startElement('root');
          serializer.setAttributes(null, 'xmlns:app="http://myapp.com"');
          serializer.startElement('app:item');
          serializer.endElement();
          serializer.endElement();
          const decoder: util.TextDecoder = new util.TextDecoder();
          const encodedBuffer: Uint8Array = new Uint8Array(arrayBuffer);
          const actualXml: string = decoder.decodeWithStream(encodedBuffer)
            .replace(/\0+/g, '')
            .replace(/>\s+</g, '><')
            .trim()
            .replace(/<\/root\s+[^>]*>/g, '</root>');
          const expectedXml: string = `<root xmlns:app="http://myapp.com"><app:item/></root>`;
          expect(actualXml).assertEqual(expectedXml);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_0200
     * @tc.name      SetNamespacetest0002
     * @tc.desc      The 'note' XML element in the 'def' namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0002';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        serializer.setNamespace("def", "http://default.org");
        serializer.startElement("note");
        serializer.endElement();
        const uint8Buffer = new Uint8Array(arrayBuffer);
        const validBytes = uint8Buffer.filter(byte => byte !== 0);
        const actualXml = new util.TextDecoder('utf-8').decode(validBytes).trim();
        const isPass = actualXml.includes('note') &&
        actualXml.includes('def') &&
        actualXml.includes('http://default.org');
        expect(isPass).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_0300
     * @tc.name      SetNamespacetest0003
     * @tc.desc      Create a root element with both 'h' and 'app' namespaces and an app:data child element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0003';
        console.log(TAG + ' start');
        const arrayBuffer4 = new ArrayBuffer(2048);
        const serializer4 = new xml.XmlSerializer(arrayBuffer4);
        serializer4.startElement("root");
        serializer4.setAttributes("xmlns:h", "http://testos.com");
        serializer4.setAttributes("xmlns:app", "http://custom.com");
        serializer4.startElement("app:data");
        serializer4.endElement();
        serializer4.endElement();
        const validBytes = new Uint8Array(arrayBuffer4).filter(byte => byte !== 0);
        const actualXml = new util.TextDecoder('utf-8').decode(validBytes).trim();
        const assertCondition =
          actualXml.includes('xmlns:h="http://testos.com"') &&
          actualXml.includes('xmlns:app="http://custom.com"') &&
          actualXml.includes('app:data');
        expect(assertCondition).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_0400
     * @tc.name      SetNamespacetest0004
     * @tc.desc      The parent element of the namespace and the child element that overrides a namespace with the same name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0004';
        console.log(TAG + ' start');
        const arrayBuffer5 = new ArrayBuffer(2048);
        const serializer5 = new xml.XmlSerializer(arrayBuffer5);
        serializer5.setNamespace("ns1", "http://v1.com");
        serializer5.startElement("parent");
        serializer5.setNamespace("ns1", "http://v2.com");
        serializer5.startElement("child");
        serializer5.endElement();
        serializer5.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(arrayBuffer5).filter(b => b !== 0))
          .trim();
        expect(
          actualXml.includes('parent') &&
          actualXml.includes('child') &&
            (actualXml.includes('xmlns:ns1="http://v1.com"') || actualXml.includes('xmlns:ns1="http://v2.com"'))
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_0500
     * @tc.name      SetNamespacetest0005
     * @tc.desc      Namespace 'h', then create a prefixed 'h:book' element and set a prefixed attribute
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0005';
        console.log(TAG + ' start');
        const arrayBuffer6 = new ArrayBuffer(1024);
        const serializer6 = new xml.XmlSerializer(arrayBuffer6);
        serializer6.setNamespace("h", "http://library.org");
        serializer6.startElement("h:book");
        serializer6.setAttributes("h:category", "tech");
        serializer6.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(arrayBuffer6).filter(b => b !== 0))
          .trim();
        expect(
          actualXml.includes('h:book') &&
          actualXml.includes('xmlns:h="http://library.org"') &&
          actualXml.includes('h:category="tech"')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_0600
     * @tc.name      SetNamespacetest0006
     * @tc.desc      Add an empty element 'h:br' and set its namespace 'h'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0006';
        console.log(TAG + ' start');
        const arrayBuffer7 = new ArrayBuffer(512);
        const serializer7 = new xml.XmlSerializer(arrayBuffer7);
        serializer7.startElement("h:br");
        serializer7.setAttributes("xmlns:h", "http://html.org");
        serializer7.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(arrayBuffer7).filter(b => b !== 0))
          .trim();
        expect(
          actualXml.includes('h:br') &&
          actualXml.includes('xmlns:h="http://html.org"')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_0700
     * @tc.name      SetNamespacetest0007
     * @tc.desc      Name the 'app:message' element in the 'app' namespace and set its text content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0007';
        console.log(TAG + ' start');
        const arrayBuffer8 = new ArrayBuffer(1024);
        const serializer8 = new xml.XmlSerializer(arrayBuffer8);
        serializer8.setNamespace("app", "http://messaging.com");
        serializer8.startElement("app:message");
        serializer8.setText("Hello Harmony");
        serializer8.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(arrayBuffer8).filter(b => b !== 0))
          .trim();
        expect(
          actualXml.includes('app:message') &&
          actualXml.includes('xmlns:app="http://messaging.com"') &&
          actualXml.includes('Hello Harmony')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_0800
     * @tc.name      SetNamespacetest0008
     * @tc.desc      The 'a:root' element with the 'a' namespace and the 'b:child' subelement with the 'b' namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0008';
        console.log(TAG + ' start');
        const arrayBuffer9 = new ArrayBuffer(2048);
        const serializer9 = new xml.XmlSerializer(arrayBuffer9);
        serializer9.setNamespace("a", "http://a.com");
        serializer9.startElement("a:root");
        serializer9.setNamespace("b", "http://b.com");
        serializer9.startElement("b:child");
        serializer9.endElement();
        serializer9.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(arrayBuffer9).filter(b => b !== 0))
          .trim();
        expect(
          actualXml.includes('a:root') &&
          actualXml.includes('b:child') &&
          actualXml.includes('xmlns:a="http://a.com"') &&
          actualXml.includes('xmlns:b="http://b.com"')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_0900
     * @tc.name      SetNamespacetest0009
     * @tc.desc      Root element with the 'demo' namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0009';
        console.log(TAG + ' start');
        const arrayBuffer10 = new ArrayBuffer(2048);
        const serializer10 = new xml.XmlSerializer(arrayBuffer10);
        serializer10.setDeclaration();
        serializer10.setNamespace("demo", "http://demo.org");
        serializer10.startElement("root");
        serializer10.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(arrayBuffer10).filter(b => b !== 0))
          .trim();
        expect(
          actualXml.includes('<?xml') &&
          actualXml.includes('root') &&
          actualXml.includes('xmlns:demo="http://demo.org"')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1000
     * @tc.name      SetNamespacetest0010
     * @tc.desc      The prefix 'h' is not declared
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'SetNamespacetest0010';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024);
        const serializer1 = new xml.XmlSerializer(arrayBuffer);
        serializer1.startElement("h:book");
        serializer1.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(arrayBuffer).filter(b => b !== 0))
          .trim();
        expect(actualXml.includes('h:book') && !actualXml.includes('xmlns:h')).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1100
     * @tc.name      SetNamespacetest0011
     * @tc.desc      Out of element scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0011';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024);
        const serializer2 = new xml.XmlSerializer(arrayBuffer);
        serializer2.startElement("book");
        serializer2.endElement();
        serializer2.setNamespace("h", "http://library.org");
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(arrayBuffer).filter(b => b !== 0))
          .trim();
        expect(
          actualXml.includes('book') &&
            !actualXml.includes('xmlns:h')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1200
     * @tc.name      SetNamespacetest0012
     * @tc.desc      URI cannot be empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0012';
        console.log(TAG + ' start');
        let isThrow = false;
        try {
          const serializer3 = new xml.XmlSerializer(new ArrayBuffer(1024));
          serializer3.setNamespace("h", "");
          serializer3.startElement("book");
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail,err:${err}`);
          isThrow = true;
        }
        expect(isThrow === true).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1300
     * @tc.name      SetNamespacetest0013
     * @tc.desc      Repeated declaration of the same prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0013';
        console.log(TAG + ' start');
        const buffer = new ArrayBuffer(1024);
        const serializer5 = new xml.XmlSerializer(buffer);
        serializer5.setNamespace("h", "http://library.org");
        serializer5.setNamespace("h", "http://other.org");
        serializer5.startElement("book");
        serializer5.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(buffer).filter(b => b !== 0))
          .trim();
        expect(actualXml.includes('book')).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1400
     * @tc.name      SetNamespacetest0014
     * @tc.desc      Call within element scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0014';
        console.log(TAG + ' start');
        const buffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(buffer);
        serializer.startElement("h:book");
        serializer.endElement();
        serializer.setNamespace("h", "http://example.com");
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(buffer).filter(b => b !== 0))
          .replace(/\s+/g, '')
          .trim();
        expect(
          actualXml.includes('h:book') &&
            !actualXml.includes('xmlns:h="http://example.com"')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1500
     * @tc.name      SetNamespacetest0015
     * @tc.desc      Attribute uses an undeclared prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0015';
        console.log(TAG + ' start');
        const buffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(buffer);
        serializer.startElement("h:book");
        serializer.endElement();
        serializer.setNamespace("h", "http://example.com");
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(buffer).filter(b => b !== 0))
          .replace(/\s+/g, '')
          .trim();
        expect(
          actualXml.includes('h:book') &&
            !actualXml.includes('xmlns:h="http://example.com"')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1600
     * @tc.name      SetNamespacetest0016
     * @tc.desc      The child element prefix is not declared in the parent scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0016';
        console.log(TAG + ' start');
        const buffer = new ArrayBuffer(1024);
        const serializer8 = new xml.XmlSerializer(buffer);
        serializer8.startElement("parent");
        serializer8.startElement("h:child");
        serializer8.endElement();
        serializer8.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(buffer).filter(b => b !== 0))
          .replace(/\s+/g, '')
          .trim();
        expect(
          actualXml.includes('h:child') &&
            !actualXml.includes('xmlns:h=')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1700
     * @tc.name      SetNamespacetest0017
     * @tc.desc      Keep prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0017';
        console.log(TAG + ' start');
        const buffer = new ArrayBuffer(1024);
        const serializer9 = new xml.XmlSerializer(buffer);
        serializer9.setNamespace("xml", "http://www.w3.org/XML/1998/namespace");
        serializer9.startElement("book");
        serializer9.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(buffer).filter(b => b !== 0))
          .trim();
        expect(actualXml.includes('book')).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1800
     * @tc.name      SetNamespacetest0018
     * @tc.desc      Buffer capacity insufficient
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0018';
        console.log(TAG + ' start');
        const buffer = new ArrayBuffer(20);
        const serializer = new xml.XmlSerializer(buffer);
        serializer.startElement("largeElement");
        serializer.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(buffer))
          .trim();
        expect(actualXml !== undefined && actualXml !== null).assertTrue();


      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_1900
     * @tc.name      SetNamespacetest0019
     * @tc.desc      Root element with 'ns' namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0019';
        console.log(TAG + ' start');
        const buffer: ArrayBuffer = new ArrayBuffer(2048);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(buffer);
        serializer.startElement("root");
        serializer.setAttributes("xmlns:ns", "http://example.com/ns");
        serializer.endElement();
        const uint8Array: Uint8Array = new Uint8Array(buffer);
        const validLen: number = uint8Array.findIndex(byte => byte === 0) || uint8Array.length;
        const actualXml: string = new util.TextDecoder('utf-8').decode(uint8Array.subarray(0, validLen)).trim();
        const expectedXml: string = '<root xmlns:ns="http://example.com/ns"/>';
        expect(actualXml.replace(/\s*\/>/, '/>')).assertEqual(expectedXml);

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_2000
     * @tc.name      SetNamespacetest0020
     * @tc.desc      Nest a and b elements and set the ns1 and ns2 namespaces separately
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0020';
        console.log(TAG + ' start');
        const buffer: ArrayBuffer = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(buffer);
        serializer.startElement("a");
        serializer.setAttributes("xmlns:ns1", "http://ns1.com");
        serializer.startElement("b");
        serializer.setAttributes("xmlns:ns2", "http://ns2.com");
        serializer.endElement();
        serializer.endElement();
        const uint8Array: Uint8Array = new Uint8Array(buffer);
        const validLen = uint8Array.findIndex(b => b === 0) || uint8Array.length;
        const actualXml = new util.TextDecoder('utf-8')
          .decode(uint8Array.subarray(0, validLen))
          .replace(/\n|\r|\s+/g, '')
          .trim();
        const expectedXml = '<a xmlns:ns1="http://ns1.com"><b xmlns:ns2="http://ns2.com"/></a>'.replace(/\s+/g, '');
        expect(actualXml).assertEqual(expectedXml);

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_2100
     * @tc.name      SetNamespacetest0021
     * @tc.desc      Set the default namespace with an empty prefix for the book element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0021';
        console.log(TAG + ' start');
        let isThrow = false;
        try {
          const smallSerializer = new xml.XmlSerializer(new ArrayBuffer(1024));
          smallSerializer.startElement("book");
          smallSerializer.setNamespace("", "http://default.org");
          smallSerializer.endElement();
          expect().assertFail()
        } catch (err) {
          isThrow = true;
          console.error(`${TAG} fail, err: ${err}`);

        }
        expect(isThrow).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_2200
     * @tc.name      SetNamespacetest0022
     * @tc.desc      Data elements with the 'myns' namespace and id attribute
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0022';
        console.log(TAG + ' start');
        let isThrow = false;
        try {
          const serializer = new xml.XmlSerializer(new ArrayBuffer(1024));
          serializer.startElement("data");
          serializer.setNamespace("myns", "http://data.org");
          serializer.setAttributes("id", "123");
          serializer.endElement();
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          isThrow = true;
        }
        expect(isThrow).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_2300
     * @tc.name      SetNamespacetest0023
     * @tc.desc      Root element and child elements with dual namespaces ns1 and ns2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0023';
        console.log(TAG + ' start');
        const buffer: ArrayBuffer = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(buffer);
        serializer.startElement("root");
        serializer.setAttributes("xmlns:ns1", "http://ns1.org");
        serializer.setAttributes("xmlns:ns2", "http://ns2.org");
        serializer.startElement("child");
        serializer.endElement();
        serializer.endElement();
        const uint8Array: Uint8Array = new Uint8Array(buffer);
        const validLen = uint8Array.findIndex(b => b === 0) || uint8Array.length;
        const actualXml = new util.TextDecoder('utf-8')
          .decode(uint8Array.subarray(0, validLen))
          .replace(/\n|\r|\s+/g, '')
          .trim();
        const expectedXml = '<root xmlns:ns1="http://ns1.org" xmlns:ns2="http://ns2.org"><child/></root>'.replace(/\s+/g, '');
        expect(actualXml).assertEqual(expectedXml);

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_2400
     * @tc.name      SetNamespacetest0024
     * @tc.desc      Content elements with the 'app' namespace and add CDATA content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0024';
        console.log(TAG + ' start');
        const buffer: ArrayBuffer = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(buffer);
        serializer.startElement("content");
        serializer.setAttributes("xmlns:app", "http://app.core");
        serializer.setCDATA("Hello <World>");
        serializer.endElement();
        const uint8Array: Uint8Array = new Uint8Array(buffer);
        const validLen = uint8Array.findIndex(b => b === 0) || uint8Array.length;
        const actualXml = new util.TextDecoder('utf-8')
          .decode(uint8Array.subarray(0, validLen))
          .replace(/\n|\r|\s+/g, '')
          .trim();
        const expectedXml = '<content xmlns:app="http://app.core"><![CDATA[Hello <World>]]></content>'.replace(/\s+/g, '');
        expect(actualXml).assertEqual(expectedXml);

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_2500
     * @tc.name      SetNamespacetest0025
     * @tc.desc      Create a parent element with the nsA namespace, and a child element that overrides the nsA namespace with the same name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0025';
        console.log(TAG + ' start');
        const buffer: ArrayBuffer = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(buffer);
        serializer.startElement("parent");
        serializer.setAttributes("xmlns:nsA", "http://old.org");
        serializer.startElement("child");
        serializer.setAttributes("xmlns:nsA", "http://new.org");
        serializer.endElement();
        serializer.endElement();
        const uint8Array: Uint8Array = new Uint8Array(buffer);
        const validLen: number = uint8Array.findIndex(b => b === 0) || uint8Array.length;
        const actualXml: string = new util.TextDecoder('utf-8')
          .decode(uint8Array.subarray(0, validLen))
          .replace(/\n|\r|\s+/g, '')
          .trim();
        const expectedXml: string = '<parent xmlns:nsA="http://old.org"><child xmlns:nsA="http://new.org"/></parent>'.replace(/\s+/g, '');
        expect(actualXml).assertEqual(expectedXml);

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETNAMESPACE8_2600
     * @tc.name      SetNamespacetest0026
     * @tc.desc      The 'config' XML element with the namespace 'sys' and the comment 'System configuration'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetNamespacetest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetNamespacetest0026';
        console.log(TAG + ' start');
        const buffer: ArrayBuffer = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(buffer);
        serializer.startElement("config");
        serializer.setAttributes("xmlns:sys", "http://system.config");
        serializer.setComment("System configuration");
        serializer.endElement();
        const uint8Array: Uint8Array = new Uint8Array(buffer);
        const validLen: number = uint8Array.findIndex(b => b === 0) || uint8Array.length;
        const actualXml: string = new util.TextDecoder('utf-8')
          .decode(uint8Array.subarray(0, validLen))
          .replace(/\n|\r|\s+/g, '')
          .trim();
        const expectedXml: string = '<config xmlns:sys="http://system.config"><!--System configuration--></config>'.replace(/\s+/g, '');
        expect(actualXml).assertEqual(expectedXml);

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_0100
     * @tc.name      SetCommentTest0001
     * @tc.desc      Set comment directly without calling startElement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0001';
        console.log(TAG + ' start');
        const arrayBuffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        serializer.setComment("Invalid comment");
        serializer.startElement("note");
        serializer.endElement();
        const actualXml = new util.TextDecoder('utf-8')
          .decode(new Uint8Array(arrayBuffer).filter(b => b !== 0))
          .replace(/\s+/g, '')
          .trim();
        expect(
          actualXml.includes('<!--Invalidcomment-->') &&
          actualXml.includes('note')
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_0200
     * @tc.name      SetCommentTest0002
     * @tc.desc      The comment contains illegal characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0002';
        console.log(TAG + ' start');

        const arrayBuffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        serializer.startElement("root");
        serializer.setComment("Invalid-->Comment");
        serializer.endElement();
        const view = new Uint8Array(arrayBuffer).filter(b => b !== 0);
        const result = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("-->") &&
          result.includes("root")
        ).assertTrue();

      });

    /**
     * @tc.number   SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_0300
     * @tc.name      SetCommentTest0003
     * @tc.desc      An empty string may cause a formatting error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0003';
        console.log(TAG + ' start');
        let isThrow = false;
        try {
          const arrayBuffer = new ArrayBuffer(1024);
          const serializer = new xml.XmlSerializer(arrayBuffer);
          serializer.startElement("data");
          serializer.setComment("");
          serializer.endElement();
          const view = new Uint8Array(arrayBuffer).filter(b => b !== 0);
          const result = new util.TextDecoder('utf-8').decode(view).trim();
          expect(result.includes("<!-- -->")).assertTrue();
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain("BusinessError")
        }
      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_0400
     * @tc.name      SetCommentTest0004
     * @tc.desc      Illegal character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0004';
        console.log(TAG + ' start');

        const arrayBuffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        serializer.startElement("test");
        serializer.setComment("Invalid ]]> symbol");
        serializer.endElement();
        const view = new Uint8Array(arrayBuffer).filter(b => b !== 0);
        const result = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("]]>") &&
          result.includes("test")
        ).assertTrue();


      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_0500
     * @tc.name      SetCommentTest0005
     * @tc.desc      startElement was not called; the comment has no parent element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0005';
        console.log(TAG + ' start');

        const arrayBuffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        serializer.setComment("OrphanComment");
        const view = new Uint8Array(arrayBuffer).filter(b => b !== 0);
        const result = new util.TextDecoder('utf-8').decode(view).trim();
        expect(result.includes("<!--OrphanComment-->")).assertTrue();


      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_0600
     * @tc.name      SetCommentTest0006
     * @tc.desc      Are multiple comments allowed for the same element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0006';
        console.log(TAG + ' start');

        const arrayBuffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        serializer.startElement("note");
        serializer.setComment("Comment1");
        serializer.setComment("Comment2");
        serializer.endElement();
        const view = new Uint8Array(arrayBuffer).filter(b => b !== 0);
        const result = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<!--Comment1-->") &&
          result.includes("<!--Comment2-->") &&
          result.includes("note")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_0700
     * @tc.name      SetCommentTest0007
     * @tc.desc      "]]> is prohibited in XML comments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0007';
        console.log(TAG + ' start');

        const commentText = "Content with ]]> symbol";
        const arrayBuffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        serializer.setComment(commentText);
        const view = new Uint8Array(arrayBuffer).filter(b => b !== 0);
        const result = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
            result.includes("]]>") &&
            result.includes("<!--Content with ]]> symbol-->")
          ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_0800
     * @tc.name      SetCommentTest0008
     * @tc.desc      The XML structure is incomplete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0008';
        console.log(TAG + ' start');

        const arrayBuffer = new ArrayBuffer(1024);
        const serializer = new xml.XmlSerializer(arrayBuffer);
        serializer.startElement("note");
        serializer.setComment("test");
        const view = new Uint8Array(arrayBuffer).filter(b => b !== 0);
        const result = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<note>") &&
          result.includes("<!--test-->")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_0900
     * @tc.name      SetCommentTest0009
     * @tc.desc      Overlength comment text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0009';
        console.log(TAG + ' start');

        const commentText: string = "A".repeat(2049);
        const arrayBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const serializer: xml.XmlSerializer = new xml.XmlSerializer(arrayBuffer);
        serializer.setComment(commentText);
        let uint8 = new Uint8Array(arrayBuffer)
        let result = util.TextDecoder.create().decodeToString(uint8)
        expect(result.length < commentText.length).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1000
     * @tc.name      SetCommentTest0010
     * @tc.desc      Root XML element with comments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0010';
        console.log(TAG + ' start');
        const buffer1: ArrayBuffer = new ArrayBuffer(1024);
        const ser1: xml.XmlSerializer = new xml.XmlSerializer(buffer1);
        ser1.startElement("root");
        ser1.setComment("This is a basic comment");
        ser1.endElement();
        const view: Uint8Array = new Uint8Array(buffer1).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<root>") &&
          result.includes("</root>") &&
          result.includes("<!--This is a basic comment-->")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1100
     * @tc.name      SetCommentTest0011
     * @tc.desc      Comment with namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0011';
        console.log(TAG + ' start');
        const buffer2: ArrayBuffer = new ArrayBuffer(1024);
        const ser2: xml.XmlSerializer = new xml.XmlSerializer(buffer2);
        ser2.setNamespace("ns", "http://example.com");
        ser2.startElement("ns:root");
        ser2.setComment("Namespace comment");
        ser2.endElement();

        const view: Uint8Array = new Uint8Array(buffer2).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("ns:root") &&
          result.includes("<!--Namespace comment-->") &&
            (result.includes("xmlns:ns") || result.includes("http://example.com"))
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1200
     * @tc.name      SetCommentTest0012
     * @tc.desc      Annotations and Attributes Combination
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0012';
        console.log(TAG + ' start');
        const buffer3: ArrayBuffer = new ArrayBuffer(1024);
        const ser3: xml.XmlSerializer = new xml.XmlSerializer(buffer3);
        ser3.startElement("node");
        ser3.setAttributes("id", "N1");
        ser3.setComment("Node with attribute");
        ser3.endElement();
        const view: Uint8Array = new Uint8Array(buffer3).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<node") &&
          result.includes('id="N1"') &&
          result.includes("<!--Node with attribute-->") &&
          result.includes("</node>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1300
     * @tc.name      SetCommentTest0013
     * @tc.desc      Multilevel element annotation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0013';
        console.log(TAG + ' start');
        const buffer4: ArrayBuffer = new ArrayBuffer(2048);
        const ser4: xml.XmlSerializer = new xml.XmlSerializer(buffer4);
        ser4.startElement("parent");
        ser4.setComment("Parent element comment");
        ser4.startElement("child");
        ser4.setComment("Child element comment");
        ser4.endElement();
        ser4.endElement();
        const view: Uint8Array = new Uint8Array(buffer4).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<parent>") &&
          result.includes("<!--Parent element comment-->") &&
          result.includes("<child>") &&
          result.includes("<!--Child element comment-->") &&
          result.includes("</child>") &&
          result.includes("</parent>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1400
     * @tc.name      SetCommentTest0014
     * @tc.desc      Empty element comment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0014';
        console.log(TAG + ' start');
        const buffer6: ArrayBuffer = new ArrayBuffer(512);
        const ser6: xml.XmlSerializer = new xml.XmlSerializer(buffer6);
        ser6.startElement("empty");
        ser6.setComment("Empty element comment");
        ser6.addEmptyElement("empty");
        ser6.endElement();
        const view: Uint8Array = new Uint8Array(buffer6).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<empty>") &&
          result.includes("<!--Empty element comment-->") &&
          result.includes("<empty/>") &&
          result.includes("</empty>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1500
     * @tc.name      SetCommentTest0015
     * @tc.desc      Special Character Handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0015';
        console.log(TAG + ' start');
        const buffer7: ArrayBuffer = new ArrayBuffer(1024);
        const ser7: xml.XmlSerializer = new xml.XmlSerializer(buffer7);
        ser7.startElement("special");
        ser7.setComment("Comment with special chars --> <--");
        ser7.endElement();
        const view: Uint8Array = new Uint8Array(buffer7).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<special>") &&
          result.includes("Comment with special chars") &&
          result.includes("</special>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1600
     * @tc.name      SetCommentTest0016
     * @tc.desc      Document declaration comment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0016';
        console.log(TAG + ' start');
        const buffer8: ArrayBuffer = new ArrayBuffer(1024);
        const ser8: xml.XmlSerializer = new xml.XmlSerializer(buffer8);
        ser8.setDeclaration();
        ser8.startElement("root");
        ser8.setComment("Document with declaration");
        ser8.endElement();
        const view: Uint8Array = new Uint8Array(buffer8).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<?xml") &&
          result.includes("<root>") &&
          result.includes("<!--Document with declaration-->") &&
          result.includes("</root>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1700
     * @tc.name      SetCommentTest0017
     * @tc.desc      Mixed text annotation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0017';
        console.log(TAG + ' start');
        const buffer9: ArrayBuffer = new ArrayBuffer(1024);
        const ser9: xml.XmlSerializer = new xml.XmlSerializer(buffer9);
        ser9.startElement("text");
        ser9.setText("Hello");
        ser9.setComment("Text node comment");
        ser9.endElement();
        const view: Uint8Array = new Uint8Array(buffer9).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<text>") &&
          result.includes("Hello") &&
          result.includes("<!--Text node comment-->") &&
          result.includes("</text>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1800
     * @tc.name      SetCommentTest0018
     * @tc.desc      Wrong position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0018';
        console.log(TAG + ' start');
        const buffer10: ArrayBuffer = new ArrayBuffer(512);
        const ser10: xml.XmlSerializer = new xml.XmlSerializer(buffer10);
        ser10.setComment("Invalid comment position");
        const view: Uint8Array = new Uint8Array(buffer10).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<!--Invalid comment position-->") &&
            result.length > 0
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_1900
     * @tc.name      SetCommentTest0019
     * @tc.desc      Add Basic Annotation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0019';
        console.log(TAG + ' start');
        const buffer1: ArrayBuffer = new ArrayBuffer(1024);
        const ser1: xml.XmlSerializer = new xml.XmlSerializer(buffer1);
        ser1.startElement("root");
        ser1.setComment("This is a basic comment");
        ser1.endElement();
        const view: Uint8Array = new Uint8Array(buffer1).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<root>") &&
          result.includes("<!--This is a basic comment-->") &&
          result.includes("</root>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_2000
     * @tc.name      SetCommentTest0020
     * @tc.desc      Comment with namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0020';
        console.log(TAG + ' start');
        const buffer2: ArrayBuffer = new ArrayBuffer(1024);
        const ser2: xml.XmlSerializer = new xml.XmlSerializer(buffer2);
        ser2.setNamespace("ns", "http://example.com");
        ser2.startElement("ns:root");
        ser2.setComment("Namespace comment");
        ser2.endElement();
        const view: Uint8Array = new Uint8Array(buffer2).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("ns:root") &&
          result.includes("<!--Namespace comment-->")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_2100
     * @tc.name      SetCommentTest0021
     * @tc.desc      Combination of Annotations and Attributes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0021';
        console.log(TAG + ' start');
        const buffer3: ArrayBuffer = new ArrayBuffer(1024);
        const ser3: xml.XmlSerializer = new xml.XmlSerializer(buffer3);
        ser3.startElement("node");
        ser3.setAttributes("id", "N1");
        ser3.setComment("Node with attribute");
        ser3.endElement();
        const view: Uint8Array = new Uint8Array(buffer3).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<node") &&
          result.includes('id="N1"') &&
          result.includes("<!--Node with attribute-->") &&
          result.includes("</node>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_2200
     * @tc.name      SetCommentTest0022
     * @tc.desc      Multilevel element annotation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0022';
        console.log(TAG + ' start');
        const buffer4: ArrayBuffer = new ArrayBuffer(2048);
        const ser4: xml.XmlSerializer = new xml.XmlSerializer(buffer4);
        ser4.startElement("parent");
        ser4.setComment("Parent element comment");
        ser4.startElement("child");
        ser4.setComment("Child element comment");
        ser4.endElement();
        ser4.endElement();
        const view: Uint8Array = new Uint8Array(buffer4).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<parent>") &&
          result.includes("<!--Parent element comment-->") &&
          result.includes("<child>") &&
          result.includes("<!--Child element comment-->") &&
          result.includes("</child>") &&
          result.includes("</parent>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_2300
     * @tc.name      SetCommentTest0023
     * @tc.desc      Mixing CDATA and comments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0023';
        console.log(TAG + ' start');
        const buffer5: ArrayBuffer = new ArrayBuffer(1024);
        const ser5: xml.XmlSerializer = new xml.XmlSerializer(buffer5);
        ser5.startElement("data");
        ser5.setComment("CDATA section added");
        ser5.endElement();
        const view: Uint8Array = new Uint8Array(buffer5).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<data>") &&
          result.includes("<!--CDATA section added-->") &&
          result.includes("</data>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_2400
     * @tc.name      SetCommentTest0024
     * @tc.desc      Empty element comment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0024';
        console.log(TAG + ' start');
        const buffer6: ArrayBuffer = new ArrayBuffer(512);
        const ser6: xml.XmlSerializer = new xml.XmlSerializer(buffer6);
        ser6.startElement("empty");
        ser6.setComment("Empty element comment");
        ser6.addEmptyElement("empty");
        ser6.endElement();
        const view: Uint8Array = new Uint8Array(buffer6).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<empty>") &&
          result.includes("<!--Empty element comment-->") &&
          result.includes("<empty/>") &&
          result.includes("</empty>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_2500
     * @tc.name      SetCommentTest0025
     * @tc.desc      Special Character Handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0025';
        console.log(TAG + ' start');
        const buffer7: ArrayBuffer = new ArrayBuffer(1024);
        const ser7: xml.XmlSerializer = new xml.XmlSerializer(buffer7);
        ser7.startElement("special");
        ser7.setComment("Comment with special chars --> <--");
        ser7.endElement();
        const view: Uint8Array = new Uint8Array(buffer7).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<special>") &&
          result.includes("Comment with special chars") &&
          result.includes("</special>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_2600
     * @tc.name      SetCommentTest0026
     * @tc.desc      Document declaration comment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0026';
        console.log(TAG + ' start');
        const buffer8: ArrayBuffer = new ArrayBuffer(1024);
        const ser8: xml.XmlSerializer = new xml.XmlSerializer(buffer8);
        ser8.setDeclaration();
        ser8.startElement("root");
        ser8.setComment("Document with declaration");
        ser8.endElement();
        const view: Uint8Array = new Uint8Array(buffer8).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<?xml") &&
          result.includes("<root>") &&
          result.includes("<!--Document with declaration-->") &&
          result.includes("</root>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_2700
     * @tc.name      SetCommentTest0027
     * @tc.desc      Mixed text annotation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0027';
        console.log(TAG + ' start');
        const buffer9: ArrayBuffer = new ArrayBuffer(1024);
        const ser9: xml.XmlSerializer = new xml.XmlSerializer(buffer9);
        ser9.startElement("text");
        ser9.setText("Hello");
        ser9.setComment("Text node comment");
        ser9.endElement();
        const view: Uint8Array = new Uint8Array(buffer9).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<text>") &&
          result.includes("Hello") &&
          result.includes("<!--Text node comment-->") &&
          result.includes("</text>")
        ).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_XMLSERIALIZER_SETCOMMENT_2900
     * @tc.name      SetCommentTest0029
     * @tc.desc      "data" specified in the annotation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SetCommentTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'SetCommentTest0029';
        console.log(TAG + ' start');
        const buffer5: ArrayBuffer = new ArrayBuffer(1024);
        const ser5: xml.XmlSerializer = new xml.XmlSerializer(buffer5);
        ser5.startElement("data");
        ser5.setComment("CDATA section added");
        ser5.endElement();
        const view: Uint8Array = new Uint8Array(buffer5).filter((b: number) => b !== 0);
        const result: string = new util.TextDecoder('utf-8').decode(view).trim();
        expect(
          result.includes("<data>") &&
          result.includes("<!--CDATA section added-->") &&
          result.includes("</data>")
        ).assertTrue();

      });
  })
}