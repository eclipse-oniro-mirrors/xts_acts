import LRUCacheTest from './util/LRUCacheTest.test'
import TextDecoderTest from './util/TextDecoderTest.test'
import Base64HelperTest from './util/Base64HelperTest.test'
import StringDecoder01Test from './util/StringDecoderTest01.test'
import StringDecoder02Test from './util/StringDecoderTest02.test'
import RationalNumberTest from './util/RationalNumberTest.test'
import Util1Test from './util/Util.test';
import TextEncoderTest from './util/TextEncoderTest.test'

import UtilTest01 from './util/Base64HelperTest02.test';
import UtilTest02 from './util/Base64HelperTest03.test';
import UtilTest03 from './util/LRUCacheTest02.test';
import UtilTest04 from './util/LRUCacheTest03.test';
import UtilTest05 from './util/LRUCacheTest04.test';
import UtilTest06 from './util/LRUCacheTest05.test';
import UtilTest07 from './util/RationalNumberTest02.test';
import UtilTest08 from './util/RationalNumberTest03.test';
import UtilTest09 from './util/RationalNumberTest04.test';
import UtilTest10 from './util/TextDecoderTest02.test';
import UtilTest11 from './util/TextEncoderTest02.test';

import XmlTest01 from "./xml/XmlTest01.test"
import XmlTest02 from "./xml/XmlTest02.test"
import XmlTest03 from "./xml/XmlTest03.test"
import XmlTest04 from "./xml/XmlTest04.test"
import XmlTest05 from "./xml/XmlTest05.test"
import XmlTest06 from "./xml/XmlTest06.test"
import XmlTest07 from "./xml/XmlTest07.test"
import XmlTest08 from "./xml/XmlTest08.test"
import XmlSAXParserTest from "./xml/XmlSAXParserTest.test"

import HashMapTest01 from "./hashmap/HashMapTest01.test"
import HashMapTest02 from "./hashmap/HashMapTest02.test"
import HashMapTest03 from "./hashmap/HashMapTest03.test"
import HashMapTest04 from "./hashmap/HashMapTest04.test"
import HashMapTest05 from "./hashmap/HashMapTest05.test"

import HashSetTest01 from "./hashset/HashSetTest01.test"
import HashSetTest02 from "./hashset/HashSetTest02.test"
import HashSetTest03 from "./hashset/HashSetTest03.test"
import HashSetTest04 from "./hashset/HashSetTest04.test"
import HashSetTest05 from "./hashset/HashSetTest05.test"
import HashSetTest06 from "./hashset/HashSetTest06.test"
import HashSetTest07 from "./hashset/HashSetTest07.test"
import HashSetTest08 from "./hashset/HashSetTest08.test"

import JsonTest01 from "./json/JsonTest01.test"
import JsonTest02 from "./json/JsonTest02.test"
import JsonTest03 from "./json/JsonTest03.test"
import JsonTest04 from "./json/JsonTest04.test"
import JsonTest05 from "./json/JsonTest05.test"
import JsonTest06 from "./json/JsonTest06.test"

import LightWeightMapTest01 from "./lightweightmap/LightWeightMapTest01.test"
import LightWeightMapTest02 from "./lightweightmap/LightWeightMapTest02.test"
import LightWeightMapTest03 from "./lightweightmap/LightWeightMapTest03.test"
import LightWeightMapTest04 from "./lightweightmap/LightWeightMapTest04.test"
import LightWeightMapTest05 from "./lightweightmap/LightWeightMapTest05.test"
import LightWeightMapTest06 from "./lightweightmap/LightWeightMapTest06.test"
import LightWeightMapTest07 from "./lightweightmap/LightWeightMapTest07.test"
import LightWeightMapTest08 from "./lightweightmap/LightWeightMapTest08.test"

import LightWeightSetTest01 from "./lightweightset/LightWeightSetTest01.test"
import LightWeightSetTest02 from "./lightweightset/LightWeightSetTest02.test"
import LightWeightSetTest03 from "./lightweightset/LightWeightSetTest03.test"
import LightWeightSetTest04 from "./lightweightset/LightWeightSetTest04.test"
import LightWeightSetTest05 from "./lightweightset/LightWeightSetTest05.test"



import PlainArrayTest01 from "./plainarray/PlainArrayTest01.test"
import PlainArrayTest02 from "./plainarray/PlainArrayTest02.test"
import PlainArrayTest03 from "./plainarray/PlainArrayTest03.test"
import PlainArrayTest04 from "./plainarray/PlainArrayTest04.test"
import PlainArrayTest05 from "./plainarray/PlainArrayTest05.test"
import PlainArrayTest06 from "./plainarray/PlainArrayTest06.test"
import PlainArrayTest07 from "./plainarray/PlainArrayTest07.test"
import PlainArrayTest08 from "./plainarray/PlainArrayTest08.test"
import PlainArrayTest09 from "./plainarray/PlainArrayTest09.test"

import QueueTest01 from "./queue/QueueTest01.test"
import QueueTest02 from "./queue/QueueTest02.test"

import StackTest01 from "./stack/StackTest01.test"
import StackTest02 from "./stack/StackTest02.test"
import StackTest03 from "./stack/StackTest03.test"
import StackTest04 from "./stack/StackTest04.test"

import URL01Test from './url/URLTest01.test';
import URL02Test from './url/URLTest02.test';
import URI01Test from './uri/URITest01.test';
import URI02Test from './uri/URITest02.test';
import URI03Test from './uri/URITest03.test';
import URI04Test from './uri/URITest04.test';
import URI05Test from './uri/URITest05.test';

export default function testsuite() {
  LRUCacheTest();
  TextDecoderTest();
  Base64HelperTest();
  StringDecoder01Test();
  StringDecoder02Test();
  RationalNumberTest(); 
  TextEncoderTest();
  Util1Test();
  UtilTest01();
  UtilTest02();
  UtilTest03();
  UtilTest04();
  UtilTest05();
  UtilTest06();
  UtilTest07();
  UtilTest08();
  UtilTest09();
  UtilTest10();
  UtilTest11();

  XmlTest01();
  XmlTest02();
  XmlTest03();
  XmlTest04();
  XmlTest05();
  XmlTest06();
  XmlTest07();
  XmlTest08();
  XmlSAXParserTest();

  HashMapTest01();
  HashMapTest02();
  HashMapTest03();
  HashMapTest04();
  HashMapTest05();

  HashSetTest01();
  HashSetTest02();
  HashSetTest03();
  HashSetTest04();
  HashSetTest05();
  HashSetTest06();
  HashSetTest07();
  HashSetTest08();

  JsonTest01();
  JsonTest02();
  JsonTest03();
  JsonTest04();
  JsonTest05();
  JsonTest06();

  LightWeightMapTest01();
  LightWeightMapTest02();
  LightWeightMapTest03();
  LightWeightMapTest04();
  LightWeightMapTest05();
  LightWeightMapTest06();
  LightWeightMapTest07();
  LightWeightMapTest08();

  LightWeightSetTest01();
  LightWeightSetTest02();
  LightWeightSetTest03();
  LightWeightSetTest04();
  LightWeightSetTest05();

  PlainArrayTest01();
  PlainArrayTest02();
  PlainArrayTest03();
  PlainArrayTest04();
  PlainArrayTest05();
  PlainArrayTest06();
  PlainArrayTest07();
  PlainArrayTest08();
  PlainArrayTest09();

  QueueTest01();
  QueueTest02();


  StackTest01();
  StackTest02();
  StackTest03();
  StackTest04();

  URL01Test();
  URL02Test();

  URI01Test();
  URI02Test();
  URI03Test();
  URI04Test();
  URI05Test();
};

