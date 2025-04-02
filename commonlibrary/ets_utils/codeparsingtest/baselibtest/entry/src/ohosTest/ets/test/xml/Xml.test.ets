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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { util, xml } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

let testXml =
  "<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE example [<!ENTITY exampleEntity '这是一个实体引用事件。'>]><!-- XML注释事件：这是一个示例注释 --><example><!-- 启动文件事件 --><startDocument><startTag><element><!-- 启动标签事件 --><tagName>示例标签</tagName><!-- 文本事件 --><content>这是一些文本内容。</content>" +
    "<!-- CDATA事件 -->" +
    "<cdata><![CDATA[这是一些不需要解析的内容]]></cdata>" +
    "<!-- 处理指令事件 -->" +
    "<?processingInstruction example='处理指令内容'?>" +
    "<!-- 实体引用事件 -->" +
    "<entityReference>&exampleEntity;</entityReference>" +
    "<!-- 空白事件 -->" +
    "<whitespace>     </whitespace>" +
    "</element>" +
    "<!-- 结束标签事件 -->" +
    "</startTag>" +
    "</startDocument>" +
    "<!-- 结束文件事件 -->" +
    "<endDocument/>" +
    "</example>";

export default function XmlTest() {
  describe('xmlTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_CONSTRUCTOR_0100
     * @tc.name       : testXmlConstructor0001
     * @tc.desc       : Testing the XML constructor with a invalid ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlConstructor0001', 0, () => {
      const TAG = 'testXmlConstructor0001';
      try {
        const expectedResult = '<?xml version="1.0" encoding="utf-8"?>';
        const lengthToCheck = expectedResult.length - 1;
        let arrayBuffer = new ArrayBuffer(lengthToCheck);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        let view = new Uint8Array(arrayBuffer);
        let view1 = String.fromCharCode(...view.subarray(0, expectedResult.length));
        const isNullCharacterString = (input: string): boolean => {
          const nullCharRegex = new RegExp(`^\\u0000{${lengthToCheck}}$`);
          return nullCharRegex.test(input);
        };
        expect(isNullCharacterString(view1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_CONSTRUCTOR_0200
     * @tc.name       : testXmlConstructor0002
     * @tc.desc       : Testing the XML constructor with a zero ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlConstructor0002', 0, () => {
      const TAG = 'testXmlConstructor0002';
      try {
        const expectedResult = '<?xml version="1.0" encoding="utf-8"?>';
        const lengthToCheck = expectedResult.length - 38;
        let arrayBuffer = new ArrayBuffer(lengthToCheck);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        let view = new Uint8Array(arrayBuffer);
        let view1 = String.fromCharCode(...view.subarray(0, expectedResult.length));
        const isNullCharacterString = (input: string): boolean => {
          const nullCharRegex = new RegExp(`^\\u0000{${lengthToCheck}}$`);
          return nullCharRegex.test(input);
        };
        expect(isNullCharacterString(view1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_CONSTRUCTOR_0300
     * @tc.name       : testXmlConstructor0003
     * @tc.desc       : Testing the XML constructor with ArrayBuffer < 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlConstructor0003', 0, () => {
      const TAG = 'testXmlConstructor0003';
      try {
        const expectedResult = '<?xml version="1.0" encoding="utf-8"?>';
        const lengthToCheck = expectedResult.length - 39;
        new ArrayBuffer(lengthToCheck);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(undefined)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_CONSTRUCTOR_0400
     * @tc.name       : testXmlConstructor0004
     * @tc.desc       : Testing the XML constructor with a valid ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlConstructor0004', 0, () => {
      const TAG = 'testXmlConstructor0004';
      try {
        const expectedResult = '<?xml version="1.0" encoding="utf-8"?>';
        let arrayBuffer = new ArrayBuffer(expectedResult.length + 1);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        let view = new Uint8Array(arrayBuffer);
        let view1 = String.fromCharCode(...view.subarray(0, expectedResult.length));
        expect(view1).assertEqual(expectedResult);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_CONSTRUCTOR_0500
     * @tc.name       : testXmlConstructor0005
     * @tc.desc       : Testing the XML constructor using the an ArrayBuffer value
     *                  that is exactly the same length as the expected Result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlConstructor0005', 0, () => {
      const TAG = 'testXmlConstructor0005';
      try {
        const expectedResult = '<?xml version="1.0" encoding="utf-8"?>';
        let arrayBuffer = new ArrayBuffer(expectedResult.length);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        let view = new Uint8Array(arrayBuffer);
        let view1 = String.fromCharCode(...view.subarray(0, expectedResult.length));
        expect(view1).assertEqual(expectedResult);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_CONSTRUCTOR_0600
     * @tc.name       : testXmlConstructor0006
     * @tc.desc       : Testing the XML constructor with a valid DataView.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlConstructor0006', 0, () => {
      const TAG = 'testXmlConstructor0006';
      try {
        const expectedResult = '<?xml version="1.0" encoding="utf-8"?>';
        let arrayBuffer = new ArrayBuffer(expectedResult.length);
        let dataView = new DataView(arrayBuffer);
        let thatSer = new xml.XmlSerializer(dataView);
        thatSer.setDeclaration();
        let view = new Uint8Array(arrayBuffer);
        let view1 = String.fromCharCode(...view.subarray(0, expectedResult.length));
        expect(view1).assertEqual(expectedResult);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_CONSTRUCTOR_0700
     * @tc.name       : testXmlConstructor0007
     * @tc.desc       : Testing the XML constructor with a valid DataView and without encoding.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlConstructor0007', 0, () => {
      const TAG = 'testXmlConstructor0007';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let dataView = new DataView(arrayBuffer);
        let thatSer = new xml.XmlSerializer(dataView);
        thatSer.setDeclaration();
        let view = new Uint8Array(arrayBuffer);
        let view1 = String.fromCharCode(...view.subarray(0, 2048));
        expect(view1).assertContain('encoding="utf-8"')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_CONSTRUCTOR_0800
     * @tc.name       : testXmlConstructor0008
     * @tc.desc       : Testing the XML constructor with a valid DataView and encoding "utf-8".
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlConstructor0008', 0, () => {
      const TAG = 'testXmlConstructor0008';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let dataView = new DataView(arrayBuffer);
        let thatSer = new xml.XmlSerializer(dataView, "utf-8");
        thatSer.setDeclaration();
        let view = new Uint8Array(arrayBuffer);
        let view1 = String.fromCharCode(...view.subarray(0, 2048));
        expect(view1).assertContain('encoding="utf-8"')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_CONSTRUCTOR_0900
     * @tc.name       : testXmlConstructor0009
     * @tc.desc       : Testing the XML constructor with a valid DataView and encoding 'gbk'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlConstructor0009', 0, () => {
      const TAG = 'testXmlConstructor0009';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let dataView = new DataView(arrayBuffer);
        new xml.XmlSerializer(dataView, 'gbk');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETATTRIBUTES_0100
     * @tc.name       : testXmlSetAttributes0001
     * @tc.desc       : Testing the XML serializer's setAttributes method with undefined parameters,
     *                  expecting a BusinessError to be thrown.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetAttributes0001', 0, () => {
      const TAG = 'testXmlSetAttributes0001';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setAttributes(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETATTRIBUTES_0200
     * @tc.name       : testXmlSetAttributes0002
     * @tc.desc       : Testing the XML serializer's setAttributes method with null parameters,
     *                  expecting a BusinessError to be thrown.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetAttributes0002', 0, () => {
      const TAG = 'testXmlSetAttributes0002';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setAttributes(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETATTRIBUTES_0300
     * @tc.name       : testXmlSetAttributes0003
     * @tc.desc       : Testing the XML serializer's setAttributes method with "",
     *                  expecting a BusinessError to be thrown.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetAttributes0003', 0, () => {
      const TAG = 'testXmlSetAttributes0003';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setAttributes("", "");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETATTRIBUTES_0400
     * @tc.name       : testXmlSetAttributes0004
     * @tc.desc       : Testing the XML serializer's setAttributes method with "",
     *                  expecting a BusinessError to be thrown.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetAttributes0004', 0, () => {
      const TAG = 'testXmlSetAttributes0004';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance1", "high1");
        thatSer.setAttributes("importance1", "high1");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < 1000; ++i) {
          view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertContain('<note importance1="high1" importance1="high1"/>')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETATTRIBUTES_0500
     * @tc.name       : testXmlSetAttributes0005
     * @tc.desc       : Testing the XML serializer's setAttributes method with a 10K size string,
     *                  expecting a correct result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetAttributes0005', 0, () => {
      const TAG = 'testXmlSetAttributes0005';
      try {
        const MY_MAX = 10240;
        let longString = new Array(MY_MAX / 2 - 5).join('a');
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes(longString, longString);
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < MY_MAX; ++i) {
          view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1.length).assertEqual(10240)
        const countA = (view1.match(/a/g) || []).length;
        expect(countA).assertEqual(longString.length * 2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETATTRIBUTES_0600
     * @tc.name       : testXmlSetAttributes0006
     * @tc.desc       : Testing the XML serializer's setAttributes method expecting a correct result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetAttributes0006', 0, () => {
      const TAG = 'testXmlSetAttributes0006';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("..8", "high1");
        thatSer.setAttributes("ab@#_-.& *%", "high1");
        thatSer.setAttributes("note", "high1");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < MY_MAX; ++i) {
          view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertContain('<note ..8="high1" ab@#_-.& *%="high1" note="high1"/>')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_0100
     * @tc.name       : testXmlAddEmptyElement0001
     * @tc.desc       : Test the XML serializer's addEmptyElement with undefined,
     *                  expecting an error to be thrown.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0001', 0, () => {
      const TAG = 'testXmlAddEmptyElement0001';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_0200
     * @tc.name       : testXmlAddEmptyElement0002
     * @tc.desc       : Test the XML serializer's addEmptyElement with null,
     *                  expecting an error to be thrown.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0002', 0, () => {
      const TAG = 'testXmlAddEmptyElement0002';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_0300
     * @tc.name       : testXmlAddEmptyElement0003
     * @tc.desc       : Test the XML serializer's addEmptyElement with null and undefined,
     *                  expecting an error to be thrown.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0003', 0, () => {
      const TAG = 'testXmlAddEmptyElement0003';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement(null);
        thatSer.addEmptyElement(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_0400
     * @tc.name       : testXmlAddEmptyElement0004
     * @tc.desc       : Testing the XML serializer's addEmptyElement with an empty string,
     *                  expecting an error to be thrown.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0004', 0, () => {
      const TAG = 'testXmlAddEmptyElement0004';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_0500
     * @tc.name       : testXmlAddEmptyElement0005
     * @tc.desc       : Testing the XML serializer's addEmptyElement method by adding 2560 "note" elements
     *                  in a loop, verifying the total output length and the count of added elements.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0005', 0, () => {
      const TAG = 'testXmlAddEmptyElement0005';
      try {
        const MY_MAX = 102400;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        for (let index = 0; index < 2560; index++) {
          thatSer.addEmptyElement("note");
        }
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < MY_MAX; ++i) {
          view1 += String.fromCodePoint(view[i]);
        }
        expect(view1.length).assertEqual(MY_MAX);
        const countNote = (view1.match(/<note\/>/g) || []).length;
        expect(countNote).assertEqual(2560);
        expect(view1).assertContain('<note/>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_0600
     * @tc.name       : testXmlAddEmptyElement0006
     * @tc.desc       : Testing the XML serializer's addEmptyElement method by adding two "aaaaa" elements
     *                  and verifying the output XML structure and element count.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0006', 0, () => {
      const TAG = 'testXmlAddEmptyElement0006';
      try {
        const MY_MAX = 16;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("aaaaa");
        thatSer.addEmptyElement("aaaaa");
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < MY_MAX - 6; ++i) {
          view1 += String.fromCodePoint(view[i]);
        }
        expect(view1).assertContain("<aaaaa/>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_0700
     * @tc.name       : testXmlAddEmptyElement0007
     * @tc.desc       : Testing the XML serializer's addEmptyElement method by adding any elements
     *                  and verifying the output XML structure and element count.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0007', 0, () => {
      const TAG = 'testXmlAddEmptyElement0007';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("aaaaa");
        thatSer.addEmptyElement("..8");
        thatSer.addEmptyElement("ab@#_-.& *%");
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < MY_MAX; ++i) {
          view1 += String.fromCodePoint(view[i]);
        }
        expect(view1).assertContain("<ab@#_-.& *%/>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_0800
     * @tc.name       : testXmlAddEmptyElement0008
     * @tc.desc       : Testing the XML serializer's addEmptyElement method by adding an empty element
     *                  and verifying that the output XML structure matches the expected format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0008', 0, () => {
      const TAG = 'testXmlAddEmptyElement0008';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("aaaaa");
        let result = '<d/>';
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < result.length; ++i) {
          view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual("<aaa");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_0900
     * @tc.name       : testXmlAddEmptyElement0009
     * @tc.desc       : Testing the XML serializer's addEmptyElement method by adding an empty element
     *                  and verifying that the output XML structure matches the expected format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0009', 0, () => {
      const TAG = 'testXmlAddEmptyElement0009';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("aaaaa");
        let result = '<ddddddddecade/>';
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < result.length; ++i) {
          view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertContain("<aaaaa/>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ADDELEM_1000
     * @tc.name       : testXmlAddEmptyElement0010
     * @tc.desc       : Testing the XML serializer's addEmptyElement method by adding an empty element
     *                  and verifying that the output XML structure matches the expected format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElement0010', 0, () => {
      const TAG = 'testXmlAddEmptyElement0010';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement("aaaaa");
        let result = '<abcde/>';
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < result.length; ++i) {
          view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertEqual("<aaaaa/>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETDECLARATION_0100
     * @tc.name       : testXmlSetDeclaration0001
     * @tc.desc       : Testing the XML serializer's setDeclaration method by setting
     *                  an XML declaration and verifying that the output starts with
     *                  the correct declaration format.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetDeclaration0001', 0, () => {
      const TAG = 'testXmlSetDeclaration0001';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        let expected = '<?xml version="1.0" encoding="utf-8"?>';
        let view = new Uint8Array(arrayBuffer);
        let output = "";
        for (let i = 0; i < expected.length; ++i) {
          output += String.fromCodePoint(view[i]);
        }
        expect(output).assertContain(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_STARTELEMENT_0100
     * @tc.name       : testXmlStartElement0001
     * @tc.desc       : Testing the XML serializer's startElement method with null as the element name
     *                  and verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlStartElement0001', 0, () => {
      const TAG = 'testXmlStartElement0001';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_STARTELEMENT_0200
     * @tc.name       : testXmlStartElement0002
     * @tc.desc       : Testing the XML serializer's startElement method with undefined as the element name
     *                  and verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlStartElement0002', 0, () => {
      const TAG = 'testXmlStartElement0002';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_STARTELEMENT_0300
     * @tc.name       : testXmlStartElement0003
     * @tc.desc       : Testing the XML serializer's startElement method with an empty string as the element name
     *                  and verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlStartElement0003', 0, () => {
      const TAG = 'testXmlStartElement0003';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_STARTELEMENT_0400
     * @tc.name       : testXmlStartElement0004
     * @tc.desc       : Testing the XML serializer's startElement method by adding a
     *                  valid element name twice and verifying the output.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlStartElement0004', 0, () => {
      const TAG = 'testXmlStartElement0004';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        thatSer.startElement("note");
        thatSer.endElement();
        thatSer.startElement("note_child");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < MY_MAX; ++i) {
          view1 += String.fromCodePoint(view[i]);
        }
        expect(view1).assertContain('<?xml version="1.0" encoding="utf-8"?><note/>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_STARTELEMENT_0500
     * @tc.name       : testXmlStartElement0005
     * @tc.desc       : Testing the XML serializer's startElement method by adding duplicate element names
     *                  and verifies that no error is thrown.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlStartElement0005', 0, () => {
      const TAG = 'testXmlStartElement0005';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setDeclaration();
        thatSer.endElement();
        thatSer.startElement("note");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < MY_MAX; ++i) {
          view1 += String.fromCodePoint(view[i]);
        }
        expect(view1).assertContain('<note<?xml version="1.0" encoding="utf-8"?>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_STARTELEMENT_0600
     * @tc.name       : testXmlStartElement0006
     * @tc.desc       : Testing the XML serializer's startElement method with a 10K size string,
     *                  expecting a correct result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlStartElement0006', 0, () => {
      const TAG = 'testXmlStartElement0006';
      try {
        const MY_MAX = 10240;
        let longString = new Array(MY_MAX).join('a');
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(longString);
        thatSer.setDeclaration();
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < MY_MAX; ++i) {
          view1 += String.fromCodePoint(view[i]);
        }
        expect(view1.length).assertEqual(MY_MAX)
        const countA = (view1.match(/a/g) || []).length;
        expect(countA).assertEqual(longString.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_STARTELEMENT_0700
     * @tc.name       : testXmlStartElement0007
     * @tc.desc       : Testing the XML serializer's startElement method with nest,
     *                  expecting a correct result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlStartElement0007', 0, () => {
      const TAG = 'testXmlStartElement0007';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        thatSer.startElement("note");
        thatSer.startElement("note_child");
        thatSer.endElement();
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let view1 = "";
        for (let i = 0; i < 2048; ++i) {
          view1 = view1 + String.fromCodePoint(view[i]);
        }
        expect(view1).assertContain('<?xml version="1.0" encoding="utf-8"?><note>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ENDELEMENT_0100
     * @tc.name       : testXmlEndElement0001
     * @tc.desc       : Testing the XML serializer's endElement , expecting a correct result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlEndElement0001', 0, () => {
      const TAG = 'testXmlEndElement0001';
      try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText("Happy");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual('<note>Happy</note>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ENDELEMENT_0200
     * @tc.name       : testXmlEndElement0002
     * @tc.desc       : Testing the XML serializer's endElement , expecting a correct result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlEndElement0002', 0, () => {
      const TAG = 'testXmlEndElement0002';
      try {
        const MY_MAX = 2048;
        const expectedResult = '<?xml version="1.0" encoding="utf-8"?><note importance1="high1"';
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDeclaration();
        thatSer.startElement("note");
        thatSer.setAttributes("importance1", "high1");
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual(expectedResult);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETNAMESPACE_0100
     * @tc.name       : testXmlSetNamespace0001
     * @tc.desc       : Testing the XML serializer's setNamespace method with valid namespace and uri.
     *                  Verifies that it handles it correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetNamespace0001', 0, () => {
      const TAG = 'testXmlSetNamespace0001';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("ns1", "http://www.example.com/ns1");
        thatSer.startElement("note");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual('<ns1:note xmlns:ns1="http://www.example.com/ns1"/>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETNAMESPACE_0200
     * @tc.name       : testXmlSetNamespace0002
     * @tc.desc       : Testing the XML serializer's setNamespace method with empty string namespace parameter,
     *                  checking that it handles the error gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetNamespace0002', 0, () => {
      const TAG = 'testXmlSetNamespace0002';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("ns1", "");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETNAMESPACE_0300
     * @tc.name       : testXmlSetNamespace0003
     * @tc.desc       : Testing the XML serializer's setNamespace method with empty string prefix parameter,
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetNamespace0003', 0, () => {
      const TAG = 'testXmlSetNamespace0003';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("", "123")
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETNAMESPACE_0400
     * @tc.name       : testXmlSetNamespace0004
     * @tc.desc       : Testing the XML serializer's setNamespace method with null for namespace and uri.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetNamespace0004', 0, () => {
      const TAG = 'testXmlSetNamespace0004';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETNAMESPACE_0500
     * @tc.name       : testXmlSetNamespace0005
     * @tc.desc       : Testing the XML serializer's setNamespace method with undefined as parameters.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetNamespace0005', 0, () => {
      const TAG = 'testXmlSetNamespace0005';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETNAMESPACE_0600
     * @tc.name       : testXmlSetNamespace0006
     * @tc.desc       : Testing the XML serializer's setNamespace method with empty string parameters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetNamespace0006', 0, () => {
      const TAG = 'testXmlSetNamespace0006';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("", "");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETNAMESPACE_0700
     * @tc.name       : testXmlSetNamespace0007
     * @tc.desc       : Testing the XML serializer's setNamespace method with special characters in namespace and uri.
     *                  Verifies the output is as expected.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetNamespace0007', 0, () => {
      const TAG = 'testXmlSetNamespace0007';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("ns@#&", "http://example.com/ns@#&");
        thatSer.startElement("note");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual('<ns@#&:note xmlns:ns@#&="http://example.com/ns@#&"/>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETNAMESPACE_0800
     * @tc.name       : testXmlSetNamespace0008
     * @tc.desc       : Testing the XML serializer's setNamespace method with set namespace twice,
     *                  expecting a correct result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetNamespace0008', 0, () => {
      const TAG = 'testXmlSetNamespace0008';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("b", "http://www.w3.org/TR/html4/");
        thatSer.setNamespace("h", "https://www.example.com/path/to/page?username=johndoe&search=apple" +
          "&sort=price#section-3");
        thatSer.startElement("note");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual('<h:note xmlns:b="http://www.w3.org/TR/html4/" xmlns:h="https://' +
          'www.example.com/path/to/page?username=johndoe&search=apple&sort=price#section-3"/>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETNAMESPACE_0900
     * @tc.name       : testXmlSetNamespace0009
     * @tc.desc       : Testing the XML serializer's setNamespace method with a 10k string as namespace.
     *                  Ensuring it handles large inputs as expected.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetNamespace0009', 0, () => {
      const TAG = 'testXmlSetNamespace0009';
      try {
        const MY_MAX = 10240;
        let longNamespace = new Array(MY_MAX - 27).join('a');
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("bc", longNamespace);
        thatSer.startElement("notebook");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<bc:notebook");
        expect(result.length).assertEqual(10238)
        const countA = (result.match(/a/g) || []).length;
        expect(countA).assertEqual(10212);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCOMMENT_0100
     * @tc.name       : testXmlSetComment0001
     * @tc.desc       : Testing the XML serializer's setComment with undefined as parameter.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetComment0001', 0, () => {
      const TAG = 'testXmlSetComment0001';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCOMMENT_0200
     * @tc.name       : testXmlSetComment0002
     * @tc.desc       : Testing the XML serializer's setComment with null as parameter.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetComment0002', 0, () => {
      const TAG = 'testXmlSetComment0002';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCOMMENT_0300
     * @tc.name       : testXmlSetComment0003
     * @tc.desc       : Testing the XML serializer's setComment with an empty string.
     *                  Verifies that it prints an empty comment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetComment0003', 0, () => {
      const TAG = 'testXmlSetComment0003';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment("");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCOMMENT_0400
     * @tc.name       : testXmlSetComment0004
     * @tc.desc       : Testing the XML serializer's setComment with special characters.
     *                  Verifies that the output is as expected.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetComment0004', 0, () => {
      const TAG = 'testXmlSetComment0004';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment("@#&*");
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual("<!--@#&*-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCOMMENT_0500
     * @tc.name       : testXmlSetComment0005
     * @tc.desc       : Testing the XML serializer's setComment called multiple times.
     *                  Verifies the last comment is the one that is used.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetComment0005', 0, () => {
      const TAG = 'testXmlSetComment0005';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment("First comment");
        thatSer.setComment("Second comment");
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<!--First comment-->");
        expect(result).assertContain("<!--Second comment-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCOMMENT_0600
     * @tc.name       : testXmlSetComment0006
     * @tc.desc       : Testing the XML serializer's setComment in combination with other methods.
     *                  Ensures proper handling of the comment with startElement and endElement.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetComment0006', 0, () => {
      const TAG = 'testXmlSetComment0006';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setNamespace("ns1", "http://www.example.com/ns1");
        thatSer.startElement("note");
        thatSer.setAttributes("importance1", "high1");
        thatSer.endElement();
        thatSer.setDeclaration();
        thatSer.addEmptyElement("aaaaa");
        thatSer.setComment("This is a comment");
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<ns1:note importance1=\"high1\" xmlns:ns1=\"http:" +
          "//www.example.com/ns1\"/><?xml version=\"1.0\" encoding=\"utf-8\"?>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCOMMENT_0700
     * @tc.name       : testXmlSetComment0007
     * @tc.desc       : Testing the XML serializer's setComment with a large data input (10k characters).
     *                  Verifies that it handles large inputs properly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetComment0007', 0, () => {
      const TAG = 'testXmlSetComment0007';
      try {
        const MY_MAX = 10240;
        let longComment = new Array(MY_MAX - 6).join('a');
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(longComment);
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<!--" + longComment + "-->");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCDATA_0100
     * @tc.name       : testXmlSetCData0001
     * @tc.desc       : Testing the XML serializer's setCDATA with undefined as parameter.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetCData0001', 0, () => {
      const TAG = 'testXmlSetCData0001';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCDATA_0200
     * @tc.name       : testXmlSetCData0002
     * @tc.desc       : Testing the XML serializer's setCDATA with null as parameter.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetCData0002', 0, () => {
      const TAG = 'testXmlSetCData0002';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCDATA_0300
     * @tc.name       : testXmlSetCData0003
     * @tc.desc       : Testing the XML serializer's setCDATA with an empty string.
     *                  Verifies it handles it correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetCData0003', 0, () => {
      const TAG = 'testXmlSetCData0003';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA("");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCDATA_0400
     * @tc.name       : testXmlSetCData0004
     * @tc.desc       : Testing the XML serializer's setCDATA with special characters.
     *                  Verifies that the output is as expected.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetCData0004', 0, () => {
      const TAG = 'testXmlSetCData0004';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA("> < }");
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual("<![CDATA[> < }]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCDATA_0500
     * @tc.name       : testXmlSetCData0005
     * @tc.desc       : Testing the XML serializer's setCDATA with escaped characters.
     *                  Verifies that it handles escape characters properly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetCData0005', 0, () => {
      const TAG = 'testXmlSetCData0005';
      try {
        const escapeCharacters = '<>&\'"';
        let longData = "This is a test string with escape characters: " + escapeCharacters;
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA(longData);
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<![CDATA[" + longData + "]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCDATA_0600
     * @tc.name       : testXmlSetCData0006
     * @tc.desc       : Testing the XML serializer's setCDATA with repeated calls.
     *                  Verifies that the last call is reflected properly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetCData0006', 0, () => {
      const TAG = 'testXmlSetCData0006';
      try {
        const firstData = "This is the first CDATA.";
        const secondData = "This is the second CDATA.";
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA(firstData);
        thatSer.setCDATA(secondData);
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<![CDATA[" + secondData + "]]>");
        expect(result).assertContain("<![CDATA[" + firstData + "]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETCDATA_0700
     * @tc.name       : testXmlSetCData0007
     * @tc.desc       : Testing the XML serializer's setCDATA with a large input (10k characters).
     *                  Verifies that it handles large inputs properly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetCData0007', 0, () => {
      const TAG = 'testXmlSetCData0007';
      try {
        const MY_MAX = 10240;
        let longData = new Array(MY_MAX - 11).join('a');
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA(longData);
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<![CDATA[" + longData + "]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETTEXT_0100
     * @tc.name       : testXmlSetText0001
     * @tc.desc       : Testing the XML serializer's setText with undefined as parameter.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetText0001', 0, () => {
      const TAG = 'testXmlSetText0001';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setText(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETTEXT_0200
     * @tc.name       : testXmlSetText0002
     * @tc.desc       : Testing the XML serializer's setText with null as parameter.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetText0002', 0, () => {
      const TAG = 'testXmlSetText0002';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setText(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETTEXT_0300
     * @tc.name       : testXmlSetText0003
     * @tc.desc       : Testing the XML serializer's setText with an empty string.
     *                  Confirms that the XML contains a text node.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetText0003', 0, () => {
      const TAG = 'testXmlSetText0003';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText("");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETTEXT_0400
     * @tc.name       : testXmlSetText0004
     * @tc.desc       : Testing the XML serializer's setText with special characters.
     *                  Verifies that it handles them correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetText0004', 0, () => {
      const TAG = 'testXmlSetText0004';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText("Special chars: <>&'\"");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual("<note>Special chars: &lt;&gt;&amp;&apos;&quot;</note>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETTEXT_0500
     * @tc.name       : testXmlSetText0005
     * @tc.desc       : Testing setText called multiple times.
     *                  Verifies that the last setText value is used.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetText0005', 0, () => {
      const TAG = 'testXmlSetText0005';
      try {
        const MY_MAX = 51000;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText("First value");
        thatSer.setText("Second value");
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual("<note>First valueSecond value</note>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETTEXT_0600
     * @tc.name       : testXmlSetText0006
     * @tc.desc       : Testing the XML serializer's setText with large data input.
     *                  Verifies that it handles large inputs properly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetText0006', 0, () => {
      const TAG = 'testXmlSetText0006';
      try {
        const MY_MAX = 10240;
        let longText = new Array(MY_MAX - 12).join('a');
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setText(longText);
        thatSer.endElement();
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<note>" + longText + "</note>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETDOCTYPE_0100
     * @tc.name       : testXmlSetDocType0001
     * @tc.desc       : Testing the XML serializer's setDocType with undefined as parameter.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetDocType0001', 0, () => {
      const TAG = 'testXmlSetDocType0001';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETDOCTYPE_0200
     * @tc.name       : testXmlSetDocType0002
     * @tc.desc       : Testing the XML serializer's setDocType with null as parameter.
     *                  Verifies that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetDocType0002', 0, () => {
      const TAG = 'testXmlSetDocType0002';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETDOCTYPE_0300
     * @tc.name       : testXmlSetDocType0003
     * @tc.desc       : Testing the XML serializer's setDocType with an empty string.
     *                  Confirms that it handles it gracefully.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetDocType0003', 0, () => {
      const TAG = 'testXmlSetDocType0003';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType("");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETDOCTYPE_0400
     * @tc.name       : testXmlSetDocType0004
     * @tc.desc       : Testing the XML serializer's setDocType with special characters.
     *                  Verifies that it handles them correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetDocType0004', 0, () => {
      const TAG = 'testXmlSetDocType0004';
      try {
        const MY_MAX = 2048;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType("Special chars: <>&'\"");
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertEqual("<!DOCTYPE Special chars: <>&'\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETDOCTYPE_0500
     * @tc.name       : testXmlSetDocType0005
     * @tc.desc       : Testing setDocType called multiple times.
     *                  Verifies that only one DOCTYPE declaration is present.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetDocType0005', 0, () => {
      const TAG = 'testXmlSetDocType0005';
      try {
        const MY_MAX = 51000;
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType("Th!s 1s @ str!ng w1th m@ny $pec!@l ch@r@cters!<>&'");
        thatSer.setDocType("$pec!@l ch@r@cters!<>&' Th!s 1s @ str!ng w1th m@ny ");
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("Th!s 1s @ str!ng w1th m@ny $pec!@l ch@r@cters!<>&'");
        expect(result).assertContain("$pec!@l ch@r@cters!<>&' Th!s 1s @ str!ng w1th m@ny ");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SETDOCTYPE_0600
     * @tc.name       : testXmlSetDocType0006
     * @tc.desc       : Testing the XML serializer's setDocType with large data input.
     *                  Verifies that it handles large inputs properly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetDocType0006', 0, () => {
      const TAG = 'testXmlSetDocType0006';
      try {
        const MY_MAX = 10240;
        let longText = new Array(MY_MAX - 10).join('b');
        let arrayBuffer = new ArrayBuffer(MY_MAX);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType(longText);
        let view = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<!DOCTYPE " + longText + ">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_0100
     * @tc.name       : testXmlPullParserConstructor0001
     * @tc.desc       : Testing the XML PullParser's Constructor with the attribute value is not within ''.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0001', 0, () => {
      const TAG = 'testXmlPullParserConstructor0001';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<book price=245>' +
            '  <ti-tle>XML for Dummies</ti-tle>' +
            '  <author>John Doe</author>' +
            '  <price>19.99</price>' +
            '  <description>This book is about XML.</description>' +
            '</book>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, "utf-8");
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => {
            return true;
          }
        }
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_0200
     * @tc.name       : testXmlPullParserConstructor0002
     * @tc.desc       : Testing the XML PullParser's constructor with a single tag.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0002', 0, () => {
      const TAG = 'testXmlPullParserConstructor0002';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8" ?>' +
            '<book/>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<book/>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_0300
     * @tc.name       : testXmlPullParserConstructor0003
     * @tc.desc       : Testing the XML PullParser's constructor with a double tag.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0003', 0, () => {
      const TAG = 'testXmlPullParserConstructor0003';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8" ?>' +
            '<book>' +
            '  <title>XML for Dummies</title>' +
            '  <author>John Doe</author>' +
            '  <price>19.99</price>' +
            '</book>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<title>XML for Dummies</title>");
        expect(result).assertContain("<author>John Doe</author>");
        expect(result).assertContain("<price>19.99</price>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_0400
     * @tc.name       : testXmlPullParserConstructor0004
     * @tc.desc       : Testing the XML PullParser's constructor with incorrect nested tags.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0004', 0, () => {
      const TAG = 'testXmlPullParserConstructor0004';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8" ?>' +
            '<root>' +
            '    <b><i>This text is bold and italic</b></i>' +
            '</root>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_0500
     * @tc.name       : testXmlPullParserConstructor0005
     * @tc.desc       : Testing the XML PullParser's constructor with comments.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0005', 0, () => {
      const TAG = 'testXmlPullParserConstructor0005';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8" ?>' +
            '<!-- This is a comment -->' +
            '<root>' +
            '    <child>Content here</child>' +
            '</root>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<!-- This is a comment --><root>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_0600
     * @tc.name       : testXmlPullParserConstructor0006
     * @tc.desc       : Testing the XML PullParser's constructor with element names starting with a number.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0006', 0, () => {
      const TAG = 'testXmlPullParserConstructor0006';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<123book>' +
            '  <title>XML for Dummies</title>' +
            '  <author>John Doe</author>' +
            '  <price>19.99</price>' +
            '</123book>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_0700
     * @tc.name       : testXmlPullParserConstructor0007
     * @tc.desc       : Testing the XML PullParser with tag names that contain spaces.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0007', 0, () => {
      const TAG = 'testXmlPullParserConstructor0007';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8" ?>' +
            '<book tag with spaces>' +
            '  <title>XML for Dummies</title>' +
            '  <author>John Doe</author>' +
            '  <price>19.99</price>' +
            '</book>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<book tag with spaces>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_0800
     * @tc.name       : testXmlPullParserConstructor0008
     * @tc.desc       : Testing the XML PullParser with names containing special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0008', 0, () => {
      const TAG = 'testXmlPullParserConstructor0008';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<book>' +
            '  <ti&>@tle>XML for Dummies</ti-tle>' +
            '  <author>John Doe</author>' +
            '  <price>19.99</price>' +
            '  <description>This book is about XML.</description>' +
            '</book>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_1000
     * @tc.name       : testXmlPullParserConstructor0010
     * @tc.desc       : Testing the XML PullParser constructor with an empty string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0010', 0, () => {
      const TAG = 'testXmlPullParserConstructor0010';
      try {
        let testXml = '';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_1100
     * @tc.name       : testXmlPullParserConstructor0011
     * @tc.desc       : Testing the XML PullParser's constructor with long character input.
     *                  Verifies that it handles large inputs properly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0011', 0, () => {
      const TAG = 'testXmlPullParserConstructor0011';
      try {
        const MY_MAX = 65536;
        let longText = new Array(MY_MAX).join('a');
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<longText>' +
            longText +
            '</longText>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain(longText);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_1200
     * @tc.name       : testXmlPullParserConstructor0012
     * @tc.desc       : Testing the XML PullParser's constructor with namespaces.
     *                  Verifies that it handles XML namespaces correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0012', 0, () => {
      const TAG = 'testXmlPullParserConstructor0012';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<catalog xmlns:h="http://www.w3.org/TR/html4/" xmlns:f="http://www.example.com/furniture">' +
            '    <h:page>' +
            '        <h:title>Product Catalog</h:title>' +
            '        <h:body>' +
            '            <f:chair>' +
            '                <f:name>Office Chair</f:name>' +
            '                <f:price>59.99</f:price>' +
            '            </f:chair>' +
            '        </h:body>' +
            '    </h:page>' +
            '</catalog>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("xmlns:h=\"http://www.w3.org/TR/html4/\"");
        expect(result).assertContain("xmlns:f=\"http://www.example.com/furniture\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_1300
     * @tc.name       : testXmlPullParserConstructor0013
     * @tc.desc       : Testing the XML PullParser with a malformed CDATA section.
     *                  Verifies that it throws a meaningful error for invalid CDATA.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0013', 0, () => {
      const TAG = 'testXmlPullParserConstructor0013';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<!--注释的内容-->' +
            '<students>' +
            '    <!--第一个学生信息-->' +
            '    <student id="1">' +
            '        <name>张三</name>' +
            '        <age>23</age>' +
            '        <info>学生&lt; &gt;&gt;&gt;&gt;的信息</info>' +
            '        <message> <!%[CDATA[内容 <<<<<< >>>>>> ]]]></message>' +
            '    </student>' +
            '    <body>I was parsed!</body>' +
            '</students>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_1400
     * @tc.name       : testXmlPullParserConstructor0014
     * @tc.desc       : Testing the XML PullParser with nested CDATA sections.
     *                  Verifies that it handles nested CDATA sections correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0014', 0, () => {
      const TAG = 'testXmlPullParserConstructor0014';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<!--注释的内容-->' +
            '<students>' +
            '    <!--第一个学生信息-->' +
            '    <student id="1">' +
            '        <name>张三</name>' +
            '        <age>23</age>' +
            '        <info>学生&lt; &gt;&gt;&gt;&gt;的信息</info>' +
            '        <message> <![CDATA[内容<![CDATA[嵌套 ]]> ]]></message>' +
            '    </student>' +
            '    <body>I was parsed!</body>' +
            '</students>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_1500
     * @tc.name       : testXmlPullParserConstructor0015
     * @tc.desc       : Testing the XML PullParser with content containing "]]>" within CDATA.
     *                  Verifies that it handles the input correctly without error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0015', 0, () => {
      const TAG = 'testXmlPullParserConstructor0015';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<!--注释的内容-->' +
            '<students>' +
            '    <!--第一个学生信息-->' +
            '    <student id="1">' +
            '        <name>张三</name>' +
            '        <age>23</age>' +
            '        <info>学生&lt; &gt;&gt;&gt;&gt;的信息</info>' +
            '        <message> <![CDATA[内容都发给对方]]>分隔符发 ]]></message>' +
            '    </student>' +
            '    <body>I was parsed!</body>' +
            '</students>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_0016
     * @tc.name       : testXmlPullParserConstructor0016
     * @tc.desc       : Testing the XML PullParser with special characters inside elements.
     *                  Verifies that it can handle such cases correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0016', 0, () => {
      const TAG = 'testXmlPullParserConstructor0016';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<!--注释的内容-->' +
            '<students>' +
            '    <!--第一个学生信息-->' +
            '    <student id="1">' +
            '        <name>张三</name>' +
            '        <age>23</age>' +
            '        <info>学生&lt; &gt;&gt;&gt;&gt;的信息</info>' +
            '        <message> <![CDATA[内容%$^# ]]></message>' +
            '    </student>' +
            '    <body>I was parsed!</body>' +
            '</students>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<![CDATA[内容%$^# ]]>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_1700
     * @tc.name       : testXmlPullParserConstructor0017
     * @tc.desc       : Testing the XML PullParser with introduced declaration, parsed correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0017', 0, () => {
      const TAG = 'testXmlPullParserConstructor0017';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<?xml-stylesheet type="text/css" href="cd_catalog.css"?>' +
            '<CATALOG>' +
            '<CD>' +
            '<TITLE>Empire Burlesque</TITLE>' +
            '<ARTIST>Bob Dylan</ARTIST>' +
            '<COUNTRY>USA</COUNTRY>' +
            '<COMPANY>Columbia</COMPANY>' +
            '<PRICE>10.90</PRICE>' +
            '<YEAR>1985</YEAR>' +
            '</CD>' +
            '</CATALOG>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<?xml-stylesheet type=\"text/css\" href=\"cd_catalog.css\"?>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_1800
     * @tc.name       : testXmlPullParserConstructor0018
     * @tc.desc       : Testing the XML PullParser with escaped characters in content.
     *                  Verifies that it can handle such cases correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0018', 0, () => {
      const TAG = 'testXmlPullParserConstructor0018';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<NOTE>' +
            '<TO>John</TO>' +
            '<FROM>Jane</FROM>' +
            '<MESSAGE>Hello & Welcome to the \"XML\" World!</MESSAGE>' +
            '</NOTE>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_1900
     * @tc.name       : testXmlPullParserConstructor0019
     * @tc.desc       : Testing the XML PullParser with special characters in content.
     *                  Verifies that it can handle such cases correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0019', 0, () => {
      const TAG = 'testXmlPullParserConstructor0019';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<!-- This is a comment -->' +
            '<root><>&<root>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_CONSTRUCTOR_2000
     * @tc.name       : testXmlPullParserConstructor0020
     * @tc.desc       : Testing the XML PullParser without <>.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserConstructor0020', 0, () => {
      const TAG = 'testXmlPullParserConstructor0020';
      try {
        let testXml =
          'xml version="1.0" encoding="utf-8"' +
            '<note importance="high" logged="true">' +
            ' <title>Happy</title>' +
            ' <todo>Work</todo>' +
            ' <todo>Play</todo>' +
            '</note>'
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_0100
     * @tc.name       : testXmlPullParserParseOptions0001
     * @tc.desc       : Testing the XML PullParser with supportDoctype set to true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0001', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0001';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<!DOCTYPE note>' +
            '<note>' +
            '    <title>Happy</title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<!DOCTYPE note><note>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_0200
     * @tc.name       : testXmlPullParserParseOptions0002
     * @tc.desc       : Testing the XML PullParser with supportDoctype set to false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0002', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0002';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note>' +
            '    <title>Happy</title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: false,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<title>Happy</title>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_0300
     * @tc.name       : testXmlPullParserParseOptions0003
     * @tc.desc       : Testing XML PullParser with ignoreNameSpace set to true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0003', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0003';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<h:root xmlns:h="http://www.w3.org/TR/html4/">' +
            '   <h:b/>' +
            '</h:root>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: false,
          ignoreNameSpace: true,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<h:root xmlns:h=\"http://www.w3.org/TR/html4/\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_0400
     * @tc.name       : testXmlPullParserParseOptions0004
     * @tc.desc       : Testing XML PullParser with ignoreNameSpace set to false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0004', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0004';
      try {
        let testXml =
          '<?xml version="1.0" encoding="UTF-8" ?>' +
            '<h:root xmlns:h="http://www.w3.org/TR/html4/">' +
            '   <h:b/>' +
            '</h:root>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<h:root xmlns:h=\"http://www.w3.org/TR/html4/\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_0500
     * @tc.name       : testXmlPullParserParseOptions0005
     * @tc.desc       : Testing XML PullParser with tagValueCallbackFunction as undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0005', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0005';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8" ?>' +
            '<note>' +
            '    <title>Happy</title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: undefined
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<title>Happy</title>");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_0600
     * @tc.name       : testXmlPullParserParseOptions0006
     * @tc.desc       : Testing XML PullParser with tagValueCallbackFunction as function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0006', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0006';
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
          tagValueCallbackFunction: (name: string, value: string) => true
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<note importance=\"high\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_0700
     * @tc.name       : testXmlPullParserParseOptions0007
     * @tc.desc       : Testing XML PullParser with attributeValueCallbackFunction as function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0007', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0007';
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
          attributeValueCallbackFunction: (name: string, value: string) => true,
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<note importance=\"high\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_0800
     * @tc.name       : testXmlPullParserParseOptions0008
     * @tc.desc       : Testing XML PullParser with tokenValueCallbackFunction as function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0008', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0008';
      try {
        let testXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: (key: xml.EventType, value: xml.ParseInfo) => true,
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<note importance=\"high\" logged=\"true\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_0900
     * @tc.name       : testXmlPullParserParseOptions0009
     * @tc.desc       : Testing XML PullParser with tokenValueCallbackFunction as undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0009', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0009';
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
          tokenValueCallbackFunction: undefined,
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<note importance=\"high\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PULLPARSER_PARSEOPTIONS_1000
     * @tc.name       : testXmlPullParserParseOptions0010
     * @tc.desc       : Testing XML PullParser with attributeValueCallbackFunction as undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlPullParserParseOptions0010', 0, () => {
      const TAG = 'testXmlPullParserParseOptions0010';
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
          attributeValueCallbackFunction: undefined,
        };
        that.parse(options);
        const view = new Uint8Array(arrbuffer.buffer);
        const result = util.TextDecoder.create().decodeWithStream(view).trim();
        expect(result).assertContain("<note importance=\"high\">");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_0100
     * @tc.name       : testXmlParseInfoGetColumnNumber0001
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with START_DOCUMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0001', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0001';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:0 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_0200
     * @tc.name       : testXmlParseInfoGetColumnNumber0002
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with END_DOCUMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0002', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0002';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:1 value:772");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_0300
     * @tc.name       : testXmlParseInfoGetColumnNumber0003
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with start tag event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0003', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0003';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:2 value:573");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_0400
     * @tc.name       : testXmlParseInfoGetColumnNumber0004
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with end tag event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0004', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0004';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:3 value:772");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_0500
     * @tc.name       : testXmlParseInfoGetColumnNumber0005
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with TEXT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0005', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0005';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:4 value:355");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_0600
     * @tc.name       : testXmlParseInfoGetColumnNumber0006
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with CDSECT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0006', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0006';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:5 value:440");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_0700
     * @tc.name       : testXmlParseInfoGetColumnNumber0007
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with COMMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0007', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0007';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:6 value:170");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_0800
     * @tc.name       : testXmlParseInfoGetColumnNumber0008
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with DOCDECL event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0008', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0008';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:7 value:119");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_0900
     * @tc.name       : testXmlParseInfoGetColumnNumber0009
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with INSTRUCTION event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0009', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0009';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:8 value:529");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_1000
     * @tc.name       : testXmlParseInfoGetColumnNumber0010
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with ENTITY_REFERENCE event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0010', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0010';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:9 value:588");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETCOLUMNNUMBER_1100
     * @tc.name       : testXmlParseInfoGetColumnNumber0011
     * @tc.desc       : Testing XML ParseInfo getColumnNumber with WHITESPACE event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetColumnNumber0011', 0, () => {
      const TAG = 'testXmlParseInfoGetColumnNumber0011';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getColumnNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:10 value:644");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_0100
     * @tc.name       : testXmlParseInfoGetDepth0001
     * @tc.desc       : Testing XML ParseInfo getDepth with START_DOCUMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0001', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0001';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:0 value:0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_0200
     * @tc.name       : testXmlParseInfoGetDepth0002
     * @tc.desc       : Testing XML ParseInfo getDepth with END_DOCUMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0002', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0002';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:1 value:0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_0300
     * @tc.name       : testXmlParseInfoGetDepth0003
     * @tc.desc       : Testing XML ParseInfo getDepth with start tag event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0003', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0003';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:2 value:2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_0400
     * @tc.name       : testXmlParseInfoGetDepth0004
     * @tc.desc       : Testing XML ParseInfo getDepth with end tag event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0004', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0004';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:3 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_0500
     * @tc.name       : testXmlParseInfoGetDepth0005
     * @tc.desc       : Testing XML ParseInfo getDepth with TEXT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0005', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0005';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:4 value:5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_0600
     * @tc.name       : testXmlParseInfoGetDepth0006
     * @tc.desc       : Testing XML ParseInfo getDepth with CDSECT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0006', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0006';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:5 value:5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_0700
     * @tc.name       : testXmlParseInfoGetDepth0007
     * @tc.desc       : Testing XML ParseInfo getDepth with COMMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0007', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0007';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:6 value:0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_0800
     * @tc.name       : testXmlParseInfoGetDepth0008
     * @tc.desc       : Testing XML ParseInfo getDepth with DOCDECL event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0008', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0008';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:7 value:0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_0900
     * @tc.name       : testXmlParseInfoGetDepth0009
     * @tc.desc       : Testing XML ParseInfo getDepth with INSTRUCTION event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0009', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0009';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:8 value:4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_1000
     * @tc.name       : testXmlParseInfoGetDepth0010
     * @tc.desc       : Testing XML ParseInfo getDepth with ENTITY_REFERENCE event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0010', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0010';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:9 value:5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETDEPTH_1100
     * @tc.name       : testXmlParseInfoGetDepth0011
     * @tc.desc       : Testing XML ParseInfo getDepth with WHITESPACE event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetDepth0011', 0, () => {
      const TAG = 'testXmlParseInfoGetDepth0011';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getDepth() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:10 value:5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_0100
     * @tc.name       : testXmlParseInfoGetLineNumber0001
     * @tc.desc       : Testing XML ParseInfo getLineNumber with START_DOCUMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0001', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0001';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:0 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_0200
     * @tc.name       : testXmlParseInfoGetLineNumber0002
     * @tc.desc       : Testing XML ParseInfo getLineNumber with END_DOCUMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0002', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0002';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:1 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_0300
     * @tc.name       : testXmlParseInfoGetLineNumber0003
     * @tc.desc       : Testing XML ParseInfo getLineNumber with start tag event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0003', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0003';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:2 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_0400
     * @tc.name       : testXmlParseInfoGetLineNumber0004
     * @tc.desc       : Testing XML ParseInfo getLineNumber with end tag event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0004', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0004';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:3 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_0500
     * @tc.name       : testXmlParseInfoGetLineNumber0005
     * @tc.desc       : Testing XML ParseInfo getLineNumber with TEXT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0005', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0005';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:4 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_0600
     * @tc.name       : testXmlParseInfoGetLineNumber0006
     * @tc.desc       : Testing XML ParseInfo getLineNumber with CDSECT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0006', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0006';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:5 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_0700
     * @tc.name       : testXmlParseInfoGetLineNumber0007
     * @tc.desc       : Testing XML ParseInfo getLineNumber with COMMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0007', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0007';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:6 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_0800
     * @tc.name       : testXmlParseInfoGetLineNumber0008
     * @tc.desc       : Testing XML ParseInfo getLineNumber with DOCDECL event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0008', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0008';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:7 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_0900
     * @tc.name       : testXmlParseInfoGetLineNumber0009
     * @tc.desc       : Testing XML ParseInfo getLineNumber with INSTRUCTION event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0009', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0009';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:8 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_1000
     * @tc.name       : testXmlParseInfoGetLineNumber0010
     * @tc.desc       : Testing XML ParseInfo getLineNumber with ENTITY_REFERENCE event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0010', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0010';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:9 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETLINENUMBER_1100
     * @tc.name       : testXmlParseInfoGetLineNumber0011
     * @tc.desc       : Testing XML ParseInfo getLineNumber with WHITESPACE event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetLineNumber0011', 0, () => {
      const TAG = 'testXmlParseInfoGetLineNumber0011';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getLineNumber() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:10 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_0100
     * @tc.name       : testXmlParseInfoGetName0001
     * @tc.desc       : Testing XML ParseInfo getName with START_DOCUMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0001', 0, () => {
      const TAG = 'testXmlParseInfoGetName0001';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:0 value:");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_0200
     * @tc.name       : testXmlParseInfoGetName0002
     * @tc.desc       : Testing XML ParseInfo getName with END_DOCUMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0002', 0, () => {
      const TAG = 'testXmlParseInfoGetName0002';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:1 value:");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_0300
     * @tc.name       : testXmlParseInfoGetName0003
     * @tc.desc       : Testing XML ParseInfo getName with start tag event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0003', 0, () => {
      const TAG = 'testXmlParseInfoGetName0003';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:2 value:example");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_0400
     * @tc.name       : testXmlParseInfoGetName0004
     * @tc.desc       : Testing XML ParseInfo getName with end tag event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0004', 0, () => {
      const TAG = 'testXmlParseInfoGetName0004';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:3 value:endDocument");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_0500
     * @tc.name       : testXmlParseInfoGetName0005
     * @tc.desc       : Testing XML ParseInfo getName with TEXT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0005', 0, () => {
      const TAG = 'testXmlParseInfoGetName0005';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:4 value:");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_0600
     * @tc.name       : testXmlParseInfoGetName0006
     * @tc.desc       : Testing XML ParseInfo getName with CDSECT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0006', 0, () => {
      const TAG = 'testXmlParseInfoGetName0006';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:5 value:");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_0700
     * @tc.name       : testXmlParseInfoGetName0007
     * @tc.desc       : Testing XML ParseInfo getName with COMMENT event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0007', 0, () => {
      const TAG = 'testXmlParseInfoGetName0007';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:6 value:");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_0800
     * @tc.name       : testXmlParseInfoGetName0008
     * @tc.desc       : Testing XML ParseInfo getName with DOCDECL event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0008', 0, () => {
      const TAG = 'testXmlParseInfoGetName0008';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:7 value:");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_0900
     * @tc.name       : testXmlParseInfoGetName0009
     * @tc.desc       : Testing XML ParseInfo getName with INSTRUCTION event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0009', 0, () => {
      const TAG = 'testXmlParseInfoGetName0009';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:8 value:");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_1000
     * @tc.name       : testXmlParseInfoGetName0010
     * @tc.desc       : Testing XML ParseInfo getName with ENTITY_REFERENCE event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0010', 0, () => {
      const TAG = 'testXmlParseInfoGetName0010';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:9 value:exampleEntity");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_1100
     * @tc.name       : testXmlParseInfoGetName0011
     * @tc.desc       : Testing XML ParseInfo getName with WHITESPACE event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0011', 0, () => {
      const TAG = 'testXmlParseInfoGetName0011';
      try {
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:10 value:");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_1200
     * @tc.name       : testXmlParseInfoGetName0012
     * @tc.desc       : Testing XML ParseInfo getName with invalid testXml.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0012', 0, () => {
      const TAG = 'testXmlParseInfoGetName0012';
      try {
        let testXml = "<1example>" +
          "<example>" +
          "<invalid-name!></invalid-name!>" +
          "</example>" +
          "</1example>";
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAME_1300
     * @tc.name       : testXmlParseInfoGetName0013
     * @tc.desc       : Testing XML ParseInfo getName with single testXml.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetName0013', 0, () => {
      const TAG = 'testXmlParseInfoGetName0013';
      try {
        let testXml = "<item id=\"1\" />\n";
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(testXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getName() + ' ';
          return true;
        };
        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tagValueCallbackFunction: (name: string, value: string) => true,
          tokenValueCallbackFunction: func,
        };
        that.parse(options);
        expect(str).assertContain("key:2 value:item");
        expect(str).assertContain("key:3 value:item");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAMESPACE_0100
     * @tc.name       : testXmlParseInfoGetNamespace0001
     * @tc.desc       : Testing XML ParseInfo getNamespace with namespace is existent.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetNamespace0001', 0, () => {
      const TAG = 'testXmlParseInfoGetNamespace0001';
      try {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note xmlns:h="http://www.w3.org">' +
            '<h:title>Happy</h:title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getNamespace() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: false, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:2 value:http://www.w3.org");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETNAMESPACE_0200
     * @tc.name       : testXmlParseInfoGetNamespace0002
     * @tc.desc       : Testing XML ParseInfo getNamespace with namespace is not existent.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetNamespace0002', 0, () => {
      const TAG = 'testXmlParseInfoGetNamespace0002';
      try {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note xmlns:h="http://www.w3.org">' +
            '<h:title>Happy</h:title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getNamespace() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:2 value:");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETPREFIX_0100
     * @tc.name       : testXmlParseInfoGetPrefix0001
     * @tc.desc       : Testing XML ParseInfo Prefix.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetPrefix0001', 0, () => {
      const TAG = 'testXmlParseInfoGetPrefix0001';
      try {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note xmlns:h="http://www.w3.org/TR/html4">' +
            '<h:title>Happy</h:title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getPrefix() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: false, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:2 value:h");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETTEXT_0100
     * @tc.name       : testXmlParseInfoGetText0001
     * @tc.desc       : Testing XML ParseInfo GetText with legal content.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetText0001', 0, () => {
      const TAG = 'testXmlParseInfoGetText0001';
      try {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getText() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:4 value:Happy");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_PARSEINFO_GETTEXT_0200
     * @tc.name       : testXmlParseInfoGetText0002
     * @tc.desc       : Testing XML ParseInfo GetText with illegal content.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlParseInfoGetText0002', 0, () => {
      const TAG = 'testXmlParseInfoGetText0002';
      try {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Ha$ppy</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getText() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:4 value:Ha$ppy");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ISEMPTYELEMENTTAG_0100
     * @tc.name       : testXmlIsEmptyElementTag0001
     * @tc.desc       : Testing XML isEmptyElementTag with valid empty element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlIsEmptyElementTag0001', 0, () => {
      const TAG = 'testXmlIsEmptyElementTag0001';
      try {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<title/>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.isEmptyElementTag() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:2 value:true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ISEMPTYELEMENTTAG_0200
     * @tc.name       : testXmlIsEmptyElementTag0002
     * @tc.desc       : Testing XML isEmptyElementTag with valid non-empty element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlIsEmptyElementTag0002', 0, () => {
      const TAG = 'testXmlIsEmptyElementTag0002';
      try {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><note><to>Work</to></note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.isEmptyElementTag() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:4 value:false");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ISEMPTYELEMENTTAG_0300
     * @tc.name       : testXmlIsEmptyElementTag0003
     * @tc.desc       : Testing XML isEmptyElementTag with illegal XML structure.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlIsEmptyElementTag0003', 0, () => {
      const TAG = 'testXmlIsEmptyElementTag0003';
      try {
        let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true">' +
          '    <to do>Work</to do>' +
          '    <todo>Play</todo>' +
          '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.isEmptyElementTag() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_ISWHITESPACE_0100
     * @tc.name       : testXmlIsWhitespace0001
     * @tc.desc       : Testing XML isWhitespace with valid whitespace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlIsWhitespace0001', 0, () => {
      const TAG = 'testXmlIsWhitespace0001';
      try {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<title> </title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.isWhitespace() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:2 value:true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_GETATTRIBUTESCOUNT_0100
     * @tc.name       : testXmlGetAttributeCount0001
     * @tc.desc       : Testing XML getAttributeCount with one valid attribute.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlGetAttributeCount0001', 0, () => {
      const TAG = 'testXmlGetAttributeCount0001';
      try {
        let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high"/>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getAttributeCount() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:2 value:1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_GETATTRIBUTESCOUNT_0200
     * @tc.name       : testXmlGetAttributeCount0002
     * @tc.desc       : Testing XML getAttributeCount with multiple valid attributes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlGetAttributeCount0002', 0, () => {
      const TAG = 'testXmlGetAttributeCount0002';
      try {
        let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
          '<note importance="high" logged="true"/>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getAttributeCount() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect(str).assertContain("key:2 value:2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_GETATTRIBUTESCOUNT_0300
     * @tc.name       : testXmlGetAttributeCount0003
     * @tc.desc       : Testing XML getAttributeCount with illegal attribute.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlGetAttributeCount0003', 0, () => {
      const TAG = 'testXmlGetAttributeCount0003';
      try {
        let strXml = '<note importance=high logged="true"/>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
        let str = "";
        const func = (key: xml.EventType, value: xml.ParseInfo) => {
          str += 'key:' + key + ' value:' + value.getAttributeCount() + ' ';
          return true;
        }
        let options: xml.ParseOptions = {
          supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
        }
        that.parse(options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });


  })
}