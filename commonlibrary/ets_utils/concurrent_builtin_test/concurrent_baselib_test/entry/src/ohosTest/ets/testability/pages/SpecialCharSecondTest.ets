
import { ArkTSUtils, xml, util } from '@kit.ArkTS';
import { specChars } from './Testxml';


/* ******************************** AsyncLock ******************************** */

@Concurrent
export function testAsyncLockRequestSpecial() {
  const caseName = 'testAsyncLockRequestSpecial';
  try {
    console.log(`${caseName} test start`);
    const lock1 = ArkTSUtils.locks.AsyncLock.request(specChars);
    const lock2 = ArkTSUtils.locks.AsyncLock.request(specChars);
    if (lock1.name !== lock2.name) { throw new Error(`${caseName} name mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}

@Concurrent
export function testAsyncLockQuerySpecial() {
  const caseName = 'testAsyncLockQuerySpecial';
  try {
    console.log(`${caseName} test start`);
    const lock = ArkTSUtils.locks.AsyncLock.request(specChars);
    const state = ArkTSUtils.locks.AsyncLock.query(specChars);
    if (!state) { throw new Error(`${caseName} query failed`); }
    if (!(state.held.length >= 0)) { throw new Error(`${caseName} held length check failed`); }
    if (!(state.pending.length >= 0)) { throw new Error(`${caseName} pending length check failed`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}

/* ******************************** XmlSerializer ******************************** */

@Concurrent
export function testXmlSerializerConstructorSpecial() {
  const caseName = 'testXmlSerializerConstructorSpecial';
  try {
    console.log(`${caseName} test start`);
    const arrayBuffer = new ArrayBuffer(2048);
    const thatSer = new xml.XmlSerializer(arrayBuffer, specChars);
    throw new Error(`${caseName} should throw`);
  } catch (err) {
    if (err.message !== 'Parameter error.Just support utf-8') { throw new Error(`${caseName} err msg mismatch`); }
    console.log(`${caseName} test end`);
  }
}

@Concurrent
export function testXmlSetAttributesSpecial() {
  const caseName = 'testXmlSetAttributesSpecial';
  try {
    console.log(`${caseName} test start`);
    const arrayBuffer = new ArrayBuffer(225);
    const thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.startElement('note');
    thatSer.setAttributes(specChars, specChars);
    thatSer.endElement();
    const uint8 = new Uint8Array(arrayBuffer);
    const result = util.TextDecoder.create().decodeToString(uint8);
    const expected = '<note  ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~=" ！&quot;#$%&amp;&apos;()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"/>';
    if (result !== expected) { throw new Error(`${caseName} result mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}

@Concurrent
export function testXmlAddEmptyElementSpecial() {
  const caseName = 'testXmlAddEmptyElementSpecial';
  try {
    console.log(`${caseName} test start`);
    const arrayBuffer = new ArrayBuffer(100);
    const thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.addEmptyElement(specChars);
    const uint8 = new Uint8Array(arrayBuffer);
    const result = util.TextDecoder.create().decodeToString(uint8);
    const expected = '< ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~/>';
    if (result !== expected) { throw new Error(`${caseName} result mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}

@Concurrent
export function testXmlStartElementSpecial() {
  const caseName = 'testXmlStartElementSpecial';
  try {
    console.log(`${caseName} test start`);
    const arrayBuffer = new ArrayBuffer(204);
    const thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.startElement(specChars);
    thatSer.setText('Happy');
    thatSer.endElement();
    const uint8 = new Uint8Array(arrayBuffer);
    const result = util.TextDecoder.create().decodeToString(uint8);
    const expected = '< ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~>Happy</ ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~>';
    if (result !== expected) { throw new Error(`${caseName} result mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}

@Concurrent
export function testXmlSetCommentSpecial() {
  const caseName = 'testXmlSetCommentSpecial';
  try {
    console.log(`${caseName} test start`);
    const arrayBuffer = new ArrayBuffer(104);
    const thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.setComment(specChars);
    const uint8 = new Uint8Array(arrayBuffer);
    const result = util.TextDecoder.create().decodeToString(uint8);
    const expected = '<!-- ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~-->';
    if (result !== expected) { throw new Error(`${caseName} result mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}

@Concurrent
export function testXmlSetCDATASpecial() {
  const caseName = 'testXmlSetCDATASpecial';
  try {
    console.log(`${caseName} test start`);
    const arrayBuffer = new ArrayBuffer(109);
    const thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.setCDATA(specChars);
    const uint8 = new Uint8Array(arrayBuffer);
    const result = util.TextDecoder.create().decodeToString(uint8);
    const expected = '<![CDATA[ ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~]]>';
    if (result !== expected) { throw new Error(`${caseName} result mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}

@Concurrent
export function testXmlSetTextSpecial() {
  const caseName = 'testXmlSetTextSpecial';
  try {
    console.log(`${caseName} test start`);
    const arrayBuffer = new ArrayBuffer(148);
    const thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.startElement('note');
    thatSer.setAttributes('importance', 'high');
    thatSer.setText(specChars);
    thatSer.endElement();
    const uint8 = new Uint8Array(arrayBuffer);
    const result = util.TextDecoder.create().decodeToString(uint8);
    const expected = '<note importance="high"> ！&quot;#$%&amp;&apos;()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~</note>';
    if (result !== expected) { throw new Error(`${caseName} result mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}

@Concurrent
export function testXmlSetDocTypeSpecial() {
  const caseName = 'testXmlSetDocTypeSpecial';
  try {
    console.log(`${caseName} test start`);
    const arrayBuffer = new ArrayBuffer(108);
    const thatSer = new xml.XmlSerializer(arrayBuffer);
    thatSer.setDocType(specChars);
    const uint8 = new Uint8Array(arrayBuffer);
    const result = util.TextDecoder.create().decodeToString(uint8);
    const expected = '<!DOCTYPE  ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~>';
    if (result !== expected) { throw new Error(`${caseName} result mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}

/* ******************************** XmlPullParser ******************************** */

@Concurrent
export function testXmlPullParserConstructorSpecial() {
  const caseName = 'testXmlPullParserConstructorSpecial';
  try {
    console.log(`${caseName} test start`);
    const strXml = '<title>Happy</title>';
    const textEncoder = new util.TextEncoder();
    const arrbuffer = textEncoder.encodeInto(strXml);
    const that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, specChars);
    throw new Error(`${caseName} should throw`);
  } catch (err) {
    if (err.message !== 'Parameter error.Just support utf-8') { throw new Error(`${caseName} err msg mismatch`); }
    console.log(`${caseName} test end`);
  }
}