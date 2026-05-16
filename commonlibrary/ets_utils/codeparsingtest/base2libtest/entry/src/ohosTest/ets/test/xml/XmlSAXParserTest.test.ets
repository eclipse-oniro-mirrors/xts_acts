import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { xml } from '@kit.ArkTS';
import stream from '@ohos.util.stream';

const DOMAIN = 0x0000

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

class TestReadable extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

export default function XmlSAXParserTest() {
  describe('XmlSAXParserTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BASEDATE_XMLSAXPARSER_CONSTRUCTOR_0100
     * @tc.name      XmlSAXParserConstructorTest0001
     * @tc.desc      Test creating XmlSAXParser with valid inputStream only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('XmlSAXParserConstructorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);

      expect(saxParser).assertInstanceOf('Object');
      expect(saxParser instanceof xml.XmlSAXParser).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_XMLSAXPARSER_CONSTRUCTOR_0200
     * @tc.name      XmlSAXParserConstructorTest0002
     * @tc.desc      Test creating XmlSAXParser with valid inputStream and encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('XmlSAXParserConstructorTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream, 'utf-8');

      expect(saxParser).assertInstanceOf('Object');
      expect(saxParser instanceof xml.XmlSAXParser).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_XMLSAXPARSER_CONSTRUCTOR_0300
     * @tc.name      XmlSAXParserConstructorTest0003
     * @tc.desc      Test creating XmlSAXParser with unsupported encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('XmlSAXParserConstructorTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const inputStream = new TestReadable();
        const saxParser = new xml.XmlSAXParser(inputStream, 'gbk');
        expect().assertFail();
      } catch (err) {
        console.error(`XmlSAXParserConstructorTest0003 fail, err: ${err}`);
        expect(err.code).assertEqual(401);
        expect(err.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number    SUB_BASEDATE_XMLSAXPARSER_PARSE_0100
     * @tc.name      XmlSAXParserParseTest0001
     * @tc.desc      Test parsing with valid handler
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('XmlSAXParserParseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let startDocumentCalled = false;
      let endDocumentCalled = false;
      let startElementCalled = false;
      let endElementCalled = false;
      let charactersCalled = false;

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
          startDocumentCalled = true;
        },
        endDocument() {
          endDocumentCalled = true;
        },
        startElement(elementName: string, namespaceURI?: string, qName?: string, attributes?: Map<string, string>) {
          startElementCalled = true;
        },
        endElement(elementName: string, namespaceURI?: string, qName?: string) {
          endElementCalled = true;
        },
        characters(content: string) {
          charactersCalled = true;
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?><root><child>Text</child></root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);
      
      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);
      await sleep(100);

      expect(startDocumentCalled).assertTrue();
      expect(endDocumentCalled).assertTrue();
      expect(startElementCalled).assertTrue();
      expect(endElementCalled).assertTrue();
      expect(charactersCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_XMLSAXPARSER_PARSE_0200
     * @tc.name      XmlSAXParserParseTest0002
     * @tc.desc      Test parsing with namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('XmlSAXParserParseTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let receivedElementName = '';
      let receivedNamespaceURI = '';
      let receivedQName = '';
      let receivedAttributes: Map<string, string> | undefined;

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
        },
        startElement(elementName: string, namespaceURI?: string, qName?: string, attributes?: Map<string, string>) {
          receivedElementName = elementName;
          receivedNamespaceURI = namespaceURI || '';
          receivedQName = qName || '';
          receivedAttributes = attributes;
        },
        endElement(elementName: string, namespaceURI?: string, qName?: string) {
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?><root xmlns:ns1="http://example.com/ns1"><ns1:child ns1:attr1="value1" attr2="value2">Text</ns1:child></root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);
      
      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);
      await sleep(100);

      expect(receivedElementName).assertEqual('child');
      expect(receivedNamespaceURI).assertEqual('http://example.com/ns1');
      expect(receivedQName).assertEqual('ns1:child');
      expect(receivedAttributes).assertInstanceOf('Map');
    });

    /**
     * @tc.number    SUB_BASEDATE_XMLSAXPARSER_PARSE_0400
     * @tc.name      XmlSAXParserParseTest0004
     * @tc.desc      Test parsing with multiple elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('XmlSAXParserParseTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let elementCount = 0;
      const elementNames: string[] = [];

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
        },
        startElement(elementName: string, namespaceURI?: string, qName?: string, attributes?: Map<string, string>) {
          elementCount++;
          elementNames.push(elementName);
        },
        endElement(elementName: string, namespaceURI?: string, qName?: string) {
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?><root><item1>Text1</item1><item2>Text2</item2><item3>Text3</item3></root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);
      
      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);
      await sleep(100);

      expect(elementCount).assertEqual(4);
      expect(elementNames.includes('root')).assertTrue();
      expect(elementNames.includes('item1')).assertTrue();
      expect(elementNames.includes('item2')).assertTrue();
      expect(elementNames.includes('item3')).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_XMLSAXPARSER_PARSE_0500
     * @tc.name      XmlSAXParserParseTest0005
     * @tc.desc      Test parsing with attributes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('XmlSAXParserParseTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let attributesReceived = false;
      let attrValue1 = '';
      let attrValue2 = '';

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
        },
        startElement(elementName: string, namespaceURI?: string, qName?: string, attributes?: Map<string, string>) {
          if (attributes && attributes.size > 0) {
            attributesReceived = true;
            attrValue1 = attributes.get('id') || '';
            attrValue2 = attributes.get('name') || '';
          }
        },
        endElement(elementName: string, namespaceURI?: string, qName?: string) {
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?><root id="123" name="test">Content</root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);
      
      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);
      await sleep(100);

      expect(attributesReceived).assertTrue();
      expect(attrValue1).assertEqual('123');
      expect(attrValue2).assertEqual('test');
    });

    /**
     * @tc.number    SUB_BASEDATE_XMLSAXPARSER_PARSE_0600
     * @tc.name      XmlSAXParserParseTest0006
     * @tc.desc      Test parsing with UTF-8 encoding parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('XmlSAXParserParseTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let parseSuccess = false;

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
          parseSuccess = true;
        },
        startElement(elementName: string, namespaceURI?: string, qName?: string, attributes?: Map<string, string>) {
        },
        endElement(elementName: string, namespaceURI?: string, qName?: string) {
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?><root>测试中文</root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream, 'utf-8');
      
      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);
      await sleep(100);

      expect(parseSuccess).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_XMLSAXPARSER_PARSE_0700
     * @tc.name      XmlSAXParserParseTest0007
     * @tc.desc      Test parsing with deep nested elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('XmlSAXParserParseTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let maxDepth = 0;
      let currentDepth = 0;

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
        },
        startElement(elementName: string, namespaceURI?: string, qName?: string, attributes?: Map<string, string>) {
          currentDepth++;
          if (currentDepth > maxDepth) {
            maxDepth = currentDepth;
          }
        },
        endElement(elementName: string, namespaceURI?: string, qName?: string) {
          currentDepth--;
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?><a><b><c><d><e>Deep</e></d></c></b></a>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);
      
      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);
      await sleep(100);

      expect(maxDepth).assertEqual(5);
    });
  });
}
