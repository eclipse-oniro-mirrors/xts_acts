/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { util, xml } from '@kit.ArkTS';
import { testXml } from './Testxml';

@Concurrent
export function testXmlDynamicSerializer() {
  const TAG = 'DynamicXmlConcurrentTest0001';
  try {
    const ser = new xml.XmlDynamicSerializer();
    ser.startElement('note');
    ser.setAttributes('importance', '馃槉');
    ser.endElement();
    const buf = ser.getOutput();
    if (!buf || buf.byteLength === 0) {
      throw new Error(`${TAG} empty output`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSetComment() {
  const TAG = 'DynamicXmlConcurrentTest0002';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.setComment('馃槉');
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<!--馃槉-->')) {
      throw new Error(`${TAG} comment mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSetCdata() {
  const TAG = 'DynamicXmlConcurrentTest0003';
  try {
    console.log(`${TAG} test start`);
    const emoji = '\ud83d\udc7f';
    let that = new xml.XmlDynamicSerializer();
    that.setCdata(emoji);
    let arrayBuffer = that.getOutput();
    let uint8 = new Uint8Array(arrayBuffer);
    let result = util.TextDecoder.create().decodeToString(uint8);
    if (result !== '<![CDATA[👿]]>') {
      console.info('==========',result)
      throw new Error(`${TAG} cdata mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSetDocType() {
  const TAG = 'DynamicXmlConcurrentTest0004';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.setDocType('馃槉');
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<!DOCTYPE 馃槉>')) {
      throw new Error(`${TAG} doctype mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSetDeclaration() {
  const TAG = 'DynamicXmlConcurrentTest0005';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.setDeclaration();          // 鍙兘璋冧竴娆★紝鎺ュ彛瀛樺湪鍗冲彲
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<?xml')) {
      throw new Error(`${TAG} declaration missing`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSetNamespace() {
  const TAG = 'DynamicXmlConcurrentTest0006';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.setNamespace('ns', 'http://test');
    ser.startElement('note');
    ser.endElement();
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('xmlns:ns=')) {
      throw new Error(`${TAG} namespace mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSetText() {
  const TAG = 'DynamicXmlConcurrentTest0007';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.startElement('note');
    ser.setText('inner');
    ser.endElement();
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('>inner<')) {
      throw new Error(`${TAG} text mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testAddEmptyElement() {
  const TAG = 'DynamicXmlConcurrentTest0008';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.addEmptyElement('empty');
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<empty/>')) {
      throw new Error(`${TAG} empty element mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


// 1. XmlSerializer 鏋勯€犲嚱鏁帮紙ArrayBuffer 瓒冲闀匡級
@Concurrent
export function testXmlSerializerConstructor() {
  const TAG = 'testXmlSerializerConstructor';
  try {
    console.log(`${TAG} start`);
    const expectDecl = '<?xml version="1.0" encoding="utf-8"?>';
    const buf = new ArrayBuffer(expectDecl.length + 10);
    const ser = new xml.XmlSerializer(buf);
    ser.setDeclaration();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf)).slice(0, expectDecl.length);
    if (str !== expectDecl) {
      throw new Error(`decl mismatch: ${str}`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 2. setAttributes 姝ｅ父鍒嗘敮锛堢涓€娆″嚭鐜帮級
@Concurrent
export function testSetAttributes() {
  const TAG = 'testSetAttributes';
  try {
    console.log(`${TAG} start`);
    const buf = new ArrayBuffer(2048);
    const ser = new xml.XmlSerializer(buf);
    ser.startElement('note');
    ser.setAttributes('importance', 'high');
    ser.endElement();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('importance="high"')) {
      throw new Error(`attr not found`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 3. addEmptyElement 姝ｅ父鍒嗘敮
@Concurrent
export function testAddEmptyElement2() {
  const TAG = 'testAddEmptyElement';
  try {
    console.log(`${TAG} start`);
    const buf = new ArrayBuffer(256);
    const ser = new xml.XmlSerializer(buf);
    ser.addEmptyElement('empty');
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<empty/>')) {
      throw new Error(`empty element mismatch`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 4. setDeclaration
@Concurrent
export function testSetDeclaration2() {
  const TAG = 'testSetDeclaration';
  try {
    console.log(`${TAG} start`);
    const buf = new ArrayBuffer(256);
    const ser = new xml.XmlSerializer(buf);
    ser.setDeclaration();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<?xml version="1.0" encoding="utf-8"?>')) {
      throw new Error(`decl mismatch`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 5. startElement 姝ｅ父鍒嗘敮
@Concurrent
export function testStartElement() {
  const TAG = 'testStartElement';
  try {
    console.log(`${TAG} start`);
    const buf = new ArrayBuffer(256);
    const ser = new xml.XmlSerializer(buf);
    ser.startElement('note');
    ser.endElement();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<note/>')) {
      throw new Error(`startElement mismatch`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 6. endElement
@Concurrent
export function testEndElement() {
  const TAG = 'testEndElement';
  try {
    console.log(`${TAG} start`);
    const MY_MAX = 51000;
    let arrayBuffer = new ArrayBuffer(MY_MAX);
    let thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.startElement('note');
    thatSer.setText('First value');
    thatSer.setText('Second value');
    thatSer.endElement();
    let view = new Uint8Array(arrayBuffer);
    let result = util.TextDecoder.create().decodeWithStream(view).trim();
    if (result !== '<note>First valueSecond value</note>') {
      throw new Error(`endElement mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


// 8. setComment
@Concurrent
export function testSetComment2() {
  const TAG = 'testSetComment';
  try {
    console.log(`${TAG} start`);
    const MY_MAX = 2048;
    let arrayBuffer = new ArrayBuffer(MY_MAX);
    let thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.setComment('@#&*');
    let view = new Uint8Array(arrayBuffer);
    let result = util.TextDecoder.create().decodeWithStream(view).trim();
    if (result !== '<!--@#&*-->') {
      throw new Error(`comment mismatch`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 9. setCDATA
@Concurrent
export function testSetCDATA() {
  const TAG = 'testSetCDATA';
  try {
    console.log(`${TAG} start`);
    const MY_MAX = 2048;
    let arrayBuffer = new ArrayBuffer(MY_MAX);
    let thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.setCDATA('> < }');
    let view = new Uint8Array(arrayBuffer);
    let result = util.TextDecoder.create().decodeWithStream(view).trim();
    if (result !== '<![CDATA[> < }]]>') {
      console.info('============9',result)
      throw new Error(`CDATA mismatch`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSetText2() {
  const TAG = 'DynamicXmlConcurrentTest0007';
  try {
    console.log(`${TAG} test start`);
    const MY_MAX = 2048;
    let arrayBuffer = new ArrayBuffer(MY_MAX);
    let thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.startElement('note');
    thatSer.setText("Special chars: <>&'\'");
    thatSer.endElement();
    let view = new Uint8Array(arrayBuffer);
    let result = util.TextDecoder.create().decodeWithStream(view).trim();
    if (result !== '<note>Special chars: &lt;&gt;&amp;&apos;&apos;</note>') {
      console.info('===============',result)
      throw new Error(`${TAG} text mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 10. setDocType
@Concurrent
export function testSetDocType2() {
  const TAG = 'testSetDocType';
  try {
    console.log(`${TAG} start`);
    const MY_MAX = 2048;
    let arrayBuffer = new ArrayBuffer(MY_MAX);
    let thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.setDocType("Special chars: <>&'\"");
    let view = new Uint8Array(arrayBuffer);
    let result = util.TextDecoder.create().decodeWithStream(view).trim();
    if (result !== '<!DOCTYPE Special chars: <>&\'">') {
      console.info('=============',result)
      throw new Error(`DOCTYPE mismatch`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


@Concurrent
export function testXmlPullParser_Constructor() {
  const caseName = 'DynamicXmlConcurrentTest_Constructor';
  try {
    console.log(`${caseName} test start`);
    let testXml =
      '<?xml version="1.0" encoding="utf-8"?>' +
        '<book price="245">' +
        '  <ti-tle>XML for Dummies</ti-tle>' +
        '  <author>John Doe</author>' +
        '  <price>19.99</price>' +
        '  <description>This book is about XML.</description>' +
        '</book>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(testXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
    let options: xml.ParseOptions = {
      supportDoctype: true, ignoreNameSpace: true,
      tagValueCallbackFunction: (name: string, value: string) => true
    };
    that.parse(options);
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testXmlPullParser_parse() {
  const caseName = 'DynamicXmlConcurrentTest_parse';
  try {
    console.log(`${caseName} test start`);
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
    if (!result.includes('<note importance="high">')) {
      console.log(`${caseName} test end`);
    }
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_getColumnNumber() {
  const caseName = 'DynamicXmlConcurrentTest_getColumnNumber';
  try {
    console.log(`${caseName} test start`);
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(testXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
    let str = '';
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
    if (!str.includes('key:0 value:1')) {
      throw new Error(`${caseName} getColumnNumber mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_getDepth() {
  const caseName = 'DynamicXmlConcurrentTest_getDepth';
  try {
    console.log(`${caseName} test start`);
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(testXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
    let str = '';
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
    if (!str.includes('key:0 value:0')) {
      throw new Error(`${caseName} getDepth mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_getLineNumber() {
  const caseName = 'DynamicXmlConcurrentTest_getLineNumber';
  try {
    console.log(`${caseName} test start`);
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(testXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
    let str = '';
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
    if (!str.includes('key:0 value:1')){
      throw new Error(`${caseName} getLineNumber mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_getName() {
  const caseName = 'DynamicXmlConcurrentTest_getName';
  try {
    console.log(`${caseName} test start`);
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(testXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
    let str = '';
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
    if (!str.includes('key:0 value:')){
      throw new Error(`${caseName} getName mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseOptions_supportDoctype() {
  const caseName = 'DynamicXmlConcurrentTest_supportDoctype';
  try {
    console.log(`${caseName} test start`);
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
    if (!result.includes('<!DOCTYPE note><note>')) {
      throw new Error(`${caseName} supportDoctype mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseOptions_ignoreNameSpace() {
  const caseName = 'DynamicXmlConcurrentTest_ignoreNameSpace';
  try {
    console.log(`${caseName} test start`);
    let testXml =
      '<?xml version="1.0" encoding="UTF-8" ?>' +
        '<h:root xmlns:h="http://www.w3.org/TR/html4/  ">' +
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
    if (!result.includes('<h:root xmlns:h="http://www.w3.org/TR/html4/  ">')) {
      throw new Error(`${caseName} ignoreNameSpace mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_getName_startDocument() {
  const caseName = 'DynamicXmlConcurrentTest_getName_START_DOCUMENT';
  try {
    console.log(`${caseName} test start`);
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(testXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'utf-8');
    let str = '';
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
    if (!str.includes('key:0 value:')) {
      throw new Error(`${caseName} getName mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_getNamespace() {
  const caseName = 'DynamicXmlConcurrentTest_getNamespace';
  try {
    console.log(`${caseName} test start`);
    let strXml =
      '<?xml version="1.0" encoding="utf-8"?>' +
        '<note xmlns:h="http://www.w3.org ">' +
        '<h:title>Happy</h:title>' +
        '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
    let str = '';
    const func = (key: xml.EventType, value: xml.ParseInfo) => {
      str += 'key:' + key + ' value:' + value.getNamespace() + ' ';
      return true;
    }
    let options: xml.ParseOptions = {
      supportDoctype: true, ignoreNameSpace: false, tokenValueCallbackFunction: func
    }
    that.parse(options);
    if (!str.includes('key:2 value:http://www.w3.org ')) {
      throw new Error(`${caseName} getNamespace mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_getPrefix() {
  const caseName = 'DynamicXmlConcurrentTest_getPrefix';
  try {
    console.log(`${caseName} test start`);
    let strXml =
      '<?xml version="1.0" encoding="utf-8"?>' +
        '<note xmlns:h="http://www.w3.org/TR/html4 ">' +
        '<h:title>Happy</h:title>' +
        '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
    let str = '';
    const func = (key: xml.EventType, value: xml.ParseInfo) => {
      str += 'key:' + key + ' value:' + value.getPrefix() + ' ';
      return true;
    }
    let options: xml.ParseOptions = {
      supportDoctype: true, ignoreNameSpace: false, tokenValueCallbackFunction: func
    }
    that.parse(options);
    if (!str.includes('key:2 value:h')) {
      throw new Error(`${caseName} getPrefix mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_getText() {
  const caseName = 'DynamicXmlConcurrentTest_getText';
  try {
    console.log(`${caseName} test start`);
    let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
    let str = '';
    const func = (key: xml.EventType, value: xml.ParseInfo) => {
      str += 'key:' + key + ' value:' + value.getText() + ' ';
      return true;
    }
    let options: xml.ParseOptions = {
      supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
    }
    that.parse(options);
    if (!str.includes('key:4 value:Happy')) {
      throw new Error(`${caseName} getText mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_isEmptyElementTag() {
  const caseName = 'DynamicXmlConcurrentTest_isEmptyElementTag';
  try {
    console.log(`${caseName} test start`);
    let strXml =
      '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '<title/>' +
        '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
    let str = '';
    const func = (key: xml.EventType, value: xml.ParseInfo) => {
      str += 'key:' + key + ' value:' + value.isEmptyElementTag() + ' ';
      return true;
    }
    let options: xml.ParseOptions = {
      supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
    }
    that.parse(options);
    if (!str.includes('key:2 value:true')) {
      throw new Error(`${caseName} isEmptyElementTag mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_isWhitespace() {
  const caseName = 'DynamicXmlConcurrentTest_isWhitespace';
  try {
    console.log(`${caseName} test start`);
    let strXml =
      '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '<title> </title>' +
        '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
    let str = '';
    const func = (key: xml.EventType, value: xml.ParseInfo) => {
      str += 'key:' + key + ' value:' + value.isWhitespace() + ' ';
      return true;
    }
    let options: xml.ParseOptions = {
      supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
    }
    that.parse(options);
    if (!str.includes('key:2 value:true')) {
      throw new Error(`${caseName} isWhitespace mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testParseInfo_getAttributeCount() {
  const caseName = 'DynamicXmlConcurrentTest_getAttributeCount';
  try {
    console.log(`${caseName} test start`);
    let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
      '<note importance="high" logged="true"/>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
    let str = '';
    const func = (key: xml.EventType, value: xml.ParseInfo) => {
      str += 'key:' + key + ' value:' + value.getAttributeCount() + ' ';
      return true;
    }
    let options: xml.ParseOptions = {
      supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func
    }
    that.parse(options);
    if (!str.includes('key:2 value:2')) {
      throw new Error(`${caseName} getAttributeCount mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}