import LRUCacheTest from './util/LRUCacheTest.test'
import TextDecoderTest from './util/TextDecoderTest.test'
import Base64HelperTest from './util/Base64HelperTest.test'
import StringDecoder01Test from './util/StringDecoderTest01.test'
import StringDecoder02Test from './util/StringDecoderTest02.test'
import RationalNumberTest from './util/RationalNumberTest.test'
import TextEncoderTest from './util/TextEncoderTest.test'
import XmlTest01 from "./xml/XmlTest01.test"
import XmlTest02 from "./xml/XmlTest02.test"
import XmlTest03 from "./xml/XmlTest03.test"
import XmlTest04 from "./xml/XmlTest04.test"
import XmlTest05 from "./xml/XmlTest05.test"
import XmlTest06 from "./xml/XmlTest06.test"
import XmlTest07 from "./xml/XmlTest07.test"
import XmlTest08 from "./xml/XmlTest08.test"
import StreamTest01 from "./stream/StreamTest01.test"
import StreamTest02 from "./stream/StreamTest02.test"
import StreamTest03 from "./stream/StreamTest03.test"
import StreamTest04 from "./stream/StreamTest04.test"
import StreamTest05 from "./stream/StreamTest05.test"
import StreamTest06 from "./stream/StreamTest06.test"
import StreamTest07 from "./stream/StreamTest07.test"
import StreamTest08 from "./stream/StreamTest08.test"
import StreamTest09 from "./stream/StreamTest09.test"
import StreamTest10 from "./stream/StreamTest10.test"

export default function testsuite() {
  LRUCacheTest();
  TextDecoderTest();
  Base64HelperTest();
  StringDecoder01Test();
  StringDecoder02Test();
  RationalNumberTest(); 
  TextEncoderTest();
  XmlTest01();
  XmlTest02();
  XmlTest03();
  XmlTest04();
  XmlTest05();
  XmlTest06();
  XmlTest07();
  XmlTest08();
  StreamTest01();
  StreamTest02();
  StreamTest03();
  StreamTest04();
  StreamTest05();
  StreamTest06();
  StreamTest07();
  StreamTest08();
  StreamTest09();
  StreamTest10();
};

