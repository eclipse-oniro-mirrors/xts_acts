/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import graphicSendableImageInterfaceTest from './graphicSendableImageInterface.test'
import graphicImagePixelMapTest from './graphicImagePixelMap.test'
import graphicImageInterfaceTest from './graphicImageInterface.test'
import imagePixelMapTest from './pixelMap'
import imagePixelMapTestErrorCode from './pixelMapErrorCode'
import pixelMapNewAPI from './PixelMapNewAPI.test'
import graphicImagePixelMapAPI22 from './GraphicImagePixelMapAPI22.test'
import graphicImagePixelMapAPI23 from './GraphicImagePixelMapAPI23.test'
import graphicImagePixelMapAdd01 from './GraphicImagePixelMapAdd01.test'
import graphicImagePixelMapAdd02 from './GraphicImagePixelMapAdd02.test'
import graphicImagePixelMapAdd03 from './GraphicImagePixelMapAdd03.test'
import graphicImagePixelMapAdd04 from './GraphicImagePixelMapAdd04.test'
import GraphicSendImagePixelMapAdd01 from './GraphicSendImagePixelMapAdd01.test'
import GraphicImageCreatePixelMap01 from './GraphicImageCreatePixelMap01.test'
import GraphicImageCreatePixelMap02 from './GraphicImageCreatePixelMap02.test'
import GraphicImageCreatePixelMap03 from './GraphicImageCreatePixelMap03.test'
import GraphicImageCreatePixelMap04 from './GraphicImageCreatePixelMap04.test'
import GraphicImagePixelMap1 from './GraphicImagePixelMap1.test';
import GraphicImagePixelMap2 from './GraphicImagePixelMap2.test';
import GraphicImagePixelMap3 from './GraphicImagePixelMap2.test';
import GraphicImagePixelMap4 from './GraphicImagePixelMap2.test';
import GraphicImagePixelMap5 from './GraphicImagePixelMap5.test';
import GraphicSendImagePixelMapAdd02 from './GraphicSendImagePixelMapAdd02.test';
import GraphicImageCreatePixelMap05 from './GraphicImageCreatePixelMap05.test';
import GraphicImagePixelMapAPI2601 from './GraphicImagePixelMapAPI2601.test';
import GraphicImagePixelMapAPI2602 from './GraphicImagePixelMapAPI2602.test';
import GraphicImagePixelMapAPI2603 from './GraphicImagePixelMapAPI2603.test';
import GraphicImagePixelMapErrorCode from './GraphicImagePixelMapErrorCode.test';

export default function testsuite() {
  imagePixelMapTest()
  graphicSendableImageInterfaceTest()
  graphicImagePixelMapTest()
  graphicImageInterfaceTest()
  imagePixelMapTestErrorCode()
  pixelMapNewAPI()
  graphicImagePixelMapAPI22();
  graphicImagePixelMapAPI23();
  graphicImagePixelMapAdd01();
  graphicImagePixelMapAdd02();
  graphicImagePixelMapAdd03();
  graphicImagePixelMapAdd04();
  GraphicSendImagePixelMapAdd01();
  GraphicImageCreatePixelMap01();
  GraphicImageCreatePixelMap02();
  GraphicImageCreatePixelMap03();
  GraphicImageCreatePixelMap04();
  GraphicImagePixelMap1();
  GraphicImagePixelMap2();
  GraphicImagePixelMap3();
  GraphicImagePixelMap4();
  GraphicImagePixelMap5();
  GraphicSendImagePixelMapAdd02();
  GraphicImageCreatePixelMap05();
  GraphicImagePixelMapAPI2601();
  GraphicImagePixelMapAPI2602();
  GraphicImagePixelMapAPI2603();
  GraphicImagePixelMapErrorCode();
}