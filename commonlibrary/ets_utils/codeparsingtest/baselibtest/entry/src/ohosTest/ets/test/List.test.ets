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

import buffer1Test from './buffer/Buffer1.test';
import buffer2Test from './buffer/Buffer2.test';
import fastbufferBase1Test from './fastbuffer/FastBufferBase1.test';
import fastbufferBase2Test from './fastbuffer/FastBufferBase2.test';
import processTest from './process/Process.test';
import uriTest from './uri/Uri.test';
import urlTest from './url/Url.test';
import UtilTypeTest from './util/UtilType.test';
import utilTest from './util/Util.test';
import util2Test from './util/Util2.test';
import timerTest from './timer/Timer.test';
import jsonTest from './json/Json.test';
import tresMapTest from './treemap/Treemap.test';
import treeSetTest from './treeset/TreeSet.test';
import hashSetTest from './hashset/HashSet.test';
import hashMapTest from './hashmap/HashMap.test';
import arkListTest from './arklist/ArkList.test';
import arrayListTest from './arraylist/ArrayList.test';
import xmlTest from './xml/Xml.test';
import dynamicXmlTest from './xml/DynamicXml';
import convertXmlTest from './convertxml/ConvertXml.test';
import ConvertXml2Test from './convertxml/ConvertXml2.test';
import ConvertXml3Test from './convertxml/ConvertXml3.test';
import ConvertXml4Test from './convertxml/ConvertXml4.test';
import queueTest from './queue/Queue.test';
import stackTest from './stack/Stack.test';
import dequeTest from './deque/Deque.test';
import lightWeightSetTest from './lightweightset/LightWeightSet.test';
import lightWeightMapTest from './lightweightmap/LightWeightMap.test';
import linkedListTest from './linkedlist/LinkedList.test';
import plainArrayTest from './plainarray/PlainArray.test';
import stringDecoderTest from './stringDecoder/StringDecoder.test';
import streamTest from './stream/Stream.test';
import specialChar from './specialchar/SpecialChar.test';
import consoleTest from './console/Console.test';
import LRUCacheTest from './LRUCache/LRUCache.test';
import ActsUrlParameterTest from './url/UrlParameter.test'
import emojiFastBufferTest from './fastbuffer/Emoji_FastBuffer.test.ets';
import escapeFastBufferTest from './fastbuffer/Escape_FastBuffer.test.ets';
import fastBuffer1Test from './fastbuffer/FastBuffer1.test.ets';
import fastBuffer2Test from './fastbuffer/FastBuffer2.test.ets';
import fastBuffer3Test from './fastbuffer/FastBuffer3.test.ets';

export default function testsuite() {
  buffer1Test();
  buffer2Test();
  fastbufferBase1Test();
  fastbufferBase2Test();
  processTest();
  uriTest();
  urlTest();
  utilTest();
  util2Test();
  UtilTypeTest();
  timerTest();
  jsonTest();
  tresMapTest();
  treeSetTest();
  hashSetTest();
  hashMapTest();
  arkListTest();
  arrayListTest();
  xmlTest();
  dynamicXmlTest();
  convertXmlTest();
  ConvertXml2Test();
  ConvertXml3Test();
  ConvertXml4Test();
  queueTest();
  stackTest();
  dequeTest();
  lightWeightSetTest();
  lightWeightMapTest();
  linkedListTest();
  plainArrayTest();
  stringDecoderTest();
  streamTest();
  specialChar();
  consoleTest();
  LRUCacheTest();
  //fastbuffer
  emojiFastBufferTest();
  escapeFastBufferTest();
  fastBuffer1Test();
  fastBuffer2Test();
  fastBuffer3Test();
  ActsUrlParameterTest();
}